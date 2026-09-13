> **Filed in v8.14.** This is the third external review, of v8.13, as delivered. Its countermodels were compiled against a copy of the v8.13 file and cited there as `R:n`; in v8.14 they are in `NecessaryAgent.lean` under these names: `Review.fallible_actual_iff` → `NecessaryAgent.fallible_actual_iff`; `Review.natural_directed_nonempty` → `NecessaryAgent.natural_directed_nonempty`; `Review.god_in_ToyA`/`ToyA_inadequate` → `Toy.god_holds`/`Toy.knows_everything`; `Review.BothChannels.witness` → `Toy.BothChannels.witness`; `Review.PrefPowers.*` → `Toy.W_Pref.fork_is_residue`; `Review.W_Two.*` → `Toy.W_Two.*`; the uncompiled uniform horn (Part C, "not compiled" 1) → `NecessaryAgent.uniform_countable_refuted`. Status of each recommendation: handoff §8a.

# External review — *A Necessary Agent*, v8.13

**Reviewer's position.** I wrote none of this and defer to none of it. The standard applied throughout is the argument's own: every claim has a certified model or a priced exit. Where a claim has neither, I say so. Where the argument is right, I say so and move on.

**What was reproduced.** Lean 4.33.1 (commit `819816b2`) extracted from the supplied toolchain archive. `scripts/verify.sh`: exit 0; `build/stderr.txt` 0 bytes; 51 lines; SHA-256 of `build/actual_axioms.txt` = SHA-256 of `expected_axioms.txt` (`ac6e1433…3348e`); independently confirmed by `grep -v` that no line lies outside `{[propext, choice, Quot.sound], [propext, Quot.sound], none}`. Git history intact (8 commits, `e6928fe`→`d74287d`), working tree clean.

**What was unavailable.** `docs/necessary_agent_v8_5_review.md` is absent from the repository (confirmed; `docs/NOTE_review_file.md` says so). I worked from handoff §8 and Part III's numbered attacks, as instructed. Every claim below about "what the v8.5 review said" is therefore a claim about how v8.13 *reports* it.

**What was compiled.** Thirteen new results, appended to a byte-identical copy of `NecessaryAgent.lean` (`Review_full.lean`, SHA-256 `bcc41634…d9317`): exit 0, empty stderr, zero warnings, the 51 certified lines unchanged (diff-checked), and 13 further `#print axioms` lines, none on `sorryAx`. Source: `review_countermodels.lean`; output: `review_print_axioms.txt`. Line numbers cited as `R:n` refer to `Review_full.lean` (= `review_countermodels.lean` line + 4565); `L:n` refers to `NecessaryAgent.lean`.

**Where the argument's summary fails first.** The summary under test (handoff §9; III.9) is: *`god_exists` follows from `Axioms`; every exit is certified consistent and priced; the two exits a serious naturalist takes are `W_Nat` and `NoTR`; the second is now one sentence wide; denying P4 yields several necessary minds; what remains is philosophical at four named points.* The first clause is true and reproduced. The summary fails at the fourth clause: the claim that Exit 2 is "one sentence wide" rests on `W_Nat.fallible_witness` / `W_Pref.fallible_witness`, and both are instances of a definition (`FalliblePowers.actual`, L:2182–2183) on which "s is fallibly directed at D" means "the actual reality has D" — `s` does not occur in the definiens (`R:4580`, certified). The three text readings that close the fallible reading in prose (Mumford–Anjum, Vetter, Bird) do not survive contact with the texts (Part B, III.5). The fifth clause is true of the file's witness but the witness is alternation, not the position the prose calls (ii); position (ii) had no model until `R:4973`. The "priced" clause fails at P4 in a second way: the price of a second fundamental is stated as "Exit 1's bill for its share," and `Bare` (L:1007) is a predicate on worlds, so `R:5019` exhibits a second fundamental that produces at every world, has no channel state, and pays nothing the model can name.

---

## 0. The certification apparatus (read before Part A)

### 0.1 Reproduction — passes

As stated above. Nothing further.

### 0.2 `verify.sh` can be defeated by weakening a statement (demonstrated)

The script checks *names* and *axiom lists*, never *statements*. Demonstration, on a copy of the repository:

```
theorem god_exists : (∃ N, God M N ∧ ∀ N', God M N' → N' = N) ∨ (1 = 1) := Or.inl <| by
  obtain ⟨_, _, _, _, _, N, hN⟩ := main A
  ...
```

`scripts/verify.sh` on that copy: `OK: 51 certified results, output identical to expected_axioms.txt`, exit 0. The headline theorem now asserts a disjunction one of whose disjuncts is `1 = 1`, and CI is green. The same trick works on every one of the 51 lines whose proof uses `propext`/`choice`/`Quot.sound` (keep the original proof term as `Or.inl (…)`, so the axiom list is unchanged). This is exactly the attack the brief §2 asks about, and it is live.

*Fix (Part E, item 1):* CI must also pin the **statements**. Cheapest: add `#print` (not `#print axioms`) of each certified declaration's *type* to a second expected file, or `#check @name` with `set_option pp.all true`, and diff that too. Until then "green on main" certifies only that 51 names exist with 51 axiom sets.

### 0.3 A minor fragility in the `sorry` grep

Check 3 filters `grep -v 'zero \`sorry\`'`. A line `exact sorry -- zero \`sorry\`` passes check 3. It is caught by check 2 (Lean prints a `sorry` warning to stdout). Defended in depth; note only.

### 0.4 Housekeeping errors a referee sees on page one

- README §0 and handoff header give the MD5 of "the verified file" as `21290ecf4e49ecf77894593cb036cab9`. The file is `fdab21aa0c9806aa738963076348ce35`; v8.12's is `d53aa09f…`. No file in the history has the stated MD5.
- Commits `d214430` (v8.11) and `4fc0529` (v8.13) are labelled "prose only / no Lean change"; both modify `NecessaryAgent.lean` (header comment only; verified by `git diff`). Harmless, false as written.
- README table: "v8.12: 51 results"; handoff §9 header: "as of v8.11"; version is 8.13.
- Handoff §1: "every field of `Axioms` has an independence witness." README §5: "No independence witnesses for P7, P8, P11, F1, Src." The handoff is wrong.

---

## Part A — Faithfulness (Part I / Appendix A / Lean)

**Appendix A vs Lean, mechanical.** Six code blocks, 545 code lines. Every non-blank line appears verbatim in `NecessaryAgent.lean`. Three blocks (A.1, A.4, A.5) are not *contiguous* in the Lean — they are excerpts with gaps. That is acceptable for an appendix that collects definitions, but "regenerated verbatim from the certified file" (handoff §2) should say "excerpted." Nothing material is missing: `FalliblePowers.actual`, `SameProfile`, `IDF_stmt`, `groundConfig`, `Deterministic`, `God`, `KnowsAll`, `PowersChannel` are all present. Not present: the *witness-side* definitions `W_Nat.Pw`, `NoTR.Pw` (`Directed := fun st D => st = .s ∧ ∀ w, …`), which are what make III.5's Horn 2 a triviality (A.6 below); a reader of Appendix A cannot see that.

| # | Location | Sentence | What the Lean says | Fix |
|---|---|---|---|---|
| A.1 | III.1, reply to Obj. 7; §8.3; handoff §5 | "In `W_Nat` … the initial condition N is *identical* across worlds (`T2_2`), and what differs is the transition from that identical state." | `T2_2` (L:1461–1462) is `rfl`: `(fun _ : M.W => M.groundConfig) w = (fun _ : M.W => M.groundConfig) w'`. `groundConfig` (L:986–987) does not mention `w`. This is a definitional identity, not a finding about N. Consequently `Deterministic` (L:989) is literally "F is constant across worlds," and `T2_4` follows from E plus that definition. | Say "by construction (D3)" wherever `T2_2` is cited as evidence. The naturalist who says the *initial state* varies across worlds is rejecting D3, and nothing in the file answers him (Part B, III.1 §2). |
| A.2 | III.5, case (b), (c); reply To 1; reply To 3 | "This is the sense of `Sens` stated in D20: the candidates *figure* … Comparison is over a field." "A state that has producing-nothing in its field is … not a physical power." | `Sens` (L:888) is a field of `Model` with no axioms. The words "the candidates FIGURE" occur only in a comment (L:885–887). Nothing in the file lets anything be inferred from `Sens w P (state s)` except what TR, CH, GG *stipulate*. | Mark (b), (c) and the "field" language in the replies as interpretive, as the `Favored` gloss already is. |
| A.3 | §6.0; `God` docstring L:1957–1962 | "knows every possible contingent reality and the null alternative" | `KnowsAll M t := M.Knows t .nil ∧ ∀ r, M.InOmega r → M.Knows t (.alt r) ∧ …` (L:1789–1791); `Knows t c := ∃ s, M.bearer s = t ∧ M.Rep s c ∧ M.Accurate s c` (L:1020–1021). `Accurate` (L:874) has no axioms. In the consistency witness `Toy.A` (`Accurate := fun _ _ => True`, L:2330) the being that satisfies `God` "knows" every set of items as an alternative and **every set of items as actual** — `R:4625`, certified: `∀ r, Toy.M.Knows .N (.act r)`. | State in §6.0 that "knows" is "represents, with the primitive accuracy flag set," and that the file has no model in which accuracy discriminates. |
| A.4 | §6.0; §1.3 | "acts on the best reasons, and whose production accords with the balance of value-grounded reasons" | `ActsOnBest : W → Thing → Prop` (L:901) is a primitive atom with no definition and no axioms; every witness sets it `fun _ _ => True`. `AtLeast` (L:905) has no axioms; in `Toy.A` (`AtLeast := fun _ _ => True`, L:2338) every reality, including `emptyReality`, is `Maximal` — `R:4625`. | Say so in §6.0. "Acts on the best reasons" is a name, not a defined property. |
| A.5 | III.6, position (ii), L:1295 of the prose | "This is coherent — it is `W_P4.two_minds` — and it is the position the coordination argument has to answer." | `W_P4` (L:3041–3075) is alternation: `Sens := fun w _ ch => (ch = .state .s1 ∧ w = true) ∨ (ch = .state .s2 ∧ w = false)`. Position (iv), three paragraphs later, says exactly this. Position (ii) — both channels, both active at every world — had no witness. It now does: `R:4973` (`Review.W_Two.Both.position_ii`). | Cite the new model; delete "it is `W_P4.two_minds`" from (ii). |
| A.6 | §6.2 table, row "TR fork, Horn 2"; III.5 Horn 2; D23 | "s is a powers channel … directed at 'a non-empty reality' on the natural `Powers` structure" | `W_Nat.Pw.Directed := fun st D => st = .s ∧ ∀ w, (∃ x, M.F w x) → D (M.realOf w)` (L:4414). Since `F w ⊆ realOf w`, **every state of every model** is "directed at a non-empty reality" on this structure — `R:4610`, certified with no axioms. | Delete "directed at a determinate type" as a *finding* about `W_Nat`; it is a tautology of the chosen structure. What `powers_witness` certifies is `¬CE ∧ ¬Sens`, which `W_Nat.witness` already did. |
| A.7 | §0 (bl); III.5 "The fallible reading, finished"; D23; README §5; §10 item 0 | "the *same* generic structure directs the selecting state at maximality on both models … Identical causal structure, identical balance; the models differ in `Sens`, `Rep`, `Mental` and nothing else. So fallible directedness distinguishes nothing." | `FalliblePowers.actual M s := ⟨fun st D => st = s ∧ D (M.realOf M.w₀), …⟩` (L:2182–2183). `R:4580`: `(FalliblePowers.actual M s).Directed s D ↔ D (M.realOf M.w₀)`. `R:4586`: `… Directed s M.Maximal ↔ M.Maximal (M.realOf M.w₀)`. The state does not occur. Both `fallible_witness` theorems certify only that the actual reality is maximal on the model's balance. | Replace the sentence with what is certified: "on both models the actual reality is maximal on the balance." Withdraw "fallible directedness distinguishes nothing" — nothing was defined that *could* distinguish. |
| A.8 | III.5 "The theist's state is not a power" | "no `Powers` structure directs that state at maximality" | Correct as stated (L:4472–4473). But the proof uses only `channel` and `residue.2`; it is a fact about the balance having a non-maximal productive world, and it holds of every state of every model with such a world. | Say "no powers structure directs *any* channel state at maximality on a discriminating balance." |
| A.9 | III.6 position (i); III.6 Cost; III.9 P4 row | "N₂'s contribution is a contrast to which nothing bore … the bare source pays Exit 1's bill for its share." | `Bare w := ¬ M.Deterministic ∧ ¬ M.Favored w ∧ ¬ M.HasProp` (L:1007) is a predicate on *worlds*. `R:5019`: two fundamentals, N₂ produces at every world, no state of N₂ is a channel, CE holds, IDF holds, P4 fails, and `∀ w, ¬ M.Bare w`. | Mark "pays Exit 1's bill for its share" as prose with no formal referent; the file has no per-being notion of contribution (the prose concedes this at IDF "What IDF does not do"; the P4 Cost paragraph and III.9 do not). |
| A.10 | III.6 IDF "What IDF does not do"; horn (iv) | "alternation is a bare contrast over which being acts" | In `W_P4`, every productive world is `Favored` (L:3184–3188 proves CE via `.state .s1` / `.state .s2`), hence no world is `Bare`. Same defect as A.9. | Same fix. |
| A.11 | §6.2 table, NBL row (`Axiarch`) | "Conclusion that fails: 3.4: O agential (P10 fails)" | `R:4659` (`BothChannels.witness`): law channel value-sensitive at every world, ¬NBL, and `Agential true`, a selecting representation, and `God M .N` all hold. `Axiarch` loses the conclusion because its `Params` also switch the state channel off (L:2550: `ch = .law`). | Say: "¬NBL costs the conclusion only when no state channel is also sensitive; `Axiarch` stipulates both." III.2 Cost of denial should say the same. |
| A.12 | III.7, "What the countable-kinds skeptic then faces" | "a uniform finitely additive measure on a countable set assigns zero to every singleton, and L4 says no kind can obtain … refuted by P11 and L4 alone, without CatU" | `L4_stmt` (L:1148–1149) quantifies over `POpen` regions. The kind-class `{φ ∣ cat φ = k}` is open only by `CatOpen_stmt` (L:1176). So the horn uses P11 + **CatOpen** + L4, not "P11 and L4 alone." Also: with `ArchOrd.arch_pos` (L:591–606) and `FinMeasure.mono`/`additive` (L:649–658) this horn is *provable* in the file; it is not among the things "the file has no notion of." | Correct the dependency; certify the uniform horn (I did not compile it — see Part C, "not compiled"). |
| A.13 | §0 item 3; handoff §1 | "For each of P1, P2, P4, P5, FA, P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺ there is a model in which every other premise holds, that premise fails, and the conclusion it supports fails" | True as a list of fourteen. Handoff §1's "every field" is false (README §5). | Fix the handoff. |
| A.14 | §1.4 "Deterministic" | "…does not mention w; so this is equivalent to: F_w = F_w′ for all w, w′." | Faithful. Correct and candid. | None; but see A.1 for where Part III forgets it. |
| A.15 | III.1 Statement; III.4 Statements; III.5 Statement; III.6 P2/P1/P4/IDF Statements | Lean quoted inline | Byte-match L:1113–1114, L:1128, L:1087–1088, L:1104–1105, L:1062, L:1061, L:1064, L:1199–1200. | None. |
| A.16 | §8.3 "`NoTR.witness` certifies every field except TR (FA vacuously)" | — | Faithful to L:2586–2595. GG and CH also hold non-vacuously there. | None. |

**On the brief's four "specific places to look."**
- *`Favored`/D20:* the definition is flagged; the slide back into difference-making is in III.5 (A.2), not §1.3.
- *`God` in `Toy.A`:* built (A.3, A.4, `R:4616`, `R:4625`). The being is the only fundamental in a two-world model where one world is empty, every set of items is "known," every set is "known as actual," and producing nothing is maximal.
- *`exists_maximal`:* it is a projection of `T4_6` (L:1885–1887), i.e. P8(b) applied. It is a discovery only where `AtLeast` discriminates; the only certified model of `Axioms` where it does is `W_Pref`, whose balance is `AtLeast := fun r r' => r = actual ∨ r' = (fun _ => False)` (L:3990) — "best" is *defined* as "the actual one." No certified model has a balance specified independently of actuality that discriminates.
- *FA / `Mental := True`:* FA is vacuous in every model where `Mental := True`, which is every model of `Axioms`. This is inherent — `mental_of_nonactual` forces `Mental` on the selecting state in any model of the premises — so FA's work is as a premise, witnessed by `NoMind`. Not a defect.
- *`SameProfile`/IDF:* IDF is vacuously true in every single-fundamental model and in `W_P4`. It is *false*, non-vacuously, in `R:4973`; that is the only sense in which it "does work": it excludes position (ii). No model can make IDF non-vacuously *true* (two distinct fundamentals sharing a profile falsify it). Fine as a premise; the prose should say this.

---

## Part B — Adversarial read of Part III

Ordered by section, strongest attack first. Each attack: *what the file says* → *what is wrong or unproved* → *revised ceiling*. "Philosophical, not formal" is stated wherever true.

### III.5 — TR

**Attack 1 (formal). The fallible reading was closed by a content-free definition.**
*File:* "`W_Nat.fallible_witness` / `W_Pref.fallible_witness`: the same generic structure directs the channel state at maximality on both … So fallible directedness distinguishes nothing; what distinguishes the theist from the bare naturalist is whether the alternatives figure." (§0 bl; III.5; D23; README §5; §10.0.)
*Wrong:* `FalliblePowers.actual` (L:2182–2183) makes `Directed s D ↔ D (M.realOf M.w₀)` (`R:4580`). Every state of every model is "fallibly directed" at every property the actual world has (`R:4591`: at `fun _ => True` and at `fun r => r = realOf w₀`). Both witnesses certify one thing: the actual reality is maximal on the model's balance. Nothing about `s`, nothing about fallibility, nothing about direction. The powers naturalist's "fallible directedness at maximality" was never given a structure with content; `manif₀` (L:2172) is satisfiable by the actual world alone. The sentence "the two models differ in `Sens`, `Rep`, `Mental` and nothing else" is true and irrelevant: they were *constructed* to differ in nothing else (L:3959–3991 vs L:4203–4235 are identical except those three fields).
*Revised ceiling:* the fallible reading is **open**, not one sentence wide. What is certified is that `manif` (necessitation at every productive world) cannot hold of a state on a discriminating balance (`no_powers_at_maximal`). What a fallible directedness *is* — a structure weaker than `manif`, stronger than `manif₀`, with content about `s` — has not been formalized, so nothing has been shown about it.

**Attack 2 (formal). `powers_fork`'s Horn 1 is the theist's residue restated.**
*File:* "`powers_fork` says, for any D that is not maximality on some productive world, that the channel does not track the good there: GG fails for it … and the contrast among the D-realities is a contrast to which nothing bore." (III.5 Horn 2; III.9 TR row.)
*Wrong:* `R:4682–4692`: put the file's own "natural" structure on the *theist's* model `W_Pref`, directed at "non-empty." `powers_fork` returns its left disjunct (`R:4692`), witnessed at `w = false` (`R:4685`). But `R:4689`: `M.Sens false M.Maximal (.state .s) ∧ ¬ M.Maximal (M.realOf false)` — the theist's own `Sens`-channel "fails to track the good" at the same world in the same sense. Horn 1 of the fork is `residue.2`. So the fork's "cost" for the powers naturalist is a cost the theist certifiably already pays, and the sentence "the contrast among the D-realities is a contrast to which nothing bore" applies verbatim to `W_Pref`'s c₁/c₂ contrast (the file concedes this in III.1 To 6).
*Revised ceiling:* `powers_fork` prices nothing beyond `W_Pref.residue`; it should be presented as "a power directed at D and an inclination toward maximality have the same modal profile on any model with a non-maximal productive world."

**Attack 3 (text; philosophical, not formal). Mumford & Anjum do not hold that an unopposed tendency necessitates.**
*File:* "Fallibility is fallibility under interference. At the foundation there is no interference … an unopposed tendency manifests: that is `manif`… A tendency that fails with nothing interfering is not a tendency on their account; it is the residue Lowe (2012) and Bird (2016) pressed them on … and their answer, that the modality is primitive, supplies no reason the failure world differs from the success world."
*Wrong:* *Getting Causes from Powers* ch. 3 argues against necessitation on two grounds, and only the first is interference (the antecedent-strengthening argument, §3.3–3.4). The second (§3.5–3.7) is that the dispositional modality is *sui generis*, weaker than necessity *even for the total cause with nothing further to add*; they explicitly refuse the "necessitates in the absence of interferers" reconstruction because it treats the tendency as conditional necessity. Lowe's 2012 paper is precisely the objection that their argument only establishes conditional necessity; Bird 2016 presses the obscurity of the "less than necessity" modality. The prose adopts the *critics'* reconstruction and then attributes `manif` to M&A as "the powers theorist's own axiom" (D23, README §5). It is Lowe's axiom for what M&A *ought* to say. The prose's last sentence is an *argument* against M&A's primitive — but it is the argument the theist concedes against `Sens`: `W_Pref.residue` is a primitive inclination that "supplies no reason the failure world differs from the success world." If that is "what bare means," the theist's package is bare at w′ by the prose's own criterion.
*Revised ceiling:* the powers naturalist who takes M&A's primitive modality has exactly the modal profile of the theist's `Sens`, and the prose's charge against him ("bare") is the charge it concedes against itself. What separates them is TR's content claim, which the M&A material does not touch.

**Attack 4 (text; philosophical, not formal). Vetter's degrees are comparative, not measured; the "propensity or bare" fork has a third setting.**
*File:* "Either its *degree*: then the potentialities carry a comparative weight over the space of possibilities, which is a propensity structure, `HasProp` … Or nothing … A Vetter potentiality at the foundation is either a propensity or bare; there is no third setting of the dial."
*Wrong:* In *Potentiality* (2015) potentiality is individuated by its manifestation, has no stimulus, need not manifest, and this non-manifestation is primitive — no rival and no trigger is owed (ch. 3; the point is made against the conditional analysis). Degrees (§3.4–3.5) are a *comparative* ("x has more of a potentiality to M than y") tied to a comparative possibility; Vetter distinguishes them from probabilities. A comparative without a measure is not `HasProp` (which the file glosses as a *distribution* with `μ`, D11) and is not "nothing." The file's own `AtLeast` (L:905) is exactly such an object: a comparative with no axioms and no measure. So the dial has the setting the file uses for its *own* balance.
*Revised ceiling:* the powers naturalist can hold Vetter-degrees at the foundation — a comparative over potentialities, no measure — and meet neither III.7 nor "bare." The argument owes him a reason why a comparative among N's potentialities is not the same kind of object as the comparative among realities the theist calls the balance.

**Attack 5 (text; philosophical, not formal). Bird allows stimulus-free potencies.**
*File:* "A stimulus-free disposition that manifests at one world and not another, with identical bearer and no fink, is not a Birdian disposition."
*Wrong:* *Nature's Metaphysics* treats spontaneous manifestations — radioactive decay is his standing example — as potencies with a trivial or null stimulus condition and a probabilistic manifestation (ch. 2, the discussion of propensities; ch. 3 on fundamental potencies). A potency that manifests at one world and not another with nothing distinguishing them is a *probabilistic* potency, which is III.7's territory, not a non-Birdian object. The prose's dichotomy (no stimulus → not Birdian) is not in the text.
*Revised ceiling:* Bird gives the powers naturalist a stimulus-free probabilistic potency; that routes to III.7 (whose ceiling is CatU + propensity fork, Part B III.7), not to "the state is not a disposition."

**Attack 6 (philosophical, not formal). "Maximality" is a determinate type in the certified fork and an abstraction in the philosophical step.**
*File:* Horn 1 treats `Directed s M.Maximal` as a determinate-type power ("a power directed at the best manifests the best at every world"). The last step then says "a state directed at *whichever* is best among instances it has not produced exhibits the specific indifference that [Oderberg] reserves for the mental."
*Wrong:* Oderberg's abstraction (2017) concerns the mental's directedness at *universals* abstracted from particulars, as opposed to a power's fixed directedness at *its* manifestation type. `M.Maximal : Reality → Prop` is a property of realities; a power directed at it is directed at a type exactly as a power directed at "non-empty" is. Either maximality is a determinate manifestation-type (then Horn 1 stands and Oderberg supplies no reason the state is mental — dissolving is "whichever dissolution" too) or it is not (then the powers naturalist never offered it and Horn 1 is empty). The prose uses both readings.
*Revised ceiling:* the Oderberg step does not apply to a state directed at a *property* of realities; it would apply only to a state that represents the *comparison*, which is TR assumed.

**Attack 7 (philosophical, not formal). The Dretskean modus tollens reply assumes Horn 1.**
*File:* "the state is sensitive to the field (CE, NBL, and Horn 1 of the fork), so it has the field as content (TR)…"
*Wrong:* "Horn 1 of the fork" is the reading on which the alternatives figure. That is what the Dretskean denies. The reply runs ponens because it has assumed the field-sensitive reading; the Dretskean who runs tollens is not thereby "forced onto Exit 1" — he holds `Sens` with no content and calls that indication of the actual. `NoTR` is his model and it is certified.
*Revised ceiling:* TR against a consistent Dretskean is the whole Horn 1/Horn 2 assignment, not one sentence.

**Revised III.5 ceiling (all attacks):** TR cannot be proved. What can be shown: `manif` ties every reality or fails on a discriminating balance (`powers_all_tied`, `no_powers_at_maximal`) — true and worth having. What cannot be shown, and is currently asserted: that a fallible directedness is "not a tendency, potentiality, or disposition" (the texts do not say so), that it is "the same structure both sides" (nothing with content was defined), or that its holder owes one sentence (he owes the same modal primitive the theist holds, and the dispute is entirely TR's content claim, on which the powers material is silent).

### III.6 — P4, IDF, P1

**Attack 1 (formal). The four-position argument is invalid without a per-being notion of contribution, and the file's own witness is not the position the prose says it is.**
*File:* (i) "one necessary mind plus one bare foundational source, and the bare source pays Exit 1's bill"; (ii) "This is coherent — it is `W_P4.two_minds`"; (iv) alternation "is a bare contrast at the level of the actor, and it pays Exit 1's bill"; Ceiling: uniqueness "rests on IDF *together with* the pricing of bare sources by CE."
*Wrong:* `R:5019` (`OneChannel.position_i`): two fundamentals; N₂ produces at every world; no state of N₂ is a channel (`∀ w P, ¬ Sens w P (state s2)`); N₂ is not an agent at any world; CE holds; **IDF holds**; P4 fails; **no world is `Bare`**. This is position (i) exactly, and in the model's currency N₂ pays nothing: `Bare` is world-indexed, CE is satisfied through N₁, and there is no premise, theorem, or definition that a bare *source* violates. "Uniqueness = IDF + CE's pricing of bare sources" is therefore false in the model's own terms: IDF ∧ CE ∧ ¬P4 is consistent with nothing bare. `R:4973` (`Both.position_ii`): position (ii) — both channels, both active everywhere, both minds, both agents, `SameProfile M .N .N2`, hence `¬ IDF_stmt M`. That is the model the prose thought `W_P4` was; `W_P4` is (iv). The prose's own concession ("a per-being notion of contribution to F_w would let the four positions themselves be certified; the model does not have one") is correct and is the whole point: without it, (i) and (iv) are not priced, and the Cost and Ceiling paragraphs and III.9's P4 row, which price them, are unsupported.
*Revised ceiling:* certified: denying P4 with a second *channel-bearing* fundamental costs IDF (`R:4973` is excluded by IDF and by nothing else). Not certified, and currently not priced: a second fundamental that produces without a channel (`R:5019`) — IDF is silent, CE is silent, `Bare` is silent. That is a naturalist-compatible position (a second brute producer alongside one mind) and the argument has no bill for it.

**Attack 2 (philosophical, not formal, with one formal remark). IDF and CE's haecceitistic exit are not "the same commitment."**
*File:* "IDF … is the same commitment CE already needs against Objection 9"; "The argument pays for anti-haecceitism at the foundation once, and P4 is what it buys the second time."
*Wrong:* Objection 9 is about tokens of the *first stage*: `ID_stmt : M.TypeDeterministic → M.Deterministic` (L:1153), stated over `kind : Item → K` (L:859) and `kindsOf` (L:992). IDF is about *fundamental things*: `IDF_stmt` over `SameProfile : Thing → Thing → Prop` (L:1181–1200). Different sorts (items produced vs producers), different premises, neither mentioned in the other. A haecceitist about contingent tokens who is an anti-haecceitist about necessary beings (Adams 1979 is compatible with this; his thisness thesis is about individuals generally, and his examples are contingent) holds ¬ID ∧ IDF. `W_P4` has IDF (certified, L:3249) and ¬ID: `K := Unit` (L:3050–3051) with both worlds productive (`F_c1`, `F_c2`) gives `TypeDeterministic`, and `F true ≠ F false` gives `¬Deterministic` — **not compiled; conjecture**, but a two-line corollary. (The `Toy.Mk` models do *not* have ¬ID: their `false` world is empty, so `kindsOf` differs and `TypeDeterministic` fails.) The converse (ID ∧ ¬IDF) is not witnessed (`R:4973` has ¬IDF and, by the same reasoning, ¬ID); I have not built it — **conjecture**: it needs a non-trivial `K`. So "the same refusal, made once" is false at the level of the file, and the prose's routing of Obj. 9's price onto IDF (and IDF's onto Obj. 9) is circular: each is said to be paid where the other is.
*Revised ceiling:* IDF is a separate premise with its own bill (primitive thisness for necessary beings); it is not bought by refusing token thisness for the first stage, and CE's Obj. 9 is not answered by IDF.

**Attack 3 (formal remark). "Alternation is a bare contrast."** In `W_P4` every productive world is `Favored` (CE is proved through `.state .s1`/`.state .s2`, L:3184–3188), so nothing is `Bare`; A.10. The contrast "N₁ rather than N₂ at w₀" is a contrast the model does not name and no premise addresses. *Revised ceiling:* the alternation cost is prose.

**Attack 4 (formal remark). The aggregate reply is consistent with the model.** `Fundamental w t := M.Nec t ∧ M.Concrete t ∧ ∀ y, ¬ M.Causes w y (.inl t)` (L:938–939); `Concrete t := ∃ w y, M.Causes w (.inl t) y`. A fusion and its parts are all fundamental iff each causes something; if the parts cause nothing they are not concrete, hence not fundamental, and P4 holds of the fusion. The prose reply (5) says exactly this. **Right; move on.**

**Attack 5 (philosophical, not formal). P1 against direction-neutral causation bites.**
*File:* "a theorist who denies that causation has a direction owes P1 a different reply, and the dossier has not given one for that case."
*What follows:* `P1_stmt : ∀ w, WellFounded (fun y x => M.Anc w y x)` with `Anc := TransGen Causes`. If `Causes` is symmetric (Price's perspectivalism; a Humean who takes causal direction to be a projection of temporal asymmetry, itself contingent), then any two-way causal link is a cycle and `L0_stmt` (L:1048, `¬ Anc w x x`) already fails — the framework, not P1, excludes direction-neutral causation. So the honest statement is: the argument presupposes asymmetric causation as a framework fact (L0), and the endless-future symmetry is answered by that presupposition, not by P1's content. That is a cost at L0 the dossier does not list.
*Revised ceiling:* P1's Grim Reaper defense stands only for a theorist who grants L0; against direction-neutrality the argument's exclusion of the future story is bought by L0, which then needs its own dossier entry.

### III.4 — GG / P8

**Attack 1 (formal remark; the rest philosophical, not formal). The "count" is not in the model; the two packages are formally isomorphic.**
*File:* "The D-package posits two essential features … the good-package one feature whose aim is fixed by its representation. That is not an appeal to 'intelligibility'; it is a count."
*Wrong:* `Toy.A` and `Toy.DState` each set exactly one `Sens` clause: `viaState` (L:2508–2509, sensitivity to *every* `Q`) versus `ch = .state .s ∧ w = true ∧ Q = D` (L:2792). Formally each has one representation primitive (`Rep := fun _ => True` in both) and one sensitivity primitive, each a `Sens w Q (state s)` for some `Q : Reality → Prop`. Nothing in `Model` connects `Rep` content to `Sens`: `Bears` is unlinked to `AtLeast` (the prose concedes this), and `Rep s (.alt r)` holds for every `r` in both models, so the D-selector's aim is at a property of realities its representation represents, exactly as the good-selector's is. "The aim's content is fixed by the representation" has no formal counterpart for *either* package. The count is therefore an interpretive claim about a link the file does not have — and it is the very belief–desire alignment Smith's distinct-existences thesis denies (Attack 2).
*Revised ceiling:* GG's cost to the denier is not "a second essential feature"; formally it is "a different `Q`." The asymmetry, if any, is entirely in the interpretive premise that the good-selector's `Q` is *read off* its representation and the D-selector's is not; that premise is unstated as a premise.

**Attack 2 (philosophical, not formal). Smith is satisfied by the formalism and violated by the reply.**
*File:* "The reply is that the model *satisfies* it … `Rep` and `Sens` are distinct … GG is a claim about the content of the essential `Sens`."
*Wrong:* True of the *model*. But the reply to Dasgupta then asserts that in the good package "the aim's content is fixed by the representation" — that a state's evaluative representation *determines* the direction of the inclination. That is the entailment from belief to motivation Smith (ch. 4) denies as a metaphysical thesis. The argument cannot both satisfy Smith (distinct existences, no entailment) and claim the reduction of two features to one (entailment). One of III.4's two replies must go.

**Attack 3 (philosophical, not formal). The relocation of Law to "a theory of reasons on which the bad is a reason for" does not engage Collins.**
*File:* "That is not a claim about God; it is a theory of practical reason — that the bad favors — and it is one no one holds, Law included."
*Wrong:* Collins (2019) is cited but not engaged; his paper's purpose is to show that *every* asymmetry-breaking move — including the appeal to the metaphysics of value and to what grounds reasons — has a mirror the evil-god theorist can adopt, and that preferring the value-grounded theory of reasons is not a neutral premise but the contested one. "No one holds it" is a headcount, not a reply; and the certified core's symmetry under inverting `AtLeast` (which the prose concedes) is exactly what makes the headcount the only thing left. Raz 2010 argues *for* the guise of the good; citing him for the asymmetry is citing the thesis at issue.
*Revised ceiling:* GG/P8(a) against Collins: the argument concludes "accords with a primitive comparative"; that the comparative is *value* is D15/D16, interpretive, and the evil-god theorist reads it as disvalue at no formal cost. The price the prose names ("a practical reason on which the bad is a reason for") is a price only if reasons are value-grounded, which is GG.

**Attack 4 (formal remark). Ties.** See III.1 Attack 1: with ties on the balance, "this one because it was best" explains at most the maximal class; P8 is silent on which member.

### III.7 — chance premises

**Attack 1 (philosophical, not formal). "A difference in field content is a difference in kind and not a limit" is a stipulation about the similarity topology, and standard physics contradicts it.**
*File:* "a law-structure with an additional field species is not a small perturbation of one without it, however many other features they share."
*Wrong:* A field species with coupling ε → 0 decouples: every observable of the theory with the extra species converges to the observable of the theory without it. Under any similarity relation that tracks observables, dynamics, or coupling space, "the law-structure without the species" *is* the limit of "with the species at coupling ε." The prose's claim is true only for a similarity relation that counts field content categorically — which is CatOpen assumed, not argued. Dirac's point (quantum numbers are not deformable) concerns a *given* species' charges, not the presence or absence of a species with vanishing coupling.
*Revised ceiling:* CatU's positive argument has two contestable premises, not one: (a) infinitely many independent species are possible; (b) the similarity topology is the categorical one on species content. A naturalist takes coupling-space similarity, and then adding a species is a small change and the 2^ℵ₀ subsets are not isolated. The dossier's "the only denial the positive argument leaves" is wrong; (b) is the cheaper denial.

**Attack 2 (formal remark). The uniform horn depends on CatOpen and is certifiable.** A.12. With CatOpen, P11 (Archimedean `V`, `FinMeasure` with `meas_top`, `mono`, `additive`) and L4, a uniform finitely additive measure on countably many disjoint open kind-classes gives each class value `vzero` (else `n·m ≤ μ(top)` for all `n` contradicts `arch_pos`), and L4 forbids `F w₀` from its own class. **I have not compiled this**; it is a straightforward variant of `L2`'s proof and should be in the file as a theorem rather than in III.7 as prose. Its dependency on CatOpen should be stated.

**Attack 3 (philosophical, not formal). The middle horn is not NBL.** `NBL_stmt : ∀ w P, ¬ M.Sens w P .law` (L:1121). A propensity whose weights track a property of kinds is, in the model, `HasProp` with a particular `μ`; it is a `Sens` through the law channel only if one *stipulates* that weight-tracking is sensitivity — which is D17's exhaustiveness claim applied to measures, a stipulation the model does not make (`μ` and `Sens` are independent fields). So "a property-tracking chance is a selecting law (NBL)" is a reclassification the file cannot support. *Revised ceiling:* the countable-kinds skeptic with a non-uniform propensity is at `HasProp` with CatU false, and the file has no theorem against him; the "propensity fork" middle horn is prose that would need a new field.

**Attack 4 (text; philosophical, not formal). Benci–Horsten–Wenmackers on objective chance.**
*File:* "(i) is not answered in the NAP literature, which addresses credence."
*Wrong:* BHW 2013's motivating cases are fair infinite lotteries and infinite coin-toss sequences, presented as *chance* setups, and BHW 2018 (*BJPS*) explicitly replies to Williamson's shift-invariance argument and to Pruss's underdetermination ("too small," ultrafilter-dependence), arguing that ultrafilter-relativity is a modelling choice of the same status as the choice of σ-algebra or of a measure in the real-valued case. One may reject those replies; the dossier does not report them. (Section numbers should be verified against the published text; I am working from the papers as I know them.) Also: the prose's (iv) — "obtained with infinitesimal propensity … no better than nothing" — is the objection Williamson makes to *real-valued* probability-zero possibilities, and the prose's own L4 section says probability-zero *points* are possible; an NAP theorist assigns the actual kind an infinitesimal *positive* value precisely to avoid that, and "explains nothing" is then a claim about explanation, not about NAP.
*Revised ceiling:* P11's price against NAP is ultrafilter-relativity of a one-off chance; the NAP literature has a reply (modelling relativity) that the dossier must engage rather than deny exists.

**Attack 5 (text; philosophical, not formal). Non-normalizability shows the Liouville measure fails, not that no measure exists.** Schiffrin & Wald 2012 show the GHS/Liouville measure on FRW-plus-scalar is non-normalizable and that regularizations are ambiguous, and conclude that *that* measure supports no probabilistic claims about initial conditions. "`HasProp` has no measure to be true with" over-reads: it shows the canonical measure fails; a naturalist may supply another and then meets P11/L4/CatU, as the prose itself says two sentences later. Delete the strong sentence; keep the routing.

### III.1 — CE

**Attack 1 (formal remark; the rest philosophical). "One yes/no versus the whole content" is the best case, not the certified case.**
*File:* "The theist explains the content of the outcome — which reality — by maximality on the balance: this one because it was best. What is unexplained is one binary fact."
*Wrong:* (a) `Maximal` (L:960–961) is not unique; `exists_maximal` gives a maximal element, not a unique one; with ties, `Sens w Maximal` discriminates nothing among the maximal class and P8 is silent on which member obtains. In the consistency witness `Toy.A` **every** reality is maximal (`R:4625`); in `NoTR` likewise; so the theist's "explanation of the content" is, in the file's own model of all its premises, no explanation of content at all. (b) The only certified model of `Axioms` with a discriminating balance is `W_Pref`, whose `AtLeast` (L:3990) is *defined* by naming the actual reality: "best" = "the one that obtains." It is a consistency witness, not an explanation, and the file has no model in which an independently specified balance picks out the actual world.
*Revised ceiling:* the first asymmetry should read "the theist explains the outcome *up to the maximal class*, whose size the argument cannot bound; one yes/no plus 'which of the tied'." Whether that beats the bare naturalist's bill is then a comparison the file does not certify and the prose should not round.

**Attack 2 (formal remark). The transition/boundary-condition distinction is definitional.** A.1. `T2_2` is `rfl`; the naturalist who says the *initial state* varies is denying D3 (that `groundConfig` is the setup), and the reply "physics never exempts the transition from a fixed state" assumes the state is fixed, which is what D3 stipulates. *Revised ceiling:* against the Past-Hypothesis naturalist the argument's reply is a stipulation (D3) plus an appeal to practice; it is not `T2_2`.

**Attack 3 (philosophical, not formal). Norton's dome is bare by definition of the model.** `CE_stmt`'s third disjunct is `∃ P ch, Sens w P ch`; unmeasured lawful indeterminism with no sensitivity is `¬Det ∧ ¬HasProp ∧ ¬Sens` = `Bare`. So the classification is not "defended rather than assumed"; it is forced by the disjunction's shape, and the dome's critics are then cited to price the class. A naturalist who wants a fourth disjunct must reject the model's `Chan` type (D17) — that is a cost, but it is a cost at D17, not answered by Malament/Wilson. Reasonable; say so.

**Attack 4. Objection 9 — the reply is right.** The haecceitistic exit is cheaper than `W_Nat` only if the qualitative contrast is necessitated (`TypeDeterministic`); otherwise it collapses into `W_Nat` with a token gap added. Correct. (But see III.6 Attack 2: the price is not "IDF paid once.")

**Attack 5 (philosophical, not formal). The second asymmetry ("familiar vs new gap").** "A gap of a kind every libertarian pays" is a claim about the *kind* of the gap, and the scope note honestly limits it to libertarian naturalists. Against a compatibilist the prose says only the first asymmetry remains — which Attack 1 has reduced to "up to the maximal class." So against the compatibilist naturalist, who is the usual one, the whole of III.1's residual asymmetry is a comparison between "which of the tied maximal realities" and "the whole first stage," and the file cannot say how large the first is. *Revised ceiling:* stated that way.

### III.2 — NBL

**Attack 1 (formal).** `R:4659`: law channel value-sensitive at *every* world, ¬NBL, every other field of `Axioms`, and `God M .N`. Denying NBL costs the conclusion only when the state channel is *also* off; `Axiarch` and `DLaw` stipulate both. *Revised ceiling and cost:* "To deny NBL *and* deny any state-channel sensitivity is …"; the dossier's Cost of denial and III.9's NBL row describe the conjunction as if it were the single premise. The reply "To 2 (verbal)" already concedes that a relabeler who keeps a state is at TR, so the row should say the ¬NBL exit is `Axiarch`/`DLaw` *as packages*, not ¬NBL.

### III.3 — FA

Holds. The exhaustion of naturalistic content theories is philosophical, not formal, and is stated as such; the physical-intentionality dilemma (Oderberg: powers do not represent alternatives, or they do and FA applies) is the strongest thing in Part III. One note: the same Oderberg text is used in III.5 to do the opposite job (Attack 6 there); the two uses should be reconciled.

### III.8 — P4⁺

Holds as stated: parsimony plus `originator_produces_mind_and_agent`; the cost (necessary generation) is honest. Nothing to add.

### III.9 — rewritten rows for every premise touched

| Premise | Ceiling: what cannot be shown | What the holdout pays |
|---|---|---|
| CE | That a skeptic who pays errs (`W_Nat.witness`). **Also:** that the theist's residue is "one yes/no" — `Maximal` is not unique and the only discriminating certified balance is defined by actuality (`W_Pref`, L:3990) | The whole content of the first stage with nothing bearing on it, against the theist's "which of the maximal class, and whether the inclination prevailed" — a comparison the file does not size. The transition/boundary distinction is D3, a stipulation, not `T2_2`. Norton's dome is bare by the shape of the disjunction; the price is D17's exhaustiveness |
| NBL | That a nomic primitivist cannot posit a selecting law | Nothing, unless every state channel is also off (`R:4659`); the priced exit is the package `Axiarch`/`DLaw`, not ¬NBL |
| GG, P8(a) | That a necessary being's inclination must track its representation; that the balance is value (the core is symmetric under inverting `AtLeast`) | Formally: a different `Q` in `Sens w Q (state s)` (`Toy.A` vs `DState` differ in nothing else). The "count" of essential features is interpretive and asserts the belief–desire link Smith denies. Against Collins, the price "the bad is a reason for" is a price only given GG |
| TR | That a fallible field-ranging inclination is content rather than a primitive modality — and **the fallible reading has not been formalized**: `FalliblePowers.actual` is content-free (`R:4580`) | Certified: `manif` ties everything or fails on a discriminating balance. Not certified: anything about a directedness weaker than `manif`. `powers_fork`'s Horn 1 is `W_Pref.residue` (`R:4685–4692`). The M&A/Vetter/Bird closures do not hold to the texts; the powers naturalist holds the theist's modal primitive and denies TR's content claim — the dispute is TR alone, not "one sentence the powers accounts do not write" |
| P1 | That the unsatisfiable-pair theorist errs; **and** direction-neutral causation is excluded by L0, not P1 | An ungrounded chain; or — for the direction-neutralist — the framework premise L0, which needs its own entry |
| P4 | Uniqueness, beyond IDF. **Certified now:** IDF excludes position (ii) (`R:4973`) and is silent on (i) and (iv) (`R:5019`, `W_P4`), where nothing is `Bare` | Position (ii): primitive thisness (`R:4973`). Positions (i)/(iv): **nothing the model can name** — a second producer with no channel satisfies IDF, CE, and every field but P4/P4⁺ with no world bare. "Exit 1's bill for its share" needs a per-being contribution notion the file lacks |
| IDF | That fundamentals lack thisness; and that IDF ≠ ID: they are about different sorts (Things vs first-stage Items); ¬ID ∧ IDF is consistent (`W_P4`: IDF certified; ¬ID an uncompiled two-line corollary of `K := Unit`) | Primitive thisness for necessary beings, paid **separately** from CE's Obj. 9, not "once" |
| P11 | That chance is Archimedean, against BHW — whose 2018 replies to ultrafilter-relativity and shift-invariance the dossier does not report | Hyperreal one-off chance with modelling-relative ultrafilter; the dossier must engage BHW's "same status as choosing a measure" reply |
| CatU | That a law-structure has infinitely many independent features **and** that similarity is categorical in species (coupling-space similarity makes species addition a limit) | Countably many kinds → the fork: uniform (refuted by P11 + **CatOpen** + L4; certifiable, not yet certified), property-tracking (`HasProp` with structure — not NBL; the file cannot classify it), bare weights (prose) |

---

## Part C — Formal

All results in `review_countermodels.lean`, compiled as `Review_full.lean` (certified file + append), exit 0, empty stderr, 51 certified lines unchanged, 13 new lines, none on `sorryAx`. Definitions are quoted, never paraphrased.

### C.6 — `#print axioms` lines whose content is trivial

**`FalliblePowers.actual` (L:2182–2183):**
```lean
def FalliblePowers.actual (M : Model) (s : M.State) : FalliblePowers M :=
  ⟨fun st D => st = s ∧ D (M.realOf M.w₀), fun _ _ ⟨_, h⟩ _ _ _ => h⟩
```
**`R:4580`, no axioms:**
```lean
theorem fallible_actual_iff (M : Model) (s : M.State) (D : M.Reality → Prop) :
    (FalliblePowers.actual M s).Directed s D ↔ D (M.realOf M.w₀) :=
  ⟨fun h => h.2, fun h => ⟨rfl, h⟩⟩
```
**`R:4586`, no axioms:** `(FalliblePowers.actual M s).Directed s M.Maximal ↔ M.Maximal (M.realOf M.w₀)`.
**`R:4591`:** directed at `fun _ => True` and at `fun r => r = M.realOf M.w₀`.
*Consequence:* `Toy.W_Nat.fallible_witness` (L:4452–4457) and `Toy.W_Pref.fallible_witness` (L:4481–4485) each certify, in their first conjunct, exactly `M.Maximal (M.realOf true)`, which each model's `AtLeast` (L:4234, L:3990) makes true by `Or.inl realOf_true`. Their `#print axioms` lines survive; their content is "the actual reality is maximal on a balance defined to say so."

**The "natural" powers structure (L:4413–4415, L:4489–4491), generic (`R:4599`):**
```lean
def naturalPowers (M : Model) (s : M.State) : Powers M :=
  ⟨fun st D => st = s ∧ ∀ w, (∃ x, M.F w x) → D (M.realOf w),
   fun _ _ ⟨_, h⟩ w m hm _ => h w ⟨m, hm⟩⟩
```
**`R:4610`, no axioms:**
```lean
theorem natural_directed_nonempty (M : Model) (s : M.State) :
    (naturalPowers M s).Directed s (fun r => ∃ x, r x) :=
  ⟨rfl, fun _ ⟨x, hx⟩ => ⟨x, hx.1, hx.2.1⟩⟩
```
*Consequence:* `Toy.W_Nat.powers_witness`'s second conjunct (L:4442) holds of every state of every model. `Toy.NoTR.powers_horn1`'s second conjunct (`Pw.Directed .s Maximal`) holds because `NoTR`'s `AtLeast := fun _ _ => True` makes every reality maximal (the prose says this itself).

### C.1 — `God` in `Toy.A`, of a being inadequate to the name

**`R:4616`:** `theorem god_in_ToyA : God Toy.M .N` (from `main Toy.A` and P4-uniqueness).
**`R:4625`, `[propext, Quot.sound]`:**
```lean
theorem ToyA_inadequate :
    (∀ r : Toy.M.Reality, Toy.M.Knows .N (.alt r)) ∧
    (∀ r : Toy.M.Reality, Toy.M.Knows .N (.act r)) ∧
    (∀ r : Toy.M.Reality, Toy.M.Maximal r) ∧ Toy.M.Maximal Toy.M.emptyReality ∧
    (∀ r r', Toy.M.InOmega r → Toy.M.InOmega r' → r = r')
```
Read: in the model that certifies the premises consistent, the being `god_exists` delivers accurately represents every set of items as an alternative *and as actual* (`Content.act`, L:480), producing nothing is maximal, and there is exactly one possible reality. `KnowsAll` (L:1789–1791) and `Knows` (L:1020–1021) are the definitions; `Accurate := fun _ _ => True` (L:2330) and `AtLeast := fun _ _ => True` (L:2338) are the settings.

### C.2 — denying NBL with the state channel on

**`R:4642`:** `def P : Params := ⟨fun w _ ch => ch = .law ∨ w = true, fun _ => True, True, True, False, true⟩`
**`R:4659`, `[propext, choice, Quot.sound]`:**
```lean
theorem witness :
    Nonempty (Core M) ∧ CE_stmt M ∧ GG_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P4plus_stmt M ∧
    ¬ NBL_stmt M ∧ (∀ w P, (M).Sens w P .law) ∧
    (M).Agential true ∧ (∃ st, (M).SelectingRep true st) ∧ God M .N
```
The law channel is sensitive to every property at every world; NBL is false; `God` holds. Compare `Toy.Axiarch.P` (L:2550: `ch = .law ∧ w = true`), which loses the conclusion because it *also* has no state channel.

### C.3 — two fundamentals, both producing at every world (`R:4712–5029`)

Model `Review.W_Two.Mk (both : Bool)`: things `N N2 a a' b b' d d'`, states `s1` (bearer `N`), `s2` (bearer `N2`); at `true` N produces `a` via `s1` and N2 produces `b` via `s2`; at `false`, `a'` and `b'`; `d`/`d'` downstream. Key field:
```lean
  Sens := fun _ _ ch => ch = .state .s1 ∨ (both = true ∧ ch = .state .s2)
```
`R:4864` (`fields`): every field of `Axioms` except P4, P4⁺ holds for both settings. `R:4936`: both produce at every world. `R:4947`: `¬ Bare w` for all `w`.

**Position (ii), `R:4973`, `[propext, choice, Quot.sound]`:**
```lean
theorem position_ii :
    (∀ w, (M).Fundamental w .N) ∧ (∀ w, (M).Fundamental w .N2) ∧ T.N ≠ T.N2 ∧
    (M).Mind .N ∧ (M).Mind .N2 ∧ (M).Agent true .N ∧ (M).Agent true .N2 ∧
    (∀ w, (∃ m, (M).F w m ∧ (M).CausesVia w .N .s1 m) ∧ (∃ m, (M).F w m ∧ (M).CausesVia w .N2 .s2 m)) ∧
    SameProfile M .N .N2 ∧ ¬ IDF_stmt M ∧ ¬ P4_stmt M ∧ ¬ P4plus_stmt M ∧ (∀ w, ¬ (M).Bare w) ∧
    (M).realOf true ≠ (M).realOf false ∧ (…every field except P4, P4⁺…)
```
This is what III.6 calls (ii); it is excluded by IDF (`R:4959` `same_profile`; `not_IDF`) and by nothing else. `W_P4` is not this model.

**Position (i), `R:5019`, `[propext, choice, Quot.sound]`:**
```lean
theorem position_i :
    IDF_stmt M ∧ ¬ P4_stmt M ∧ CE_stmt M ∧ (∀ w, ¬ (M).Bare w) ∧
    (∀ w P, ¬ (M).Sens w P (.state .s2)) ∧
    (∀ w, ∃ m, (M).F w m ∧ (M).CausesVia w .N2 .s2 m) ∧
    (∀ w, (M).Fundamental w .N2) ∧ (M).Mind .N2 ∧ (∀ w, ¬ (M).Agent w .N2) ∧
    (M).Agent true .N ∧ (M).realOf true ≠ (M).realOf false
```
A second fundamental producer with no channel; IDF holds; CE holds; no world is bare. The prose's price for (i) has no referent. (N₂ is a `Mind` here only because `Mental := True` is a global setting. A non-mind N₂ would need `Mental s2 := False` *and* `Rep s2 := False`, since FA bites on any non-mental ahistorical state that represents `.nil`. Not built — **conjecture** — and not needed for the point, which is about `Bare`.)

### C.4 — a power on the theist's model directed at a determinate type

**`R:4682–4692`, on `Toy.W_Pref.M`:**
```lean
def Pw : Powers M := naturalPowers M .s
theorem directed_nonempty : Pw.Directed .s (fun r => ∃ x, r x)
theorem fork_horn1 : ∃ w, (∃ x, M.F w x) ∧ (fun r : M.Reality => ∃ x, r x) (M.realOf w) ∧ ¬ M.Maximal (M.realOf w)
theorem sens_same_failure : M.Sens false M.Maximal (.state .s) ∧ ¬ M.Maximal (M.realOf false)
theorem fork_applied : (∃ w, …) ∨ (∀ r r', …tied…) := powers_fork Pw channel directed_nonempty
```
`powers_fork` takes its left horn on the theist's own model at the world where `residue` holds, and the theist's `Sens`-channel "fails to track the good" there in the same sense. Horn 1's cost is shared.

### C.5 — fallible directedness at maximality, `Sens` false, non-discriminating balance

**`R:4701`, on `Toy.Mk Toy.Bare.P`:**
```lean
theorem bare_fallible :
    (FalliblePowers.actual (Toy.Mk Toy.Bare.P) .s).Directed .s (Toy.Mk Toy.Bare.P).Maximal ∧
    (∀ w P ch, ¬ (Toy.Mk Toy.Bare.P).Sens w P ch) ∧ (Toy.Mk Toy.Bare.P).Bare true ∧
    (∀ r r', (Toy.Mk Toy.Bare.P).AtLeast r r')
```
"Fallibly directed at the best," bare, sensitive to nothing, everything tied. The "same structure both sides" claim holds here too — for the reason C.6 gives: the structure has no sides.

### Not compiled (conjectures, labelled)

1. The uniform-measure horn of III.7's propensity fork as a theorem from P11 + CatOpen + L4 (A.12). Straightforward; not done.
2. A model with ID ∧ ¬IDF (needs non-trivial `K`); III.6 Attack 2's independence claim is certified in one direction only (¬ID ∧ IDF: every model, since `K := Unit`).
3. A position-(i) model in which N₂ is *not* a mind (`Rep s2 := False`, `Mental s2 := False`): would strengthen C.3 but is not needed for the `Bare` finding.

### Vacuity findings, with the model that exhibits each

| Certified line | What it certifies | Model exhibiting the vacuity |
|---|---|---|
| `W_Nat.fallible_witness`, `W_Pref.fallible_witness` | `Maximal (realOf w₀)` | `R:4580` (all models) |
| `W_Nat.powers_witness` (2nd conjunct) | a tautology of `naturalPowers` | `R:4610` (all models) |
| `NoTR.powers_horn1` (2nd conjunct) | every reality maximal ⇒ directed at maximality | `NoTR` itself (`AtLeast := True`) |
| `exists_maximal` | one projection of `T4_6` | vacuous wherever `AtLeast := True` (every `Toy.Mk` model); non-vacuous only in `W_Pref`, where `AtLeast` is defined by actuality |
| `T2_2` | `rfl` | all models |
| `Axiarch.witness` "conclusion fails" | fails because the state channel is off | `R:4659` |
| `god_exists` in `Toy.A` | `God` of a being that knows every set as actual | `R:4625` |

---

## Part D — What holds

- **Validity.** `god_exists` follows from `Axioms`; reproduced; nothing in this review touches it. The premise-to-conclusion chain is exactly as advertised, and `mind_of_CE_NBL`'s typing over `CoreNoP4` is a real and useful certification.
- **`no_modal_collapse`** is real and matters.
- **`L2_of_P11`, `archRat`, `P12_of_cat`.** Genuine core-Lean theorems; the reduction of P12 to CatOpen + CatU is a real clarification.
- **The witness apparatus** does what it says as *consistency* certificates. `W_Nat`, `NoTR`, `W_P4`, `W_Pref` are honest models.
- **`W_Pref.residue`** is the most important thing in the file and the argument owns it properly.
- **`powers_all_tied` / `no_powers_at_maximal`.** True and worth having: a necessitating directedness at maximality ties everything or contradicts a discriminating balance. This closes the *necessitating* powers reading, exactly as claimed.
- **`W_P4.IDF_and_not_P4`** says what the prose says it says, and the prose's own correction (horn (iv)) is right.
- **FA's dossier (III.3)** is the strongest section of Part III and its Oderberg dilemma is well made.
- **III.1 To 9 (haecceitism):** right.
- **III.6 aggregate reply:** consistent with `Fundamental`/`Concrete`.
- **The change-log discipline** (§0, newest first, each version's claim stated) made this review possible; it is a model of how to do this.

---

## Part E — Recommended changes, in the order a hostile referee finds them

1. **CI pins statements, not just axiom lists.** Add a second expected file containing the *types* of all 51 declarations (`#print` or `pp.all #check`) and diff it. Without this, "green on main" does not certify what the README says it certifies (§0.2 above demonstrates a passing build whose headline theorem is `… ∨ (1 = 1)`).
2. **Fix the MD5 in README §0 and the handoff header**, the "prose only" commit messages, "v8.12: 51," "as of v8.11," and handoff §1's "every field has an independence witness."
3. **Withdraw "one sentence wide" (D23, README §5, §10.0, III.5 ceiling, III.9 TR row, §8.3).** Replace `FalliblePowers.actual` with a structure that mentions `s` non-trivially or delete the fallible witnesses; state that the fallible reading is open. Present `powers_fork`'s Horn 1 as shared with `W_Pref.residue` (`R:4685–4692`).
4. **Rewrite III.5's Mumford–Anjum, Vetter, and Bird paragraphs to the texts.** M&A: report the sui-generis-modality position and that `manif` is Lowe's reconstruction; Vetter: comparative degrees without a measure are a third setting; Bird: spontaneous probabilistic potencies exist and route to III.7. Reconcile the two uses of Oderberg (III.3 vs III.5).
5. **Add `R:4973` and `R:5019` (or equivalents) to the file.** Correct III.6 (ii) ("it is `W_P4.two_minds`" is false); state that positions (i) and (iv) are unpriced in the model's terms because `Bare` is world-indexed; either add a per-being contribution notion and prove the four positions, or reduce III.6's Cost/Ceiling and III.9's P4 row to "position (ii) costs IDF; (i)/(iv) are not priced."
6. **Separate IDF from ID.** They are about different sorts; ¬ID ∧ IDF is consistent (III.6 Attack 2); delete "the same commitment, paid once" from III.6, D25, and III.1 To 9.
7. **III.1 To 6:** replace "one yes/no" with "which of the maximal class, and whether the inclination prevailed"; note that the only discriminating certified balance is defined by actuality; drop `T2_2` as evidence for the transition/boundary distinction and cite D3.
8. **III.4:** withdraw the "count" or state it as an interpretive premise (the belief–desire link) and reconcile with the Smith reply; engage Collins 2019 rather than Law alone.
9. **III.7:** state CatU's *two* contestable premises (infinite independent features; categorical similarity in species) and answer decoupling; certify the uniform horn from P11 + CatOpen + L4 and state the CatOpen dependency; reclassify the property-tracking horn as `HasProp`-with-structure, not NBL; report BHW 2018's replies; soften Schiffrin–Wald to "the canonical measure."
10. **III.2:** price the ¬NBL exit as the package (`Axiarch`/`DLaw`), citing `R:4659`.
11. **§6.2 table:** delete "directed at a determinate type" as a finding about `W_Nat` (`R:4610`); say what `powers_witness` adds over `W_Nat.witness` (nothing).
12. **§6.0:** say that `ActsOnBest` and `Accurate` are primitive atoms, that `Maximal` need not be unique, and that in `Toy.A` the being that satisfies `God` knows every set of items as actual (`R:4625`).
13. **P1:** add L0 (asymmetry of causation) to the dossier; the direction-neutral theorist is excluded there, not at P1.
14. **Add the `#print axioms` of the review results** (or equivalents) to `expected_axioms.txt` in the same commit that adopts any of the above, per README §4.

---

### Closing statement on the tested claim

*`god_exists` follows from `Axioms`* — true, reproduced. *Every exit is certified consistent* — true for the fourteen witnessed premises. *…and priced* — false at P4 positions (i)/(iv) (no price the model can name), at NBL (the price is the package, not the premise), and at TR (the price rests on a content-free definition). *The two exits a serious naturalist takes are `W_Nat` and `NoTR`* — the second is not one position: its "fallible" version has not been formalized, and the M&A/Vetter/Bird closures do not hold to the texts. *The second is one sentence wide* — no; it is the whole of TR's content claim against a primitive modality the theist also holds. *Denying P4 is polytheism* — true of the file's witness (alternation) and of `R:4973`; false of `R:5019`, where the second fundamental is a producer with no channel and the argument has no bill for it. *What remains is philosophical at four named points* — the list is longer: the fallible reading (open, not one sentence), a second channel-less fundamental (unpriced), IDF as a separate premise from ID, the "count" in III.4 as an unstated premise, CatU's second contestable premise, and L0 against direction-neutral causation.
