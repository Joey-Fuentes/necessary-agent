# External read-through of `necessary-agent` v8.14 — findings

**Object reviewed.** `necessary-agent-v8_14_tar.gz`, git commit `8b45d9c` ("v8.14: after the third external review (of v8.13)"). Files: `NecessaryAgent.lean` (5,089 lines), `README.md`, `scripts/verify.sh`, `.github/workflows/verify.yml`, `expected_axioms.txt`, `expected_statements.txt`, and `docs/*`.

**Method and limits.** Read-through by inspection, in two passes. No Lean toolchain and no network were available, so nothing below is a kernel check; the file's claim to compile under Lean 4.33.1 with zero warnings is taken at face value. Line numbers are for the v8.14 commit. Names in backticks are Lean identifiers unless stated. The document lists findings only; it does not propose fixes.

**One-paragraph summary.** No error was found in any proof traced (Tier 1–4 chain, `main`/`god_exists`, the L2 measure argument, every witness construction). The problems are in what the certificate covers versus what the documents say it covers: one premise (FA) is formally much stronger than its prose, one headline theorem's type says less than its docstring, one theorem's proof uses a premise the prose says it avoids, four independence witnesses certify a retired premise, the CI's new statement-pinning check can be bypassed one level down, and the documents disagree with each other and with the file in a number of places, several of them carried over from versions that were later withdrawn.

---

## Part A — The certification apparatus

### A1. Check 5 pins statements but not the definitions they name

**Where.** `scripts/verify.sh` (check 5), `README.md` §0.0 items 5 and the sentence "A green check on `main` therefore means exactly: the file in the repository is in the certified state described in this README."

**What.** The v8.13 review showed that a theorem statement could be weakened to `… ∨ (1 = 1)` while CI stayed green. v8.14 added check 5, which pins the `#check @name` output of every certified result against `expected_statements.txt`. That output prints the theorem's type as it names things: `NecessaryAgent.Axioms M → … ∧ M.AccordsValue M.w₀ ∧ …`. It does not unfold `Axioms`, `AccordsValue`, `KnowsAll`, `P7Antecedent`, `Agential`, or any `abbrev X_stmt`.

So the same attack works one level down. Change `abbrev P8_stmt … := True`, or `def Model.AccordsValue … := True`, patch the handful of witness proofs that stop typechecking, and every one of the five checks passes with byte-identical `#print axioms` and `#check` output. Some definitions are protected indirectly because some witness asserts their negation (`W_Pref.residue` needs `¬Maximal`; `NoAcc.witness` needs `¬KnowsAll`), but `AccordsValue`, `P7Antecedent`, `Agential`, `BringsAbout`, and every premise abbrev are not.

**Why it matters.** "Green on `main`" currently certifies: these 58 names exist, with these axiom sets, with these printed types. It does not certify what those types mean. The v8.13 reviewer suggested `set_option pp.all true`; that was not adopted, and it would not close this either, since `pp.all` still does not unfold definitions.

### A2. The README cites a fingerprint that does not exist

**Where.** `README.md` §0: "the fingerprint that counts is the SHA-256 in the v8.14 commit message".

**What.** No commit message in the repository (checked `git log --all`) contains a SHA-256 or any hash. The README's own earlier admission that the MD5 it once stated "matched no file in the history" is now followed by a second fingerprint claim that also has no referent.

### A3. Minor fragilities in `verify.sh` (defended in depth; note only)

- Check 3's grep for forbidden declarations anchors on `^[[:space:]]*(axiom|unsafe|partial|opaque)`, so `private axiom …`, `protected unsafe …`, or an attribute-prefixed `@[…] axiom …` pass it. Any real use is still caught by check 4 (`sorryAx`/new axioms would appear in `#print axioms`).
- The `sorry` grep whitelists any line containing the string `zero \`sorry\``; caught by check 2 (Lean warns on stdout).
- Check 2 greps stdout case-insensitively for the substrings `error|warning|sorry`. Any future identifier containing one of those substrings (e.g. a theorem named `…terror…`) would fail the build as a false positive.
- `lakefile.toml` / `lake-manifest.json` are not used by CI (which runs `lean NecessaryAgent.lean` directly); they are harmless but vestigial.

---

## Part B — The Lean file: what is certified versus what is claimed

### B1. FA and P9 are formally far stronger than their prose, because "ahistorical" is vacuous at worlds where a state is absent

**Where.** `FA_stmt` (l. 1122–1123), `P9_stmt` (l. 1136), `Model.Historical` (l. 1041), `F1_stmt` (l. 1064); prose D19 (Lean header and argument doc §1.0), argument doc §III.3 ("Cost of denial").

**What.** `Historical w s := ∃ x, Anc w x (inr s) ∧ ContingentItem x`. Ancestry is the transitive closure of `Causes w`, and F1 says `Causes w x y → E w x ∧ E w y`. So at any world `w` where `s` is not in force (`E_state w s` false), nothing causes `(inr s)` at `w`, `s` has no ancestors there, and `¬Historical w s` holds vacuously. FA is stated `∀ w s, ¬Mental s → ¬Historical w s → (∀ r, Rep s (alt r) → r = realOf w) ∧ (Rep s nil → realOf w is empty)`, and `Rep` is not world-indexed.

Consequence: a non-mental state that represents some alternative `r` must satisfy `r = realOf w` at *every* world where it is absent. Take a contingent organism with a non-mental state representing an alternative; at any two worlds where the organism does not exist and the contingent realities differ, FA is violated. So in any model with modest modal variety, `Axioms` is inconsistent with any non-mental state representing any alternative or ⟨nil⟩ at all — anywhere in the model, not just at the foundation. (The only escape would be to make the state "in force" at a world where its bearer does not exist, but B2 + F1 derive `E_state w s → E_thing w (bearer s)`, so there is none.)

D19 says FA "does not touch ordinary biological or artefactual representation … that is what selection history buys (Millikan)." III.3 prices its denial as "naturalistically ungrounded content of the non-actual in a mindless state." The formal FA is denied by Millikan's frog.

P9 has the same shape: `∀ w s, RepState s → ¬Historical w s → NecState s → AccurateAll s`. A necessary representational state of a *contingent* being (`NecState` only requires "in the state wherever the bearer exists") is vacuously ahistorical wherever the bearer is absent, so P9 declares it accurate throughout.

**Why it matters.** Validity is unaffected — a stronger premise still delivers the theorems. What is wrong is the price column: the dossier defends and prices a premise about ahistorical states *of the ground*, while the certified premise binds every non-mental (resp. necessary) representing state in the model. The argument only ever applies FA and P9 to states that are causing something at the world in question (so `E_state` is available there via F1), which is why the intended premise is the weaker one.

### B2. Four independence witnesses certify the retired premise P6 instead of FA

**Where.** `Toy.W_P2.witness` (l. 3039), `Toy.W_P4.witness` (l. 3245), `Toy.W_P1.witness` (l. 3451), `Toy.W_L4.witness` (l. 3649); pinned in `expected_statements.txt` l. 219, 245, 270, 297.

**What.** Each independence witness is a single theorem asserting "every other `Axioms` field holds ∧ this premise fails ∧ this conclusion fails." These four list `P6_stmt` in the first conjunction and never mention `FA_stmt`. P6 left `Core` at v8.2 when FA replaced it (README changelog row "at"); `P6_stmt` is still defined (l. 1127) but is not a field of any premise structure.

**Why it matters.** README §1 ("Each of P1, P2, P4, P5, FA, P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺ is independent of the other premises") and argument doc §2.3 ("for each … a model in which every other `Axioms` field holds") are not what the kernel checked for P1, P2, P4, and L4. Philosophically low-risk — all four models set `Mental := fun _ => True`, so FA holds trivially — but the certificate and the prose say different things, and this survived three reviews. The other thirteen witnesses (those built via `Nonempty (Core …)`/`Nonempty (Axioms0 …)` or listing `FA_stmt` explicitly) are fine.

### B3. `mind_of_CE_NBL`'s type says less than its docstring, README, and prose

**Where.** `mind_of_CE_NBL` (l. 1742–1746); docstring above it; README §1 and §2.1; argument doc §5.3 ("Mind without value"), §7 Exit 2C″, D24; `Toy.DState.witness` (l. 2920).

**What.** The conclusion is

```
∃ (t : M.Thing) (s : M.State), M.Nec t ∧ M.Concrete t ∧ M.bearer s = t ∧
  (∃ m, M.F M.w₀ m ∧ M.CausesVia M.w₀ t s m) ∧ M.RepState s ∧
  (∃ P, M.Sens M.w₀ P (.state s)) ∧
  ∃ t', M.Nec t' ∧ M.Concrete t' ∧ M.Mind t'
```

The final existential is fresh. Nothing in the type says `t' = t`, and nothing says `s` is `Mental`. The proof establishes both (it instantiates `t'` with `M.bearer s` and proves `Mental s`), but the pinned, CI-protected object is the type, and the type is compatible with "the selector is one thing and the mind is another." The docstring says "there is a necessary concrete being that is a mind and whose state selects the first contingent items … the selecting state … cannot be non-mental"; README §1 says "The mind conclusion (`mind_of_CE_NBL`) needs only CE, NBL, CH, TR and FA"; prose §5.3 says "and that being is a mind"; §7 Exit 2C″ says the theorem "shows a necessary mind still exists whose state does the selecting."

`Toy.DState.witness` inherits this: its last conjunct is `∃ t, Nec t ∧ Concrete t ∧ Mind t`, obtained from the fresh `t'`, so the ¬GG witness certifies "some necessary mind exists," not "the selector is a mind."

**Why it matters.** This is the headline "necessary mind without any value premise" result, and it is precisely a statement-weaker-than-claim case — the class of gap that check 5 was added to catch, one level below where check 5 looks.

### B4. `T3_11'` is proved through `T3_7`/`Src`, contrary to three documents

**Where.** `T3_11'` (l. 1878–1880): `theorem T3_11' : … := (T3_11 A).2`. Claims: argument doc §5.3 ("No use of Src, D5, or 3.7. Unconditional since v8.2"), README §2.1 ("3.11′ | `T3_11'` | Axioms0 (no Src; …)"), argument doc changelog (am) ("with no root regress and no use of `Src`"), Lean docstring ("with no regress to a root representation and no use of `Src`").

**What.** `T3_11` obtains the root state via `T3_7`, which is `root_of_state`, which uses `A.Src` (and the well-founded induction on states). `T3_11'` is defined as the second component of `T3_11`, so its proof term depends on `Src`. The type cannot certify Src-independence either, because `Axioms0` contains `Src` as a field. So the claim is neither true of the proof nor certifiable from the type. (`mind_of_CE_NBL` genuinely avoids `Src`; `T3_11'` does not.) A direct proof exists in three steps (`T3_6`, `selecting_props`, `mental_of_nonactual`).

### B5. §10 item 15 is contradicted by the file's own `Toy.archNat`

**Where.** Argument doc §10 item 15: "`ArchOrd` is instantiated by ℚ in core Lean (`archRat`), so the value-structure axioms are certified to be those of an ordinary dense ordered field." `ArchOrd` (l. 616–631); `Toy.archNat : ArchOrd Nat` (l. 2330).

**What.** `ArchOrd` has a reflexive-transitive `le` (no antisymmetry, no totality), a commutative associative `add` with left zero, monotonicity, and two Archimedean clauses. It has no density, no negation, no multiplication. The file itself proves ℕ with the usual order satisfies it. `archRat` certifies that ℚ is *an* instance; it says nothing about the axioms characterizing a dense ordered field, and they do not.

### B6. Results asserted as certified that are not in the file

- Argument doc §7 Exit 4E: "the satisficing route is certified consistent (the consistency model satisfies P8s)." No theorem states `P8s_stmt Toy.M` (or `SK_stmt Toy.M`). Both optional premises appear only as hypotheses of `T4_6s` and `knows_actual`; nothing certifies that either is jointly satisfiable with `Axioms`. (Both are true of `Toy.M` — `Good := fun _ => True`, `Rep := fun _ _ => True` — but uncertified.)
- Argument doc III.9, IDF row: "`W_P4` has IDF ∧ ¬ID (v8.14)," and III.6 "IDF (certified) and ¬ID (`K := Unit` with both worlds productive)." The handoff (§9 item 10, §8a) lists "¬ID on `W_P4` as a theorem" as *not compiled*. It is true (both worlds have non-empty F, `K := Unit`, so `TypeDeterministic` holds and `Deterministic` fails), but it sits in a table row beside "(certified)" with no marker.

### B7. Definitional scope that the prose renders faithfully but never flags

- **Causally inert contingents are outside "reality."** `Concrete t := ∃ w y, Causes w (inl t) y`, and `ContingentItem` requires `Concrete`. So a contingent thing that never causes anything at any world is not a contingent item: it is outside `realOf w`, it needs no cause under P2, and `BringsAbout`, `KnowsAll`, and `God` say nothing about it. "Brings about every world's contingent reality" means every *causally active* contingent, and P2 permits uncaused, causally inert contingent existents. §1.2 renders the definitions correctly; no D-entry records the consequence. (In `W_Pref`/`W_Nat` this is visible: `actual := {c1}` because `d1` "causes nothing, so is not concrete.")
- **`Mind` and `Knows` do not require the state to be in force anywhere.** `Mind t := ∃ s, bearer s = t ∧ Mental s`; `Knows t c := ∃ s, bearer s = t ∧ Rep s c ∧ Accurate s c`. Neither requires `E_state w s` at any `w`, so a being counts as a mind or a knower in virtue of a state-type it never occupies. The certified chain uses a necessary state of a necessary being, so `God`'s conjuncts are unaffected; the definitions are looser than "some state of t is mental" reads.
- **`no_modal_collapse` is a near-analytic consequence of D1 + E.** Any contingent item fails to exist at some world, so `F` varies (that is the whole of `T2_4`). The framing "the defect formalization exposed in Gödel/Scott; here it is ruled out by theorem, not assumed away" oversells: nothing about the premises' modal strength is being tested.
- **L0 is derivable from P1.** A well-founded relation is irreflexive, so `L0_stmt` follows from `P1_stmt`. It is listed as a separate "near-universal" premise, and the handoff plans a dossier entry for it; both matter only to a reader who has already denied P1.
- **D18 "intensional" is limited.** Lean functions are extensional: two properties coextensive over *all* realities (not just Ω) are identified by `funext`/`propext`, and `Sens` would transfer between them. `DLaw`/`DState` work because `D` and `Maximal` differ at the empty reality. D18's appeal to Fodor/Davidson suggests more hyperintensionality than the model has.
- **`Sens` in the consistency witness is sensitive to every property.** `Toy.Pall.sens = viaState`, which holds for *every* `Q` at `w₀` through `s`, including `fun _ => False`. GG therefore holds trivially there. The file's own `knows_everything` is candid about `Accurate`/`AtLeast`; the same candour applies to `Sens`.

---

## Part C — Prose faithfulness errors (argument document)

### C1. The `Toy.Narrow` row in §6.2 misdescribes the model

**Where.** Argument doc §6.2, row P5: "`Toy.Narrow` — Rep only ⟨alt true⟩ | s is selecting but does not represent ⟨nil⟩." Lean l. 2775: `rep := fun c => c = .nil ∨ ∃ r, c = .alt r`.

**What.** The model represents ⟨nil⟩ and every ⟨alt r⟩ (it must, or TR would fail). What it lacks is ⟨cons c r⟩ — a consideration bearing on a reality — and that is exactly what the Lean proof of `¬P5` uses (`Bears := fun _ _ => True`, so `RepAllOmega` demands `Rep s (cons () r)`). The row appears to date from before ⟨nil⟩ was added to TR (v8.2).

### C2. "Same content" in §5.4 is one direction only

**Where.** §5.4, "Shared content": "The agent's selecting representation and the mind's root representation have the same content (Src, 3.7)."

**What.** `Src_stmt` gives `∀ c, Rep s c → Rep s' c` (the source represents everything the derived state represents), and `root_of_state` inherits that direction only. Nothing gives the converse. Certified: the root represents at least what the selector represents.

### C3. The IDF/ID correction was applied in III.6 but not propagated

**Where.** v8.13 review recommendation 6 asked to delete "the same commitment, paid once" from III.6, D25, and III.1's reply To 9. Current state:

- III.6 (l. 1351): "*Corrected (v8.14):* it is not. … Different sorts, different premises."
- III.9 IDF row: "paid **separately** from CE's Objection 9."
- D25 (l. 217): still "made once, on which both P4's uniqueness (III.6) and CE's reply to the haecceitistic exit (III.1, Obj. 9) rest."
- Changelog (bv) (l. 66) and (bp) (l. 83): still "made once" / "the same commitment CE already needs against Objection 9."
- §11 P4 row (l. 821): still "uniqueness rests on IDF …, the commitment CE already needs."

The document argues both sides of the same point.

### C4. §11 (Soundness status) has rows that predate v8.14

- TR row (l. 831): "The fallible reading is closed on the powers accounts (v8.9; `W_Nat.fallible_witness` = `W_Pref.fallible_witness` in structure …). One sentence left …" — the exact claim withdrawn in §10 item 0, D26, and III.9, with the cited theorems deleted from the file.
- Src / D5 row: "avoidable via P6′" — P6′ has not existed since v8.2; the route is FA (`T3_11'`, but see B4).

### C5. Title, D23, Appendix A header, and filenames

- The document's title line (l. 2) says both "the fallible reading reopened" and "the fallible reading finished (`FalliblePowers`)."
- D23 (l. 220) still ends with "*v8.9:* the fallible reading is finished … `W_Nat.fallible_witness` and `W_Pref.fallible_witness` show it is the *same* structure" as an assertion; D26 (l. 218) corrects it, but D23 carries no marker.
- Appendix A's introduction says the blocks are "unedited from `NecessaryAgent.lean` (v8.8)"; A.6 is a v8.14 addition. (The blocks themselves were mechanically diffed against the file and are verbatim apart from two intentional `…` ellipses.)
- The argument document, guide, and handoff are named `_v8_7` while their contents are v8.13/v8.14; the handoff's own housekeeping list notes this.

### C6. The prose cites Lean names that do not exist

- `identify_of`: §5.3 (l. 436) "(`identify_of` is the same result over `Axioms0` with P4⁺ as an explicit hypothesis)"; changelog (s) (l. 171). Not defined anywhere in the file.
- `W_Id.three_distinct`: changelog (s) (l. 171); replaced by `originator_neither` at v8.2.
- `fallible_witness` theorems: cited as current in §11 (see C4); deleted in v8.14.
- `MoralBears`: mentioned as absent (fine); noted only because it also appears in the handoff.

---

## Part D — Lean header, docstrings, and dead code

### D1. Stale references inside `NecessaryAgent.lean`

- l. 25–27: "`Toy.W_Id.three_distinct` is now the independence witness for P4⁺ … `identify_of` keeps the conditional form" — neither exists.
- l. 29: optional premises listed as "P6′ (`T3_11'`, the route that does not need single-source derivation)" — `P6′_stmt` does not exist and `T3_11'` is unconditional (and see B4).
- l. 282–283: "P6′ merges mind into agent … (`agent_ne_originator_under_P6'`)" — not defined.
- l. 293: independence list "for each of P1, P2, P4, P5, **P6**, P9, …" — should be FA (and see B2).
- l. 325 (D5): "`T3_11'` reaches the same conclusion … from P6′".
- l. 330 (D6): "`identify_of` keeps the conditional form".
- l. 1886 (docstring of `originator_produces_mind_and_agent`): "`W_Id.three_distinct` (three beings without it)".
- l. 2279–2282 (Toy namespace header): "parametrized by Favored, SelectedBecause, Rep, Mental, Accurate, HasProp. Covers: … independence of P3, P10, P5, P6, P9, P12" — the parameters are `⟨sens, rep, mental, accurate, hasProp, viaS⟩` since v8, and the premises covered are CE, NBL, GG, CH, TR, FA, P9, P5, P12.
- `W_Id.matrix` docstring: "the minds are exactly the bearer of r (plus the bearer of s if s is mental)" — `Mental := fun _ => True` regardless of `_mentalS`, which the family comment itself calls inert.

### D2. Dead code and unused bindings

- Unused `have hΩ : M.InOmega (M.realOf w) := …` in `P10_of` (l. 1291) and in `mind_of_CE_NBL` (l. 1748). (Not flagged by the linter in this toolchain, evidently, since CI reports zero warnings.)
- Defined but never used: `Toy.archNat`, `Powers.fallible`, `fallible_actual_trivial`, `natural_directed_iff`, `powers_no_preference`, `srcstar_anc`, `T2_9`, `W_L4.E_items`, and every `allItems`/`mem_allItems` pair. Some (`T2_9`, `srcstar_anc`) are deliberately present as prose-line anchors; `fallible_actual_trivial` is listed in README §2.1 but is not among the 58 pinned results.
- `W_Nat.Pw` and `NoTR.Pw` duplicate the body of `naturalPowers`; `W_Pref.PwNonempty` uses `naturalPowers`. Cosmetic.

---

## Part E — README inconsistencies

- §0 (l. 19): the SHA-256 claim (see A2).
- §0.1 item 3 (l. 104): "Independence witnesses compile (ten `*.witness` theorems)." There are seventeen `theorem witness` declarations (`Bare`, `Axiarch`, `NoCH`, `NoTR`, `DLaw`, `DState`, `NoMind`, `NoAcc`, `Narrow`, `Chance`, `W_P2`, `W_P4`, `W_P1`, `W_L4`, `W_Pref`, `W_Nat`, `BothChannels`), plus `W_Nat.powers_witness`.
- §1 (l. 112): "`T2_4'` from `Core` plus ID" — it is typed over `CoreNoP4` (and pinned that way in `expected_statements.txt`).
- §2 file map (l. 140): "optional: P6'_stmt, ID_stmt, CatU/CatOpen, IDF_stmt" — `P6'_stmt` does not exist; `SK_stmt`, `P8s_stmt`, `P7all_stmt`/`P8all_stmt` are the other optional premises and are omitted.
- §2 file map (l. 154): "`Toy.Bare/Axiarch/NoCH/NoTR/NoMind/NoAcc/Narrow/Chance` — P3, NI, CH, TR, P6, P9, P5, P12" — `Bare` is the ¬CE witness, `Axiarch` is ¬NBL, `NoMind` is ¬FA (v8.1–8.2); P3 and NI are derived and have no witnesses of their own.
- §2.1 table (l. 225): row "the fallible reading, both sides | `W_Nat.fallible_witness`, `W_Pref.fallible_witness`" — deleted in v8.14 (the v8.14 changelog row "cf" in the same README says so).
- File table (l. 13): lists `docs/necessary_agent_v8_5_review.md`, which is absent (`docs/NOTE_review_file.md` says so); does not list `docs/necessary_agent_v8_13_review.md`, `docs/REVIEW_BRIEF_v8_13.md`, `docs/Necessary_Agent_Handoff_v8_7.md`, or `expected_statements.txt`.
- File table says the plain-language guide is "synchronized with v8.7"; the guide's header says v8.13 and its count says fifty-one (v8.12/13); the file has fifty-eight.
- §1 "modeling decisions (header D1–D23; prose §1.0)": D24–D26 exist only in the prose; the v8.14 changelog row "cf" attributes D26 to "Lean; prose".
- Changelog rows (u), (z) cite `Toy.W_Id.three_distinct`, `agent_ne_originator_under_P6'`, `identify_of` — acceptable as history, but nothing tells the reader these were later removed except row (av).

---

## Part F — Plain-language guide and handoff

### F1. The guide asserts a withdrawn result in the body and retracts it in a footnote

**Where.** `docs/plain_language_guide_v8_7.md`, Exit 2 section (l. 171–173) and "The honest part" (l. 212).

**What.** The Exit 2 section still says "the computer confirms the very same description fits the bare naturalist's picture and the theist's" and ends with "That is the one sentence the powers naturalist still has to write." The appended note then says that machine-checked result "said nothing about the state at all — and it has been deleted." A reader who stops at the section receives the withdrawn v8.9 claim as established fact.

### F2. Other guide points

- "fifty-one certified results" (l. 7); the file has fifty-eight.
- "every premise *can* be rejected without contradiction" (l. 9) overclaims: P7, P8, P11, F1, and Src have no independence witnesses (README §5 says so).

### F3. Handoff

- Claims "CI (`scripts/verify.sh`, checks 1–5) passes locally on this commit" and simultaneously flags itself as not independently verified (consistent with README §4 step 5; noted only so a fresh reader does not treat either as verification).
- Its "Open — formal" item 9 (an L0 dossier entry) is affected by B7 (L0 is derivable from P1).

---

## Part G — Small numeric / wording inconsistencies

- The Lean header's v8.7 note says the count of independent sharply-bounded constraints is "~3–5"; D21 (Lean and prose), D22, III.9, and `cosmic_strand_v2.md` say five.
- D7 lists E among "the chance premises … stated at w₀"; E is not a chance premise (it is stated at w₀, which is presumably what was meant).

---

## Part H — What was checked and found clean

- The 58 `#print axioms` names in the Lean file, `expected_axioms.txt`, and the README block match, in order; the 58 `#check` names match the `#print` list.
- The pinned statements spot-checked (`main`, `god_exists`, `identify`, `T3_11'`, `T2_4'`, `mind_of_CE_NBL`, `W_P2.witness`, `DState.witness`, `W_Nat.witness`) match the source, including the `P6_stmt` conjuncts noted in B2 (i.e. B2 is not a typo in the pin; the pin faithfully records the defect).
- Appendix A of the argument document is verbatim against the Lean file apart from two intentional `…` ellipses.
- Every Lean-like identifier cited in backticks across the README and docs was mechanically checked against the file's declarations; the only unaccounted names are those listed in C6, D1, and E.
- Proofs traced without finding an error: `pair_inj`, `uncountable_fiber`, `countable_of_mem_list`, `exists_nodup_list`, `list_bound`, `L2`, `L2_countable_uniform`, `archRat`/`RatArch.*`, `exists_minimal`, the whole `CoreTheorems` and `FullTheorems` sections, `identify`, `main`, `god_exists`, `powers_all_tied`, `powers_fork`, `uniform_countable_refuted`, and the constructions of every `Toy.*` model and witness (`F_char`, `fund_N`, `not_det`, the `Sens`/`Rep`/`Mental` settings against the claimed field lists).
- `verify.sh` parses; the pipeline logic under `set -o pipefail` behaves as intended for all three outcomes of the `sorry` grep.

**Standing caveat.** This is a read-through by a single session without a compiler, which by the project's own README §4 step 5 is not verification. The Lean-level findings (B1–B5) are about what statements and definitions say; the proofs were read, not kernel-checked.
