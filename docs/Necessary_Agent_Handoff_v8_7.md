# A Necessary Agent — Handoff (v8.14)

**Status:** Consolidated as of 2026-09-13. Supersedes `Necessary_Agent_Teleological_Handoff.md`, `teleological_argument_proof.md`, and `teleological_argument_proof__1_.md` in full.
**Verified:** `NecessaryAgent.lean` compiles under Lean 4.33.1 (core, no Mathlib), exit 0, zero errors, zero warnings, zero `sorry`; 58 `#print axioms` results, every one depending on at most `propext`, `choice`, `Quot.sound`; the statement of each pinned in `expected_statements.txt`. CI (`scripts/verify.sh`, checks 1–5) passes locally on this commit. **Produced by the session that reviewed v8.13; not independently verified** (README §4, step 5).

---

## 1. Goal, stated precisely

Construct the strongest argument for a necessary rational agent — God, in the classical sense — without assuming any religion, revelation, omniscience, omnipotence, moral perfection, or that complexity implies design.

The target, in the terms the file now uses: **make every exit from `god_exists` as expensive as the literature allows, and state each price exactly.**

What "proof" means here, and what it doesn't. `god_exists` is a certified theorem of the form `Axioms M → ∃ N, God M N ∧ (unique)`. The antecedent cannot be discharged: every contested field of `Axioms` has an independence witness in the same file (P7, P8, P11, F1, Src do not: README §5), i.e. a Lean proof that denying it is consistent. So the argument is a proof for anyone who accepts the premises, and a priced bill for anyone who doesn't. It is not, and cannot be made into, a demonstration that closes every exit — the certification apparatus is itself the proof of that. The remaining work is on the *prices* — and, after the third review, on two places where the price has no formal object: the fallible powers reading (III.5) and a second channel-less fundamental (III.6).

---

## 2. File inventory

**Current (use these):**
- `NecessaryAgent.lean` — the argument. Arbiter of validity. Attach the actual file to every handoff; never paraphrase it from memory (the retired "Blueprint" did, and its Lean block had a sign-flipped CE, a mangled `Maximal`, an unparseable field, and `Chan` declared after use).
- `NecessaryAgent_v8_7_print_axioms.txt` — verification output.
- `plain_language_guide_v8_7.md` — companion for non-specialists; synchronized with v8.7.
- `cosmic_strand_v2.md` — the empirical strand, conservative numbers, with its two roles and its exclusions.
- `necessary_agent_argument_v8_7.md` — the full prose argument (Parts I–III, Appendix A), synchronized with the Lean: Appendix A regenerated verbatim from the certified file (A.0 and A.4 added), every Part A review item applied, III.1 and III.5 rewritten, III.7 and III.9 updated, §6.0 carries `God`/`god_exists`, §6.4 and §8.3 carry the priced residue and the two packages.
- `README.md` — how to verify (42 expected lines, checked byte-identical against the actual compiler output), reading map, change log through v8.7, workflow, known limits.
- `necessary_agent_v8_5_review.md` — the external review. Not modified. Status of its items in §8 below.
- This document.

**Superseded (do not use):**
- `Necessary_Agent_Teleological_Handoff.md` — used pre-v8 premise names (P3, P10, P6, P9 as the "remaining bridges"); all four are now derived, replaced, or bookkeeping. Treated Case A necessitation as the strongest escape; in the model that is denying E.
- `teleological_argument_proof.md` — the 10⁻³⁸ "Glitched Monkeys" argument. Error-rate ratios treated as probabilities; independence assumed among instances of one mechanism; evolved machinery treated as fine-tuning.
- `teleological_argument_proof__1_.md` — the "Blueprint." Incorrect Lean excerpt; targeted `W_Nat`/`NoMind`/`Axiarch` and ignored `NoTR`; its "causality is broken" critique of `W_Nat` proves too much given `W_Pref.residue`; advocacy register.

---

## 3. The argument as it stands (correct names)

**Tier 1 → a unique necessary concrete ground N.** E, P2, P1 (well-founded ancestry; infinite branching allowed), P4 (exactly one uncaused necessary concrete thing, the same in every world). Oppy grants all four with N = the initial state.

**Tier 2 → the first production is neither determined nor chance.** `no_modal_collapse` (certified): N invariant + worlds differ ⇒ N doesn't determine F. Anti-chance: P11 (Archimedean, finitely additive propensities), CatOpen (kinds are open regions with sharp boundaries), CatU (uncountably many kinds), L4 (zero-propensity regions can't obtain). `P12_of_cat` and `L2_of_P11` certified.

**CE** (the key premise): at a world with non-empty output, which reality obtains is deterministic, or `HasProp`, or sensitive through some channel to some property of the candidates. Deny ⇒ Exit 1 (`W_Nat`).

**NBL, CH, TR, FA → N is a mind.** NBL: laws as such select nothing (deny ⇒ `Axiarch`/`DLaw`). CH: a state channel is a causal channel. TR: a state sensitive to a property of the candidates represents every alternative and the nil alternative (deny ⇒ Exit 2, `NoTR`). FA: ahistorical non-mental content is factive (deny ⇒ `NoMind`). `mind_of_CE_NBL` certified without any value premise.

**Tier 4 → for the good.** GG (whatever the state tracks in selecting, the selection is sensitive to maximality); P7/P8 at w₀ only (acts on the best reasons; that produces the maximal reality); P8s satisficing fallback; `exists_maximal` certified (the premises entail a top exists, so Rowe's no-best-world thesis is not neutral).

**P4⁺ → one being.** `identify`, `main`, and now `god_exists`.

**Certified facts that shape the dialectic:**
- `W_Pref.residue` — the theist's own agent, same state, same representation, produces the strictly worse reality at w′. One bare contrast on the theist's side; not confined to ties.
- `all_tied` — P7/P8 stated for all worlds ⇒ every reality tied. This is why they are w₀-only (D7), and D20/D22 now *price* that restriction rather than presenting it as bookkeeping.
- Two single-premise naturalist packages: `W_Nat` (¬CE) and `NoTR` (¬TR). "Only CE" is withdrawn.
- `Sens` is primitive with no axioms; "favored" ≠ difference-making (D20; `Favored` docstring now flags this).

---

## 4. The two exits and their bills (D22)

**Exit 1 — `W_Nat`, deny CE.** Nothing bore on which reality the necessary foundation produced. Price:
(a) the whole content of the first stage — under the conservative numbers, Λ inside a ~2-order window against a ~120-order natural range; Q inside a ~2-order window; light quark masses inside the nuclear-stability island; near-zero initial gravitational entropy against a ~10¹²² maximum; 3+1 dimensions — obtains with nothing bearing on any of it;
(b) contrastive explanation is exempted at exactly one point and demanded everywhere above it;
(c) the measure cosmology uses for initial conditions is rejected, or kept and Boltzmann brains inherited.

**Exit 2 — `NoTR`, deny TR.** Something bore on the outcome — a necessary state directed at a determinate kind — but the state is about nothing; no alternative, including nil, figured. Price: the fork in D23 (§9, burden 1).

**The theist's residue, priced.** One binary fact — whether the inclination toward the best prevailed — of the kind every libertarian pays at every free choice. The content of the outcome is explained by `Maximal`. The asymmetry over Exit 1 is therefore in *what is left unexplained* (a yes/no vs the whole first stage) and in *the kind of gap* (familiar vs new). Scope: bites against any naturalist who accepts libertarian agency; against a compatibilist, the comparison is content alone.

---

## 5. The symmetry problem — where it stands

The review's Attack 1 (`W_Pref` contains a favored production of the worse) is now conceded and certified. The reply is not that the theist's gap is smaller in flavor but that it is different in kind and in scope of content, as above. What this does not do: make Exit 1 contradictory. Nothing can; `W_Nat.witness` is the proof. The reader judges whether the bill is acceptable. The argument's job is to make the bill exact, and it now is.

The Past-Hypothesis reply ("physics treats boundary conditions as brute") is blunted, not eliminated: in `W_Nat` the initial condition N is *identical* across worlds, so the bruteness is not in a boundary condition but in the transition from an identical state — the one place science never tolerates silence. The Humean "PH is a law" dress is `¬Deterministic ∧ ¬HasProp ∧ ¬Sens`, i.e. bare with a label; the anti-Humean dress lands on determinism (collides with E+P4), chance (anti-chance tier), or a selecting law (`DLaw`, ¬NBL). Every branch lands on a priced exit. This routing should be written into the prose CE dossier (burden 3).

---

## 6. The empirical strand — role and limits (D21; `cosmic_strand_v2.md`)

Two jobs only: (1) empirical support for CatOpen — the life-permitting region has sharp, discontinuous boundaries in kind; (2) sizing Exit 1's bill.

What it cannot do: give odds against "nothing bore on it" (no measure on the bare hypothesis, by definition); ground CatU (the constants of our laws give ~5 independent sharp kinds, finitely many; CatU is a modal claim over law-structures and must be defended as such); support Tier 4 (life-permitting ≠ maximal).

The strongest empirical anti-chance point is non-normalizability (Schiffrin & Wald 2012): `HasProp` has no measure to be true with. Any supplied measure meets P11/L4 in the file.

Excluded permanently: biological error rates, the 10⁻³⁸ product, photosynthetic coherence (Cao et al. 2020), single-photon vision, water/carbon claims, Penrose's number *as a probability*, the ±2% strong-force and ±0.5% Hoyle figures.

---

## 7. What changed in v8.7 (Lean)

- `God M N` defined; `god_exists` certified (∃ N, God M N ∧ ∀ N', God M N' → N' = N). Proof is `main` plus its own uniqueness clause. `#print axioms` added.
- Dead `Finite` removed. `Favored` docstring flags the "because" gloss as interpretive. CE docstring says `HasProp`, not "propensity-governed." D7 narrowed to list the chance premises among the w₀-only statements.
- D21 (empirical status of the chance premises), D22 (the two exits, priced), D23 (the TR fork, open) added.
- All 41 prior results unchanged; verified by diff of `#print axioms` output.

---

## 8. Status of the v8.5 review's recommendations

| Item | Recommendation | Status |
|---|---|---|
| A.7.1 | Add `KnowsAll`, `Uncountable`, `Pred`, `main`, `identify` to Appendix A | **Done (v8.7)** — A.0 and A.4 added; A.2/A.3 regenerated verbatim from the certified file; `God` and `god_exists` included |
| A.7.2 | Delete `Finite` | **Done (v8.7)** — Lean and prose §1.6 |
| A.7.3 | Fix §2 intro; P6→FA slips; §5.4 "finite"; §6.1 parameter list and `MoralBears` | **Done (v8.7)** — all five, plus §6.1's "in virtue of s" qualified |
| A.7.4 | Narrow D7 | **Done (v8.7)** — Lean header and prose §1.0 |
| A.7.5 | Flag `Favored` gloss as interpretive | **Done (v8.7)** — Lean docstring and prose §1.3, D20 |
| A.4 (other) | P10 hypothesis; P10 proof sketch's unused hΩ; 3.8's condition; CE docstring | **Done (v8.7)** |
| B.11.1 | III.1: state `W_Pref.residue`, answer symmetry on those terms | **Done (v8.7)** — reply to Objection 6 rewritten; residue conceded; asymmetry in content and in kind of gap, with scope |
| B.11.2 | III.1: engage Past Hypothesis; "no propensity measure" not "no modal profile"; haecceitistic exit | **Done (v8.7)** — Objections 7–9 added with replies; case (a) and (c) rewritten |
| B.11.3 | III.5: full TR section with the nil clause and the Dretskean modus tollens | **Done (v8.7)** as a dossier section; the fork (D23) is stated as an open burden, not formalized |
| B.11.4 | Lean: certify mindless `NoTR` | **Done (v8.6)** |
| B.11.5 | §8.3/III.9: two single-premise packages | **Done (v8.7)** — §8.3 rewritten as three packages; III.9 closing rewritten |
| B.11.6 | D7: defend the w₀ restriction or price it | **Done (v8.6/8.7)** — priced in D20/D22 and §6.4 |
| B.11.7 | Flag `Favored` gloss | **Done (v8.7)** |
| B.2 (NoTR mindless as filed) | — | **Done (v8.6)** |
| B.4, B.5, B.8 | GG evil-god, Dasgupta, Smith; NBL's relabeler; CH on the powers view | **Done (v8.11)** — III.4 rewritten; the relabeler routed to the TR fork; CH note in III.5 |
| B.6 (P4 "undeveloped") | — | **Done (v8.10)** — III.6 rewritten; uniqueness at IDF |
| B.7 (CatU cheap for discrete physics) | — | **Done (v8.7)** — conceded in III.7, Objection 4; CatU restated as modal |

### 8a. Status of the third external review's recommendations (v8.13 review → v8.14)

| Item | Recommendation | Status |
|---|---|---|
| E.1 | CI pins statements, not just axiom lists | **Done** — `expected_statements.txt`; the `… ∨ (1 = 1)` attack is a tested failure |
| E.2 | MD5, "prose only" labels, "v8.12: 51", "as of v8.11", handoff §1 "every field" | **Done** |
| E.3 | Withdraw "one sentence wide"; fix or delete `FalliblePowers.actual` witnesses; Horn 1 = residue | **Done** — `fallible_actual_iff`; witnesses deleted; `W_Pref.fork_is_residue` |
| E.4 | III.5 rewritten to Mumford–Anjum, Vetter, Bird; Oderberg reconciled | **Done** in prose (philosophical; no Lean) |
| E.5 | Add position (i)/(ii) models; correct III.6 (ii); state (i)/(iv) unpriced | **Done** — `W_Two`; Cost/Ceiling/III.9 rewritten |
| E.6 | Separate IDF from ID | **Done** in prose; `W_P4` has IDF ∧ ¬ID (¬ID not compiled as a theorem) |
| E.7 | III.1: ties; `T2_2` is `rfl` | **Done** in prose |
| E.8 | III.4: count as interpretive; Collins | **Done** in prose |
| E.9 | III.7: CatU's second premise; certify uniform horn; middle horn; BHW; Schiffrin–Wald | **Done** — `uniform_countable_refuted`; prose |
| E.10 | III.2: ¬NBL as package | **Done** — `BothChannels.witness` |
| E.11 | §6.2: "determinate type" tautology | **Done** — `natural_directed_nonempty` |
| E.12 | §6.0: primitives; God in `Toy.A` | **Done** — `god_holds`, `knows_everything` |
| E.13 | L0 entry for direction-neutral causation | **Partly** — noted in III.6 P1; no dossier section yet |
| E.14 | Add the review results to the expected files | **Done** |
| — | Not compiled (review Part C): ID ∧ ¬IDF model; a non-mind position-(i) N₂; ¬ID on `W_P4` as a theorem | **Open** |

---

## 9. Burdens — status as of v8.14

**Closed as far as formal work can close them:**

1. **TR, necessitating reading** (v8.8). `powers_fork`, `powers_all_tied`, `no_powers_at_maximal`.
2. **P4, position (ii)** (v8.14). `W_Two.Both.not_IDF`: IDF and nothing else excludes a second channel-bearing fundamental.
3. **CE dossier** (v8.7, corrected v8.14). Residue restated as "which of the maximal class, and whether the inclination prevailed"; `T2_2` no longer cited as evidence.
4. **III.4** (v8.11, scoped v8.14). The count is an interpretive premise; Collins engaged.
5. **Uniform propensity horn** (v8.14). `uniform_countable_refuted`.
6. **CI** (v8.14). Statements pinned.

**Open — formal:**

7. **A per-being notion of contribution to F_w.** Without it, III.6's positions (i) and (iv) — a second fundamental that produces with no channel, or by turns — are consistent with IDF, CE, and every field but P4/P4⁺ with no world `Bare` (`W_Two.OneChannel.position_i`, `W_P4`), and the argument has no bill for a naturalist who grants one mind and posits one brute producer alongside it. This is now the highest-leverage formal item.
8. **A formalization of fallible directedness** with content about the state (weaker than `manif`, stronger than `manif₀`). Nothing has been shown about the fallible reading; `FalliblePowers.actual` is content-free.
9. **L0** as a dossier entry (direction-neutral causation is excluded there, not at P1).
10. Not compiled: ID ∧ ¬IDF; a non-mind position-(i) N₂; ¬ID on `W_P4`.

**Open — philosophical:** TR's content claim against a powers naturalist holding the theist's own modal primitive (III.5); IDF against a foundation-haecceitist, as a separate commitment from ID (III.6); CatU's two contestable premises (III.7); the problem of evil at P8/w₀ (located, not answered, by design); BHW's modelling-relativity reply (III.7).

**Housekeeping:** drop the v8.5 and v8.13 reviews into `docs/` (`docs/necessary_agent_v8_13_review.md` is added in this commit); bump `actions/*` to `@v5`; rename the docs from `_v8_7` to unversioned names in one commit. **Next step, per README §4 step 5:** a fresh reader who did not produce v8.14 must reproduce `verify.sh` (58 lines + statements) before anything in this handoff is treated as verified; the two open formal items (§9, items 7–8) are where a fourth review should build its countermodels.

## 10. Rules for every subsequent pass

1. Attach `NecessaryAgent.lean` (or its successor) itself. Never reconstruct it. Verify before claiming verification.
2. Never assign a probability to a brute fact. Never multiply biological rates. Never cite the retired figures in §6.
3. State fine-tuning topologically (bounded region, sharp edges), not probabilistically.
4. Name the theist's residue before the reader does.
5. No advocacy register. "Shatter," "obliterate," "tactical," "relentless" are how a paper gets rejected unread.
6. Every new premise gets an independence witness before it gets a defense.
7. The conclusion is `god_exists`, conditional on `Axioms`; the claim over the skeptic is the bill in D22, stated exactly, never rounded up.
