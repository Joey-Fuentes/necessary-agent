# A Necessary Agent — machine-checked core: documentation

Three files, which must stay in agreement:

| File | Role | Status |
|---|---|---|
| `NecessaryAgent.lean` | The formal argument. Definitions, premises, every derivation line as a theorem, a consistency witness, independence witnesses for every premise, and the named conclusion `God` with `god_exists`. | Certified by Lean 4.33.1 (v8.17: 77 results; statements and definitions pinned) |
| `docs/necessary_agent_argument_v8_7.md` | The human-readable argument. **Part I** is the Lean file in words, section for section. **Part II** is informal assessment: exits, ledger, ladder, open problems. **Part III** is the soundness dossier: each premise's case, objections, replies, cost of denial, and ceiling. | Part I inherits the certificate *if it matches the Lean file*; Parts II–III are uncertified |
| `README.md` | This file: how to verify, how to read, how to change things without breaking them. | — |
| `expected_axioms.txt`, `scripts/verify.sh`, `.github/workflows/verify.yml`, `lean-toolchain`, `lakefile.toml` | Continuous verification (§0.0). | CI |
| `docs/plain_language_guide_v8_7.md` | Companion for non-specialists. Every premise in plain words; the two exits and their prices. | Uncertified; synchronized with v8.17 |
| `docs/cosmic_strand_v2.md` | The empirical strand: conservative fine-tuning numbers, their two roles (CatOpen support; Exit 1's bill), and what is excluded. | Uncertified; supersedes all earlier teleological documents |
| `docs/necessary_agent_v8_13_review.md` | Third external review (of v8.13). Status of each item: handoff §8a. | — |
| `docs/necessary_agent_v8_14_review_findings.md` | Fourth external review (of v8.14; read-through). Status of each item: handoff §8b. | — |
| `docs/REVIEW_BRIEF_v8_13.md` | The brief handed to the third reviewer. | — |
| `docs/Necessary_Agent_Handoff_v8_7.md` | Status: certified / priced / open; review-item tables; burdens. | — |
| `expected_statements.txt`, `expected_definitions.txt` | Pinned `#check` types and `#print` definitions (checks 5–6). | CI |
| `scripts/build_site.py`, `.github/workflows/pages.yml` | The website (§3a): built and deployed only after `verify` succeeds. | Pages |
| `docs/necessary_agent_v8_5_review.md` | External review of v8.5 — **not in the repository** (`docs/NOTE_review_file.md`). | — |

---

## 0. How to verify

No installation: paste `NecessaryAgent.lean` into https://live.lean-lang.org (select a Lean 4 toolchain; Mathlib is not needed). Locally: install `elan` with toolchain `leanprover/lean4:v4.33.1`, then `lean NecessaryAgent.lean`. The file is self-contained (`import Std` only). Last verified 2026-09-13 under Lean 4.33.1 (commit 819816b2): exit 0, no errors, no warnings, ~90 s. No file fingerprint is stated here (the MD5 once given matched no file, and v8.14's promise of a SHA-256 in the commit message was not kept). What counts is the git commit hash and the byte-identity of `expected_axioms.txt`, `expected_statements.txt` and `expected_definitions.txt` under `scripts/verify.sh`.

Expected `#print axioms` output — these seventy-seven lines and nothing else (followed by the `#check` output pinned in `expected_statements.txt` and the `#print` output pinned in `expected_definitions.txt`):

```
'NecessaryAgent.main' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.god_exists' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.identify' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.T3_11'' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.T2_4'' depends on axioms: [propext, choice, Quot.sound]
'Toy.premises_consistent' depends on axioms: [propext, choice, Quot.sound]
'Toy.Bare.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.Axiarch.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.NoCH.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.NoTR.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.DLaw.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.DState.witness' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.no_modal_collapse' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.mind_of_CE_NBL' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.P3_of' does not depend on any axioms
'NecessaryAgent.exists_maximal' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.T4_6s' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.knows_actual' depends on axioms: [propext, choice, Quot.sound]
'Toy.NoMind.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.NoAcc.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.Narrow.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.Chance.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_P2.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_P4.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_P1.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_L4.witness' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.P12_of_cat' does not depend on any axioms
'NecessaryAgent.L2_of_P11' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.archRat' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Id.originator_neither' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.agent_ne_originator' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.matrix' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.originator_is_mind_not_agent' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.originator_is_agent_and_mind_with_another_mind' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.mind_is_agent_not_originator' depends on axioms: [propext, Quot.sound]
'Toy.W_Id.all_one' depends on axioms: [propext, Quot.sound]
'NecessaryAgent.originator_produces_mind_and_agent' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.stateless_originator_is_neither' does not depend on any axioms
'NecessaryAgent.all_worlds_accord'' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.all_tied' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Pref.witness' depends on axioms: [propext, Quot.sound]
'Toy.W_Nat.witness' depends on axioms: [propext, Quot.sound]
'NecessaryAgent.powers_all_tied' does not depend on any axioms
'NecessaryAgent.powers_fork' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Nat.powers_witness' depends on axioms: [propext, Quot.sound]
'Toy.W_Pref.no_powers_at_maximal' depends on axioms: [propext, Quot.sound]
'Toy.NoTR.powers_horn1' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_P4.two_minds' depends on axioms: [propext, Quot.sound]
'Toy.W_P4.IDF_and_not_P4' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.fallible_actual_iff' does not depend on any axioms
'NecessaryAgent.natural_directed_nonempty' does not depend on any axioms
'NecessaryAgent.uniform_countable_refuted' depends on axioms: [propext, choice, Quot.sound]
'Toy.god_holds' depends on axioms: [propext, choice, Quot.sound]
'Toy.knows_everything' depends on axioms: [propext, Quot.sound]
'Toy.BothChannels.witness' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Pref.fork_is_residue' depends on axioms: [propext, Quot.sound]
'Toy.W_Two.Both.position_ii' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Two.OneChannel.position_i' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Two.Both.ID_and_not_IDF' depends on axioms: [propext, Quot.sound]
'NecessaryAgent.contrib_det_empty' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.contributors_are_minds' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.CEB_of_Axioms' depends on axioms: [propext, choice, Quot.sound]
'NecessaryAgent.fallible_not_power' does not depend on any axioms
'NecessaryAgent.fallible_maximal_discriminates' does not depend on any axioms
'Toy.CEB_holds' depends on axioms: [propext, choice, Quot.sound]
'Toy.no_fallible_dir' depends on axioms: [propext, Quot.sound]
'Toy.W_P4.alternation_priced' depends on axioms: [propext, Quot.sound]
'Toy.W_Pref.fallible_dir' depends on axioms: [propext, Quot.sound]
'Toy.W_Nat.fallible_dir' depends on axioms: [propext, Quot.sound]
'Toy.NoTR.no_fallible_dir' depends on axioms: [propext, Quot.sound]
'Toy.W_Two.Both.two_contributors_two_minds' depends on axioms: [propext, choice, Quot.sound]
'Toy.W_Two.OneChannel.position_i_priced' depends on axioms: [propext, Quot.sound]
'NecessaryAgent.L0_of_P1' does not depend on any axioms
'NecessaryAgent.fallible_actual_trivial' does not depend on any axioms
'Toy.P8s_holds' depends on axioms: [propext, Quot.sound]
'Toy.SK_holds' depends on axioms: [propext, Quot.sound]
'Toy.W_P4.IDF_and_not_ID' depends on axioms: [propext, choice, Quot.sound]
```

Anything else — an error, a warning, `sorryAx` in an axiom list, a missing line — means the file is not in the certified state.

### 0.0 Continuous verification

Every push to `main` (and every pull request) runs `.github/workflows/verify.yml`, which installs the toolchain pinned in `lean-toolchain` via elan and runs `scripts/verify.sh`. That script enforces:

1. `lean NecessaryAgent.lean` exits 0 with empty stderr;
2. the output contains no `error`, `warning`, or `sorry`;
3. the source declares no `axiom`, contains no `sorry`, and uses no escape hatch (`native_decide`, `implemented_by`, `unsafe`, `partial`, `opaque`);
4. the `#print axioms` lines are **byte-identical** to `expected_axioms.txt` — the certified list below;
5. (v8.14) the `#check` output — the **statement** of every certified result — is byte-identical to `expected_statements.txt`. Without this, a theorem whose statement was weakened to `… ∨ (1 = 1)` while keeping the same proof term passed checks 1–4 unchanged; the third external review demonstrated it, and it is now a tested failure;
6. (v8.15) the `#print` output of every **definition** those statements name — the `Model` structure and all its definitions, every `X_stmt`, the premise structures, `God`, `KnowsAll`, the powers structures — is byte-identical to `expected_definitions.txt`. Check 5 pins types *by name*; the fourth review showed `def AccordsValue … := True` with patched proofs passed checks 1–5.

**What green means after all six checks, exactly:** the file declares these seventy-seven results, with these axiom sets, these printed types, and these printed definitions. It does not mean the definitions are the right ones — that is the faithfulness question (§1), which is read, not run — and a commit can change a pinned definition and its expected file together; the commit diff is the last line of defence and the reader is the one after that.

A green check on `main` means what the paragraph after item 6 says, and no more. Any change to a premise, theorem, or witness that alters what is certified changes the output and fails the build; `expected_axioms.txt` must be updated in the same commit with the reason in the message. Locally: `scripts/verify.sh` (needs `lean` on PATH; elan reads `lean-toolchain` automatically), or `lake build`.

The script's negative behaviour is tested: a `sorry` inserted into a proof, a `#print axioms` line removed, and a statement weakened to `… ∨ (1 = 1)` with the same proof, and a definition changed to `True`, each fail the check.

### 0.1 The three checks, and why all three

1. **Compiles with no `sorry`.** Necessary. Not sufficient: the first draft of this file compiled with no `sorry` and proved every tier from an inconsistent premise set. (P12 was quantified over every propensity structure, including the one with no open sets, so `Axioms M → False` was provable in three lines, and every theorem was vacuous.)
2. **Consistency witness compiles** (`Toy.A`). A concrete model in which every premise holds. If the premises are inconsistent, this cannot be built. **Any edit to `Core` or `Axioms` must keep `Toy.A` compiling, or the certificate is void.**
3. **Independence witnesses compile** (seventeen `*.witness` theorems, plus `W_Nat.powers_witness`). For each contested premise, a model in which every other premise holds, that one fails, and the conclusion it supports fails. These show each premise is genuinely load-bearing and not a consequence of the rest — i.e. that the definitions have not quietly made any conclusion analytic.

---

## 1. What is certified, exactly

**Certified (Lean kernel):**
- Every conclusion in `main` follows from the fields of `Axioms` under the definitions in `Model`; `god_exists` names that conclusion (`God M N`) and certifies existence and uniqueness. It does not and cannot discharge `Axioms`.
- `identify` (one being) and `main` follow from `Axioms`, which includes P4⁺; everything else is typed over `Axioms0` (no P4⁺) or `Core` (no P3, P10, P4⁺). `T3_11'` follows from `Axioms0` (since v8.2, unconditionally; direct proof since v8.15); `T2_4'` from `CoreNoP4` plus ID.
- `Axioms` is satisfiable (has a model).
- Each of P1, P2, P4, P5, FA, P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺ is independent of the other premises and necessary for the conclusion it supports (P3, NI, P10 are derived; P6 was replaced by FA). Two of the witnesses are complete naturalist packages: `W_Nat` (¬CE) and `NoTR` (¬TR, mindless since v8.6). `W_Pref.residue` certifies the theist's own libertarian residue.
- Theorems in `section CoreTheorems` use neither P3 nor P10 — their type says so.

**Not certified (and not certifiable by any tool):**
- That the premises are true.
- That the Lean definitions mean what the prose words mean. This "faithfulness" step is an informal judgment; the definitions are written to make it checkable by inspection, and the prose gives the Lean name beside every definition and premise so the reader can compare.
- That the modeling decisions (Lean header D1–D23; prose §1.0 D1–D28 (D28 resolved in v8.16)) are the right stipulations. Each is a place where earlier versions were ambiguous. Rejecting one is rejecting a stipulation, which is priced in prose §7.
- Anything in prose Parts II–III, or in `cosmic_strand_v2.md`. In particular: that Exit 1's price (D22) is too high to pay is a judgment, and the TR fork (D23) is stated, not formalized.

---

## 2. Reading the Lean file

```
header comment      status, modeling decisions D1–D23, what is not formalized
Content             representational contents: ⟨alt r⟩, ⟨cons c r⟩
structure Model     primitive sorts and relations (prose §1.0)
namespace Model     all §1 definitions
iterAdd, ArchOrd, FinMeasure, L2   axiomatized value structure; L2 proved (prose D9, Appendix A.1)
RatArch, archRat, zeroMeasureRat    ℚ satisfies ArchOrd, in core Lean
section Stmts       every premise as a named proposition X_stmt (prose §2)
structure CoreNoP4  every framework and Tier 1–2 premise except P4 (v8.10)
structure Core      CoreNoP4 + P4 (prose §2.1)
structure Core      … includes FA (factivity of ahistorical non-mental content) in place of P6
structure Axioms0   extends Core with CE, NBL, GG, CH, TR (P3, NI, P10 derived: P3_of, NI_of_NBL, P10_of)
structure Axioms    extends Axioms0 with P4⁺ (prose §2.2)
                    optional: ID_stmt, SK_stmt, P8s_stmt, P7all/P8all, CatU/CatOpen, IDF_stmt (prose §2.3)
exists_minimal      generic: finite strict partial orders have minimal elements
section CoreTheorems   Tier 1, 2.1–2.15, 3.7–3.10 lemmas, mind_of_CE_NBL — typed over CoreNoP4 (T2_8 over Core)
section FullTheorems   2.16–4.6, identity relations, all_worlds_accord — typed over Axioms0
def God              the conclusion, named (v8.7)
section WithP4plus     identify, main, god_exists — the only theorems that use P4⁺
structure Powers     the powers naturalist's primitive (optional extension; v8.8)
section PowersFork     powers_all_tied, powers_fork — the TR fork
structure FalliblePowers  the fallible reading; FalliblePowers.actual (v8.9) — content-free: fallible_actual_iff (v8.14)
structure FallibleDir     fallible directedness WITH content about the state (v8.17); fallible_not_power, fallible_maximal_discriminates
Model.Contrib/BareOf/…, CEB_stmt   per-being contribution and per-being CE (v8.17); contributors_are_minds, CEB_of_Axioms
naturalPowers, natural_directed_nonempty   the structure W_Nat.Pw uses; "directed at non-empty" is a tautology (v8.14)
L2_countable_uniform, uniform_countable_refuted   the uniform propensity horn, from P11 + CatOpen + L4 (v8.14)
exists_notin_list, cantor   lemmas for the infinite witnesses
namespace Toy       model family Mk (Params); per-premise lemmas h_*
  Toy.A             consistency witness
  Toy.Bare/Axiarch/NoCH/NoTR/NoMind/NoAcc/Narrow/Chance   CE, NBL, CH, TR, FA, P9, P5, P12
  Toy.DLaw          base-tracking law: ¬NBL, bare, not favored
  Toy.DState        ¬GG: state selects for a non-evaluative property; mind survives
  Toy.W_P2, W_P4    finite models for P2, P4
  Toy.W_P1          infinite chain, for P1
  Toy.W_L4          uncountably many worlds, for L4
P12_of_cat          P12 from CatU + CatOpen (no axioms)
L2_of_P11           L2 from P11 (via generic L2, ArchOrd, FinMeasure)
  Toy.W_Id          identity model family; matrix of one/two/three-being configurations
N_anc_of_nec_concrete, originator_produces_mind_and_agent, stateless_originator_is_neither
  Toy.W_Pref        the theist's residue (`residue`, `witness`)
  Toy.W_Nat         the bare naturalist's package
  Toy.god_holds, Toy.knows_everything   God in the consistency witness, and what it knows (v8.14)
  Toy.BothChannels  ¬NBL with the state channel on: God still holds (v8.14)
  Toy.W_Pref.fork_is_residue   powers_fork's Horn 1 on the theist's model is residue (v8.14)
  Toy.W_Two         two fundamentals both producing at every world: positions (i) and (ii) (v8.14)
#print axioms ×63; #check ×63 (statements pinned); #print ×99 definitions (pinned, v8.15)
```

### 2.1 Prose line → theorem

| Prose | Lean | Uses |
|---|---|---|
| 1.2 | `first_exists` | Core |
| 1.3 | `F_nonempty` | Core |
| Ω remark | `contingent_iff_F_nonempty` | Core |
| 1.5 (gen.) | `anc_of_first_in_ground` | Core |
| 1.5 | `causes_in_ground` | Core |
| 1.4–1.5 | `first_has_ground_cause` | Core |
| 1.6 | `first_has_fundamental_anc` | Core |
| 1.7 | `T1_7`, `fundamental_exists` | Core |
| 2.1 | `T2_1` | Core |
| 2.2 | `T2_2` | — (rfl) |
| 2.3–2.4 | `T2_4` | Core |
| 2.4′ | `T2_4'` | Core + ID |
| L-tax | `L_tax_exhaustive`, `L_tax_exclusive` | — |
| 2.6–2.8 | `T2_8` | Core (P4) |
| 2.9 | `T2_9` | — (definitional) |
| L2 | `L2`, `L2_of_P11` | P11 only |
| 2.10–2.15 | `T2_15` | Core (P12, P11, L4; **not** P4) |
| P12 reduction | `P12_of_cat` | CatU + CatOpen only (no axioms) |
| 2.16 | `T2_16` | P3 |
| 2.17–2.18 | `T2_17`, `T2_18` | Axioms |
| P3 derivation | `P3_of` | CE + NBL + GG only |
| P10 derivation | `P10_of` | NI + CH + TR only |
| no modal collapse | `no_modal_collapse` | Core |
| mind without value | `mind_of_CE_NBL` | CoreNoP4 + CE + NBL + CH + TR (no P4: v8.10) |
| 3.3–3.4 | `T3_4` | Axioms0 (via derived P10) |
| 3.6 | `T3_6` | Axioms (P5) |
| 3.7 | `T3_7` | Core (Src, P1, B1) |
| mentality by elimination | `mental_of_nonactual`, `inground_state_in_force` | FA (states in force, v8.15) |
| 3.8 | `T3_8` | FA |
| 3.9–3.10 | `T3_10`, `selecting_props` | P9 |
| 3.11 | `T3_11` | Axioms |
| 3.11′ | `T3_11'` | Axioms0 (no Src; unconditional since v8.2) |
| §5.4 order of production | `N_anc_of_nec_concrete`, `originator_produces_mind_and_agent` | Core / Axioms0 |
| §6.4 | `all_worlds_accord'`, `all_tied` | Axioms0 + P7all + P8all (optional; not adopted) |
| §5.4 matrix | `W_Id.matrix` and corollaries | — (models) |
| 3.12 | `identify` | Axioms (the only use of P4⁺, with `main`) |
| 4.2 | `T4_2` | P0 |
| 4.1 | `T4_1` | Axioms |
| 4.3–4.6 | `T4_6` | P7, P8 |
| a best reality exists | `exists_maximal` | Axioms0 (P7, P8) |
| satisficing Tier 4 | `T4_6s` | Axioms0 + P8s |
| knowledge of the actual world | `knows_actual` | Axioms0 + SK |
| summary | `main` | Axioms |
| the conclusion, named | `God`, `god_exists` | Axioms (via `main`) |
| the theist's residue | `W_Pref.residue`, `W_Pref.witness` | — (model) |
| the two naturalist packages | `W_Nat.witness`, `NoTR.witness` | — (models) |
| the TR fork | `powers_all_tied`, `powers_fork` | `Powers M` only (no `Axioms`) |
| the fork's horns; inclination ≠ power | `W_Nat.powers_witness`, `NoTR.powers_horn1`, `W_Pref.no_powers_at_maximal` | — (models) |
| denying P4 is polytheism | `W_P4.two_minds` | — (model) |
| IDF alone is not P4 (alternation) | `W_P4.IDF_and_not_P4` | — (model) |
| the fallible structure is content-free | `fallible_actual_iff`, `fallible_actual_trivial` | — (no axioms) |
| L0 derived (not a field since v8.16) | `L0_of_P1` | P1 |
| ID ≠ IDF, both directions | `W_P4.IDF_and_not_ID`, `W_Two.Both.ID_and_not_IDF` | — (models) |
| position (i)'s N₂ is not a mind | `W_Two.OneChannel.position_i` (`not_mind_N2`, `not_knows_N2`) | — (model) |
| every fundamental contributor is a mind | `contributors_are_minds` | CoreNoP4 + CEB + ¬HasProp + CH + TR |
| CEB from the premises | `CEB_of_Axioms` | Axioms |
| positions (i), (iv) priced | `W_Two.OneChannel.position_i_priced`, `W_P4.alternation_priced` | — (models: ¬CEB) |
| position (ii): CEB, two minds | `W_Two.Both.two_contributors_two_minds` | — (model) |
| fallible directedness, both sides | `W_Pref.fallible_dir`, `W_Nat.fallible_dir` | — (models) |
| none on a tied balance | `NoTR.no_fallible_dir`, `Toy.no_fallible_dir` | — (models) |
| not a power; needs a losing world | `fallible_not_power`, `fallible_maximal_discriminates` | `FallibleDir` only |
| P8s, SK consistent with `Axioms` | `P8s_holds`, `SK_holds` | — (model) |
| IDF ≠ ID | `W_P4.IDF_and_not_ID` | — (model) |
| "directed at non-empty" is a tautology | `natural_directed_nonempty` | — (no axioms) |
| Horn 1 of the fork is the residue | `W_Pref.fork_is_residue` | — (model) |
| ¬NBL alone keeps `God` | `BothChannels.witness` | — (model) |
| positions (i), (ii) of III.6 | `W_Two.OneChannel.position_i`, `W_Two.Both.position_ii` | — (models) |
| God in the consistency witness | `god_holds`, `knows_everything` | — (model) |
| uniform propensity over countably many kinds | `uniform_countable_refuted` | P11 + CatOpen + L4 |

---

## 3. Changes from v5 found by formalizing

*Rows are history. Lean names in rows (n), (u), (z), (bq) that no longer exist are marked where they occur; the current names are in §2.*

*The change log is history and is not rewritten. Names that appear in rows (n)–(z) and no longer exist — `P6′`, `Toy.W_Id.three_distinct`, `agent_ne_originator_under_P6'`, `identify_of` — were retired in v7 (P4⁺ adopted) and v8.2 (FA replaces P6/P6′; `originator_neither` replaces `three_distinct`); row (bq)'s `fallible_witness` theorems were deleted in v8.14 (row cf).*

| # | v5 | v6 | Where |
|---|---|---|---|
| a | Hand-written audit table, all ✓ | Kernel-checked; consistency + independence witnesses | whole file |
| b | First formal draft: P12 over all structures → inconsistent | P12, L2, L4 conditional on `PropGoverned w₀`; structure in `Model` | D11 |
| c | P3, P10 for all worlds (+ null outcome) ⇒ no empty world | Restricted to worlds with non-empty F | D10 |
| d | "Selected because of R" transferred to R's source | Dropped; mind and agent delivered separately; `identify` joins them under strengthened P4 | D6 |
| e | "Derived" allowed "explained by" (partial, multi-source) | Single-source, whole-content | D5, `Src` |
| f | 3.7 needed "because ⇒ depends" + P0 to make R a cause | Selecting rep is a state *in virtue of which* bearer causes; B1 suffices | D4 |
| g | P8 "not outweighed" (fails in ties) | P8 "settles the balance" | D8 |
| h | "Good in essential constitution" — trivially true of every agent given P7+P8 | Dropped; result is 4.6 + 4.2 | D8 |
| i | "Outcome" ambiguous between token and type | Token; cost recorded (weight on P3) | D1 |
| j | Ω defined by "non-empty reality" but 2.6 used "non-empty F" | Proved equivalent | `contingent_iff_F_nonempty` |
| k | "Knows every contingent reality" undefined | `Knows t c` over a content type | D12 |
| l | Ledger: theist has "zero brute contingent facts" | Favored-but-underdetermined selection; scored honestly | prose §8.3 |

### v6.0 → v6.1

| # | Change | Where |
|---|---|---|
| m | Selecting representation must represent the empty alternative | `Content.nil`, `RepAllOmega`, P5, `KnowsAll` |
| n | Second route to Tier 3 without single-source derivation | P6′ *(retired v8.2; `T3_11'` now rests on FA)* |
| o | D1 made explicit as an optional premise | `TypeDeterministic`, ID, `T2_4'` |
| p | Independence witnesses for all ten contested premises | `Toy.*`, `W_P2`, `W_P4`, `W_P1`, `W_L4` |

### v6.1 → v6.2

| # | Change | Where |
|---|---|---|
| q | P12 reduced to CatOpen + CatU, proved by pure logic | `Cat`, `cat`, `P12_of_cat`; `W_L4` satisfies both |
| r | Verbatim Lean definitions and premises appended to the prose for the faithfulness check | prose Appendix A |

### v6.2 → v6.3

| # | Change | Where |
|---|---|---|
| s | L2 proved in core Lean from an axiomatization of Archimedean values and finitely additive measures; P11 restated as that axiomatization | `ArchOrd`, `FinMeasure`, `L2`, `L2_of_P11`, `P11_stmt` |
| t | Witness models use ℕ with the zero measure as their value structure | `Toy.archNat`, `Toy.zeroMeasure` |

### v6.3 → v6.4

| # | Change | Where |
|---|---|---|
| u | Certified that the premises permit originator, mind, and agent to be three distinct beings; only P4⁺ identifies them | `Toy.W_Id.three_distinct`, `agent_ne_originator_under_P6'` *(both removed v8.2; see `originator_neither`)* |

### v6.4 → v6.5

| # | Change | Where |
|---|---|---|
| v | Proved: every necessary concrete being other than N is produced by N; hence mind and agent are N or N's products | `N_anc_of_nec_concrete`, `originator_produces_mind_and_agent` |
| w | Full possibility matrix: one generic model family covering one-, two-, and three-being configurations | `W_Id.matrix` and five corollaries |
| x | Optional simplicity premise: stateless N is neither mind nor agent | `stateless_originator_is_neither` |
| y | P4⁺ certified consistent with all of `Axioms` | `Toy.P4plus_holds` |

### v6.5 → v7

| # | Change | Where |
|---|---|---|
| z | P4⁺ adopted as a premise; `identify` unconditional; `main` concludes about one being; `W_Id.three_distinct` becomes P4⁺'s independence witness; `identify_of` keeps the conditional form *(both since removed: `originator_neither` is the witness; `identify_of` is gone)* | `Axioms0`, `Axioms`, `identify`, `identify_of`, `main` |
| aa | ℚ certified to satisfy `ArchOrd` in core; all witness models use ℚ-valued propensities; Mathlib item closed | `RatArch`, `archRat`, `zeroMeasureRat` |

### v7 → v7.1 (after external review)

| # | Change | Where |
|---|---|---|
| ab | `stateless_originator_is_neither` was vacuous over `Axioms` (P4⁺ contradicts its hypothesis); it, `originator_produces_mind_and_agent`, and the new theorem are over `Axioms0`; `identify`/`main` isolated in `WithP4plus` | sections |
| ac | P4⁺ added to every witness's "all others hold" list; `W_P4` records ¬P4⁺ | all `witness` theorems |
| ad | Reality defined as the set of contingent items at a world (was an unconstrained primitive type) | `Model.realOf`, D14 |
| ae | `Accurate` content-indexed; P9 says accurate on all represented contents | `Accurate`, `AccurateAll`, P9 |
| af | MR removed from the formal core (was an idle atom) | D15 |
| ag | `all_worlds_accord'`: HasProp ∨ every non-empty world's first production is value-accordant | prose §6.4 |
| ah | Prose corrections: D6, §5.4/§6.3 "Axioms"→"Axioms0", §2.3→§2.2, ladder 2.4 row, empty header, change-letter order, file renamed to v7 | prose |

### v7.1 → v7.2

| # | Change | Where |
|---|---|---|
| ai | `AccordsValue` defined as maximality on a comparative `AtLeast` over realities (was a primitive atom) | `Model.AtLeast`, `Model.AccordsValue`, D16 |
| aj | `all_tied`: unless HasProp, every two possible contingent realities are tied on the balance | prose §6.4, Exit 4C, open problem 11 |

### v7.2 → v7.3 (Phase 1 of the v8 plan)

| # | Change | Where |
|---|---|---|
| ak | P7, P8 restricted to w₀ (principles about the actual act); all-worlds forms kept as optional `P7all`, `P8all`; `all_tied` now a theorem from them | `P7_stmt`, `P8_stmt`, `P7all_stmt`, `P8all_stmt`, D7 |
| al | `W_Pref`: all of `Axioms` holds, the balance strictly prefers the actual reality, all-worlds P8 fails | `Toy.W_Pref.witness` |

### v7.3 → v8 (Phase 2: the P10 bridge)

| # | Change | Where |
|---|---|---|
| am | `Favored`, `SelectedBecause` replaced by one primitive `Sens w P ch` (sensitivity through a channel: `Chan.law` or `Chan.state s`); both defined from it | `Chan`, `Model.Sens`, `Maximal`, `Favored`, `SelectedBecause`, D17, D18 |
| an | P10 derived from NI (no law channel is value-sensitive), CH (state channels are causal channels), TR (state channels carry indicator content) | `NI_stmt`, `CH_stmt`, `TR_stmt`, `P10_of`, `Axioms0.P10` |
| ao | Witnesses: `Axiarch` (¬NI, favored, no selecting rep), `NoCH`, `NoTR`, `DLaw` (base-tracking law is bare: P3 fails, NI holds) | `Toy.*` |

### v8 → v8.1 (Phase 2: the P3 bridge)

| # | Change | Where |
|---|---|---|
| ap | P3 derived from CE (weak contrastive explicability), NBL (no bearer-free selection), GG (guise of the good); NI derived from NBL | `CE_stmt`, `NBL_stmt`, `GG_stmt`, `P3_of`, `NI_of_NBL` |
| aq | `mind_of_CE_NBL`: a necessary mind from Core + CE + NBL + CH + TR, no value premise | FullTheorems |
| ar | `no_modal_collapse` certified from Core | CoreTheorems |
| as | Witnesses re-sorted: `Bare` → ¬CE; `Axiarch`, `DLaw` → ¬NBL; new `DState` → ¬GG with a surviving mind | `Toy.*` |

### v8.1 → v8.2 (Phase 2: the P6 bridge)

| # | Change | Where |
|---|---|---|
| at | P6 replaced by FA (factivity of ahistorical non-mental content); mentality of the selecting state and its root derived by elimination | `FA_stmt`, `mental_of_nonactual`, `T3_8` |
| au | TR now includes the empty alternative; `T3_11'` unconditional; `mind_of_CE_NBL` uses FA directly (no root regress, no `Src`) | `TR_stmt`, `T3_11'`, `mind_of_CE_NBL` |
| av | `Toy.NoMind` is the FA witness (structural-representation skeptic); `W_Id` corollaries reworked — the agent is always a mind; `originator_neither` replaces `three_distinct` | `Toy.*` |

### v8.2 → v8.3 (Phase 3: attributes and latent commitments)

| # | Change | Where |
|---|---|---|
| aw | `exists_maximal`: the premises entail a maximal reality; no-best-world is inconsistent with P7 + P8 | FullTheorems; prose Exit 4E |
| ax | Optional P8s (satisficing) and `T4_6s`; `Good` threshold primitive | `P8s_stmt`, `Model.Good` |
| ay | Optional SK and `knows_actual`: the agent knows the actual contingent world; content gains `act r` | `SK_stmt`, `Content.act` |
| az | Part II: priority monism, branching actualism, Humean chance, Cantorian objection, no-best-world located at the premises they contact; attribute checklist §8.4 | prose |

### v8.3 → v8.4 (Phase 4: the soundness dossier)

| # | Change | Where |
|---|---|---|
| ba | P1 weakened to well-foundedness of ancestry (infinite branching permitted; only infinite regress forbidden); `exists_minimal` by well-founded induction | `P1_stmt`, `exists_minimal`, all P1 uses and witnesses |
| bb | Part III: soundness dossier for every remaining premise, each with statement, case, objections, replies, cost of denial, and ceiling; summary table §III.9 | prose |

### v8.4 → v8.5 (Phase 5: the two packages)

| # | Change | Where |
|---|---|---|
| bc | `W_Nat`: the naturalist's complete package (necessary initial state, two possible realities, no chance, no representation, no mind) satisfies every `Axioms` field except CE | `Toy.W_Nat.witness`; prose §8.3, §III.9 |

### v8.5 → v8.6 (after the second external review)

| # | Change | Where |
|---|---|---|
| bd | `NoTR` made mindless and representation-free: the powers naturalist's complete package satisfies every field but TR; two single-premise naturalist packages; "only CE" withdrawn | `Toy.NoTR`; prose §8.3, §III.9 |
| be | `W_Pref.residue`: the theist's own agent, same state, same representation, produces the strictly worse reality at w′; the libertarian residue certified, not confined to ties | `Toy.W_Pref.residue`; prose §6.4, §III.1 |
| bf | D20: `Sens` is inclination, not necessitation; the "because" gloss on *Favored* is interpretive; the w₀ restriction priced | header D20 |

### v8.6 → v8.7 (the conclusion named; the exits priced; review items closed)

| # | Change | Where |
|---|---|---|
| bg | `God M N` defined as the conjunction `main` concludes; `god_exists`: ∃ N, God M N ∧ ∀ N′, God M N′ → N′ = N. `#print axioms` ×42 | `God`, `god_exists`; prose §6.0 |
| bh | Review Part A applied: `Finite` deleted; `Favored` docstring flags its gloss; CE docstring says `HasProp`; D7 narrowed; prose §2 intro, P6→FA, §5.4, §6.1, 3.8, P10 corrected; Appendix A regenerated verbatim with A.0 and A.4 added | Lean docstrings; prose Part I, Appendix A |
| bi | D21: empirical status of CatOpen (supported: sharp boundaries in kind) and CatU (modal, not empirical); non-normalizability as the empirical anti-chance point | header D21; prose §III.7; `cosmic_strand_v2.md` |
| bj | D22: the two exits and their bills; the theist's residue priced with the asymmetry and its scope | header D22; prose §8.3, §III.1, §III.9 |
| bk | D23: the TR fork stated as the central open burden; III.5 rewritten as a full TR section (nil clause, Dretskean modus tollens, the fork) | header D23; prose §III.5, §10 |

### v8.7 → v8.8 (the TR fork certified)

| # | Change | Where |
|---|---|---|
| bl | `Powers M`: optional extension with `Directed s D` and the powers theorist's axiom `manif`; `PowersChannel` | `Powers`, `PowersChannel` |
| bm | `powers_all_tied` (no axioms): a powers channel directed at maximality ties every possible reality; `powers_fork`: directed at any D, either fails to track the good somewhere or ties everything | `section PowersFork` |
| bn | `W_Nat.powers_witness` (Horn 2 = the bare naturalist), `NoTR.powers_horn1` (Horn 1 consistent only tied), `W_Nat.no_powers_at_maximal`, `W_Pref.no_powers_at_maximal` (the theist's state is not a power) | `Toy.*`; prose §6.2, §III.5, §10 |
| bo | `#print axioms` ×47 | — |

### v8.8 → v8.9 (the fallible reading finished)

| # | Change | Where |
|---|---|---|
| bp | `FalliblePowers` (manifests at w₀ only); `Powers.fallible`; `FalliblePowers.actual` — the generic structure every model with a channel state has | after `PowersFork` |
| bq | *(withdrawn v8.14, row cf)* `W_Nat.fallible_witness`, `W_Pref.fallible_witness`: the same generic structure directs the channel state at maximality on both models, which differ only in `Sens`, `Rep`, `Mental` | `Toy.*`; prose §III.5 |
| br | III.5 closes the fallible reading on Mumford–Anjum, Vetter, and Bird; open problem 0 narrowed to one sentence with nothing further to formalize | prose §III.5, §10 |
| bs | `#print axioms` ×49 | — |

### v8.9 → v8.10 (P4 narrowed to uniqueness)

| # | Change | Where |
|---|---|---|
| bt | `Core` = `CoreNoP4` + P4; `CoreTheorems` typed over `CoreNoP4`; only `T2_8` takes `Core`; `mind_of_CE_NBL` certified free of P4 | `CoreNoP4`, `Core`, `section CoreTheorems` |
| bu | `W_P4.two_minds`: both fundamental beings in the ¬P4 model are necessary minds | `Toy.W_P4` |
| bv | III.6 P4 rewritten: trilemma for the second being; uniqueness located at IDF; island universes and the aggregate move answered; literature placed | prose §III.6, §10, §11, §III.9, D24 |
| bw | `#print axioms` ×50 | — |

### v8.10 → v8.11 (III.4 rewritten; prose only)

| # | Change | Where |
|---|---|---|
| bx | Case (c) corrected (no "represents that D does not favor"); Smith answered via the `Rep`/`Sens` split; evil-god reply withdrawn and relocated to the interpretation of `AtLeast`; Dasgupta conceded and answered by a count; the residue named in III.4 | prose §III.4, §11, §III.9; Lean header only |

### v8.11 → v8.12 (IDF)

| # | Change | Where |
|---|---|---|
| by | `SameProfile`, `IDF_stmt` (optional): fundamentals sharing every necessary feature are one | `section Stmts` |
| bz | `W_P4.IDF_and_not_P4`: alternation satisfies IDF and violates P4; IDF alone is not uniqueness | `Toy.W_P4` |
| ca | III.6: horn (iv) alternation added and `W_P4` named as it; IDF given its own dossier entry; D25; §2.3, §10, §11, §III.9 | prose |
| cb | `#print axioms` ×51 | — |

### v8.12 → v8.13 (CatU, P1, P11 argued; prose only)

| # | Change | Where |
|---|---|---|
| cc | CatU: parameter-continuum argument withdrawn; positive argument from infinitely many independent discrete respects; the propensity fork for the countable case (prose) | prose §III.7, §10, §11, §III.9 |
| cd | P1: the Grim Reaper diagnosis argued against the unsatisfiable-pair reading and the endless-future symmetry | prose §III.6 |
| ce | P11: argued against Benci–Horsten–Wenmackers (ultrafilter, relabeling, infinitesimal explanation) | prose §III.7 |

### v8.13 → v8.14 (after the third external review)

| # | Change | Where |
|---|---|---|
| cf | `fallible_actual_iff`: `FalliblePowers.actual` is content-free; the two `fallible_witness` theorems deleted; the fallible reading reopened; III.5's Mumford–Anjum, Vetter, Bird, Oderberg paragraphs rewritten to the texts | Lean; prose §III.5, §10.0, D26 |
| cg | `naturalPowers`, `natural_directed_nonempty`; `W_Pref.fork_is_residue`: Horn 2's "determinate type" is a tautology and Horn 1 is the theist's residue | Lean; prose §III.5, §6.2 |
| ch | `W_Two`: positions (i) and (ii) certified; `W_P4` is (iv); positions (i)/(iv) unpriced (`Bare` is world-indexed); IDF ≠ ID | Lean; prose §III.6, §10.6, §10.17, D26 |
| ci | `BothChannels.witness`: ¬NBL with the state channel on keeps `God` | Lean; prose §III.2, §6.2 |
| cj | `god_holds`, `knows_everything`; §6.0 says what `God`'s conjuncts amount to | Lean; prose §6.0 |
| ck | `L2_countable_uniform`, `uniform_countable_refuted`: the uniform propensity horn certified (CatOpen needed) | Lean; prose §III.7 |
| cl | `verify.sh` pins statements (`expected_statements.txt`); the statement-weakening attack is a tested failure | scripts, CI |
| cm | Prose: III.1 ties and `T2_2`; III.4 count and Collins; III.7 CatU's second premise, BHW, Schiffrin–Wald; III.9 rows; housekeeping | prose |

### v8.14 → v8.15 (after the fourth external review)

| # | Change | Where |
|---|---|---|
| cn | FA and P9 restricted to states in force at w (`M.E_state w s →`); `inground_state_in_force`; every consumer re-threaded; a premise weakening with no loss of theorems | `FA_stmt`, `P9_stmt`, `mental_of_nonactual`, `T3_8`, `T3_10`, `T3_11`; prose III.3, D19 |
| co | `W_P2`, `W_P4`, `W_P1`, `W_L4` witnesses certified `P6_stmt` instead of `FA_stmt` since v8.2; fixed | `Toy.*` |
| cp | `mind_of_CE_NBL` concludes `Mental s ∧ Mind t` of the selector (was a fresh `∃ t'`); `DState.witness` strengthened | `mind_of_CE_NBL`, `Toy.DState` |
| cq | `T3_11'` proved directly (was `(T3_11 A).2`, through `Src`) | `T3_11'` |
| cr | `L0_of_P1`; L0 marked derived; v8.14's "L0 burden" withdrawn | Lean; prose III.6 |
| cs | `P8s_holds`, `SK_holds`, `W_P4.IDF_and_not_ID` | `Toy.*` |
| ct | `verify.sh` check 6 pins definitions (`expected_definitions.txt`); README states what green means | scripts, CI, README §0.0 |
| cu | Stale names in the Lean header (`identify_of`, `three_distinct`, P6′, "~3–5", E as a chance premise) corrected; prose sweep (D25, changelog, §11, title, D23, `Narrow` row, §5.4, §10.15, D18, D27, D28, Appendix A) | Lean header; prose; README; guide; handoff |

---

### v8.15 → v8.16 (the deferred definitional changes)

| # | Change | Where |
|---|---|---|
| cv | `Mind`, `Knows` require the state in force at some world; D28 resolved; consumers re-threaded | `Model.Mind`, `Model.Knows`, `knowsAll_of_rep`, `T3_8`, `T3_11`, `T3_11'`, `mind_of_CE_NBL`, `knows_actual`; `Toy.*` |
| cw | L0 removed as a `CoreNoP4` field (derived: `L0_of_P1`); no proof used it | `CoreNoP4`; every witness statement |
| cx | `W_Two`: per-state `Rep`/`Mental`; position (i)'s N₂ certified not a mind, knows nothing | `Toy.W_Two.OneChannel.position_i` |
| cy | `W_Two.Both.ID_and_not_IDF` (kinds differ across worlds); with `W_P4.IDF_and_not_ID`, IDF ≠ ID both ways | `Toy.W_Two.Both` |
| cz | v8.15 independently verified by CI run 94204794756 (recorded in the handoff) | handoff |

### v8.16 → v8.17 (the last two formal burdens)

| # | Change | Where |
|---|---|---|
| da | Per-being contribution: `Contrib`, `ContribDet`, `SensOf`, `BareOf`, `Contributes`; optional premise CEB | `Model.*`, `CEB_stmt`; prose §1.4, §2.3, D29 |
| db | `contrib_det_empty`, `contributors_sensitive`, `contributors_are_minds`, `CEB_of_Axioms` | CoreTheorems, WithP4plus |
| dc | `W_Two.OneChannel.position_i_priced`, `W_P4.alternation_priced`, `W_Two.Both.two_contributors_two_minds`, `Toy.CEB_holds`, `W_Pref.CEB_holds` | `Toy.*`; prose III.6, III.9, §10, §11 |
| dd | `FallibleDir`; `fallible_not_power`, `fallible_maximal_discriminates`, `FallibleDir.toFallible` | after `FalliblePowers`; prose III.5, D30 |
| de | `W_Pref.fallible_dir`, `W_Nat.fallible_dir`, `NoTR.no_fallible_dir`, `Toy.no_fallible_dir` | `Toy.*` |
| df | The handoff's formal burden list is empty; what remains is philosophical | handoff §9 |

## 3a. The website

`.github/workflows/pages.yml` publishes a GitHub Pages site — the argument, the plain-language guide, the handoff, the cosmic strand, the review brief, both external reviews, this README, a verification page listing all certified results with their axioms, and the full formal proof rendered with line anchors and a declaration index and downloadable as a file, together with the three pinned expected files and a source archive of the commit.

It runs **only** on a successful completion of the `verify` workflow on `main` (`on: workflow_run`, `conclusion == 'success'`), checks out the exact commit that run certified (`workflow_run.head_sha`), and — before deploying — `cmp`s the published `NecessaryAgent.lean` and expected files against the checked-out ones. So the site can never show an unverified state: a push that fails `verify` leaves the previous certified site in place. The footer of every page names the commit and the verify run it came from.

Build locally with `python3 scripts/build_site.py` (needs `pandoc`); output in `site/` (ignored by git). One-time setup in the repository: Settings → Pages → Source: **GitHub Actions**.

## 4. Workflow for future changes

Every prior version of this argument was declared fixed by the person who fixed it and then broken by the next reader. The Lean file exists to end that. It only works if the workflow is followed.

1. **Change the prose first, in Part I only**, and say which Lean definition or premise it corresponds to. Never paraphrase the Lean file in any handoff or summary; attach it. (A v8.6-era handoff reconstructed the file from memory with a sign-flipped CE and an unparseable field; the rule exists because of it.)
2. **Make the matching change in the Lean file.** If a definition changes, every theorem mentioning it must be re-proved; the compiler will tell you which.
3. **Run the three checks (§0.1).** If `Toy.A` no longer compiles, either the new premise set is inconsistent or the toy model needs a different instance — find out which before proceeding. If a witness no longer compiles, the corresponding independence claim in the prose must be withdrawn.
4. **Re-check faithfulness by inspection**: read the changed Lean definition and the changed prose sentence side by side.
5. **Never accept a "verified" claim from the same session that made the change.** Hand the files to a fresh reader (human or chat) with the expected outputs and the instruction: reproduce the seventy-seven `#print axioms` lines, the pinned statements and the pinned definitions, then attack faithfulness, then attack Part II. (v8.14–8.16 were produced by the session that reviewed v8.13. v8.15 was independently verified by CI run 94204794756 and v8.17 by run 94209860042; the certified state is reproduced, and faithfulness of the v8.17 definitions is the next reader's job.)

What a fresh reader can still legitimately attack after all this: (i) whether a Lean definition captures the intended notion; (ii) whether a stipulation D1–D12 is reasonable; (iii) whether a premise is true. They cannot legitimately attack the inference from premises to conclusion — if they think they can, the Lean file is the arbiter, and they should produce a compiling counterexample.

---

## 5. Known limits

- **The value structure is axiomatized, with ℚ as the certified instance.** L2 is proved from `ArchOrd`/`FinMeasure`; ℚ is certified to satisfy `ArchOrd` in core; ℝ satisfies the same eight axioms by inspection. No external library is used anywhere, by design: the trusted base is core Lean only.
- **P3, P6 and P10 are derived.** P3 from CE + NBL + GG; P10 from NI + CH + TR; NI from NBL; P6 (for the states that matter) from FA. The mind conclusion (`mind_of_CE_NBL`) needs only CE, NBL, CH, TR and FA — no value premise, no derivation premise.
- **P10 is derived; the premises behind it are NI, CH, TR.** CH and TR are close to framework; NI is the substantive one, and its denial is axiarchism. `DLaw` certifies that the "law tracks the supervenience base" reply is the P3 exit, not a P10 exit.
- **No independence witnesses for P7, P8, P11, F1, Src.** Tier 4's vocabulary is abstract so P7/P8 independence is trivial; P11's denial is non-Archimedean chance; F1 and Src are framework. Every other premise, including P4⁺, has one.
- **The balance is a primitive comparative.** `AtLeast` has no axioms (not even reflexivity or transitivity); nothing in the argument needs them. Reasons themselves are not objects in the model, and MR is not formalized. The certificate says the actual reality is unbeaten on the balance; what the balance *is* remains in the prose.
- **Downstream claims are out of scope.** Knowledge of the actual world beyond O, and goodness in any act other than O, are not in the Lean file and not claimed.
- **The TR fork is certified for the necessitating reading, and the fallible reading is formalized with content about the state (v8.17).** `powers_fork` and its witnesses close the determinate-type and the necessitating-maximality readings. `fallible_actual_iff` shows the v8.9 fallible structure is content-free and its witnesses are deleted; `W_Pref.fork_is_residue` shows the fork's Horn 1 is the theist's residue; `manif` is Lowe's reconstruction of Mumford–Anjum, not their axiom, and the Vetter/Bird closures do not hold to the texts. `FallibleDir` is satisfied by the theist's state and the bare naturalist's alike (`W_Pref.fallible_dir`, `W_Nat.fallible_dir`), is not a power, needs a discriminating balance, and does not exist on a tied one. What remains is TR's content claim — `Sens` — against a powers naturalist who holds the theist's own modal primitive (prose §10, item 0, and III.5). Nothing formal remains on TR.
- **CatU is modal, not empirical, and has a positive argument (v8.13).** The constants of our laws yield about five independent sharply-bounded constraints (D21); uncountably many isolated kinds come from infinitely many independent discrete structural respects (III.7), with one contestable premise. The countable-kinds case is met by the propensity fork, which is prose: the model has no notion of what a propensity's weights track. The empirical anti-chance point (non-normalizability) is also prose.
- **P4 is for uniqueness only (v8.10); uniqueness is CEB + IDF + profile uniformity (v8.17).** The mind conclusion is typed over `CoreNoP4`; `W_P4.two_minds` shows denying P4 gives several necessary minds. IDF is stated in the file as an optional premise and `W_P4.IDF_and_not_P4` certifies it is not sufficient alone: the alternation model satisfies it and violates P4. Per-being contribution (`BareOf`, CEB) prices positions (i) and (iv) (`position_i_priced`, `alternation_priced`); `contributors_are_minds` makes every fundamental contributor a mind under CEB; `W_Two.Both.position_ii` is excluded by IDF. What is not a theorem is profile uniformity — that two necessary contributors' states match — and uniqueness is honestly CEB + IDF + that.
- **Nothing in the empirical strand is a probability.** No number in `cosmic_strand_v2.md` is applied to the bare hypothesis, which has none by definition.
- **Sandbox note.** This was checked in a container without Mathlib. The file imports only `Std`.
