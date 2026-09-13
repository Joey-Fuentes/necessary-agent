#!/usr/bin/env bash
# Verifies NecessaryAgent.lean is in the certified state.
#
# Passes only if ALL of the following hold:
#   1. `lean NecessaryAgent.lean` exits 0 with empty stderr.
#   2. The output contains no "error", "warning", or "sorry".
#   3. The source declares no `axiom`, uses no `sorry`, and no escape hatch
#      (`native_decide`, `unsafe`, `partial`, `implemented_by`, `opaque`).
#   4. The output is byte-identical to expected_axioms.txt — i.e. exactly the
#      certified list of results, each depending on at most
#      [propext, choice, Quot.sound].
#
# Any change to the premise set, the theorems, or the witnesses that alters
# what is certified will change the output and fail this check; that is the
# point. Update expected_axioms.txt deliberately, in the same commit, and say
# why in the commit message.

set -euo pipefail
cd "$(dirname "$0")/.."

SRC=NecessaryAgent.lean
EXPECTED=expected_axioms.txt
OUT=build/actual_axioms.txt
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
if ! lean "$SRC" > "$OUT" 2> "$ERR"; then
  echo "--- stderr ---"; cat "$ERR"; echo "--- stdout ---"; cat "$OUT"
  fail "lean exited non-zero"
fi
if [ -s "$ERR" ]; then
  echo "--- stderr ---"; cat "$ERR"
  fail "lean wrote to stderr"
fi

echo "== check 2: no error/warning/sorry in output =="
if grep -qiE 'error|warning|sorry' "$OUT"; then
  cat "$OUT"
  fail "output contains error/warning/sorry"
fi

echo "== check 4: output identical to $EXPECTED =="
if ! diff -u "$EXPECTED" "$OUT"; then
  fail "#print axioms output differs from $EXPECTED"
fi

N=$(wc -l < "$OUT")
echo "OK: $N certified results, output identical to $EXPECTED"
grep -c 'depends on axioms: \[propext, choice, Quot.sound\]' "$OUT" | sed 's/^/  [propext, choice, Quot.sound]: /'
grep -c 'depends on axioms: \[propext, Quot.sound\]' "$OUT"          | sed 's/^/  [propext, Quot.sound]:         /'
grep -c 'does not depend on any axioms' "$OUT"                        | sed 's/^/  no axioms:                     /'
