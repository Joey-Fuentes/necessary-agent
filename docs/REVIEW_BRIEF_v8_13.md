# Review brief — A Necessary Agent, v8.13

You are being handed this repository to attack it. You did not write any of it. That is the point: the README's own rule (§4, step 5) is that no session verifies its own changes, and versions 8.6 through 8.13 were all produced by one session working from the v8.5 external review. Your job is to be the next v8.5 review — the one that produces v8.14 — and to be harder than it was.

Do not defer to the argument. Do not defer to the Lean. The argument's own standard is that every claim has either a certified model or a priced exit; hold it to that.

---

## 1. What you are attacking

Three files carry the argument; the rest is scaffolding.

- `NecessaryAgent.lean` — the formal core. 51 `#print axioms` results. Arbiter of *validity only*.
- `docs/necessary_agent_argument_v8_7.md` — the prose (filename is historical; the version line inside says 8.13). Part I renders the Lean in words; Part II is informal assessment; Part III is the soundness dossier (per-premise case, objections, replies, cost, ceiling); Appendix A reproduces the Lean definitions verbatim.
- `docs/Necessary_Agent_Handoff_v8_7.md` — status: what is certified, what is priced, what is open, and the version history since the last review.

Read in this order: README §0–§1, then the handoff, then the prose §0 (the change log, newest first — it tells you exactly what was added and why), then Part III, then Part I against Appendix A, then the Lean.

The v8.5 review is `docs/necessary_agent_v8_5_review.md`. Read it. Its form is the form your report should take, and its findings are what v8.6–8.13 claim to have answered. Check whether they did.

## 2. Verify before anything else

```
scripts/verify.sh
```
(needs Lean 4.33.1 on PATH; `elan` reads `lean-toolchain`), or paste `NecessaryAgent.lean` into https://live.lean-lang.org. Expected: exit 0, empty stderr, 51 lines byte-identical to `expected_axioms.txt`, every result on at most `[propext, choice, Quot.sound]`. If that fails, stop and report it; nothing else matters.

Then read `scripts/verify.sh` itself and try to defeat it: is there a way to change what is certified without changing the output? (Think about `#print axioms` on a theorem whose *statement* has been weakened; think about definitions.)

## 3. The three attack surfaces, in the order the README allows

### A. Faithfulness (Part I vs Appendix A vs the Lean)

Appendix A is regenerated mechanically from the Lean and should be byte-identical to it — check that first, then check that Part I's *sentences* say what the *definitions* mean. The v8.5 review found seven contradictions and four glosses that added content; all are marked fixed. Confirm, and find the next ones. Specific places to look:

- §1.3 `Favored` and D20: the "because" gloss is now flagged interpretive. Is the rest of the prose consistent with `Sens` carrying no axioms, or does it slide back into difference-making anywhere?
- §6.0 `God`: is the definition exactly the conjunction `main` proves? Could a model satisfy `Axioms` and make `God M N` true of something nobody would call God? Build it. (Start from `Toy.A`: one world with output, Ω a singleton, `AtLeast := True`. Ask what "knows all of Ω" and "accords with the balance" amount to there.)
- `Maximal` with `AtLeast` axiomless: is `exists_maximal` a discovery or a triviality? In which models?
- FA with `Mental := True` everywhere: FA is vacuous in `Toy.A`, `NoTR`, `W_P4`. Is FA doing work in *any* model where the conclusion is interesting, or only in `NoMind` where it fails?
- `SameProfile` / `IDF_stmt` (v8.12): vacuous in every model in the file except `W_P4`, where it is vacuous for a different reason. Does IDF have a model where it is non-vacuously true and does work?

### B. The dossier (Part III) — where v8.8–8.13 leaned on readings of the literature

These are the sections where the last five versions rest on one author's reading of specific texts. Go to the texts.

**III.5 (TR; the fork; the fallible reading).**
- `Powers.manif` is attributed to "the powers theorist's own axiom." Is it? Mumford & Anjum (2011) explicitly deny that powers necessitate. The prose says their fallibility is *fallibility under interference* and that nothing interferes at the foundation. Check *Getting Causes from Powers* ch. 3 and the Lowe (2012) / Bird (2016) exchange: is that a fair reading, or does M&A's "tendency" modality allow failure with no interferer?
- Vetter (2015): the prose says a potentiality that fails does so "by degree or by rival co-present potentialities." Is that Vetter's view, or is unmanifested potentiality primitive for her, with no explanation owed? If primitive, does the "propensity or bare" fork still close?
- Bird (2007) "no stimulus at the foundation": is a stimulus-free disposition really not a Birdian disposition, or does Bird allow non-conditional dispositions?
- `FalliblePowers.actual` is called "free" and used to show fallible directedness "distinguishes nothing." Is that a substantive result or a triviality dressed up? State precisely what `W_Nat.fallible_witness = W_Pref.fallible_witness in structure` shows and does not show.
- Oderberg (2017): the "specific indifference / abstraction" criterion is the argument's last step and is conceded to be philosophical. Does Oderberg's text support applying it to a *single* state directed at "whichever is best"? Or is his abstraction about concepts, not directedness?
- The Dretskean modus tollens reply (III.5, "To 2"): does it actually answer the objection, or does it assume that field-sensitivity is established (Horn 1) — which is what is at issue?

**III.6 (P4; IDF; the four positions).**
- The trilemma-now-tetralemma is prose. Position (i) "bare source" needs a per-being notion of contribution to F_w that the model lacks. Is the prose argument valid without it? Try to build a two-fundamental model where CE holds through N₁'s state and N₂'s contribution is *not* bare on any reasonable reading.
- IDF: the prose says it is "foundation-only anti-haecceitism" and "the same commitment CE already needs" (III.1 Obj. 9). Are those the same commitment? CE's haecceitistic exit is about *tokens of the first stage*; IDF is about *fundamental beings*. Argue they come apart.
- The aggregate reply (objection 5): "the argument is about the producer." Does the model's definition of `Fundamental` / `Concrete` support that, or can a fusion and its parts both be fundamental?
- `W_P4.IDF_and_not_P4` is certified. Is "alternation is a bare contrast over which being acts" actually a cost, or is it just what a two-being modal profile looks like?

**III.4 (GG/P8).**
- The evil-god reply now says the core is symmetric under inverting `AtLeast` and the asymmetry is "a theory of practical reason on which the bad is a reason for." Is that fair to Law (2010) and Collins (2019)? Does the theory-of-reasons asymmetry (Raz) beg the question in a subtler way than "evil = good + inversion" did?
- The reply to Smith says the `Rep`/`Sens` split *satisfies* the distinct-existences thesis. Does it, or does GG then just assert an essential belief–desire *alignment* that Smith's argument was designed to deny?
- The "count" reply to Dasgupta: two essential features vs one. Is "the aim's content is fixed by the representation" a real reduction of features, or is the good-selector's aim also a second feature under another name?

**III.7 (chance; CatU; P11).**
- The positive argument for CatU (v8.13): "a difference in field content is a difference in kind and not a limit." Is that a fact about the similarity topology or a stipulation about it? Can a naturalist define similarity so that adding a species *is* a small change (e.g., a species with vanishing coupling)?
- "A uniform finitely additive measure on a countable set assigns zero to every singleton." True — but does L4 apply to singletons? Is `{k}` an open region (`POpen`) in the kind topology the argument is using? Check `L4_stmt` and `POpen`.
- The propensity fork ("uniform → L4; property-tracking → NBL; bare weights → III.4's count") is prose. Is the middle horn right — is a propensity that tracks a property of kinds a *selecting law* in NBL's sense, or is NBL about something else?
- P11 vs NAP: the prose says ultrafilter-dependence is "fatal for the objective propensity of a one-off." Do Benci, Horsten & Wenmackers (2018) address objective chance, and if so, what do they say? Is Williamson's non-invariance point applicable to a space of kinds with no natural order?
- Non-normalizability (Schiffrin & Wald 2012) is used to say `HasProp` "has no measure to be true with." Is that the right conclusion from non-normalizability, or does it only show the *Liouville* measure fails?

**III.1 (CE; the symmetry; the exits).**
- The residue is conceded and the asymmetry is "what is left unexplained (a yes/no vs the whole content) and the kind of gap (familiar vs new)." Is the first asymmetry real, or does the theist also leave "which of the tied maximal realities" unexplained wherever there are ties? Is the second asymmetry anything more than "ours is the kind we like"?
- "The bare naturalist's bruteness is in the transition from an identical state, not in a boundary condition." Does that distinction survive if the naturalist says the *initial state* is what varies across worlds (i.e., denies `T2_2`'s reading)?
- Norton's dome is classified as "bare" and priced with the dome's critics. Is that the right classification, or is unmeasured lawful indeterminism a fourth CE disjunct the argument is refusing to state?
- Objection 9 (haecceitism): the price is "necessitarianism about the constants." Does the haecceitist have to hold `TypeDeterministic`, or only that the *qualitative* contrast is chancy/bare while the token contrast is haecceitistic?

**III.6 (P1).**
- The endless-future reply needs the direction of causation. What does the reply owe a theorist who takes causation to be direction-neutral (Price, Huw; or a Humean)? The prose admits it has not answered that case. Try to make it bite.

### C. Formal attacks — build compiling countermodels

Every attack that can be stated as a model should be. The file's own witnesses are the template (`namespace Toy`, the `Mk` family, `W_Nat`, `W_Pref`, `W_P4`). Targets:

1. A model of `Axioms` in which `God M N` holds and N is obviously inadequate to the name (see A above).
2. A model where `Sens` is true through the *law* channel for every property at every world and every field of `Axioms` still holds — i.e., is NBL doing work, or is `Axiarch`'s failure an artifact of how it was built?
3. A two-fundamental model (extend `W_P4`) in which both are active at *every* world and CE, NBL, CH, TR, FA all hold: what does the argument say about it, and is III.6's "position (ii)" fairly described?
4. A `Powers` structure on `W_Pref` directed at something *other* than maximality that satisfies `manif` — and ask what `powers_fork` then says. Is the fork's second horn ("fails to track the good") a cost or a description?
5. A model of `FalliblePowers` where `Directed s Maximal` holds, `Sens` fails, and the balance is *not* discriminating — does the fallible reading's "same structure both sides" claim survive there?
6. Anything that makes a `#print axioms` line survive while the theorem's *content* has become trivial.

Any countermodel claim without compiling Lean is a conjecture; label it so.

## 4. What the report should look like

Mirror `necessary_agent_v8_5_review.md`:

- **Part A — Faithfulness.** A table: location / sentence / what the Lean says / fix.
- **Part B — Adversarial read of Part III.** Per section: the attacks, strongest first, each with *what the file says*, *what is wrong or unproved*, and a *revised ceiling* — the honest sentence about what the holdout pays. End with a rewritten III.9 table row for every premise you touched.
- **Part C — Formal.** Every countermodel with its Lean; every vacuity finding with the model that exhibits it.
- **Part D — What holds.** Say what survived. The v8.5 review did this and it made its attacks credible.
- **Part E — Recommended changes, in order of what a hostile journal referee would find first.**

Rules: cite the Lean by line number; never paraphrase a definition — quote it; never claim a countermodel you have not compiled; say "philosophical, not formal" wherever that is true; no advocacy in either direction. Where the argument is right, say so briefly and move on. Where it leans on a reading of a text, go to the text.

## 5. The specific claim to test

The argument's own summary of its state (handoff §9, III.9): *`god_exists` follows from `Axioms`; every exit is certified consistent and priced; the two exits a serious naturalist takes are `W_Nat` (¬CE) and `NoTR` (¬TR); the second is now one sentence wide; denying P4 is polytheism; what remains is philosophical at four named points.* Your job is to find out whether that summary is true, and if it is not, where it fails first.
