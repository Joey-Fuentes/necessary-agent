#!/usr/bin/env bash
# Verifies NecessaryAgent.lean is in the certified state.
#
# Passes only if ALL of the following hold:
#   1. `lean NecessaryAgent.lean` exits 0 with empty stderr.
#   2. The output contains no "error", "warning", or "sorry".
#   3. The source declares no `axiom`, uses no `sorry`, and no escape hatch
#      (`native_decide`, `unsafe`, `partial`, `implemented_by`, `opaque`).
#   4. The `#print axioms` lines are byte-identical to expected_axioms.txt —
#      i.e. exactly the certified list of results, each depending on at most
#      [propext, choice, Quot.sound].
#   5. (v8.14) The `#check` output — the STATEMENT of every certified result —
#      is byte-identical to expected_statements.txt.  Without this, a theorem
#      whose statement was weakened (e.g. to `… ∨ (1 = 1)`) while keeping the
#      same proof term passed checks 1–4 unchanged.
#   6. (v8.15) The `#print` output of every DEFINITION those statements name
#      (the `Model` structure and its definitions, every `X_stmt`, the premise
#      structures, `God`, `KnowsAll`, the powers structures) is byte-identical
#      to expected_definitions.txt.  Check 5 pins types BY NAME; without check
#      6, `def AccordsValue … := True` with patched proofs passed checks 1–5.
#
# What green means after all six: the file declares these results, with these
# axiom sets, these printed types, and these printed definitions.  It does not
# and cannot mean the definitions are the right ones; that is read, not run.
#
# Any change to the premise set, the theorems, or the witnesses that alters
# what is certified will change the output and fail this check; that is the
# point. Update expected_axioms.txt deliberately, in the same commit, and say
# why in the commit message.

set -euo pipefail
cd "$(dirname "$0")/.."

SRC=NecessaryAgent.lean
EXPECTED=expected_axioms.txt
EXPECTED_STMTS=expected_statements.txt
EXPECTED_DEFS=expected_definitions.txt
RAW=build/raw_output.txt
OUT=build/actual_axioms.txt
STMTS=build/actual_statements.txt
DEFS=build/actual_definitions.txt
ERR=build/stderr.txt
mkdir -p build

fail() { echo "::error::$1"; exit 1; }

echo "== toolchain =="
lean --version

echo "== check 3: no axioms, sorries, or escape hatches in source =="
if grep -nE '^[[:space:]]*(axiom|unsafe|partial|opaque)[[:space:]]' "$SRC"; then
  fail "forbidden declaration in $SRC"
fi
if grep -nE '(^|[^[:alnum:]_])sorry([^[:alnum:]_]|$)' "$SRC" | grep -vE '^\s*[0-9]+:\s*(--|/-|-)' | grep -v 'zero `sorry`' ; then
  fail "sorry found in $SRC"
fi
if grep -nE 'native_decide|implemented_by' "$SRC"; then
  fail "escape hatch in $SRC"
fi

echo "== check 1: compile =="
if ! lean "$SRC" > "$RAW" 2> "$ERR"; then
  echo "--- stderr ---"; cat "$ERR"; echo "--- stdout ---"; cat "$RAW"
  fail "lean exited non-zero"
fi
# `#print axioms` lines begin with a quote; `#check` output follows; the
# `#print` of definitions follows the marker line emitted by `#eval`.
grep "^'" "$RAW" > "$OUT" || true
awk '/^-- definitions --$/{exit} !/^'"'"'/' "$RAW" > "$STMTS"
awk '/^-- definitions --$/{f=1;next} f' "$RAW" > "$DEFS"
if [ -s "$ERR" ]; then
  echo "--- stderr ---"; cat "$ERR"
  fail "lean wrote to stderr"
fi

echo "== check 2: no error/warning/sorry in output =="
if grep -qiE 'error|warning|sorry' "$RAW"; then
  cat "$RAW"
  fail "output contains error/warning/sorry"
fi

echo "== check 4: output identical to $EXPECTED =="
if ! diff -u "$EXPECTED" "$OUT"; then
  fail "#print axioms output differs from $EXPECTED"
fi

echo "== check 5: statements identical to $EXPECTED_STMTS =="
if ! diff -u "$EXPECTED_STMTS" "$STMTS"; then
  fail "#check statement output differs from $EXPECTED_STMTS"
fi

echo "== check 6: definitions identical to $EXPECTED_DEFS =="
if ! diff -u "$EXPECTED_DEFS" "$DEFS"; then
  fail "#print definition output differs from $EXPECTED_DEFS"
fi

N=$(wc -l < "$OUT")
echo "OK: $N certified results; axioms, statements and definitions identical to the expected files"
grep -c 'depends on axioms: \[propext, choice, Quot.sound\]' "$OUT" | sed 's/^/  [propext, choice, Quot.sound]: /'
grep -c 'depends on axioms: \[propext, Quot.sound\]' "$OUT"          | sed 's/^/  [propext, Quot.sound]:         /'
grep -c 'does not depend on any axioms' "$OUT"                        | sed 's/^/  no axioms:                     /'
