# A Necessary Agent: The Argument at Minimum Cost
## Version 8.9 — machine-checked core; P3, P6 and P10 derived; the necessary-mind conclusion needs no value premise; P4⁺ adopted: one being; soundness dossier complete; two naturalist packages certified (¬CE and ¬TR); the theist's residue certified and priced; the conclusion named (`God`) and certified (`god_exists`); the TR fork certified (`powers_fork`) and the fallible reading finished (`FalliblePowers`)

---

## 0. What this document claims

This document has two parts with different epistemic status.

**Part I (§§1–6) is a human-readable rendering of the Lean 4 file `NecessaryAgent.lean`.** Every definition in §1 is a Lean definition stated in words. Every premise in §2 is a field of the Lean structure `Core` or `Axioms`, stated in words. Every derivation line in §§3–6 names the Lean theorem that proves it. The following facts about Part I are certified by the Lean kernel and can be reproduced by anyone with `lean NecessaryAgent.lean`:

1. **Validity.** Every conclusion of §§3–6 follows from the premises of §2 and the definitions of §1 (`NecessaryAgent.main`) — including, with P4⁺ now in the premise set, that the originator, the mind, and the agent are one being (`identify`). The conjunction `main` concludes about that being is named `God` (§6.0), and `god_exists` certifies that, given the premises, God exists and is unique. Two further conclusions follow when an optional premise of §2.3 is added (`T3_11'`, `T2_4'`), and P12 itself is a theorem from two optional premises (`P12_of_cat`, which uses no axioms at all).
2. **Consistency.** The premises of §2 are jointly satisfiable: a finite model of all of them exists (`Toy.premises_consistent`).
3. **Independence of every contested premise.** For each of P1, P2, P4, P5, FA, P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺ there is a model in which every other premise holds, that premise fails, and the conclusion it supports fails (`Toy.*.witness`, fourteen theorems; P3, NI and P10 are derived and so are not premises; P6 was replaced by FA in v8.2 and `P6_stmt` survives only as a retired statement). So none is idle and none follows from the others. (One caveat, owned in D3: 2.4's substance — that the ground's natures and necessary states do not vary — was absorbed into the *definition* of "deterministic," so `T2_4` follows from E, P1, L0, F1 and that definition alone. The independence witnesses show the *premises* are not idle; they do not show that every definition is innocent, and D1–D15 say which ones carry weight.)

Nothing in the certificate depends on anything beyond Lean's standard axioms (`propext`, `Classical.choice`, `Quot.sound`).

**Part II (§§7–11) is informal assessment**: skeptic exits, costs, the ledger, open problems, soundness status. None of it is certified and none of it is claimed to be more than reasoned judgment.

**What "valid" does and does not mean here.** The certificate says the conclusions follow from the stated premises under the stated definitions, and that the premises are consistent. It does not say the premises are true, that the definitions are the right stipulations, or that the twelve modeling decisions of §1.0 are the ones a reader must accept. Each decision is a point where earlier versions were ambiguous and a choice had to be made to write the definition at all. A reader who rejects a decision rejects a stipulation, not an inference; §7 prices the rejections.

**Changes from v5.** v5 claimed validity by a hand-written audit table. Formalizing it found:

- (a) The first formal draft's premise set was **inconsistent** — P12 was quantified over every propensity structure, including the trivial one — and every theorem in it was vacuously provable. This was detected only by constructing a model of the premises. The lesson is built into the workflow (§0.1 of the README): no change to §2 is accepted without re-checking the consistency witness.
- (b) P3 and P10, stated for all worlds, together with the empty outcome counting as an outcome (needed for 2.3), **entailed that no world has an empty contingent reality** — settling v5's open problem §9.11 by accident. Both are now restricted to worlds with non-empty first-stage output (D10), which is all the derivation uses.
- (c) The v5 step "selected because of R transfers to R's source" was not definitional and is **gone** (D6). The argument now delivers a mind (the bearer of the underived root representation) and an agent (the bearer of the selecting representation) separately, and proves they coincide with N only under strengthened uniqueness (`identify`).
- (d) Derivation is stipulated single-source and whole-content (D5); v5's "explained by" clause admitted partial and multi-source derivation, under which 3.7 fails.
- (e) The agential definition now requires the selecting state to be one *in virtue of which* its bearer causes an F-member (D4), so no appeal to "because ⇒ depends" is needed.
- (f) P8 is strengthened from "not outweighed" to "settles the balance" (D8); v5's P7+P8 did not deliver 4.5 in ties.
- (g) The definition "good in its essential constitution" is dropped: given P7 and P8 it was satisfied by every agent. Tier 4's result is stated as what was actually derived (4.6 + 4.2).
- (h) "Outcome" is a token plurality (D1). The cost — type-fixed but token-varying productions count as non-deterministic and hence bare unless favored — is recorded and priced (§7, Exit 2C).
- (i) The definition of Ω by "non-empty contingent reality" and by "non-empty first-stage output" are proved equivalent (`contingent_iff_F_nonempty`), closing a gap between §1 and 2.6.
- (j) "Knows" is given a content type (D12): a reality as an alternative, a consideration bearing on a reality, or producing nothing as an alternative. Nothing stronger is claimed.

**Changes from v6.0 (this revision).**

- (k) The selecting representation must represent *producing nothing* as an alternative (P5, `Content.nil`), so the deliberation is complete over Ω and the empty case.
- (l) A second route to Tier 3 that does not use single-source derivation (D5): under P6′ — an ahistorical representing state is mental, derived or not — the agent itself is a mind (`T3_11'`), with no regress to a root. The argument now holds under *either* P6 + D5 or P6′; both are priced in §7.
- (m) D1 is made explicit. "Type-deterministic" is defined, and the optional premise ID (identity of indiscernibles at the foundation) yields type-level non-determinism (`T2_4'`). Without ID the argument establishes token-level non-determinism only, and §7 says what that costs.
- (n) Independence witnesses for all ten contested premises, not just P3 and P10. Two required infinite models: P1 (an infinite causal chain) and L4 (uncountably many worlds, with a Cantor argument).

**Changes from v6.1 (this revision).**

- (o) **P12 reduced.** Outcomes have a category (D13). Two premises — CatOpen: each category class is an open region (no output is a limit of outputs of other categories); CatU: uncountably many categories are realized — entail P12 by pure logic (`P12_of_cat`). These are the two claims the v5 defense of P12 actually made; they are now separated and each can be attacked on its own. The L4 model satisfies both, so they are consistent with every premise except L4.
- (p) **Appendix A** reproduces the Lean definitions and premise statements verbatim, so the faithfulness check (Part I against Lean) can be done without opening the Lean file.

**Changes from v8.8 (this revision — v8.9: the fallible reading finished).**

- (bk) **`FalliblePowers`.** The powers naturalist's escape from `powers_all_tied` — a directedness at maximality that may fail at w′ — stated with the only axiom it can keep (`manif₀`: the type manifests at the actual world). `Powers.fallible` (every power is one); `FalliblePowers.actual` (every model with a channel state has one, for free: the structure that directs s at exactly the properties the actual reality has).
- (bl) **The same structure on both sides.** `W_Nat.fallible_witness`: on the bare naturalist's model, s is fallibly directed at maximality (manifests at w₀, fails at w′), `Sens` false, the production bare at both worlds, CE false. `W_Pref.fallible_witness`: on the theist's model, the *same* generic structure directs the selecting state at maximality, and `Sens` holds. Identical causal structure, identical balance; the models differ in `Sens`, `Rep`, `Mental` and nothing else. So fallible directedness distinguishes nothing; what distinguishes the theist from the bare naturalist is whether the alternatives figure.
- (bm) **Closed on the powers theorists' own accounts** (III.5). A Mumford–Anjum tendency fails only under interference, and nothing interferes at the foundation (P4, `N_anc_of_nec_concrete`, `T2_2`), so it manifests — `manif`, and the fork. A Vetter potentiality that fails does so by degree (a propensity, `HasProp`, III.7) or by rival co-present potentialities with nothing privileging one (bare). A Birdian disposition has a stimulus; the foundation has none. What is left is a state that favors the best among alternatives it has not produced and may lose — the theist's inclination described in the theist's terms — with content denied. That is one sentence, and the reply is Oderberg's criterion. Open problem 0 is narrowed to it and marked as having nothing further to formalize.

**Changes from v8.7 (v8.8: the TR fork certified).**

- (bf) **The powers naturalist's primitive, formalized on his own terms.** `Powers M` is an *optional* extension of a model — `Directed s D` (s is directed at manifestation-type D) with the one axiom powers theorists give it, `manif`: an unmasked power manifests its type, so wherever the bearer produces a first item in virtue of a state directed at D, the produced reality has D. Nothing in `Model` or `Axioms` changes; every theorem is typed over `Powers M`.
- (bg) **The fork, certified.** `powers_all_tied`: a powers channel directed at maximality ties every possible reality on the balance — `all_tied` for the powers naturalist, from `manif` alone, with no P7/P8 and no w₀ restriction available to him, because a power necessitates where an inclination (`Sens`, D20) need not. `powers_fork`: a powers channel directed at any D either fails to track the good at some productive world (D holds, maximality does not) or ties every possible reality. So the powers naturalist who denies TR *and nothing else* — keeping GG, so his channel tracks the good — must hold that every possible reality is tied; the one who drops that has a channel that does not track the good and a bare contrast among the D-realities.
- (bh) **The theist's state is not a power.** `W_Pref.no_powers_at_maximal`: in the theist's own model, where the selecting state is sensitive to maximality at both worlds and produces the worse at w′ (`residue`), *no* powers structure directs that state at maximality. The powers naturalist cannot borrow the theist's discriminating balance; and `W_Nat.no_powers_at_maximal` says the same on the bare naturalist's.
- (bi) **Both horns witnessed.** `W_Nat.powers_witness` (Horn 2): the bare naturalist's model carries a powers channel directed at a determinate type — "a non-empty reality" — with no `Sens` through any channel and CE false: a power directed at a determinate type, with the alternatives not figuring, *is* the bare naturalist. `NoTR.powers_horn1` (Horn 1): directed at maximality with every field but TR is consistent — in a model where every reality is tied, which `powers_all_tied` says is the only kind where it can be.
- (bj) **What remains open, stated exactly.** The *fallible* reading: a directedness at maximality that may fail at w′. By (bh) that is not a power on any `Powers` structure; it is `Sens`-as-inclination, where the alternatives figure, and TR's question returns in full (III.5). Open problem 0 is narrowed to this.

**Changes from v8.6 (v8.7: the conclusion named, the exits priced).**

- (ba) **`God` defined; `god_exists` certified.** `God M N` is the conjunction `main` concludes about N — unique fundamental, brings about every world's contingent reality, mind, knows all of Ω, agent, satisfies P7's antecedent, acts on the best reasons, production accords with the balance. `god_exists`: given `Axioms`, exactly one such being exists. Nothing new is assumed; the theorem names what `main` proves. What it does not do is discharge `Axioms`: every field has an independence witness, so the antecedent is not a theorem of logic. The argument's claim over the skeptic is the price of refusing the antecedent (§8.3, III.9), never that refusing it is contradictory.
- (bb) **The v8.5 external review's remaining items applied** (Part A of `necessary_agent_v8_5_review.md`): Appendix A gains `Pred`, `Uncountable`, `KnowsAll`, `identify`, `main`, `God`, `god_exists`; `Finite` deleted (§1.6 and Lean); §2 intro corrected; the two P6→FA slips corrected; §5.4's "finite strict partial order" corrected to well-foundedness; §6.1's parameter list, `MoralBears`, and "in virtue of s" corrected; D7 narrowed; the "because" gloss on *Favored* flagged as interpretive (§1.3, D20); P10's hypothesis and 3.8's condition stated in the prose as the Lean has them.
- (bc) **The empirical strand rebuilt, conservatively** (D21; companion `cosmic_strand_v2.md`). The life-permitting region of parameter space has sharp boundaries in kind — the deuteron bound or unbound, nuclei stable or unstable, galaxies form or never form, expand or recollapse, integer dimensionality — which is what CatOpen asserts. But the honest count of independent sharply-bounded constraints is about five (Λ, Q, light-quark masses, the low-entropy initial state, dimensionality), so the constants of our laws yield finitely many kinds: CatU is a claim about the space of possible law-structures and is defended as such (III.7). The empirical case against a propensity at the origin is non-normalizability (Schiffrin & Wald 2012), not CatU. Penrose's number is never used as a probability; biological error rates are excluded as fine-tuning data.
- (bd) **The two exits, priced in one place** (D22; §8.3; III.9). Exit 1, `W_Nat` (¬CE): the whole content of the first stage — five sharp constraints — obtains with nothing bearing on any of it; contrastive explanation is exempted at exactly one point; the cosmological measure is rejected or Boltzmann brains inherited. Exit 2, `NoTR` (¬TR): the fork in (be). The theist's residue: one binary fact of the kind every libertarian pays; the content of the outcome explained by maximality. The asymmetry is in what is left unexplained and in the kind of gap, with its scope stated (libertarian vs compatibilist naturalist).
- (be) **The TR fork, stated as the central open burden** (D23; III.5). `NoTR` stipulates `Sens` for a determinate-type disposition; the `Sens` comment says such a disposition is one in which no alternatives figure, which is ¬CE. So the powers naturalist must answer: do the candidates bear on the outcome or not? If yes, the state ranges over them, which is Oderberg's specific indifference, reserved for the mental — TR. If no, `Sens` is false and the package is `W_Nat`. Not yet formalized; what formalizing it requires is stated.

**Changes from v8.5 (v8.6, after the second external review).**

- (av) **`NoTR` made mindless and representation-free.** The powers naturalist's complete package — N has a necessary state through which the production is sensitive to a property and produces, but that represents no alternative; nothing is mental — satisfies every field of `Axioms` except TR. There are therefore **two** single-premise naturalist packages, `W_Nat` (¬CE) and `NoTR` (¬TR), and v8.5's "only CE" claim (§8.3, III.9) is withdrawn.
- (aw) **`W_Pref.residue` certified.** The theist's own agent, in the same necessary state, with the same complete accurate representation, satisfying the P7-antecedent, produces the strictly worse reality at the non-actual world. The libertarian residue is a theorem of the model and is not confined to ties. The review's Attack 1 is conceded; III.1 now answers the symmetry objection on those terms.
- (ax) **D20.** `Sens` is inclination, not necessitation: it carries no counterfactual or difference-making axioms, and the "because" gloss on *Favored* is interpretive. The restriction of P7/P8 to w₀ (D7) is what keeps inclination from being necessitation, and it is priced: either way the theist's package contains one bare contrast, as the naturalist's does.
- (ay) **P1 well-founded throughout**; no "finite" remains in any proof.

**Changes from v8.4 (v8.5, Phase 5: the two packages).**

- (au) **The naturalist's complete package, certified.** `W_Nat.witness`: a necessary concrete initial state that produces one of two genuinely different contingent realities, with no chance, no favoring, no representation anywhere, and no mind — the position Oppy defends — satisfies every field of `Axioms` except CE. P4⁺, NBL, GG, CH, TR, FA, P7, P8, and the whole of Tier 1 hold in it. So the disagreement between the argument and its strongest opponent is not a list of premises; it is one premise, CE: whether anything about the outcome mattered to which reality was produced. §8.3 is rewritten accordingly.

**Changes from v8.3 (v8.4, Phase 4: the soundness dossier).**

- (as) **P1 weakened.** "Every item has finitely many ancestors" conflicted with continuum physics and was stronger than any proof used. P1 now says ancestry is well-founded at every world — no infinite descending chain of causes — and permits infinite branching. `exists_minimal` is proved by well-founded induction. This is what causal finitism needs (Koons 2014; Pruss 2018) and no more.
- (at) **Part III complete.** Soundness dossier sections for CE, NBL, FA, GG/P8/P8s, TR/CH, the Tier 1 premises, the chance premises, and P4⁺. Each states the premise in prose and Lean, gives the case, the objections at full strength, the replies, the cost of denial, and a paragraph headed *Ceiling* marking where argument stops and judgment begins.

**Changes from v8.2 (v8.3, Phase 3: attributes and latent commitments).**

- (ao) **A best reality exists — certified as a commitment.** `exists_maximal`: from the premises, the actual contingent reality is maximal on the balance of value-grounded reasons. So Rowe's no-best-world thesis is *inconsistent* with P7 + P8, not a neutral background. Readers who hold that the value ordering has no top must take the satisficing form **P8s** (acting on the best reasons makes the outcome *good enough*), under which `T4_6s` concludes the actual reality is good rather than maximal. §7 Exit 4E.
- (ap) **Knowledge of the actual world.** Optional premise **SK**: a selecting representation represents the reality it selects as the one that obtains. With P9, `knows_actual`: the agent accurately represents the actual contingent reality — which, since a reality is a world's entire contingent content, is the whole actual contingent world — as actual. Content gains ⟨act r⟩.
- (aq) **Five exits from the literature surveys added to Part II** (§7): priority monism (grounding, not causation), branching actualism, Humean best-system chance, the Cantorian objection to P5, and the no-best-world problem. Each is located at the premise it actually contacts.
- (ar) **Attribute checklist** (§8.4): every attribute the argument establishes, the premises it rests on, and what it does not establish — so that the question "is this God?" can be answered against a list rather than an impression.

**Changes from v8.1 (v8.2, Phase 2: the P6 bridge).**

- (al) **P6 replaced by FA; mentality by elimination.** P6 ("an underived ahistorical representing state is mental") is no longer a premise. In its place: **FA** — factivity of ahistorical non-mental content: a state that is not mental and has no contingent causal history can represent a reality as an alternative only if that reality obtains, and can represent producing nothing only if nothing contingent exists. Every naturalistic theory of content grounds content in relations to *actual* things — selection history (Wright 1973; Millikan 1984), covariation with actual conditions (Dretske 1981), exploitable isomorphism to an actual target (Cummins 1996; Shea 2018) — and Dretske's own conclusion was that without history informational content is factive: misrepresentation, and the representation of what is not the case, need function, which needs history. The selecting state represents producing nothing as an alternative (TR, P5), is ahistorical, and something contingent exists; so it is mental (`mental_of_nonactual`). §7 Exit 3C prices the denial.
- (am) **The agent is always a mind.** `T3_11'` is now unconditional: the being whose state selects is a mind, with no root regress and no use of `Src`. `mind_of_CE_NBL` likewise. The identity matrix (§5.4) loses its "agent that is not a mind" configurations; `originator_neither` replaces `three_distinct`: without P4⁺ the originator may still be neither the knower nor the selector, but the selector is always a knower.
- (an) **The structural-representation exit is now a certified witness.** `Toy.NoMind` is a world in which an ahistorical, mindless state represents every alternative including producing nothing: all premises but FA hold, and no mind exists. That is what denying FA is.

**Changes from v8 (v8.1, Phase 2: the P3 bridge).**

- (ah) **P3 is now a theorem.** "No bare selection" follows (`P3_of`) from three premises: **CE** — weak contrastive explicability: at a world with non-empty output, which reality obtains is not *totally* brute (the production is deterministic, or propensity-governed, or sensitive through some channel to *some* property of the candidates); **NBL** — no bearer-free selection: the ground's laws as such select nothing, every sensitivity runs through a state of a thing (this entails NI); **GG** — guise of the good: whatever a state of the ground tracks in selecting, the selection is sensitive to maximality. Each has a certified independence witness.
- (ai) **The mind conclusion no longer depends on any value premise.** `mind_of_CE_NBL`: from Core + CE + NBL + CH + TR — none of which mentions value, favoring, or representation — with P6 via the root regress, there is a necessary concrete mind whose state selects the first contingent items. GG is needed only for Tier 4. `DState` certifies the split: a state that selects for a non-evaluative property makes the production *unfavored* (P3 fails, Tier 4 fails) while a necessary mind still exists.
- (aj) **No modal collapse, certified.** `no_modal_collapse`: from Core, some two worlds have different first-stage outputs. The restricted explicability principle CE never necessitates; the defect formalization exposed in Gödel's ontological argument is ruled out by theorem here.
- (ak) **The naturalist's exits, re-sorted.** Total brute selection = deny CE. A lawful selection for a descriptive property with no bearer = deny NBL (`DLaw`). A bearer's state selecting for a non-evaluative property = deny GG (`DState`) — and that concedes a necessary mind. Value-sensitive law with no bearer = deny NBL (`Axiarch`).

**Changes from v7.3 (v8, Phase 2: the P10 bridge).**

- (ae) **P10 is now a theorem.** "Favored" and "selected because of s" are no longer primitive; both are defined from a single primitive, *sensitivity through a channel*: the production is sensitive to a property of candidate realities either through the ground's laws/dispositions as such or through a state of a thing (D17). "Favored" = sensitive to maximality on the balance of value-grounded reasons through some channel. P10 follows (`P10_of`) from three premises stated without "favored," "represents," or "mental": **NI** (no law channel is sensitive to maximality as such), **CH** (a state channel is a state in virtue of which its bearer causes a member of F), **TR** (a state channel carries the candidates as content — indicator content, not mental). §2 gives the derivation; §7 Exit 3A prices the denial of NI.
- (af) **New witnesses.** `Axiarch`: a value-sensitive law with no bearer — NI fails, the production is favored, there is no selecting representation. `NoCH`, `NoTR`: the other two premises are independent. `DLaw`: a law tracking a descriptive property that coincides with maximality on every live alternative but is not maximality is *bare* selection — P3 fails, not NI (§6.2). So "the law just tracks the base" is the brute-selection exit under another name.
- (ag) **Non-circularity.** NI locates the sensitivity (law vs. state of a thing); it says nothing about content. A skeptic who relabels the ground's law-sensitivity as "a necessary state of N" thereby concedes a selecting representation and moves the dispute to P6.

**Changes from v7.2 (v7.3, Phase 1 of the v8 plan).**

- (ac) **P7 and P8 restricted to the actual world.** They are principles about an agent's *actual* act; stating them for merely possible acts was a stronger claim than the internalism they encode, and it entailed that every possible contingent reality is tied on the balance of reasons. The all-worlds forms remain in the file as optional premises (`P7all`, `P8all`), and `all_tied` is now a theorem *from them*, not from `Axioms`. This was recorded as the one exception to D7; D7 was narrowed in v8.7 to list the chance premises (stated at w₀, D11) alongside it.
- (ad) **Witness `W_Pref`.** A model of all of `Axioms` in which the necessary being's favored production yields, at the actual world, a reality strictly better supported than the alternative — so the balance discriminates, and the restricted premises do not entail ties. The all-worlds P8 fails there.

**Changes from v7.1 (v7.2).**

- (aa) **Tier 4's conclusion given structure** (D16). "Accords with the balance of value-grounded reasons" was a primitive proposition; the theorem proved an undefined atom. It is now *defined*: the balance is a comparative relation over realities ("r is at least as well supported as r′"), and accordance means the actual contingent reality is at least as well supported as every alternative in Ω and as producing nothing. Tier 4 now certifies a maximality claim.
- (ab) **Consequence surfaced** (`all_tied`, §6.4): unless O has objective propensities, every two possible contingent realities are tied on the balance — each at least as well supported as the other. This follows from P7 and P8 being stated for all worlds and is now unavoidable to see. Part II discusses what to make of it.

**Changes from v7 (v7.1, after external review).**

- (u) **Three theorems retyped.** `stateless_originator_is_neither` had been left over the full premise set after P4⁺ was adopted — but P4⁺ already yields a state of N, contradicting the theorem's own hypothesis, so it was proved ex falso. It, `originator_produces_mind_and_agent`, and the new `all_worlds_accord` are now over `Axioms0` (everything except P4⁺). Only `identify` and `main` use P4⁺.
- (v) **P4⁺ in every independence witness.** "All other premises hold" now includes P4⁺ for every witness except `W_P4`, where it fails along with P4 (recorded).
- (w) **Reality defined, not primitive** (D14). The contingent reality of a world is now the set of contingent items existing there. Previously an unconstrained one-element `Reality` type satisfied every premise and "knows every possible contingent reality" collapsed.
- (x) **Accuracy content-indexed** (D12). "Accurate" is now a relation between a state and a content; P9 says an ahistorical necessary state accurately represents everything it represents.
- (y) **MR removed from the formal core** (D15). It was a bare atom conjoined to the conclusion; "including moral ones" was never derived. Tier 4's certified result is accordance with the balance of value-grounded reasons; that the balance includes moral reasons is stated as an interpretive premise in Part II.
- (z) **A consequence surfaced** (§6.4): HasProp, or every possible first production accords with the balance of value-grounded reasons. Follows from stating the Tier 2–4 premises for all worlds. Bears on Exit 4C.
- Editorial: stale "Axioms"/"hypothesis" language in §1.0, §5.4, §6.3 and the certainty ladder corrected; the 2.4 ladder row no longer cites P0 (`T2_4` does not use it).

**Changes from v6.5 (v7).**

- (s) **P4⁺ adopted.** "No necessary concrete being other than N" is now a premise (§2.2). Rationale: the argument could not decide whether the originator, the mind, and the agent are one being or several (§5.4), and of the premises that could decide it, P4⁺ is the one a skeptic has the least reason to deny — a skeptic who grants P4 has parsimony on the side of P4⁺, and the only standing motive to reject it is a doctrine of necessary generation, which is a theistic commitment. With P4⁺, `identify` is unconditional and `main` concludes about **one being**. The three-beings model (`W_Id.three_distinct`) becomes the independence witness for P4⁺. `identify_of` keeps the conditional form for readers who decline P4⁺.

- (r) **Identity fully mapped.** Two theorems and one model family (§5.4). *Certified from the premises:* the mind and the agent are each either the originator N or produced by N at every world (`originator_produces_mind_and_agent`), because every necessary concrete being other than N has N as an ancestor (`N_anc_of_nec_concrete`). *Certified consistent with the premises* (`W_Id.matrix`): every assignment of the mind-role and agent-role to one, two, or three beings. So the premises neither identify nor distinguish the three; they fix only the order of production. Only P4⁺ forces identity; a stateless originator forces distinctness.
- (t) **ℚ instantiation.** `ArchOrd` is certified satisfied by ℚ in core Lean (`archRat`), and all witness models carry ℚ-valued propensities. The trusted base for the whole argument is core Lean; no Mathlib, no ℝ.
- (q) **L2 proved.** The measure-theoretic lemma (no finite real-valued measure gives positive measure to uncountably many disjoint sets) is now a theorem in core Lean (`L2_of_P11`, via the generic `L2`), proved from an explicit axiomatization of what "real-valued" contributes: propensity values form an Archimedean ordered additive structure, and μ is non-negative, finitely additive and monotone on a class of regions containing the open ones. That axiomatization *is* P11, stated precisely. ℝ satisfies it; nothing in the proof assumes ℝ. The proof needed its own pairing function ℕ×ℕ→ℕ and a countability pigeonhole, both in the file.

---

# Part I — Certified core

## 1. Definitions

### 1.0 Framework and modeling decisions

The Lean file fixes a structure `Model` whose fields are the primitive sorts and relations below. Everything else is defined from them.

**Primitive sorts.** Worlds `W`, with a designated actual world `w₀`. `Thing`. `State`, with a function `bearer : State → Thing`. `Consideration`. (A *reality* is not a primitive sort: it is a set of items, §1.3.) A type `V` of propensity values with a designated element `vzero`. A type `K` of qualitative kinds with a function `kind` from items to `K` (used only by the optional premise ID). A type `Cat` of outcome categories with a function `cat` from outcomes to `Cat` (used only by the optional premises CatU and CatOpen).

**Primitive relations.**
- `E_thing w t` — thing t exists at w. `E_state w s` — the bearer of s is in state s at w.
- `Causes w x y` — item x causes item y at w (an *item* is a thing or a state).
- `CausesVia w t s z` — thing t causes z at w in virtue of state s.
- `DependsOn w x` — O's outcome at w depends on item x.
- `Bears c r` — consideration c bears on reality r (a set of items).
- `Rep s c` — state s represents content c. A *content* is ⟨alt r⟩ ("r as an alternative"), ⟨cons c r⟩ ("consideration c bearing on r"), ⟨nil⟩ ("producing nothing, as an alternative"), or ⟨act r⟩ ("r as the reality that obtains").
- `Source w s s'` — s' is a source of s at w.
- `Mental s`. `Accurate s c` — state s accurately represents content c.
- `Sens w P ch` — O's outcome at w is sensitive to property P of candidate realities *through channel* ch, where a channel is either `law` (the ground's laws/dispositions as such) or `state s` (a state of a thing).
- `HasProp` — O's outcomes are governed by objective propensities. ("Favored" and "selected because" are defined, §1.4.)
- `POpen G` — G is an open region of the similarity topology on O's outcome space. `μ G` — the propensity of G. (A *region* is a set of outcomes; an outcome is a set of items.)
- `MotivState s`, `ActsOnBest w t`, `EssOutweighs t` (an essential motivational disposition of t outweighs the best reasons).
- `AtLeast r r′` — on the balance of value-grounded reasons, reality r is at least as well supported as reality r′. `Good r` — r is good enough on that balance (used only by the optional P8s).

**Modeling decisions.** Each resolves an ambiguity in earlier versions. Each is a commitment the argument now owns.

- **D1** Items are transworld individuals; existence varies by world. An *outcome* is therefore a token plurality. Consequence: a production that fixed the outcome's type but not its tokens counts as non-deterministic, falls under L-tax, and is bare unless favored or propensity-governed. This puts weight on P3 (§7, Exit 2C). Made explicit in §1.4 (`TypeDeterministic`) and §2.3 (ID).
- **D2** O's outcome at w is F_w as a set; the empty set counts as an outcome. This is what makes 2.3 valid without assuming that an empty contingent reality is impossible.
- **D3** Determinism is relative to the ground's configuration (the necessary concrete things and their necessary states). That configuration is world-invariant by construction, so "deterministic" reduces to "F is the same in every world." Theorem `causes_in_ground` justifies treating the ground as O's setup.
- **D4** A selecting representation is a state *in virtue of which* its bearer causes a member of F. It is therefore a cause of that member by B1, with no appeal to P0 or to any inference from "because" to "depends." P10's consequent is literally the definiens of "agential."
- **D5** Derivation is single-source and whole-content: a source is an ancestor, is itself a representing state, and represents everything the derived state represents. Since v8.2 this is used only to identify the *root* representation (3.7, for the 3.11a mind); the mind conclusion itself no longer depends on it.
- **D19** FA is stated for non-mental ahistorical states only. Historical non-mental states may misrepresent and represent the non-actual — that is what selection history buys (Millikan) — so FA leaves ordinary biological and artefactual representation untouched. The empty alternative is what makes the elimination bite even when Ω has one member: producing nothing is non-actual at any world with contingent items.
- **D6** "Selected because of R" does not transfer to R's sources. Mind attaches to the bearer of the underived root representation; agency to the bearer of the selecting representation. They coincide with N by P4⁺, a premise since v7 (`identify`); without P4⁺ they need not (§5.4).
- **D7** Every premise is stated for all worlds (this is v5's L3) — with the exceptions of the chance premises, which are stated at w₀ (E, P11, P12, L4, CatU, CatOpen; see D11), and of P7 and P8 (v7.3), which are stated at w₀ only because they are principles about an agent's actual act. Their all-worlds forms are recorded as optional premises (§2.3) and their consequence (§6.4) as a theorem from those forms. The w₀ restriction on P7/P8 does philosophical work and is priced in D20 and D22, not treated as bookkeeping.
- **D20** `Sens` is inclination, not necessitation. It is a primitive with no axioms: sensitivity to a property does not entail that the produced reality has that property (`W_Pref.residue`: sensitive to maximality at w′, produces the worse). The link from inclination to outcome is P8, at w₀ only (D7). A counterfactual or difference-making reading of `Sens` is *not* built in; the gloss "the outcome obtains partly because considerations favor it" (§1.3) is interpretive. Intended sense: the candidates *figure* in the producing, as alternatives bearing the property — which is why a determinate-type disposition, in which no alternatives figure, is the ¬TR package and not an instance of `Sens` (D23). With all-worlds P7/P8, `all_tied` follows and the agent never produces the worse; with w₀-P7/P8, it may. Either way the theist's package contains one bare contrast — which of the equally-maximal (all-worlds) or whether the inclination won (w₀) — as the naturalist's does. The argument's claim is only that the theist's contrast lies among candidates a mind tracks (D22).
- **D21** Empirical status of the chance premises (v8.7). On the most conservative numbers in the literature (Adams 2019 as baseline; `cosmic_strand_v2.md`), the life-permitting region of parameter space has sharp boundaries in kind — the deuteron bound or unbound, nuclei stable or unstable, galaxies form or never form, expand or recollapse, integer dimensionality — which is what CatOpen asserts. But the honest count of independent sharply-bounded constraints is about five (Λ, Q, light-quark masses, the low-entropy initial state, dimensionality), and variation within each window is gradual, so the constants of our laws yield finitely many kinds. CatU is therefore a claim about the space of possible law-structures and is defended as such (III.7). The empirical case against a propensity at the origin is that the natural (Liouville) measure over cosmological initial conditions does not normalize (Schiffrin & Wald 2012), so `HasProp` has no measure to be true with; P11/L4 close whatever measure a skeptic supplies. Penrose's 10^(10^123) is a ratio of phase-space volumes under that measure and is not used as a probability anywhere. Biological error rates are evolved mechanisms and are excluded as fine-tuning data.
- **D22** The two exits (v8.7). Every field has an independence witness, so every premise is deniable; the two a serious naturalist takes are these. *Exit 1*, `W_Nat` (¬CE): the necessary foundation could have produced many realities, produced this one, and nothing bore on which. Its price: (a) the whole content of the first stage — under D21, Λ inside a ~2-order-of-magnitude window against a ~120-order natural range, Q inside a ~2-order window, quark masses inside the nuclear-stability island, near-zero initial gravitational entropy against a ~10¹²² maximum, 3+1 dimensions — obtains with nothing bearing on any of it; (b) contrastive explanation is exempted at exactly one point and demanded everywhere above it; (c) the measure cosmology uses for initial conditions is rejected, or kept and Boltzmann brains inherited. *Exit 2*, `NoTR` (¬TR): something bore on the outcome — a necessary state directed at a determinate kind — but the state is about nothing; the alternatives, including producing nothing, never figured. Its price is the fork in D23. *The theist's residue* (`W_Pref.residue`) is one binary fact — whether the inclination toward the best prevailed — of the kind every libertarian pays at every free choice; the content of the outcome is explained by `Maximal`. The asymmetry over Exit 1 is in what is left unexplained (a yes/no against the whole first stage) and in the kind of gap (familiar against new). It bites against a naturalist who accepts libertarian agency anywhere; against a compatibilist it does not, and the comparison there is content alone.
- **D23** The TR fork (v8.7; certified v8.8 — `Powers`, `powers_fork`; III.5). `Sens w P (state s)` is primitive, so `NoTR` may stipulate it for a determinate-type disposition; D20 says such a disposition is one in which no alternatives figure, i.e. ¬CE, not ¬TR. v8.8 gives the powers naturalist his own primitive, `Directed s D`, with his own axiom `manif`, and certifies the fork from it. (i) `W_Nat.powers_witness`: a powers channel directed at a determinate type with no `Sens` is the bare naturalist's model — Horn 2 is ¬CE. (ii) `powers_all_tied` and `powers_fork`: a powers channel directed at *maximality* ties every possible reality, because `manif` necessitates where `Sens` only inclines; so the powers naturalist who keeps GG inherits `all_tied` with no w₀ escape, and the one who drops it has a channel that does not track the good and a bare contrast among the D-realities. (iii) `W_Pref.no_powers_at_maximal`: the theist's own selecting state, which fails at w′, is *not* a power on any `Powers` structure — `Sens` is inclination, and the powers naturalist cannot borrow the theist's discriminating balance. What remains open is the *fallible* reading — a directedness at maximality that may fail — which (iii) shows is not a power and which is exactly `Sens`-as-inclination, where the alternatives figure and TR's question returns in full. Ranging over unproduced alternatives is what Oderberg (2017) calls specific indifference and reserves for the mental; the nil alternative is the lever, since a power directed at D is not directed at its own non-manifestation. *v8.9:* the fallible reading is finished. `FalliblePowers` states it with the only axiom it can keep (manifests at w₀); `FalliblePowers.actual` shows it is free — every model with a channel state has it; `W_Nat.fallible_witness` and `W_Pref.fallible_witness` show it is the *same* structure on the bare naturalist's and the theist's models, which differ only in `Sens`, `Rep`, `Mental`. On Mumford–Anjum it is not a tendency (no interference at the foundation), on Vetter not a potentiality (degree is a propensity; no degree is bare), on Bird not a disposition (no stimulus). What is left is the theist's inclination with content denied — one sentence — and the reply is Oderberg's criterion (III.5).
- **D8** Tier 4's reasons vocabulary is abstract. P8 is the strengthened form "value-grounded reasons settle the balance." "Good in its essential constitution" is not defined; the result is 4.6 with 4.2.
- **D9** L2 is proved (`L2_of_P11`). The premise is P11, stated as exactly what the proof uses: an Archimedean ordered additive structure on V with zero = vzero (`ArchOrd`), and a non-negative, finitely additive, monotone measure μ on a class of regions containing the open ones (`FinMeasure`). "Archimedean" means: no value bounds every finite multiple of one, and every positive value has a finite multiple reaching one. ℚ is certified to satisfy `ArchOrd` in core Lean (`archRat`) and every witness model uses ℚ-valued propensities; ℝ satisfies the same eight one-line axioms by inspection. No part of the argument depends on ℝ or on any external library.
- **D10** P3 and P10 are stated for worlds whose first-stage output is non-empty. Unrestricted, together with D2 and L-tax, they would entail that every world has non-empty F. Both are only applied at w₀, where 1.3 supplies non-emptiness.
- **D11** The propensity structure (`POpen`, `μ`) is part of the model. P12, L2/P11 and L4 are conditional on O being propensity-governed at w₀, exactly as v5 states them. Residual chance inside a favored production is untouched.
- **D13** Outcomes have a category — ontological kind or law-structure. CatOpen says each category class is an open region of the similarity topology; CatU says uncountably many categories are realized among possible first-stage outputs. P12 follows from them (`P12_of_cat`).
- **D17** Channels of sensitivity are exhaustively the ground's laws/dispositions as such, or a state of a thing. A third, sui generis "value-explanation with no subject" is not articulated in the literature (reasons-explanation is agent-indexed); a skeptic who wants one must supply it.
- **D18** Sensitivity is intensional: it attaches to the property, and coextension on the live alternatives does not transfer it (Fodor's natural-kind constraint; Davidson's anomalism). `DLaw` (§6.2) realizes the distinction.
- **D12** "t knows content c" means: some state of t represents c and is accurate *with respect to c* (accuracy is a relation between a state and a content). "t knows all of Ω" (`KnowsAll t`) means: t knows ⟨nil⟩, and for every r ∈ Ω, t knows ⟨alt r⟩ and knows ⟨cons c r⟩ for every consideration c bearing on r. This is what 3.11's "knows every possible contingent reality" is taken to mean.
- **D14** A reality is a set of items, and the contingent reality of a world is *defined* as the set of contingent items existing there. So Ω is fixed by the model's own contingent content; it is not a free type.
- **D16** The balance of value-grounded reasons is the comparative `AtLeast`. "O's outcome at w accords with the balance" is defined (§1.4): the contingent reality of w is at least as well supported as every member of Ω and as the empty reality.
- **D15** MR is not formalized. Tier 4's certified result is that O's outcome accords with the balance of value-grounded reasons (`AccordsValue`). That some of those reasons are moral is an interpretive premise (§7, Tier 4), not a conjunct of any theorem.

### 1.1 Basic notions

- **Item.** A thing or a state. `E w x`: x exists at w (for a thing, `E_thing`; for a state, `E_state`).
- **Ancestry** (`Anc w`). The transitive closure of `Causes w`. "x is an ancestor of y at w."
- **Necessary thing** (`Nec t`). t exists at every world.
- **Necessary state** (`NecState s`). At every world at which the bearer of s exists, the bearer is in s.
- **Concrete** (`Concrete t`). At some world, t causes something.

### 1.2 Items and firsts

- **Contingent item** (`ContingentItem x`). A thing that is not necessary and is concrete; or a state that is not a necessary state and whose bearer is concrete.
- **First contingent item at w** (`FirstCont w x`). x is a contingent item, exists at w, and no ancestor of x at w is a contingent item.
- **F_w** (`F w`). The set of first contingent items at w — O's outcome at w.
- **Fundamental at w** (`Fundamental w t`). t is necessary, concrete, and nothing causes t at w.
- **In the ground** (`InGround x`). A necessary concrete thing; or a necessary state of a necessary concrete thing.
- **Cause of F at w** (`CauseOfF w x`). x causes some member of F_w at w.

### 1.3 Realities

- **Contingent reality of w** (`realOf w`). The set of contingent items that exist at w.
- **Ω** (`InOmega r`). r is the contingent reality of some world whose first-stage output is non-empty. (By `contingent_iff_F_nonempty` this is equivalent to: some world with a contingent item.)
- **Φ** (`InPhi φ`). φ = F_w for some w, and φ is non-empty.
- **Maximal** (`Maximal r`). r is at least as well supported as every r′ ∈ Ω and as the empty reality.
- **Accords with the balance at w** (`AccordsValue w`). The contingent reality of w is maximal.
- **Favored at w** (`Favored w`). Through some channel, O's outcome at w is sensitive to maximality. The gloss "the outcome obtains partly because considerations favor it" is *interpretive* (D20): `Sens` carries no counterfactual or difference-making axioms, and `W_Pref.residue` shows a favored production may produce the worse.
- **Selected because of s at w** (`SelectedBecause w s`). O's sensitivity to maximality at w runs through the state s.
- **t brings about the contingent reality of w** (`BringsAbout w t`). Nothing is an ancestor of t at w, and t is an ancestor at w of every contingent item that exists at w.

### 1.4 Modes of production

- **Deterministic** (`Deterministic`). For all worlds w, w′: if the ground's configuration at w equals the ground's configuration at w′, then F_w = F_w′. The configuration is the pair ⟨the necessary concrete things, the necessary states of necessary concrete things⟩ and does not mention w; so this is equivalent to: F_w = F_w′ for all w, w′.
- **Kinds present at w** (`kindsOf w`). The set of kinds k such that some member of F_w has kind k.
- **Type-deterministic** (`TypeDeterministic`). For all w, w′: the kinds present at w equal the kinds present at w′.
- **Representing state** (`RepState s`). s represents some content.
- **Selecting representation at w** (`SelectingRep w s`). (i) For some m ∈ F_w, the bearer of s causes m at w in virtue of s; (ii) s is a representing state; (iii) O's outcome at w is selected because of s.
- **Agential at w** (`Agential w`). O's outcome at w is favored, and there is a selecting representation at w.
- **Teleological at w** (`Teleological w`). Favored, and not agential.
- **Propensity-governed at w** (`PropGoverned w`). Not deterministic, not favored at w, and O's outcomes are governed by objective propensities.
- **Bare at w** (`Bare w`). Not deterministic, not favored at w, and not governed by objective propensities.

### 1.5 Representation

- **Derived at w** (`Derived w s`). s has a source at w.
- **Historical at w** (`Historical w s`). Some ancestor of s at w is a contingent item.
- **Represents all of Ω** (`RepAllOmega s`). s represents ⟨nil⟩; and for every r ∈ Ω: s represents ⟨alt r⟩, and for every consideration c bearing on r, s represents ⟨cons c r⟩.
- **Mind** (`Mind t`). Some state of t is mental.
- **Accurate throughout** (`AccurateAll s`). s accurately represents every content it represents.
- **Knows** (`Knows t c`). Some state of t represents c and accurately represents c.
- **Knows all of Ω** (`KnowsAll t`). t knows ⟨nil⟩; and for every r ∈ Ω, t knows ⟨alt r⟩ and, for every consideration c bearing on r, knows ⟨cons c r⟩.
- **Agent at w** (`Agent w t`). Some state of t is a selecting representation at w.
- **P7-antecedent at w** (`P7Antecedent w t`). (i) Some state of t is a selecting representation at w, represents all of Ω, and is accurate throughout; (ii) every motivational state on which O's outcome at w depends is a necessary state.

### 1.6 Auxiliary

- **Uncountable.** A type ι is uncountable iff there is no injection ι → ℕ. (`Finite` was deleted in v8.7: nothing has used it since P1 became well-foundedness in v8.4.)

---

## 2. Premises

Every premise is a named proposition `X_stmt` in the Lean file. `Core` bundles the framework and Tier 1–2 premises (including FA); `Axioms0` extends `Core` with CE, NBL, GG, CH, TR — from which P3, NI and P10 are *derived* (`Axioms0.P3`, `NI_of_NBL`, `Axioms0.P10`), not assumed; `Axioms` extends `Axioms0` with P4⁺. Theorems proved from `Core` alone are so typed; their types certify that they use none of CE, NBL, GG, CH, TR, P4⁺. Optional premises (§2.3) belong to no structure and appear only as hypotheses of the theorems that use them.

### 2.1 Core

| | Premise | Status |
|---|---|---|
| **F1** | If x causes y at w, then x and y exist at w. | framework |
| **Src** | If s′ is a source of s at w, then s′ is an ancestor of s at w, s′ is a representing state, and s′ represents everything s represents. | framework (D5) |
| **E** | Some contingent item exists at w₀. | evident |
| **L0** | Nothing is an ancestor of itself, at any world. | near-universal |
| **B1** | State s causes z at w iff the bearer of s causes z at w in virtue of s. | definitional |
| **B1′** | If t causes z at w in virtue of s, then t is the bearer of s and t causes z at w. | definitional |
| **B2** | If the bearer of s is in s at w, then the bearer of s causes s at w. | mild |
| **P0** | If O's outcome at w depends on a thing t, then t causes some member of F_w at w. If it depends on a state s, then the bearer of s causes some member of F_w at w in virtue of s. | mild, contested |
| **P1** | At every world, ancestry is well-founded: no infinite descending chain of causes. (Infinite branching is permitted.) | contested (causal finitism, §III.6) |
| **P2** | Every contingent item that exists at w has a cause at w. | contested |
| **P4** | There is an N such that, at every world, N is fundamental and every fundamental thing is N. | contested |
| **P5** | Every selecting representation at w represents all of Ω (including the empty alternative). | contested |
| **FA** | If s is not mental and is ahistorical at w, then s represents r as an alternative only if r is the contingent reality of w, and s represents producing nothing only if no contingent item exists at w. | contested only by those who allow naturalistically ungrounded content of the non-actual in a mindless state (§7, 3C) |
| **P7** | If t satisfies the P7-antecedent at w₀, then t acts on the best reasons at w₀, or an essential motivational disposition of t outweighs the best reasons. | contested; at w₀ only (D7 exception) |
| **P8** | If t satisfies the P7-antecedent at w₀, then no essential motivational disposition of t outweighs the best reasons, and if t acts on the best reasons at w₀ then O's outcome at w₀ accords with the balance of value-grounded reasons. | contested (strengthened, D8); at w₀ only |
| **P9** | A representing state that is ahistorical at w and is a necessary state accurately represents everything it represents. | contested |
| **P11** | If O is propensity-governed at w₀, then there is an Archimedean ordered additive structure on V whose zero is vzero, and μ is a non-negative, finitely additive, monotone measure on a class of regions that contains the open regions. | contested; denial is non-Archimedean chance |
| **P12** | If O is propensity-governed at w₀, then there is an uncountable family of pairwise disjoint open regions each of which contains some member of Φ. | contested |
| **L4** | If O is propensity-governed at w₀, then for every open region G with propensity vzero and every world w, F_w ∉ G. | contested |

### 2.2 Added by Axioms0 and Axioms

| | Premise | Status |
|---|---|---|
| **CE** | At every world with non-empty F: O is deterministic, or O's outcomes are governed by objective propensities, or O is sensitive through some channel to some property of the candidate realities. | contested — the live disagreement, in its weakest form (§7, 2C) |
| **NBL** | At every world and for every property, O is not sensitive to that property through the law channel. | contested only by nomic primitivists about foundational selection; entails NI (§7, 2C′, 3A) |
| **GG** | At every world, if O is sensitive to some property through a state s, then O is sensitive to maximality through s. | contested (guise of the good); denial keeps the mind and loses Tier 4 (§7, 2C″) |
| **CH** | If O's sensitivity to any property runs through a state s of a thing, then for some m ∈ F_w the bearer of s causes m at w in virtue of s. | framework (the B-framework applied to channels) |
| **TR** | If O's sensitivity to any property runs through a state s, then s represents producing nothing and every member of Ω as alternatives. | mild; indicator content over the candidates (Dretske) |
| **P4⁺** | Every necessary concrete thing is the N that is fundamental at every world. | adopted in v7; the least deniable of the identity-settling premises; denial requires necessary generation |

**P3 (derived).** `P3_of`: at every world with non-empty F, O is not bare. *Proof:* CE gives deterministic, propensity-governed, or a channel sensitive to some property; the first two are not bare by definition; by NBL the channel is a state; by GG it is sensitive to maximality; so O is favored, hence not bare. **NI (derived).** `NI_of_NBL`: an instance of NBL.

**P10 (derived).** `P10_of`: at every world with non-empty F, if O is favored then a selecting representation exists. (`P10_stmt` also carries the hypothesis "every cause of F at w is in the ground"; `P10_of` discards it, so the derivation does not use 1.5.) *Proof:* favored gives a channel sensitive to maximality; by NI it is not the law channel, so it is a state s; by CH, s is a state in virtue of which its bearer causes a member of F; by TR, s represents producing nothing, which is all `RepState` needs; and sensitivity through s is, by definition, selection because of s.

### 2.3 Optional premises

| | Premise | Enables | Status |
|---|---|---|---|
| **ID** | If O is type-deterministic then O is deterministic (identity of indiscernibles at the foundation). | `T2_4'`: O is not type-deterministic | contested; the explicit form of D1's cost |
| **P7all / P8all** | P7 and P8 stated for every world. | `all_worlds_accord'`, `all_tied` | not adopted; entails all possible realities tied |
| **SK** | A selecting representation at w represents the contingent reality of w as the one that obtains. | `knows_actual`: the agent knows the actual contingent world | Phase 3; mild (an agent knows what it did) |
| **P8s** | As P8, but acting on the best reasons makes the actual reality *good enough* rather than maximal. | `T4_6s` | alternative to P8 for those who deny the balance has a top (Exit 4E) |
| **CatOpen** | If O is propensity-governed at w₀, then for every category k, the region {φ : cat φ = k} is open. | `P12_of_cat` (with CatU): P12 | supported empirically: the life-permitting region has sharp boundaries in kind (D21, III.7); "no output is a limit of outputs of other categories" |
| **CatU** | If O is propensity-governed at w₀, then the set of categories realized by some member of Φ is uncountable. | `P12_of_cat` (with CatOpen): P12 | contested; "uncountably many law-structures" — a modal claim about possible law-structures, not established by the constants of our laws (D21, III.7) |

**Reduction of P12** (`P12_of_cat`, no axioms). From CatU and CatOpen: take the family of category classes indexed by realized categories. Each is open (CatOpen); each contains a member of Φ (by "realized"); distinct categories have disjoint classes; the index set is uncountable (CatU). That is P12. A reader who accepts CatU and CatOpen may replace P12 in `Core` by them and obtain `main` unchanged.

**Consistency.** `Toy.premises_consistent`: a model of `Axioms` exists (§6.1).
**Independence.** Fourteen witnesses, one per premise (§6.2): for each of P1, P2, P4, P5, FA, P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺, a model in which every other `Axioms` field holds, that premise fails, and the conclusion it supports fails.

---
## 3. Tier 1: a necessary concrete being originates contingent reality

All theorems in this section are proved from `Core` alone.

**Lemma (minimal elements).** `exists_minimal`. Let r be well-founded and transitive, and p a property. If x has p, there is m with p such that m = x or r(m, x), and no y with p has r(y, m). *Proof:* well-founded induction on x; if some y with p has r(y, x), the induction hypothesis at y gives such an m, and transitivity places it below x.

**Lemma.** `anc_exists`: if y is an ancestor of x at w, both exist at w (F1, induction on the closure). `anc_causes_something`: an ancestor causes something. `anc_last`: if y is an ancestor of x, something causes x.

- **1.2** `first_exists`. If x is a contingent item existing at w, there is a first contingent item m at w with m = x or m an ancestor of x. *Proof:* apply the lemma to Anc_w (well-founded by P1, transitive by definition) and the property "contingent item existing at w." Minimality gives: no ancestor of m is a contingent item existing at w; by `anc_exists` every ancestor of m exists at w; so no ancestor of m is a contingent item.
- **1.3** `F_nonempty`. F_{w₀} is non-empty. *Proof:* E and 1.2.
- **Ω remark** `contingent_iff_F_nonempty`. A world has a contingent item iff its F is non-empty. *Proof:* → by 1.2; ← a member of F is a contingent item existing at w.
- **1.5 (generalized)** `anc_of_first_in_ground`. Every ancestor y of a member m of F_w is in the ground. *Proof:* y is not a contingent item (m is first). y causes something (`anc_causes_something`). If y is a thing: concrete, hence — not being a contingent item — necessary. If y is a state s: by B1, the bearer causes in virtue of s; by B1′ the bearer causes; so the bearer is concrete. s exists at w (`anc_exists`), so by B2 the bearer causes s, hence is an ancestor of m, hence not a contingent item, hence necessary. s, not a contingent item with concrete bearer, is a necessary state.
- **1.5** `causes_in_ground`. Every cause of a member of F_w is in the ground. *Proof:* a cause is an ancestor; 1.5 generalized.
- **1.4–1.5** `first_has_ground_cause`. Every member of F_w has a cause, and that cause is in the ground. *Proof:* P2 and 1.5.
- **1.6** `first_has_fundamental_anc`. Every member m of F_w has a fundamental ancestor at w. *Proof:* m has a cause y (1.4). Apply the lemma to Anc_w and the property "ancestor of m," starting at y. The minimal u is an ancestor of m with no ancestor of m preceding it. u is not a state: a state that exists at w is caused by its bearer (B2), which would be an ancestor of m preceding u. u is in the ground (1.5 generalized), hence necessary and concrete. Nothing causes u: a cause of u would be an ancestor of m preceding u.
- **1.7** `T1_7`, `fundamental_exists`. Every contingent item existing at w has a fundamental ancestor at w. A fundamental necessary concrete being exists at w₀. *Proof:* 1.2 then 1.6, composing ancestries.

**Result at Tier 1** (certified). `fundamental_exists`.

---

## 4. Tier 2: the necessary being can originate any possible contingent reality, and its first production is favored

§4.1–4.4 are proved from `Core` alone; §4.5 uses P3 (derived from CE, NBL, GG).

### 4.1 O is not deterministic

- **2.1** `T2_1`. Everything O's outcome at w depends on is in the ground. *Proof:* P0 makes it a cause of a member of F_w (via B1 for states); 1.5.
- **2.2** `T2_2`. The ground's configuration is the same at every world. *Proof:* it does not mention the world (`rfl`).
- **2.3–2.4** `T2_4`. O is not deterministic. *Proof:* suppose it is; then F_{w₀} = F_{w′} for every w′ (`det_const`). Take m ∈ F_{w₀} (1.3). If m is a thing, it is not necessary, so fails to exist at some w′; but m ∈ F_{w′}, so m exists at w′. If m is a state, it is not a necessary state, so at some w′ its bearer exists and is not in m; but m ∈ F_{w′}, so its bearer is in m at w′. Contradiction either way.

- **2.4′** `T2_4'` (optional, from ID). O is not type-deterministic. *Proof:* ID and 2.4.

### 4.2 L-tax

- `L_tax_exhaustive`. If O is not deterministic then at every w, O is agential, teleological, propensity-governed, or bare. *Proof:* case on Favored w; if favored, case on whether a selecting representation exists; if not, case on HasProp.
- `L_tax_exclusive`. The four are pairwise exclusive at every w. *Proof:* by the definitions.

### 4.3 N brings about every possible contingent reality; every member of Φ is a possible outcome

- **2.6–2.8** `T2_8`. There is an N such that at every world w with a contingent item, N brings about the contingent reality of w. *Proof:* P4's N. N has no ancestor at w: an ancestor would give something causing N (`anc_last`), but N is fundamental. Every contingent item at w has a fundamental ancestor (1.7), which by P4's uniqueness is N.
- **2.9** `T2_9`. Every member of Φ is F_w for some w. *Proof:* definitional (D2).

### 4.4 O is not propensity-governed

- **L2** `L2`, `L2_of_P11`. If O is propensity-governed at w₀, then for every uncountable family of pairwise disjoint open regions, some member has propensity vzero. *Proof from P11:* suppose every member has non-zero measure. By non-negativity and the positive-Archimedean property, each i has some n_i with 1 ≤ n_i·μ(G_i). By the countability pigeonhole, some n has an uncountable fiber. An uncountable set contains m distinct elements for every m; for m such indices in the fiber, finite additivity and disjointness give m·1 ≤ n·μ(⋃) ≤ n·μ(top) by monotonicity. So every multiple of one is bounded by n·μ(top), contradicting the Archimedean property.
- **2.10–2.15** `T2_15`. O is not propensity-governed at w₀. *Proof:* suppose it is. P12 gives an uncountable family of pairwise disjoint open regions G_i, each containing some φ_i ∈ Φ. L2 gives some i with μ(G_i) = vzero. L4 then gives: F_w ∉ G_i for every w. But φ_i = F_w for some w (2.9) and φ_i ∈ G_i. Contradiction.

  This theorem does not use P4. It also does not use "not favored": it refutes the conjunction that defines "propensity-governed" by refuting the existence of the propensity structure L4 and P12 describe, under that conjunction.

### 4.5 O is favored

- **2.16** `T2_16`. O is not bare at w₀. *Proof:* P3 (now derived, `P3_of`) with 1.3.
- **No modal collapse** `no_modal_collapse`. Some two worlds have different first-stage outputs. *Proof:* 2.4.
- **2.17** `T2_17`. O is agential or teleological at w₀. *Proof:* L-tax exhaustive with 2.4; strike propensity-governed by 2.15 and bare by 2.16.
- **2.18** `T2_18`. O's outcome at w₀ is favored. *Proof:* both disjuncts of 2.17 entail it.

**Result at Tier 2** (certified). `T2_4`, `T2_8`, `T2_15`, `T2_18`.

---

## 5. Tier 3: a necessary being in the ground is a mind that knows every member of Ω

### 5.1 Agential, not teleological

- **3.3–3.4** `T3_4`. O is agential at w₀. *Proof:* P10 (now derived, `P10_of`) with 1.3, 1.5 (`causes_in_ground`), and 2.18; the consequent is the definiens.

### 5.2 The alternatives are all of Ω

- **3.6** `T3_6`. There is a selecting representation s at w₀, and s represents all of Ω. *Proof:* 3.4 and P5.

### 5.3 The root representation; representation is mind; accuracy

**Lemmas on sources.** Define `SrcStar w s a`: a is reachable from s by finitely many source steps (including zero). `srcstar_anc`: such an a is s or an ancestor of s (Src, transitivity). `srcstar_content`: such an a represents everything s represents (Src, induction). `srcstar_repstate`: such an a is a representing state if s is.

- `selecting_anc`. A selecting representation s at w is an ancestor of some member of F_w. *Proof:* clause (i) of the definition and B1.
- `anc_first_ahistorical`. An ancestor of a member of F_w is ahistorical at w. *Proof:* a contingent ancestor of it would be a contingent ancestor of the member.
- **3.7** `T3_7`. For any selecting representation s at w, there is a state s* such that: s* is underived at w; s* = s or s* is an ancestor of s; s* represents everything s represents; s* is a representing state; s* is ahistorical at w; s* is in the ground. *Proof:* apply the minimal-elements lemma to Anc_w restricted to states (well-founded as the inverse image of P1) and the property `SrcStar w s`. The minimal s* is reachable from s and has no source (a source would be reachable and precede it). Content, representing-state, and ancestry follow from the lemmas. s* is an ancestor of a member of F_w (via `selecting_anc`), hence ahistorical and in the ground (1.5 generalized).
- **Mentality by elimination** `mental_of_nonactual`. An ahistorical state that represents producing nothing as an alternative, at a world with a contingent item, is mental. *Proof:* FA — were it non-mental, its representing the empty alternative would require that no contingent item exist.
- **3.8** `T3_8`. At a world with a contingent item, any ahistorical state representing the empty alternative is mental and its bearer is a mind — in particular the root s* (which inherits s's content) and s itself. (`T3_8` requires ∃ x, F w x, as `mental_of_nonactual` does; without a contingent item the empty alternative is actual and FA is silent.) *Proof:* `mental_of_nonactual`.
- **3.9–3.10** `T3_10`. Any representing state that is ahistorical at w and in the ground is accurate throughout. *Proof:* in the ground gives necessary state; P9.
- `selecting_props`. A selecting representation s at w is ahistorical, in the ground, and accurate throughout. *Proof:* `selecting_anc`, `anc_first_ahistorical`, 1.5 generalized, 3.10.
- **3.11** `T3_11`. (a) There is a necessary concrete N* that is a mind and knows all of Ω. (b) There is a necessary concrete Ag that is an agent at w₀, a mind, and knows all of Ω. *Proof:* (a) N* is the bearer of the root s* from 3.7 applied to the s of 3.6: mind by 3.8; knowledge by content inheritance and 3.10. (b) Ag is the bearer of s itself: agent by definition; knowledge by 3.6 and `selecting_props`.
- **3.11′** `T3_11'`. There is a necessary concrete Ag that is an agent at w₀, a mind, and knows all of Ω. *Proof:* the s of 3.6 represents the empty alternative (P5), is ahistorical and accurate (`selecting_props`); `mental_of_nonactual`. No use of Src, D5, or 3.7. Unconditional since v8.2.
- **3.12 (v7)** `identify`. The N that is fundamental at every world is a mind, an agent at w₀, and knows all of Ω. *Proof:* both beings of 3.11 are necessary and concrete, hence by P4⁺ they are N. (`identify_of` is the same result over `Axioms0` with P4⁺ as an explicit hypothesis.)

- **Mind without value** `mind_of_CE_NBL`. From Core + CE + NBL + CH + TR: there is a necessary concrete being with a state that is a cause-in-virtue-of of a first contingent item, represents the alternatives, and is a channel of O's sensitivity to some property; and that being is a mind. *Proof:* CE with 2.4 and 2.15 gives a state channel; CH makes it causal; TR makes it represent producing nothing; it is ahistorical (`selecting_props'`); `mental_of_nonactual`. No value premise, no root regress, no `Src`.

**Result at Tier 3** (certified). `T3_4`, `T3_11`, `T3_11'`, `identify`; and `mind_of_CE_NBL` — the mind conclusion with GG, P7, P8 and every value notion removed. The originator, the mind, and the agent are one being. What the premises without P4⁺ would and would not settle about this is in §5.4. Not established at all: knowledge of anything downstream of O (v5's 3.12).

### 5.4 The originator, the mind, and the agent

**Status in v7:** with P4⁺ adopted, these are one being (`identify`). This section records what the premises *without* P4⁺ do and do not settle, which is why P4⁺ was the premise to add.

The argument delivers three roles: the unique fundamental being N (Tier 1–2), a mind N* (the bearer of the underived root representation, 3.11a), and an agent Ag (the bearer of the selecting representation, 3.11b). Here is everything the Lean file certifies about how they relate.

**Certified from the premises other than P4⁺ (`Axioms0`).**

- **Order of production** (`N_anc_of_nec_concrete`, from `Core`). Every necessary concrete being other than N has N as an ancestor at every world. *Proof:* such a being is necessary and concrete but not fundamental (P4), so it has a cause; its ancestry is well-founded (P1) and irreflexive (L0), so `exists_minimal` yields a minimal ancestor — no finiteness is used, and infinite branching is permitted; the minimal one is a thing (B2), uncaused, concrete, and necessary — a contingent one would have a cause by P2 — hence fundamental, hence N.
- **Consequently** (`originator_produces_mind_and_agent`, from `Axioms0`): the mind is N or is produced by N at every world; the agent is N or is produced by N at every world. Whatever else is true, there is one ultimate source and everything else in the ground descends from it necessarily.
- **Shared content.** The agent's selecting representation and the mind's root representation have the same content (Src, 3.7), and both are accurate (3.10). The two beings, if distinct, know the same things.

**Certified consistent with the premises other than P4⁺** (`W_Id.matrix`; one generic model family, one proof of all of `Axioms0` for every parameter value). N necessarily produces two further necessary beings L and M; r is an underived representation, s copies it and is the selecting representation; who bears r and who bears s are parameters. Since v8.2, FA makes the bearer of s a mind in every row.

| bearer of r | bearer of s (agent, always a mind) | Reading | Theorem |
|---|---|---|---|
| N | N | one being: originator = mind = agent | `all_one` |
| N | M | the originator is a mind; another mind acts | `originator_is_mind_not_agent` |
| L | N | the originator acts and is a mind; another mind exists | `originator_is_agent_and_mind_with_another_mind` |
| L | L | one mind knows and acts; it is not the originator | `mind_is_agent_not_originator` |
| L | M | the originator is neither a mind nor the agent; two minds, one of which acts | `originator_neither` |

In each row, every field of `Axioms0` holds (P4⁺ fails by design in all rows but the first), N is the only fundamental being, the agent is exactly the bearer of s, and the minds are exactly the bearers of r and s. So the premises without P4⁺ fix that the *selector is a mind* and that N produces whatever else exists, and leave open whether the originator is that mind.

**What would force each answer:**

- **One being.** P4⁺ — no necessary concrete being other than N (`identify`). **Adopted in v7.** Certified consistent with every other premise (`Toy.P4plus_holds`). Cost: excludes N necessarily producing further necessary concrete beings, which is exactly the structure the other four rows use. Note who pays that cost: a skeptic who has granted P4 has every parsimony reason to accept P4⁺; the only standing motive to deny it is a doctrine of necessary generation, which is a theistic commitment, not a skeptical one. That is why, on the most solid route, this is the premise to add.
- **Originator distinct from both.** A simplicity premise — N bears no states (`stateless_originator_is_neither`, over `Axioms0`; it is inconsistent with P4⁺, which already yields a state of N). Then N is neither the mind nor the agent, and both are its necessary products.
- **Mind = agent.** Now unconditional (`T3_11'`): the selector is a mind. What remains open without P4⁺ is only whether the originator is that mind (`agent_ne_originator`).

**In plain terms.** Without P4⁺, the argument does not say whether the being that grounds everything, the being that knows every possibility, and the being that chose this world are one or several; it says only that if several, the others are necessary products of the first and know the same things. With P4⁺ — the premise a skeptic can least motivate denying — they are one.

---

## 6. Tier 4: the agent's act in O accords with the balance of value-grounded reasons, including moral ones

- **4.2** `T4_2`. At every w, every motivational state on which O's outcome depends is a necessary state. *Proof:* 2.1.
- **4.1** `T4_1`. There is an agent Ag at w₀ satisfying the P7-antecedent at w₀. *Proof:* the s of 3.6, accurate by `selecting_props`, with 4.2.
- **4.3–4.6** `T4_6`. There is an agent Ag at w₀ satisfying the P7-antecedent, such that Ag acts on the best reasons at w₀, and the actual contingent reality is at least as well supported, on the balance of value-grounded reasons, as every alternative in Ω and as producing nothing. *Proof:* P7 gives acts-on-best or an essential disposition outweighs; P8 excludes the latter and turns the former into accordance. (That the balance includes moral reasons — MR — is not part of the theorem; see D15.)

- **A best reality exists** `exists_maximal`. Some member of Ω is maximal — the actual one. *Proof:* 4.6. This is a *commitment*: P7 and P8 are inconsistent with "for every reality there is a better."
- **Satisficing Tier 4** `T4_6s` (optional, from P8s). The agent acts on the best reasons and the actual reality is good enough.
- **Knowledge of the actual world** `knows_actual` (optional, from SK). The agent accurately represents the actual contingent reality as the one that obtains. *Proof:* SK gives the content; `selecting_props` gives accuracy.

**Result at Tier 4** (certified). `T4_6`. Stated precisely: the being whose selecting representation produced F acted, in that production, on the best reasons; the actual contingent reality is maximal on the balance of value-grounded reasons — no alternative in Ω, and not producing nothing, is better supported; and (4.2) every motivational state that bore on it is a necessary state of its bearer. Nothing is claimed about any other act, and nothing about which reasons are moral.

### 6.0 Summary theorem

`main`. From `Axioms`: a fundamental necessary concrete being exists at w₀; O is not deterministic; O is not propensity-governed at w₀; O's outcome at w₀ is favored; O is agential at w₀; and there is a being N — the unique fundamental being at every world — which brings about the contingent reality of every world that has a contingent item, is a mind, knows all of Ω, is the agent at w₀, satisfies the P7-antecedent, acts on the best reasons, and whose production accords with the balance of value-grounded reasons.

**`God`, defined (v8.7).** `God M N` is exactly the conjunction just listed about N: unique fundamental at every world; brings about every world's contingent reality; mind; knows all of Ω; agent at w₀; satisfies the P7-antecedent; acts on the best reasons; production accords with the balance. The definition adds nothing to `main` and only names it. Whether the name is apt is a decision about the word (§8.4 gives the attribute list; classical theists say this list *is* what "God" means); that the thing exists, given the premises, is the next theorem.

**`god_exists`.** From `Axioms`: there is an N with `God M N`, and every N′ with `God M N′` is N. *Proof:* `main`, plus the uniqueness clause `main` already carries. What the theorem does not do is discharge `Axioms`: every field has an independence witness (§6.2), so the antecedent is not a theorem of logic. The argument's claim over the skeptic is the price of refusing it (§8.3, III.9, D22), never that refusing it is contradictory.

### 6.1 Consistency witness

`Toy.Mk` is a family of finite models parametrized by `Toy.Params` = ⟨sens, rep, mental, accurate, hasProp, viaS⟩ (Favored and SelectedBecause are *defined* from `Sens` since v8, not parameters). Every member has two worlds, `true` (= w₀) and `false`; things N, c, d; one state s of N. N exists at both worlds; c and d only at `true`. N is in s at both worlds. Causes: N → s at both worlds; N → c, s → c, c → d at `true` only. N causes c in virtue of s when the parameter `viaS` is true (as in `Toy.A`; not in every member). O's outcome at `true` depends on N and on s. Nothing has a source. No region is open. No state is motivational; everyone acts on the best reasons; nothing is outweighed; the balance `AtLeast` and the threshold `Good` are set to hold universally (there is no `MoralBears`; MR was removed in v7.1, D15).

Certified for every member: N is necessary and fundamental at both worlds and is the only fundamental thing; s is a necessary state; c is the unique first contingent item, at `true` only (`F_char`); F at `false` is empty (`empty_world`); the model is not deterministic (`not_det`); each premise statement holds under the stated parameter conditions (`h_F1` … `h_TR`).

`Toy.A`: the member with sensitivity through s to every property, Rep, Mental, Accurate all true, HasProp false, and viaS true satisfies every field of `Axioms`. `Toy.premises_consistent` follows.

### 6.2 Independence witnesses

Each is a single theorem stating: all other premise statements hold; this one fails; this conclusion fails.

| Premise | Model | How it fails | Conclusion that fails |
|---|---|---|---|
| CE | `Toy.Bare` — no sensitivity through any channel, no chance, non-deterministic | which reality obtains is totally brute | 2.18: O favored |
| NBL | `Toy.Axiarch` — value-sensitivity through the law channel, no state channel | the ground's law is sensitive to maximality as such (axiarchism) | 3.4: O agential (P10 fails) |
| NBL | `Toy.DLaw` — law channel sensitive to a descriptive property | a bearer-free law selects for D; the production is not favored (bare) | 2.18 |
| GG | `Toy.DState` — a state channel sensitive to a descriptive property D, not maximality | the selector tracks D, not the good; P3 fails; **a necessary mind still exists** | 2.18 (but not the mind) |
| CH | `Toy.NoCH` — a state channel without the s → c causal edge | the state carries the sensitivity but is not a cause-in-virtue-of | 3.4 |
| TR | `Toy.NoTR` — a state channel with no content; since v8.6 mindless and representation-free (`mental := False`, `rep := fun _ => False`) | **the powers naturalist's complete package**: N has a necessary state through which the production is sensitive to a property and in virtue of which N produces, but the state represents no alternative and nothing is mental; every field but TR holds (FA vacuously) | 3.4, and the whole of Tier 3: no mind exists |
| *(deviance horn)* | `Toy.DLaw` — law channel sensitive to "non-empty," which coincides with maximality on every live alternative but differs at the empty reality | NI holds; the production is *not* favored; it is bare; **P3 fails** | shows "the law tracks the base" is the P3 exit, not a P10 exit |
| FA | `Toy.NoMind` — Mental false, content total | an ahistorical mindless state represents producing nothing and every alternative (the structural-representation skeptic's world) | 3.8: any mind exists |
| P9 | `Toy.NoAcc` — Accurate false | s is ahistorical, necessary, not accurate | 3.11: any being knows all of Ω |
| P5 | `Toy.Narrow` — Rep only ⟨alt true⟩ | s is selecting but does not represent ⟨nil⟩ | 3.6: a selecting rep represents all of Ω |
| P12 | `Toy.Chance` — Favored false, HasProp true | propensity-governed, no open regions | 2.15: not propensity-governed |
| P2 | `W_P2` — things N, c, c′, d | c is a first contingent item with no cause | 1.7: c has a fundamental ancestor |
| P4 | `W_P4` — N with s1 produces c1 at `true`; N2 with s2 produces c2 at `false` | two fundamental beings | 2.8: one being brings about every reality |
| P1 | `W_P1` — things N, c 0, c 1, c 2, … with c (n+1) → c n at `true` | an infinite descending chain: ancestry is not well-founded | 1.7: c 1 has a fundamental ancestor |
| L4 | `W_L4` — worlds ℕ → Bool; at each w a first contingent c w, open regions {F_v}, all propensities zero | P12 holds (Cantor), L2 holds, but F_{w₀} lies in a zero-propensity open region | 2.15: not propensity-governed |
| *(the bare naturalist's package)* | `W_Nat` — N produces c1 at `true`, c2 at `false`; no sensitivity, no representation, no mind | every field but CE holds | the whole of Tiers 2–4 |
| *(the theist's residue)* | `W_Pref` — all of `Axioms` holds; the balance strictly prefers the actual reality; `W_Pref.residue`: at `false` the same N, in the same necessary state s, with the same complete accurate representation, satisfies the P7-antecedent and produces the strictly worse reality | nothing fails: this is a consequence, not a denial | shows the argument's own package contains one bare contrast, not confined to ties (D20, D22, III.1) |
| *(the TR fork, Horn 2)* | `W_Nat.powers_witness` — on `W_Nat`, s is a powers channel (`PowersChannel`) directed at "a non-empty reality" on the natural `Powers` structure, with no `Sens` through any channel | CE fails; nothing else | shows a power directed at a determinate type, with the alternatives not figuring, is the bare naturalist (D23) |
| *(the TR fork, Horn 1)* | `NoTR.powers_horn1` — on `NoTR`, s is a powers channel directed at maximality; every field but TR holds; every possible reality is tied | TR fails | consistent only in a tied world, as `powers_all_tied` requires |
| *(inclination ≠ power)* | `W_Pref.no_powers_at_maximal`, `W_Nat.no_powers_at_maximal` — on a discriminating balance no `Powers` structure directs the channel state at maximality | nothing fails: these are consequences | the theist's selecting state is not a power; the powers naturalist cannot borrow the theist's balance |

Not covered, by design: P7, P8, MR (Tier 4's vocabulary is abstract, so their independence is trivial); P11 (its denial is non-Archimedean chance, priced at Exit 2B(i)); F1 and Src (framework).

There are therefore **two** single-premise naturalist packages: `W_Nat` (deny CE: nothing bore on which reality was produced) and `NoTR` (deny TR: something bore on it, through a state that represents no alternative). v8.5's claim that CE was the only premise separating the argument from its strongest opponent is withdrawn; §8.3 and III.9 say which opponent each package belongs to.

### 6.3 What the premises permit about identity

`W_Id.Mk`: two worlds. N is the unique fundamental being; N necessarily produces two further necessary beings L and M. L has a representing state r with no source; M has a state s whose source is r (s copies r's content). M produces the first contingent thing c in virtue of s; c produces d. r is mental; whether s is mental is a parameter.

`W_Id.originator_neither`: every field of `Axioms0` holds; the only fundamental being at any world is N; the only agent at any world is M; the minds are exactly L and M; N, L, M are pairwise distinct; P4⁺ fails (this is P4⁺'s independence witness).

`W_Id.agent_ne_originator`: every field of `Axioms0` holds; the only agent is M, which is a mind; but M ≠ N.

So: the premises other than P4⁺ are consistent with the originator being neither the mind that knows nor the mind that selects. Since v8.2 (FA) the selector is always a mind; what P4⁺ (§2.2) adds is that the selecting mind is the originator.

### 6.4 What the all-worlds forms of P7 and P8 would entail (not adopted)

`all_worlds_accord'` (over `Axioms0` plus P7all and P8all): **either O's outcomes are governed by objective propensities, or at every world with non-empty first-stage output, O's outcome accords with the balance of value-grounded reasons.** With accordance defined as maximality, this yields `all_tied`: **unless HasProp, every two possible contingent realities are tied — each is at least as well supported as the other on the balance of value-grounded reasons — and each is at least as well supported as producing nothing.**

*Proof of `all_worlds_accord'`:* if not HasProp, then at any world with non-empty output O is not bare (P3, derived), hence favored; P10 (derived) gives a selecting representation, P5 completeness, `selecting_props` accuracy, 4.2 no contingent motivation; P7all and P8all give accordance. Since HasProp is a single global fact, the disjunction is: HasProp, or every possible first production is value-accordant.

**Resolution (v7.3).** P7 and P8 are stated at w₀ only. `W_Pref` certifies that under the restricted premises the balance can strictly prefer the actual reality to the alternative, with every field of `Axioms` holding. What follows is the record of why the restriction was chosen.

This is what the premises would say if P7 and P8 were stated for all worlds. It is a strong claim: on the balance of value-grounded reasons, no possible contingent reality is better than any other. Three responses were available; the second was adopted.

(i) *Accept it.* A necessary agent with the same essential constitution in every world chooses, in every world, something no alternative beats; so all its possible choices are tied at the top. This is a version of the view that there is no unique best possible world and that the agent's options are all optimal. It is coherent, and some theists hold it. It does mean the balance of value-grounded reasons has no discriminating power among possible first stages, which sits uneasily with the idea that the selection was *because* of considerations favoring the outcome (the definition of "favored").

(ii) *Restrict P7 and P8 to the actual world.* **Adopted.** Then `all_worlds_accord` and `all_tied` do not follow, Tier 4 concludes only about w₀, and the price is giving up D7's uniformity for two premises — with a reason: P7 and P8 are principles about an agent's *actual* act, and stating them for merely possible acts is stronger than the internalism they encode. `W_Pref` shows the restricted premises are consistent with a discriminating balance.

(iii) *Accept HasProp.* Then the tie is escaped, at the cost of objective propensities alongside favoring — which 2.15 does not exclude (it refutes only *unfavored* propensity-governance at w₀), but which reintroduces chance into the first production.

Under (ii), Exit 4C bears only on the actual first stage, as in v5.

**What the restriction costs, priced (v8.6–8.7).** The v8.5 review (Attack 1, Attack 7) was right that (ii) is not bookkeeping. `W_Pref.residue` certifies that in the very model cited above, at the non-actual world the same N, in the same necessary state s, with the same complete and accurate representation of every alternative, sensitive to the same property, satisfies the P7-antecedent and produces the strictly worse reality. Nothing in the ground distinguishes the world where it acted on the best reasons from the world where it did not (`T2_2`: the ground is invariant). So the theist's package contains exactly one bare contrast — whether the inclination toward the best prevailed — and it is not confined to ties. This is the libertarian residue, and under (i) it does not disappear but relocates: with all-worlds P7/P8 the agent never produces the worse, and the bare contrast becomes which of the tied maximal realities obtains. Either way there is one (D20).

The restriction is therefore defended on two grounds, neither of which is "the all-worlds form has unwelcome consequences." First, P7 and P8 are principles about an agent's actual act; the all-worlds forms encode a necessitation the internalist premises do not contain, and `Sens` is inclination (D20). Second, the residue is *shared*: the ordinary libertarian gap that any naturalist who accepts free agency anywhere already pays at every free choice. What the theist leaves unexplained is one yes/no; the content of the outcome — which reality — is explained by maximality. What the bare naturalist leaves unexplained is the content itself (D22). That asymmetry, with its scope (it does not bite against a compatibilist), is the argument's claim over Exit 1, and III.1 states it in full.

---

# Part II — Informal assessment (not certified)

Everything below is reasoned judgment about the premises and the modeling decisions. Nothing here is checked by the Lean file, and nothing here bears on Part I's validity.

**Standard.** A denial is *ad hoc* when it requires a principle the denier accepts in every other case to fail exactly once, with no motivation other than the conclusion avoided. A denial is *motivated* when it rests on independent evidence or on a principle with standing of its own.

## 7. Skeptic exits, priced

### Tier 1

*Exit 1A — deny P1: infinite causal regress.* (Full treatment: §III.6.)
Since v8.4 P1 forbids only an infinite *descending* chain; infinite branching is allowed, so the objection from continuum physics no longer applies. Cost: the Grim Reaper and Benardete paradoxes (Koons 2014; Pruss 2018). An infinite chain of contingent items is still a contingent totality, so 1A also requires 1B for the chain as a whole.
Assessment: high cost; motivated only if a diagnosis of the paradoxes is supplied.

*Exit 1B — deny P2 at F: first contingent items exist uncaused.* (Full treatment: §III.6.)
Cost: an exception to the causal principle at the one place it cannot be checked.
Motivation available: the Humean principle that inductive generalizations should not be extrapolated beyond their confirmed domain.
Reply: the same restriction blocks every inference from observed regularity to unobserved cases.
Assessment: high cost, not unreasonable. Tier 1 commits one to nothing about minds and is accepted by the argument's most prominent naturalist critic (Oppy).

*Exit 1D — grounding, not causation (priority monism: Schaffer 2010).* The whole cosmos is fundamental and *grounds* its parts by a non-causal relation; nothing is *produced*. Where this contacts the argument: the cosmos is contingent, so P2 asks for its cause; the monist denies that a fundamental contingent whole needs one. That is Exit 1B under a different name — a brute contingent whole — with one extra cost: the monist must also deny that the cosmos's contingent parts have *causes* in the argument's sense (they are grounded instead), i.e. deny P2 for every contingent item, not just the first. Nothing in the argument turns on the word "cause" as against "produce"; B1, B2, P0 are stated for whatever the production relation is.
Assessment: not a new exit; the P2 exit with a larger bill.

*Exit 1C — deny B2 or F1.* B2 is what makes the minimal element in 1.6 a thing rather than an uncaused necessary state. F1 (causal relata exist at the world of the causing) is a framework assumption. Neither has a motivated denial on record.

### Tier 2

*Exit 2A — deny P4: several fundamental necessary beings, or a fundamental being caused in some world.* (Full treatment: §III.6.)
Cost: an account of how independent, uncaused beings with fixed natures coordinate to produce one consistent world.
What this exit gains: 2.8 fails. It gains nothing else at Tier 2: `T2_4` and `T2_15` are typed over `Core` and provably do not use P4. What is lost without P4 is the identification of the originator with a single being, not the anti-chance argument.
Assessment: moderate cost; a motivated holding position until the coordination account is given.

*Exit 2B — deny P11, P12, L4, or the propensity conception.* (Full treatment: §III.7.)
Cost: (i) Denying P11 is now precisely: propensity values are not Archimedean, or μ is not finitely additive and monotone. The first is infinitesimal (hyperreal) chance, which faces non-conglomerability and fails to deliver regularity in the cases that motivate it (Williamson 2007; Pruss 2014; Easwaran 2014). The second abandons the notion of a measure. (ii) Denying P12 now means denying CatOpen or CatU (`P12_of_cat`). Denying CatU: only countably many categories of first-stage output are possible — against the continuum of law-structures already present within one family of physical universes (Guth 2007). Denying CatOpen: some output of one category is a limit, in the similarity topology, of outputs of *other* categories — i.e. similarity does not respect categorial difference, which is contrary to what a similarity topology is for. (iii) Denying L4 requires that a propensity-governed production can yield outcomes in a zero-propensity open region. (iv) Denying that propensities are grounded in the setup abandons the propensity conception of chance. (v) Denying that O's propensities are defined over any topology makes P12 vacuous and L4 inapplicable.
Assessment: high cost for anyone who does not independently accept non-Archimedean chance.

*Exit 2B(iv) — Humean best-system chance (Lewis 1994).* Chances are not grounded in a setup's propensities but in the best systematization of the total pattern of events. Where this contacts the argument: a one-off first production is not a pattern; a best system has nothing to systematize at the foundation; so Humean chance is undefined there and HasProp is false — which is the theist's conclusion, not an exit. A Humean who wants the first production to be chancy must posit chances with no pattern to ground them, which is to abandon the Humean account for a propensity account, and then P11/P12/L4 apply.
Assessment: not an exit; a Humean about chance concedes 2.15.

*Exit 2C — deny CE: one totally brute selection at the foundation.* (Full treatment: Part III, §III.1.)
P3 is no longer a premise; it follows from CE, NBL, GG. The naturalist's cheapest exit is CE. `Toy.Bare.witness` certifies it: nothing about the outcome mattered — no property of the candidates figured in the production through any channel, no chance, no determination — and 2.18 fails.
Cost: CE is the *weakest* explicability principle that does any work: it does not say the outcome is necessitated (`no_modal_collapse` proves the premises leave it contingent), nor that it has a sufficient reason, only that *something about it mattered*. Denying it means a difference between two possible realities that made no difference to anything. Every known indeterministic process satisfies CE (propensities, at least, make a difference). Della Rocca's line-drawing argument (2010) applies with full force: the skeptic accepts CE-style explicability in every ordinary case and rejects it exactly once.
The two principled replies (Mackie 1982; Oppy 2006): (i) explicability principles are justified only a posteriori and intra-worldly, so extrapolating them to the unique foundational case is illegitimate; (ii) a singular unrepeatable event has no reference class (von Mises; Hájek 2007), so inductive support cannot reach it. Assessment: (ii) is answered by CE's form — it is not a probabilistic claim and needs no reference class; it asks whether any property of the outcome figured in its production, which is a question about causal structure, not frequency. (i) is the real residue: the skeptic must hold that the difference-making principle they use everywhere fails at the one case that would deliver a favored production. That is special pleading unless the foundation is shown to be a *different kind of case*, and "it is unique" is not a difference in kind — every event is unique under some description. This is the honest ceiling of the P3 defense: not proof, but the reduction of the exit to an admitted exception.
Motivation available: the principle that mentality and teleology are not fundamental — but note that CE itself mentions neither.
*Exit 2C′ — deny NBL: a bearer-free law selects.* (Full treatment: §III.2.) `Toy.DLaw` (a law selecting for a descriptive property) and `Toy.Axiarch` (a law selecting for value) certify the exit. Cost: a law of the ground that *selects among first realities* with no state of any thing carrying the sensitivity. Humeans cannot take it (laws are regularities, not causes); powers theorists cannot (production is by things in virtue of their states, which is the B-framework); only a nomic primitivist who lets a governing law act with no prior state to govern can. And the value-sensitive version is axiarchism (Exit 3A).
*Exit 2C″ — deny GG: the selector tracks a non-evaluative property.* (Full treatment: §III.4.) `Toy.DState` certifies it — and certifies what it costs the skeptic: `mind_of_CE_NBL` shows a necessary mind still exists whose state does the selecting. The skeptic has conceded Tiers 1–3 and disputes only whether the necessary mind selects under the guise of the good (Anscombe 1957; Raz 2010; Tenenbaum 2007; denied by Velleman 1992, Stocker 1979). This is a debate *within* the philosophy of agency about a mind already granted.

**Added by D1, now explicit as ID.** Under the token reading of "outcome," a production that fixes what kind of first stage occurs but not which tokens counts as non-deterministic and, being unfavored and not propensity-governed, as bare. So P3 also rules out purely haecceitistic variation at the foundation. The naturalist's second description of the same exit — "the only bare fact is which tokens exist, and that is no selection at all" — is the denial of ID (§2.3). With ID, `T2_4'` shows the first stage differs in *kind* across worlds, and the haecceitistic reading is closed. Without ID, the theist must either defend it or accept that P3 is doing that work. A type-level determinist denies ID and takes Exit 2C.
Reply: the theist's package is likewise an exception to "no fundamental minds" (§8). Each side carries exactly one exception to a principle that has none elsewhere.
Assessment: coherent and motivated; the live disagreement.

*Exit 2E — branching actualism (Schmid & Malpass 2023).* Every possible world shares an initial segment with the actual one and diverges only by the differential exercise of causal powers. Where this contacts the argument: the shared initial segment's items exist in every world, so they are *necessary*, not first contingent items; the first contingent items are the first branch-dependent ones, and their causes are the necessary initial state acting through its powers. That is exactly the argument's ground, with N the initial state — the branching actualist does not escape Tier 1–2, they *instantiate* it (Oppy's necessary initial state, §9). The branching itself is non-deterministic, so L-tax applies; the powers doing the branching are states of a thing (NBL holds); and the exit must then be CE (the branching is brute) or TR (a power's differential exercise carries no content about its alternatives). The last is the powers-theorist's denial of TR, which is where physical intentionality lives (Exit 3A(iii)).
Assessment: not a new exit; it relocates to CE or TR.

*Exit 2D — reject D2 (the empty outcome counts).* A critic who holds that O does not occur in a world with empty contingent reality rejects the definition of "deterministic" in §1.4, under which such a world is a second possible outcome. Without D2, 2.3 needs the additional premise that an empty contingent reality is impossible (v5's §9.11). D2 is the cheaper route and settles nothing about §9.11; `Toy.empty_world` shows the premises are consistent with an empty world.
Assessment: a dispute about a stipulation; low stakes either way.

### Tier 3

*Exit 3A — deny NI: value-directed selection with no subject.*
P10 is no longer a premise; it follows from NI, CH, TR. Of these, NI is the one with a live denier. `Toy.Axiarch.witness` certifies the exit: the ground's law is sensitive to maximality as such, the production is favored, and there is no selecting representation.

What denying NI costs. NI — evaluative facts do no causal work except through the states of beings that bear them — is a principle naturalists and non-naturalist realists share (Harman 1977; Mackie 1977; Parfit 2011; Enoch 2011; Scanlon 2014). Naturalists rely on it in the causal closure of the physical, in evolutionary debunking arguments (which work only because value is causally inert and so cannot have shaped our faculties), and in Mackie's queerness argument (whose whole point is that intrinsically efficacious value would be too strange to exist). To deny NI at the foundation and nowhere else is special pleading; to deny it generally is to give up those three things. The position that denies it — primitive, subjectless value-efficacy — is axiarchism (Leslie 1979; Rescher's optimalism; Steinhart). It is a small minority view, and its leading defender, pressed on *how* value becomes effective, ends by positing infinite divine minds (Leslie 2001) — that is, by conceding a bearer.

Three replies a skeptic might try, and why each fails as a P10 exit:
(i) *"The law tracks the descriptive base on which value supervenes; that is selection for value."* No: a law sensitive to a base property that coincides with maximality on the live alternatives but is not maximality is not favored selection at all — `Toy.DLaw` certifies it is *bare* selection. This reply is the P3 exit (Exit 2C) under another name, and it carries the deviant-causal-chain problem from action theory: producing the better outcome because of the base is producing it in accordance with value, not for it (Davidson 1973; Dancy 2000; Alvarez 2010).
(ii) *"The ground's value-sensitivity is a necessary state of N, not a law."* Then CH and TR apply: that state is a cause-in-virtue-of and carries the alternatives as content — a selecting representation. The dispute moves to P6 (is it mental?), which is where the argument locates it. This is not an exit from P10.
(iii) *"Directedness at an end doesn't need a subject — powers are directed at their manifestations (Molnar 2003; Bird 2007)."* A power is directed at a determinate manifestation-type fixed by its bearer's nature; it is neither value-sensitive nor directed at the best of uncountably many categories of alternative. Oderberg (2017), defending physical intentionality, concedes that selection among alternatives requires abstraction, which "has no correlate in the case of physical powers." Nagelian teleological laws (Nagel 2012) fare no better: the only rigorous account of a subjectless teleological law (Hawthorne & Nolan 2006) requires a privileged end state, a natural distance metric, and counterfactual robustness across repeated continuations — none available to a one-shot, historyless production — and its end states are, in the authors' words, "detached from notions of flourishing." Etiological teleology (Wright 1973; Millikan 1984) is constituted by selection history, which the foundation lacks.
Cosmopsychism (Goff 2019, 2023; Mulgan 2015) is not an exit here: it posits a cosmic mind that responds to value, i.e., a selecting representation; it disputes later premises (P4⁺, transcendence), not P10.
Assessment: coherent, developed, and expensive. The skeptic's remaining position is primitive evaluative causation with no subject; its cost is NI, and with NI the queerness argument, the debunking program, and causal closure.

*Exit 3B — deny P5.*
Cost: a necessary limiting condition on the deliberation, coexisting with N's power over the excluded members of Ω (2.8) — a power never directed.
Assessment: high cost.

*Exit 3C — deny FA: ahistorical mindless content of the non-actual.* (Full treatment: §III.3.)
P6 is no longer a premise. What the argument needs — that the selecting state and its root are mental — follows from FA by elimination. `Toy.NoMind.witness` certifies the exit: an ahistorical, mindless state that represents producing nothing and every alternative; all other premises hold; no mind exists.
What denying FA costs. The skeptic must hold that a state with no causal history and no mind can carry content about what is *not the case* — a merely possible reality, or the empty alternative. No naturalistic theory of content delivers this. Selection-history accounts (Wright 1973; Millikan 1984; Neander; Garson 2016) ground content in what the state was selected to do, and the foundation has no history. Covariation accounts (Dretske 1981) ground content in what the state carries information about, and information is factive — Dretske's "Misrepresentation" (1986) argues that representing what is not the case requires a function, which requires learning or selection. Structural accounts (Cummins 1996; Shea 2018) ground content in exploitable isomorphism to an *actual* target; there is no actual target for a merely possible reality to be isomorphic to, and Ramsey's job-description challenge (2007) makes exploitation require a consumer. So the structural-representation exit, which the earlier survey flagged as the sharpest, is exactly what FA rules out: a "structural representation" of a non-actual alternative is a resemblance to nothing.
The position that remains is Brentano's converse: intentionality directed at the non-existent is the mark of the mental, and a skeptic who wants mindless intentionality of the non-actual owes a theory nobody has. Physical intentionality (Molnar 2003) does not supply one: a power's directedness is at its own determinate manifestation, not at a range of alternatives (Oderberg 2017 concedes the abstraction "has no correlate in the case of physical powers").
Counter-cost: the theist has no worked-out theory of how a necessary mind's representation of the non-actual operates either; but the theist's promissory note is on the mechanism of a kind of thing everyone grants exists (minds represent the non-actual), the skeptic's is on a kind of thing nothing exemplifies.
Assessment: the argument's best-defended bridge. Denial is coherent (`NoMind`) but affirms exactly the content no naturalistic theory can ground.

*Exit 3D — reject D5 (single-source, whole-content derivation).* Since v8.2 this touches only 3.11a's identification of a *root* representation; the mind conclusion (`T3_11'`, `mind_of_CE_NBL`) uses neither D5 nor the regress. Rejecting D5 costs the skeptic nothing that matters.
Assessment: no longer an exit from the mind conclusion.

*Exit 3E — deny P4⁺: the mind, the agent, and the originator are distinct necessary beings.* (Full treatment: §III.8.) Certified available (`W_Id.matrix`, §5.4): without P4⁺ the other premises are consistent with every assignment of the roles to one, two, or three beings. What they fix is that any distinct mind or agent is a necessary product of N.
Cost: positing necessary concrete beings beyond the fundamental one, necessarily produced by it. This is more ontology, not less — a skeptic has no motive for it. The motive, where it exists, is a prior doctrine of necessary generation. Note that a view on which any such internal differentiation belongs to *one* concrete being does not take this exit: the argument's "concrete being" is a bearer of states that can cause, and such a view counts one.
Assessment: not a skeptic's exit. Available to a theist with a doctrine of necessary generation who counts the generated as distinct concrete beings.

*Exit 3F — deny P9: a necessarily misrepresenting state.*
Cost: a brute, necessary error with no channel, limit, or history to explain it. Leaves 3.8 intact; bites only at "knows" (3.11) and at Tier 4.
Assessment: low motivation, moderate cost; the cheapest way to block Tier 4 without denying Tier 3.

*Exit 3G — knowledge of actuality.* Without SK, nothing in Part I says the mind knows what O produced. With SK (§2.3) — an agent's selecting representation represents the selected reality as the one that obtains — `knows_actual` gives accurate representation of the actual contingent reality, which is the actual world's entire contingent content. SK is mild: it says a selector knows what it selected. Its denial is an agent that selects a reality without representing it as selected, which is hard to distinguish from not selecting.
Assessment: closed under SK; SK is cheap.

*Exit 3H — the Cantorian objection to P5 (Grim 1988; Plantinga & Grim 1993).* There is no set of all truths, so "represents every possible contingent reality" is incoherent if it presupposes a completed totality. Where this contacts the argument: nowhere. Ω is a *predicate* on realities, not a set; P5 quantifies ("for every r such that InOmega r"), and the Lean formalization does exactly that with no set of all realities and no set of all truths. Plantinga's reply — omniscience needs quantification, not a set — is what the formal statement already implements.
Assessment: not an exit.

### Tier 4

*Exit 4A — deny P7: Humean theory of reasons.*
In O every motivational state in play is a necessary state (4.2), so the Humean's claim reduces to: the agent's essential motivational constitution may diverge from its accurate judgment of the best reasons. That is Exit 4B(ii). 4A collapses into 4B.

*Interpretive premise MR.* Part I's Tier 4 result is accordance with the balance of value-grounded reasons. To read that as *moral* goodness one adds MR: some value-grounded reasons bearing on the choice among members of Ω are moral. MR is not formalized (D15); nothing in the certificate depends on it, and a reader who denies it keeps every theorem and loses only the word "moral."

*Exit 4B — an amoral omniscient agent (Hume, Dialogues).* (Full treatment: §III.4.)
(i) Deny MR. (ii) Deny P8: the agent's essential motivational constitution is not value-responsive, or value-grounded reasons do not settle the balance against essential dispositions of other kinds. Note that v6's P8 is stronger than v5's ("settles" rather than "is not outweighed by"); v5's version did not deliver 4.5 in ties, and a critic who accepts only the weaker form has a further exit.
Assessment: (i) motivated for an anti-realist; (ii) motivated for anyone who holds that value-responsiveness is a contingent constitution of some agents rather than a feature of agency as such.

*Exit 4C — the evidence of evil.*
The one exit with positive support. Draper: the observed distribution of pain and pleasure is more probable on an indifferent ground than on 4.6. Nothing in Part I answers this. With P7/P8 scoped to the actual act (v7.3), the claim evil must defeat is exactly 4.6: the actual contingent reality is unbeaten on the balance of value-grounded reasons. (Had the all-worlds forms been adopted, the claim would have been that every possible reality is so, §6.4.)
Assessment: reasonable.

*Exit 4D — deny P9 (= 3F).* Removes "accurate" from the P7-antecedent; P7 and P8 do not fire.

*Exit 4E — no best world (Rowe 2004; Kraay 2010).* (Full treatment: §III.4.) If for every possible reality there is a better one, nothing is maximal on the balance of value-grounded reasons. `exists_maximal` certifies that the premises *entail* a maximal reality — the actual one — so the no-best-world thesis is inconsistent with P7 + P8, not a background assumption one can add. A reader who holds it must replace P8 by P8s (satisficing: acting on the best reasons makes the outcome good enough), under which `T4_6s` concludes the actual reality is good rather than unbeaten (Tucker 2016 on satisficing; Kraay's multiverse response is a different route). What is lost: the claim that the actual first stage is *unbeaten*; what is kept: that the agent acted on the best reasons and produced something good.
Assessment: a genuine pressure on P8, now priced; the satisficing route is certified consistent (the consistency model satisfies P8s).

## 8. The ledger, both sides priced

### 8.1 Skeptic's cheapest exit per tier

| Tier | Cheapest exit | Cost | Motivated? | Certified as sufficient? |
|---|---|---|---|---|
| 1 | 1B: deny P2 at F | Brute existence from nothing | Yes | Yes (`W_P2`) |
| 2 | 2C: deny CE | A difference that made no difference, once; special pleading against the difference-making principle used everywhere | Yes (Mackie/Oppy a-posteriori) | Yes (`Toy.Bare`) |
| 2 | 2C′: deny NBL | Bearer-free selecting law (nomic primitivism at the foundation) | Weak | Yes (`Toy.DLaw`, `Toy.Axiarch`) |
| 2 | 2C″: deny GG | Keeps the necessary mind; disputes only the guise of the good | Yes | Yes (`Toy.DState`) |
| 3 | 3A: deny NI | Primitive subjectless value-efficacy (axiarchism); loses queerness, debunking, closure | Weak — small-minority view | Yes (`Toy.Axiarch`) |
| 3 | 3D: reject D5 *and* P6′ | Multi-source derivation, and non-mental ahistorical representation | Partly | — |
| 3→4 | 3F: deny P9 | Brute necessary error | No | Yes (`Toy.NoAcc`) |
| 4 | 4C: evil | None; positive support | Yes | — |

### 8.2 The theist's commitments

| Commitment | Principle it excepts | Motivated? |
|---|---|---|
| A necessary, disembodied, ahistorical mind | Every known mind is embodied, complex, historical | Yes: entailed by P1–P6, P10 |
| Underived intentionality (P6) | Every known representation is derived or historical | Same |
| Single-source derivation (D5), or P6′ | — | Either suffices; neither argued |
| Accuracy of necessary ahistorical intentionality (P9) | Accuracy is checkable against a source | Weak: absence of an error mechanism |
| Token outcomes (D1) / ID | — | Unargued; without ID, adds weight to CE |
| Goodness against evil | — | Requires a theodicy not given here |

### 8.3 The three complete packages — certified (v8.6–8.7)

`Toy.A` is the theist's package: every premise holds. Two naturalist packages are certified, each denying exactly one premise and granting everything else.

**Exit 1 — `Toy.W_Nat`, the bare naturalist (¬CE).** A necessary concrete initial state N; two possible contingent realities, produced non-deterministically; no objective propensities; no state of anything sensitive to any property of the candidates; no representation; no mind. `W_Nat.witness` certifies that this world satisfies **every field of `Axioms` except CE** — including P4⁺, NBL (there is no selection), GG, CH, TR, FA (all vacuous: nothing represents), and P7 and P8 (vacuous: nothing is an agent). Oppy's position.

**Exit 2 — `Toy.NoTR`, the powers naturalist (¬TR).** The same N with a necessary state s through which the production is sensitive to a property and in virtue of which N produces — a disposition directed at a determinate type — but s represents no alternative and nothing is mental. `NoTR.witness` certifies **every field except TR** (FA vacuously). This is the position of a naturalist with a dispositional metaphysics of the initial state (Molnar, Place, Oderberg): something about the outcome mattered, through a state that is about nothing.

v8.5 said the disagreement was one sentence, CE. That is withdrawn: it is one of two sentences, and which one depends on the opponent. For Oppy's bare naturalist it is CE; for the powers naturalist it is TR, and for anyone with a dispositional metaphysics ¬TR is the cheaper of the two because it keeps CE.

**What each package leaves unexplained — the honest score.**

*Theist* (`Toy.A`, `W_Pref`). A necessary being; a favored first production; a necessary mind knowing all of Ω; an agent whose production accords with the balance and whose motivation in it was wholly essential; one being (P4⁺). One exception to "no fundamental minds." What is left unexplained: `W_Pref.residue` certifies that the same agent, in the same necessary state, with the same complete accurate representation, produces the strictly worse reality at another world, and nothing in the ground distinguishes the two. So: **one binary fact** — whether the inclination toward the best prevailed. The *content* of the outcome, which reality, is explained by maximality. v5 scored this at zero brute facts; v8.5 scored it "favored but underdetermined"; the certified score is one libertarian residue, not confined to ties (§6.4). Owes: a theory of ahistorical intentionality (TR, FA); the P4 coordination argument; a response to evil.

*Bare naturalist* (`W_Nat`). A necessary concrete initial state; one bare first production; no mind. What is left unexplained: **the whole content of the first stage.** On the most conservative numbers in the literature (D21) that content is five independent sharply-bounded constraints — Λ inside a ~2-order-of-magnitude window against a ~120-order natural range; Q inside a ~2-order window; light-quark masses inside the nuclear-stability island; near-zero initial gravitational entropy against a ~10¹²² maximum; 3+1 dimensions — obtaining with nothing bearing on any of them. Owes, in addition: an exemption from contrastive explanation at exactly one point, the foundation, while demanding it everywhere above; and either rejection of the measure cosmology uses for initial conditions or acceptance of Boltzmann brains under it (Carroll 2017). The Past-Hypothesis reply ("physics treats boundary conditions as brute") is blunted: in `W_Nat` the initial condition N is identical across worlds, so the bruteness is not in a boundary condition but in the transition from an identical state (III.1).

*Powers naturalist* (`NoTR`). Everything the bare naturalist grants, plus CE. What is left unexplained: how a state can be sensitive to a property of candidate realities without the candidates figuring — the fork in D23 (III.5). If they figure, the state ranges over them and TR follows; if they do not, `Sens` is false and this is `W_Nat`.

**Where the dispute sits.** Each side makes one exception. The theist's introduces a kind of thing found nowhere else and leaves one yes/no fact unexplained — a gap of the kind every libertarian already pays at every free choice. The bare naturalist's leaves the content of the first stage unexplained — a gap of a kind accepted nowhere else. The asymmetry is in *what* is left unexplained and in *the kind* of gap; it bites against any naturalist who accepts libertarian agency anywhere, and against a compatibilist the comparison is content alone. The dispute is between explanatory completeness and ontological continuity with the known, and the numbers now say how much completeness is at stake.

### 8.4 Attribute checklist: what is established about the necessary being

"God" is not a term of the argument. This table lists every attribute the certificate establishes of the one necessary being N (under P4⁺), the premises each rests on, and what is not established, so the question "does this warrant the name?" is answered against a list.

| Attribute | Established? | Rests on | Not established |
|---|---|---|---|
| Necessary, concrete, uncaused, unique | Yes (`main`) | E, P1, P2, P4, P4⁺ | — |
| Originates every possible contingent reality | Yes: ancestor of every contingent item in every world (`T2_8`) | + L0, B2 | "omnipotence" in any stronger sense (e.g. power over the necessary, or over what it does not produce) |
| A mind | Yes (`mind_of_CE_NBL`, `identify`) | + CE, NBL, CH, TR, FA | consciousness, phenomenology, personhood — none asserted |
| Knows every possible contingent reality and every consideration bearing on each | Yes (`T3_11`) | + GG, P5, P9 | knowledge of necessary truths, of other minds, of anything not a contingent reality |
| Knows the actual contingent world | Yes with SK (`knows_actual`) | + SK | knowledge of the necessary, or of its own nature |
| Selected the actual world (agent) | Yes (`T3_4`, `identify`) | + P4⁺ | — |
| Its selection accorded with the balance of value-grounded reasons; the actual reality is maximal | Yes (`T4_6`, `exists_maximal`) | + P7, P8 | that any reason is *moral* (MR, interpretive); goodness in any act beyond O |
| … or, satisficing: the actual reality is good enough | Yes with P8s (`T4_6s`) | + P7, P8s | — |
| Its motivation in that act was wholly essential | Yes (`T4_2`) | + P0 | — |
| Personhood, will, love, consciousness, aseity in the theological sense, simplicity | **No** | — | none asserted, none denied |

Reading the table honestly: the argument establishes a unique necessary mind that originates and knows every possible contingent reality, selected this one, and did so in accordance with the balance of value-grounded reasons. Whether that is God depends on which attributes one takes to be definitional; the table says which are on offer and at what price.

## 9. Certainty ladder

| Conclusion | Certified from | Confidence in premises | Denial requires |
|---|---|---|---|
| Necessary concrete ground (1.7) | Core | High | P1 or P2 (or B2, F1) |
| Non-deterministic first production (2.4) | Core (E, P1, L0, F1 only) | High, given Tier 1 | D2 or D3 (definition of "deterministic") |
| Not type-deterministic (2.4′) | Core + ID | Conditional | ID |
| Power over all Ω (2.8) | Core | Conditional on P4 | P4 |
| Not propensity-governed (2.15) | Core | Substantial | P11/P12/L4 |
| Not propensity-governed (2.15), via categories | Core − P12 + CatOpen + CatU | Substantial | CatOpen or CatU, or P11/L4 |
| Favored (2.18) | Axioms | Substantial | CE, NBL, or GG (each certified sufficient) |
| A necessary mind that selects (`mind_of_CE_NBL`) | Core + CE + NBL + CH + TR | Substantial; **no value premise** | CE, NBL, CH, TR, FA, or Tier 1 |
| Agential (3.4) | Axioms | Substantial | NBL (denial is a bearer-free selecting law; the value-sensitive version is axiarchism), or CH/TR |
| A mind representing all Ω (3.11a / 3.11′) | Axioms | Substantial | FA, or P5 |
| That mind knows all Ω (3.11a) — i.e. accurately represents each member of Ω as an alternative, and each consideration bearing on it | Axioms | Substantial | P9 |
| Mind = agent = N (`identify`) | Axioms | Substantial | P4⁺ — certified independent (`W_Id`); no skeptical motive to deny |
| Knowledge of the actual world | — | Not established | — |
| Actual reality maximal on the balance of value-grounded reasons (4.6) | Axioms | Best explanation against counter-evidence | P7, P8, P9, or evil |
| All possible realities tied on the balance, unless HasProp (§6.4) | Axioms0 + P7all + P8all | Not adopted | — |

## 10. Open problems, ranked by leverage

0. **TR — one sentence left** (D23; III.5). Certified in v8.8–8.9: `powers_fork`, `powers_all_tied`, `W_Nat.powers_witness`, `NoTR.powers_horn1`, `W_Pref.no_powers_at_maximal`, and the fallible reading's two witnesses `W_Nat.fallible_witness` / `W_Pref.fallible_witness` (same structure, both sides). The fallible reading is closed on Mumford–Anjum (no interference at the foundation), Vetter (degree is a propensity; no degree is bare), and Bird (no stimulus). What remains is a single assertion the powers naturalist must make as a primitive: that a state whose contribution favors the best among alternatives it has not produced is about none of them. The reply is Oderberg's criterion; it is philosophical and stays so. A referee who supplies a developed non-mental account of that state reopens the exit. Nothing further to formalize here.
1. **CatOpen and CatU** (P12 is now a theorem from them). CatOpen is now supported empirically: the life-permitting region of parameter space has sharp boundaries in kind (D21; `cosmic_strand_v2.md`). CatU is *not*: the constants of our laws yield about five independent sharply-bounded constraints, finitely many kinds. CatU must be argued over the space of possible law-structures (field content, forces, dimension, topology), a modal claim; and the empirical case against a propensity at the origin is non-normalizability (Schiffrin & Wald 2012), which is not in the Lean and does not need CatU. III.7 states both.
2. **L4.** A defense of the support principle independent of a powers theory of modality.
3. **FA** (P6 is derived from it for the states that matter). The Part II defense reduces the structural-representation exit to "resemblance to nothing"; what remains is to address any future naturalistic theory of content for the non-actual, should one appear.
4. **P4⁺.** Adopted in v7. Its only serious challenger is a theology of necessary generation that counts the generated as distinct concrete beings; a defense of P4⁺ should address that directly rather than assume parsimony settles it.
5. **ID.** Defend identity of indiscernibles at the foundation, or accept that the certified result is token-level non-determinism and that CE carries the haecceitistic case.
6. **P4.** Derive uniqueness and cross-world identity from coordination constraints on plural necessary beings. The coordination argument (III.6) is a sentence; island universes (Bigelow & Pargetter 1990; Bricker) cost the skeptic nothing formally (`W_P4`); Pruss & Rasmussen (2018) explicitly bracket uniqueness, and Mghirbi (*IJPR* 2026) proves it only from a strong PSR plus an ultimate-grounding conception. Build the argument from Gellman (2000), Rasmussen's pure-actuality route (2019), Leftow's nature-vs-position necessity asymmetry (2012), and Swinburne's simplicity (1988), and price the PSR it needs. After the TR fork, this is the weakest-defended premise.
7. **NI** (P10 is now derived from it). The Part II defense is in place; what remains is to answer the one flank the literature leaves open — a *sui generis* value-explanation that is neither causal nor grounding and has no subject. No such account exists (reasons-explanation is agent-indexed), so the burden is the skeptic's; but D17 should say so explicitly.
8. *(closed: see 3)*
9. **P9.** A positive account of accuracy for necessary, ahistorical representation.
10. **CE** (P3 is derived from it). No argument can show a totally brute foundational selection incoherent — `W_Nat.witness` is the proof that there is none — so the work is entirely on the price (D22). Remaining: Norton's dome and unmeasured indeterminism (either expand CE's disjunction or argue it collapses into bare, III.1); the haecceitistic exit (III.1); an explicit answer to the Past-Hypothesis-as-law dress in both its Humean and anti-Humean forms (III.1).
11. **P8.** An account of why value-grounded reasons settle the balance for a necessary agent. (§6.4's trilemma is resolved: P7/P8 are scoped to the actual act.)
12. **Downstream.** Goodness in any act beyond O. (Knowledge of the actual contingent world is closed under SK, `knows_actual`.)
13. **Ω.** Whether an empty contingent reality is possible. Part I is consistent with either answer (`Toy.empty_world`); nothing in it settles the question.
14. **Theodicy** adequate to Draper's evidential argument.
15. **Closed.** No external library is needed. `ArchOrd` is instantiated by ℚ in core Lean (`archRat`), so the value-structure axioms are certified to be those of an ordinary dense ordered field; that ℝ satisfies the same eight axioms is verified by inspection. The trusted base is core Lean only.
16. **Faithfulness review.** An independent reading of Part I against the Lean file by someone who did not write both.

## 11. Soundness status

A valid argument is sound iff its premises are true. Part I is valid. This document does not establish soundness, and no document of this form could. What can be done is to say, for each premise and decision, where its truth stands.

| Premise / decision | Status | What settling it would take |
|---|---|---|
| E, L0, B1, B1′, definitions | Secure | Nothing |
| L2 | Proved from P11 | — |
| F1 | Framework; denied only by someone who allows causation across non-overlapping existence | A theory of cross-world causation |
| B2 | Mild; states depend on bearers | Rejected only by someone who denies that bearers ground their states |
| P0 | Mildly contested; difference-making without causation is a recognized position | A theory of causation |
| P1 | Contested; well-foundedness only (v8.4); independently argued (Grim Reaper); rejected by infinitists | A settled diagnosis of the paradoxes |
| P2 | Contested at the one uncheckable case | Resolution of the anti-extrapolation dispute |
| CE | Contested; the weakest explicability principle that does work; certified independent; certified not to collapse modality; certified to be the difference between the argument and Oppy's bare naturalism (`W_Nat`); its denial priced at three items (D22) | The a-posteriori objection (Mackie/Oppy); Norton's dome; the haecceitistic exit |
| NBL | Framework-adjacent; contested only by nomic primitivism about foundational selection; certified independent (`DLaw`, `Axiarch`) | — |
| GG | Contested (guise of the good); certified independent (`DState`); denial keeps the mind | The Velleman/Stocker debate |
| P3 | Derived from CE + NBL + GG | — |
| P4 | Contested; explicitly modal; the coordination argument is undeveloped; island universes cost nothing formally (`W_P4`); the flagship literature (Pruss & Rasmussen 2018) brackets uniqueness | The coordination argument (open problem 6) |
| P5 | Plausible given 2.8–2.9; low independent support | An account of unconstrained deliberation |
| FA | Contested only by a theory of mindless content of the non-actual, which no one has; certified independent (`NoMind`). Its factivity cuts both ways: the exhaustion of content theories that supports FA equally blocks TR unless the fork in D23 holds | A naturalistic theory of content for merely possible realities |
| P6 | Derived from FA for the selecting state and its root | — |
| P7 | Contested; internalism vs. Humeanism | The metaethics of reasons |
| P8 | Contested; strengthened in v6; commits to a maximal reality (`exists_maximal`); P8s is the satisficing alternative | An account of dominance, or a defense of satisficing |
| SK (optional) | Mild: a selector represents what it selected as selected | — |
| P9 | Contested; defended by absence of an error mechanism only | A positive account of accuracy |
| NI | Derived from NBL | — |
| CH | Framework (B-framework applied to channels); certified independent | — |
| TR | **The logical load of the argument.** Certified independent by a mindless `NoTR` (v8.6). The fork is certified (v8.8, `powers_fork`): on the powers theorist's own primitive and axiom, denying TR is either the bare naturalist (`W_Nat.powers_witness`) or a world in which every reality is tied (`powers_all_tied`); the theist's state is not a power (`W_Pref.no_powers_at_maximal`). The fallible reading is closed on the powers accounts (v8.9; `W_Nat.fallible_witness` = `W_Pref.fallible_witness` in structure, differing only in `Sens`). One sentence left: "the alternatives figure and the state is about none of them" | Oderberg's abstraction criterion, applied (open problem 0) |
| P10 | Derived from NI + CH + TR | — |
| P11 | Contested; stated as Archimedean values + finitely additive monotone measure; the standard view, with a live minority for hyperreals | Resolution of the regularity debate |
| P12 | Now a theorem from CatOpen + CatU | — |
| CatOpen (optional) | Supported empirically: sharp boundaries in kind in parameter space (D21) | An account of the similarity topology |
| CatU (optional) | Contested; "uncountably many categories realized"; not grounded by the constants of our laws (D21); a modal claim over law-structures | Physics and metaphysics of law-structure space |
| L4 | Contested; depends on a powers theory of chance | Independent support |
| MR (interpretive, not formalized) | Contested; roughly 60/40 among professional philosophers (Bourget & Chalmers 2023) | Metaethics |
| Src / D5 | Stipulation; unargued; avoidable via P6′ | An account of derivation among necessary states |
| ID (optional) | Contested; the explicit form of D1 | An account of token identity at the foundation |
| P4⁺ | Adopted; excludes necessarily-produced necessary concrete beings; no skeptical motive to deny | An answer to necessary-generation theologies |
| D2, D3, D4, D7–D12 | Stipulations that resolve ambiguity without adding commitments beyond those listed | Nothing |

**The honest summary.** Part I is machine-checked valid from a consistent premise set, and every contested premise is certified to be doing real work. It is not shown sound. Its contribution is to have reduced the soundness question to the truth of the rows above and the acceptability of twelve named stipulations, each a recognized open problem or an explicit choice, and to have located the live disagreement at two premises, CE and TR — the two certified single-premise naturalist packages — whose denial is priced in D22, and to have named its conclusion (`God`) and certified that it follows (`god_exists`). What remains is the price of the antecedent, never its necessity.

## 12. Principal sources

- Pruss, A. & Rasmussen, J. (2018). *Necessary Existence.* Oxford.
- Pruss, A. (2018). *Infinity, Causation, and Paradox.* Oxford.
- Pruss, A. (2014). "Infinitesimals are too small for countably infinite fair lotteries." *Synthese* 191.
- Koons, R. (2014). "A New Kalam Argument: Revenge of the Grim Reaper." *Noûs* 48.
- Rasmussen, J. (2009). "From a Necessary Being to God." *IJPR* 66.
- Leftow, B. (2012). *God and Necessity.* Oxford.
- Nagel, T. (2012). *Mind and Cosmos.* Oxford.
- Schmid, J. & Malpass, A. (2023). "Branching Actualism and Cosmological Arguments." *Philosophical Studies* 180.
- Schmid, J. (2024). "The End Is Near: Grim Reapers and Endless Futures." *Mind* 133.
- Oppy, G. (2019). Review of *Necessary Existence.* *Journal of Analytic Theology* 7.
- Williamson, T. (2007). "How probable is an infinite sequence of heads?" *Analysis* 67.
- Easwaran, K. (2014). "Regularity and Hyperreal Credences." *Philosophical Review* 123.
- Guth, A. (2007). "Eternal inflation and its implications." *Journal of Physics A* 40.
- Draper, P. (2023). *Atheism and the Problem of Evil.* Oxford.
- Hume, D. (1779). *Dialogues Concerning Natural Religion.*
- Bourget, D. & Chalmers, D. (2023). "Philosophers on Philosophy: The 2020 PhilPapers Survey." *Philosophers' Imprint* 23.

---

# Part III — Soundness dossier (not certified)

Part I settles validity. This part takes each premise a skeptic can still deny and gives it the treatment the published literature would demand: the statement, the case for it, the strongest published objections at full strength, the replies, and an explicit account of where the defense stops. Nothing here is checked by the Lean file; everything here is what the Lean file leaves to judgment. Each section ends with a paragraph headed **Ceiling**, stating the point beyond which the premise cannot be defended by argument and must simply be accepted or rejected.

## III.1 — CE: weak contrastive explicability

### Statement

At every world with non-empty first-stage output, the first production is deterministic, or is governed by objective propensities, or is sensitive through some channel to some property of the candidate realities.

In Lean:

```
∀ w, (∃ x, M.F w x) → M.Deterministic ∨ M.HasProp ∨ ∃ (P : M.Reality → Prop) (ch : Chan M.State), M.Sens w P ch
```

What it says in plain terms: *which* reality came out of the first production is not a fact about which nothing whatever can be said. Either the ground fixed it, or chance governed it, or something about the candidates figured in the producing. What it does not say: that the outcome was necessitated (`no_modal_collapse` proves the premises leave it contingent); that it has a sufficient reason; that every contrast between it and every alternative is explained. It asks for the least that explanation ever asks: that *some* property of the outcome made *some* difference.

### What CE is, and is not, in the space of explanatory principles

CE is deliberately placed at the bottom of the ladder of rationalist principles, and it is worth being exact about the rungs above it, because most of the literature's objections target the higher rungs.

- The **unrestricted Principle of Sufficient Reason** — every contingent fact has a sufficient reason — is what van Inwagen (1983, pp. 202–204) and Bennett (1984) showed leads to necessitarianism: if the conjunction of all contingent facts has a sufficient reason, and no necessary truth entails a contingent one, then there are no contingent truths. Della Rocca (2010; 2021) accepts the consequence and defends the principle; almost no one else does. CE is not this. It does not ask for a sufficient reason for anything.
- The **restricted PSRs** — Pruss's (2006) "every contingent fact has an explanation," with explanation allowed to incline without necessitating; Koons and Pruss's principle limited to "basic natural" facts; Dasgupta's (2016) "every substantive fact has a complete metaphysical explanation," with autonomous (essentialist) facts exempt; Rasmussen's "weak PSR" (possibly explained) — these avoid collapse by weakening either the modal force of "explanation" or its scope. CE is weaker than all of them. It does not ask for an explanation of the outcome; it asks whether *any property of the outcome figured in its production*, and it counts chance as an affirmative answer.
- **Difference-making** — Woodward's (2003) interventionist analysis of causation, on which to cause is to make a difference — is the naturalist's own working account of what it is for one thing to bear on another. CE is a difference-making claim at the foundation: some property of the candidates was a difference-maker for which was produced, or chance or determination stood in for one.

The point of placing CE this low is that Della Rocca's line-drawing argument (2010) then applies with maximum force. His "explicability arguments" — Leibniz's balanced scale, the physicalist's rejection of brute consciousness, Parfit on fission — are all cases where a state of affairs is rejected *because its obtaining would be a fact about which nothing could be said*. Della Rocca's claim is that anyone who accepts some of these owes a principled reason to reject others, and that no such reason has been given. The higher rungs give the skeptic something to point to: a sufficient reason is a strong demand, and a principled reason to refuse it at the foundation (modal collapse) is available. CE gives the skeptic nothing of the sort. To deny CE is to affirm a difference between two possible realities — the one produced and one not produced — to which *nothing* was sensitive, which no chance governed, and which nothing determined: a difference that made no difference. Della Rocca's question is then exactly the one the skeptic has to answer: what is the principled reason for accepting difference-making everywhere and denying it here?

### The case for CE

Three lines, from weakest to strongest.

**(a) Where science puts "bare," and where it does not.** Inside dynamics, every known indeterministic process is propensity-governed, every known selection is sensitive to something, and every known determination is determination; the category "bare" has no instance there. Science *does* have a place it leaves unexplained: initial and boundary conditions — the Past Hypothesis is the paradigm (Albert 2000; Callender 2004). The v8.5 review was right that v8.5's "no instance and no model" ignored this. The case for CE is therefore not that bareness is unheard of, but that the bare naturalist's bareness is not of the boundary-condition kind: in `W_Nat` the initial condition N is *identical* across worlds (`T2_2`), and what differs is the transition from that identical state. Physics exempts boundary data; it never exempts the transition from a fixed state, and the bare naturalist's silence is about the transition. (Reply to Objection 7.)

**(b) Naturalists rely on CE everywhere they infer.** Inference to the best explanation presupposes that contrasts have difference-makers — that "why this rather than that?" has an answer of *some* kind, if only "chance." The interventionist account of causation, evolutionary explanation, statistical inference, and the entire practice of treating an unexplained variation as *not yet* explained rather than *inexplicable* all presuppose that CE holds of the cases they handle. A naturalist who denies CE at the foundation is not denying an alien theistic principle; they are exempting one case from the principle their own method rests on.

**(c) The alternative is not chance; it is nothing.** This is the decisive point and the reason CE is stated as a three-way disjunction. The skeptic's natural picture of a brute foundational selection is a *chancy* one: the initial state "could have gone any of several ways" and "just went this way." But that picture is propensity-governed, and it is the second disjunct of CE — CE grants it, and the argument's *separate* premises P11, P12, L4 (§III.7) are what then rule it out. To deny CE the skeptic must hold something stronger and stranger: that the first production was not chancy either — that there was no propensity, however unequal, for one outcome over another — and still not determined, and still sensitive to nothing. That is not the naturalist's usual picture of a brute initial condition. It is a picture on which the first production has a modal profile — `W_Nat.witness` proves two worlds with different realities, so "could have been otherwise" is well-defined — but *no propensity measure*: an indeterministic power with no well-defined propensity assignment. v8.5 said "no modal profile"; that was wrong, and the review corrected it. Unmeasured indeterminism is a real position (Norton's dome: Norton 2008), and it is the position CE's denial actually is. `Toy.Bare` and `W_Nat` certify that it is consistent; III.7 says what it costs (a physically pathological non-Lipschitz dynamics, on the dome's critics: Malament 2008; Wilson 2009), and Objection 8 below states it at full strength.

### The objections, at full strength

**Objection 1 — Explicability principles are justified only a posteriori and intra-worldly (Mackie 1982, ch. 5; Oppy 2006; Oppy 2010).** Whatever confidence we have in difference-making comes from its track record within the world. "We are extrapolating far beyond their so far fruitful use when we postulate a principle of sufficient reason and apply it to the world as a whole." The foundation is not a case within the world; it is the case the world's regularities are conditional on. Extending a principle confirmed inside the system to the origin of the system is illegitimate, and no amount of weakening the principle changes that, because the objection is to the *extension*, not the *strength*.

**Objection 2 — The foundation is a different kind of case, not merely a unique one.** Every ordinary case of difference-making involves a prior circumstance that could have been otherwise. The foundation, by construction, has no prior circumstance: the ground is identical across worlds. So there is nothing available to make a difference, and demanding a difference-maker is demanding something the case cannot have. This is not special pleading; it is noticing that the concept does not apply.

**Objection 3 — The reference-class problem (von Mises; Hájek 2007).** A unique, unrepeatable event has no reference class, so probabilistic or inductive reasoning cannot reach it. Any support CE draws from the track record of difference-making is support for a generalization over a class, and the foundation belongs to no class.

**Objection 4 — Hume–Edwards.** If the existence of each contingent thing is explained by its cause, the existence of the totality is thereby explained; there is no further fact for CE to demand an account of.

**Objection 5 — Modal collapse (van Inwagen 1983).** Any explicability principle strong enough to forbid a brute foundational selection makes the selection necessary, and contingency vanishes.

**Objection 6 — Symmetry (Oppy 2006; the luck objection: Mele 2006; van Inwagen 2000).** The theist's package has a brute residue too. With the ground's states fixed across worlds, the agent's selection of *this* maximal reality rather than another maximal one is, at the moment of selection, "pure luck" — nothing about the ground distinguishes the worlds in which it chose differently. So the theist's favored production is brute at exactly the point where the naturalist's is, and refusing the naturalist a brute foundation while granting the theist one is the arbitrary move. *Strengthened by the v8.5 review:* the residue is not confined to ties. `W_Pref.residue` certifies that in a model of all of `Axioms`, with no tie, the same agent in the same necessary state produces the strictly worse reality at the non-actual world. So the theist's contrast — did the inclination toward the best prevail — is exactly as bare as the naturalist's, and the w₀ restriction on P7/P8 (D7) is what keeps the theorems from looking at it.

**Objection 7 — Boundary conditions are legitimately brute (Albert 2000; Callender 2004; Loewer; Wallace).** Physics routinely treats initial conditions as boundary data that are not determined, not assigned a chance, and not selected for anything. The Past Hypothesis is the standard example, and on the Humean best-system account it is itself a law. CE's third disjunct is precisely what the "laws + initial conditions" schema denies of the initial condition. So the category "bare" is not exotic; it is where science puts initial conditions, and the exemption the dossier charges the naturalist with is standing methodology.

**Objection 8 — Unmeasured indeterminism is a fourth option (Norton 2008).** Norton's dome is an indeterministic Newtonian system with no probability measure over its outcomes. So "not deterministic, not propensity-governed, not sensitive to anything" is not "it happened by nothing"; it is lawful indeterminism without a propensity, which physics can describe. CE's disjunction is not exhaustive of the respectable options, and the bare naturalist's position is this one.

**Objection 9 — The haecceitistic exit (Adams 1979; Lewis 1986).** D1 makes outcomes token pluralities, and `T2_4'` concedes that without ID the argument establishes only token-level non-determinism. So a naturalist can hold that the production is `TypeDeterministic` — the ground fixes every qualitative feature of the first stage — deny ID (anti-haecceitism: qualitatively identical tokens are not individuated by anything), and let determinism fail only over which numerically distinct but qualitatively identical tokens appear. CE then demands a difference-maker for a purely haecceitistic contrast, which no one, theist included, thinks has one.

### Replies

**To 5 (modal collapse).** Closed by theorem. `no_modal_collapse` proves that the premises, CE included, leave the first-stage output contingent: some two worlds have different outputs. CE does not necessitate anything; it says something mattered, not that it settled the matter. The collapse objection targets principles above CE on the ladder.

**To 4 (Hume–Edwards).** Rowe's (1975, pp. 160–167) reply is decisive and generally accepted: explaining why each member of a collection exists does not explain why there are members rather than none, or these rather than others. Applied here: explaining each contingent item by its cause leaves untouched the contrast CE is about — why *this* first stage rather than another. The first stage's members have causes in the ground; the *contrast* is what the ground's identity across worlds leaves open.

**To 3 (reference class).** CE is not a probabilistic claim and draws no support from frequencies. It asks whether any property of the candidates figured in the producing — a question about causal structure, answered by inspection of the production, not by placing it in a class. The reference-class problem is a problem for assigning a probability to a singular event; CE assigns none. (If the skeptic replies that our *confidence* in CE is frequentist, that is Objection 1, answered next.)

**To 2 (different kind of case).** This is the most instructive objection, because it proves the wrong thing. It is true that the foundation has no *prior* circumstance to make a difference. But CE does not ask for a prior circumstance. It allows the difference-maker to be a property of the candidates to which the production is sensitive *through a state of the ground itself* — the channel. That is exactly why CE is stated over channels. The observation that "there is nothing outside the ground to make a difference" is correct, and it entails not that CE fails but that if CE holds, the difference-making runs through the ground's own states — which is NBL. Objection 2, taken seriously, is an argument *for* NBL, not against CE. The skeptic who presses it must then say why a ground with states of its own, identical across worlds, produces different outputs in different worlds with no state of the ground bearing on which — and that is the denial of CE stated in its own terms.

**To 6 (symmetry).** The objection is right, and v8.5's reply — that the residue arises "only if there are ties" and "after a sensitivity the naturalist's package lacks" — was wrong on the first count. `W_Pref.residue` certifies the residue with no tie: the same N, in the same necessary state s, with the same complete accurate representation, sensitive to the same property, satisfies the P7-antecedent at w′ and produces the strictly worse reality. Nothing in the ground distinguishes the world where it acted on the best reasons from the world where it did not. So the theist's package contains one bare contrast, and CE — a difference-making principle — is not satisfied *by* that contrast in the theist's package any more than in the naturalist's. This is conceded, and D20 records that `Sens` is inclination, not necessitation, so that the concession costs nothing already claimed.

What survives is an asymmetry, and it is stated here at full strength and with its scope.

*First, in what is left unexplained.* The theist explains the content of the outcome — which reality — by maximality on the balance: this one because it was best. What is unexplained is one binary fact: whether the inclination toward the best prevailed. The bare naturalist explains nothing about the content. On the most conservative numbers in the literature (D21; III.7), that content is five independent, sharply-bounded constraints — Λ inside a window two orders of magnitude wide against a natural range of a hundred and twenty; Q inside a similar window; light-quark masses inside the nuclear-stability island; near-zero initial gravitational entropy against a maximum of 10¹²²; three spatial dimensions — and the bare naturalist holds that nothing bore on any of them. One yes/no against the whole first stage.

*Second, in the kind of gap.* The theist's residue is the ordinary libertarian residue: the gap in every free choice, present in the model of anyone who holds that agents sometimes genuinely could have done otherwise (van Inwagen's rollback; Mele's present luck; the agent-causal and event-causal replies of O'Connor, Kane, Franklin, Hartman 2017 mitigate but do not eliminate it). A naturalist who accepts libertarian agency anywhere already pays gaps of this kind daily. The bare naturalist's gap is at the foundation, over the content of reality, and of a kind accepted nowhere else. So: the theist asks the reader to accept one gap of a kind they already accept; the bare naturalist asks for a gap of a kind neither party accepts anywhere.

*Scope.* The second asymmetry bites against a libertarian naturalist and not against a compatibilist, who denies having any residue to pay. Against a compatibilist the comparison is the first asymmetry alone: a yes/no against the whole content. The argument does not pretend the second reaches everyone.

What the argument does *not* claim is that the theist's gap is explained, or that it is smaller in some measure-free sense of "smaller," or that Objection 6 targets Tier 4 rather than CE. It targets CE; the reply is that CE is not the principle "no gap anywhere" but "the content of the outcome is not totally brute," and the theist's package satisfies that while the bare naturalist's does not.

**To 7 (boundary conditions).** Granted that physics leaves boundary data brute and that the Past Hypothesis is the paradigm. The reply is in (a): the bare naturalist's bruteness is not boundary-condition bruteness. In `W_Nat`, and in every model of Tier 1, the initial condition N is identical across worlds (`T2_2`); the "laws + initial conditions" schema puts the bruteness in the initial condition and has the dynamics lawful thereafter, whereas the bare naturalist has the initial condition fixed and the *transition from it* brute. That is exactly where physics never tolerates silence. The Humean dress — the Past Hypothesis is a law of the best system — does not help: on the Humean reading a law summarizes the mosaic and does not explain why the mosaic is as it is, and in the model's terms it is `¬Deterministic ∧ ¬HasProp ∧ ¬Sens`, bare with a label. The anti-Humean dress — a primitive law fixing the first stage — either fixes it at every world (determinism; collides with E and P4 via `no_modal_collapse`), or leaves residual contingency (chance or bare again), or selects among alternatives (`DLaw`: ¬NBL, priced in III.2). Every branch lands on an exit the file already prices.

**To 8 (unmeasured indeterminism).** Granted, and the dossier's "no modal profile" is withdrawn: what the bare production lacks is a propensity measure, not modality. Two things follow. First, this is now the honest statement of what Exit 1 *is*: lawful indeterminism at the foundation with no propensity, i.e. Norton's dome as the first production. Second, its cost is then the dome's cost. The dome is a non-Lipschitz Newtonian system that its critics regard as physically illegitimate (Malament 2008; Wilson 2009; Fletcher 2012), and a naturalist who adopts it at the foundation adopts, at the one point where it matters, a dynamics they would reject anywhere else — which is Della Rocca's line-drawing again. If instead the naturalist supplies a propensity, III.7 applies. CE's disjunction is not expanded; unmeasured indeterminism is classified as bare, and the classification is now defended rather than assumed.

**To 9 (haecceitism).** The exit is real and the argument concedes it formally: without ID, `T2_4'` does not fire and the certified non-determinism is token-level. But the exit has a price the review did not state. To take it the naturalist must hold `TypeDeterministic`: that N's nature necessitates every *qualitative* feature of the first stage — every constant, every initial condition, the entire content in D21 — and that only the numerical identity of the tokens varies. That is Case A necessitation for the qualitative profile of physics: the cosmological constant, the fluctuation amplitude, the quark masses, and the initial entropy all follow from N's nature with necessity. Nothing in physics supports it, it is a far stronger claim than anyone in the fine-tuning debate makes, and it moves the naturalist from "nothing bore on it" to "N's nature fixed it," which is the second horn of the four-way tree, not the third. The haecceitistic exit is therefore not cheaper than `W_Nat`; it trades one bare contrast for necessitarianism about the constants. `W_Nat`'s two realities differ qualitatively, and that is not an accident of the witness: it is the only version of the exit that does not commit the naturalist to necessitated physics.

**To 1 (a posteriori extrapolation).** This is the residue of the debate, and it should be stated without pretense. Mackie and Oppy are right that our confidence in difference-making is not a priori and is formed within the world. The question is what follows. Three things can be said.

First, the objection proves too much. Every principle we use to reason about the foundation — that contradictions do not obtain there, that identity is transitive there, that if the ground causes the first stage then the first stage is caused — was formed within the world. If intra-worldly formation disqualifies a principle from application to the foundation, nothing can be said about the foundation at all, including that it is brute; "brute" is itself a concept formed within the world. The skeptic who wants to *assert* that the foundation is bare, rather than merely decline to say anything, is using intra-worldly concepts to do it.

Second, the objection is to extension, and the reply to Objection 2 shows that CE is not an extension in the relevant sense. CE is not "the regularities inside the system also hold at its origin." It is "either something about the outcome mattered to its being produced, or nothing did," with the difference-maker located where the case allows it to be. That is a disjunction any account of the foundation must take a side on. The a-posteriori objection gives a reason to be *humble* about which side; it gives no reason to take the "nothing" side.

Third, and this is where the defense stops: after both points, the skeptic can still say — "I decline to apply difference-making at the foundation, I do not assert that the foundation is bare, I assert that we cannot know whether CE holds there." That position is coherent. It is not special pleading, because it declines rather than denies. What it costs is stated in the next paragraph.

### Cost of denial

To *deny* CE — to take Exit 1 — is to hold that the necessary foundation, identical across worlds, produced this reality rather than another with nothing sensitive to the difference, no chance governing it, and nothing determining it. `W_Nat.witness` certifies the position is consistent, and nothing can make it inconsistent. Its price, stated exactly (D22):

(a) The whole content of the first stage obtains with nothing bearing on any of it. That content, conservatively counted, is five independent constraints with sharp boundaries in kind, one of them — Λ — a window two orders of magnitude wide against a natural range of a hundred and twenty. The theist leaves one yes/no unexplained; the bare naturalist leaves all of this.

(b) Contrastive explanation is exempted at exactly one point, the foundation, while demanded everywhere above it — and, per (a) and the reply to 7, not at a boundary condition but at a transition from a fixed state, where science never exempts it. That is Della Rocca's line-drawing, and it now has a specified content.

(c) The measure cosmology uses for initial conditions is rejected — or kept, in which case the naturalist inherits Boltzmann brains and a cognitively unstable cosmology (Carroll 2017). Either way the chance exit is closed by the naturalist's own move (III.7), and "bare" is what is left.

To *decline* CE — to say we cannot know whether it holds at the foundation — remains the honest form of the exit and remains cheaper. It does not assert a bare selection; it withholds. What it costs is stated as before: the same withholding applies to every intra-worldly principle, and it leaves the skeptic unable to affirm naturalism about the foundation as opposed to merely not affirming theism.

### Ceiling

CE cannot be proved, and `W_Nat.witness` is the theorem that says so. What can be shown, and is: that CE is the weakest principle that does any work; that the skeptic relies on it everywhere; that it does not collapse modality; that it survives the reference-class, Hume–Edwards, different-kind-of-case, boundary-condition, unmeasured-indeterminism, and haecceitistic objections at the prices stated; and that the symmetry objection is *conceded* — the theist has one bare contrast — and answered by an asymmetry in what is left unexplained and in the kind of gap, with its scope declared. What cannot be shown is that a skeptic who pays the price in (a)–(c) is making a mistake. The argument's claim is that the price is now written down, in numbers a critic would have the hardest time widening, and that whether to pay it is the judgment the argument is built to force.

### Independent literature

Della Rocca, "PSR," *Philosophers' Imprint* 10:7 (2010); "Tamers, deniers, and me," *Philosophical Studies* 178 (2021). Pruss, *The Principle of Sufficient Reason: A Reassessment* (Cambridge, 2006). Dasgupta, "Metaphysical Rationalism," *Noûs* 50 (2016). Amijee, "Inquiry and Metaphysical Rationalism," *AJP* 101 (2023). Van Inwagen, *An Essay on Free Will* (Oxford, 1983), pp. 202–204; "Free Will Remains a Mystery," *Philosophical Perspectives* 14 (2000). Bennett, *A Study of Spinoza's Ethics* (1984). McDaniel, "The principle of sufficient reason and necessitarianism," *Analysis* 79 (2019). Mackie, *The Miracle of Theism* (Oxford, 1982), ch. 5. Oppy, *Arguing About Gods* (Cambridge, 2006); "Uncaused Beginnings," *Faith and Philosophy* 27 (2010). Rowe, *The Cosmological Argument* (Princeton, 1975). Hájek, "The Reference Class Problem Is Your Problem Too," *Synthese* 156 (2007). Woodward, *Making Things Happen* (Oxford, 2003). Mele, *Free Will and Luck* (Oxford, 2006). O'Connor, *Persons and Causes* (Oxford, 2000). Albert, *Time and Chance* (Harvard, 2000). Callender, "There Is No Puzzle about the Low-Entropy Past," in Hitchcock ed., *Contemporary Debates in Philosophy of Science* (2004); "Measures, Explanations and the Past," *BJPS* 55 (2004). Earman, "The 'Past Hypothesis': Not Even False," *SHPMP* 37 (2006). Norton, "The Dome," *Philosophy of Science* 75 (2008). Malament, "Norton's Slippery Slope," *Philosophy of Science* 75 (2008). Wilson, "Determinism and the Mystery of the Missing Physics," *BJPS* 60 (2009). Adams, "Primitive Thisness and Primitive Identity," *J. Phil.* 76 (1979). Lewis, *On the Plurality of Worlds* (1986). Hartman, "Counterfactuals of Freedom and the Luck Objection," *J. Phil. Research* 42 (2017). Carroll, "Why Boltzmann Brains Are Bad," arXiv:1702.00850 (2017). Schiffrin & Wald, "Measure and Probability in Cosmology," *Phys. Rev. D* 86 (2012).

## III.2 — NBL: no bearer-free selection

### Statement

At every world and for every property of candidate realities, the first production is not sensitive to that property through the law channel.

```
∀ w (P : M.Reality → Prop), ¬ M.Sens w P .law
```

In plain terms: the ground's laws, as such, select nothing. If which reality comes out is sensitive to anything about the candidates, that sensitivity runs through a state of some thing. NBL entails NI (the value-specific case) as an instance.

### What the law channel is

The formalization distinguishes two ways a production could be sensitive to a property of its candidates: *through a state of a thing* — some bearer's state is the thing whose presence or character the outcome tracks — or *through the laws/dispositions of the ground as such*, with no state of any thing carrying the sensitivity. The second is the "law channel." It is not the claim that laws are involved in the production; laws may govern how the ground's states produce. It is the claim that the *selection among candidates by a property* is done by the law with no bearer — that if you listed every state of every thing in the ground, the sensitivity would not be located in any of them.

This is exactly what a skeptic needs in order to have selection-for-a-property without a selector. It is the axiarchist's picture when the property is value (`Toy.Axiarch`) and the descriptive-law picture when it is not (`Toy.DLaw`).

### The case for NBL

**(a) On a Humean view of laws NBL is trivial.** If laws are regularities — patterns in the mosaic, or the axioms of the best system (Lewis 1994; Loewer) — they do not *do* anything, and in particular they do not select. Production is by things, and any sensitivity in it is a fact about the things. A Humean cannot deny NBL without abandoning Humeanism about laws.

**(b) On a powers view NBL is close to definitional.** If laws supervene on the dispositional profiles of properties (Bird 2007; Mumford & Anjum 2011; Molnar 2003), then everything a law "does" is done by the powers of things, and a power is a property — a state, in the argument's sense — of its bearer. Any sensitivity of the production to a property of candidates is a fact about which powers are exercised, i.e. about the ground's states. The powers theorist cannot deny NBL either; their exit, if they have one, is at TR (§III.5), where they may deny that a power's state *represents* its alternatives.

**(c) On a governing view of laws, NBL is the one substantive claim, and the foundation is where it is most secure.** Primitivists about laws (Armstrong 1983; Maudlin 2007) hold that laws are entities in their own right that govern or produce. Even so, on every developed version a law governs *transitions*: it takes the state of the world at a time and yields the next. A law needs something to operate on. At the foundation the only thing available for a law to operate on is the ground's own state — which is the same in every world. A law that, given an identical input in every world, selects different outputs in different worlds *by a property of the outputs* is not governing a transition; it is choosing. Nothing in the primitivist's motivation — explaining regularities, supporting counterfactuals, grounding induction — calls for a law that chooses. Denying NBL requires laws to do something no theory of laws was built to let them do.

**(d) NBL is the B-framework applied consistently.** B1 says a state causes only as a state of its bearer; B2 says bearers cause their states; the whole argument locates causal work in things and their states. NBL extends the same locating to *sensitivity*: whatever the production tracks, it tracks through something that has states. A skeptic who accepts B1–B2 for causation and denies NBL for sensitivity owes an account of how a production can track a property of its outputs through nothing that has the property-tracking as a state.

### The objections, at full strength

**Objection 1 — Nomic primitivism about foundational selection.** Laws are fundamental entities (Maudlin's FLOTEs — fundamental laws of temporal evolution — are the clearest case). Nothing prevents a fundamental law from being indeterministic and property-sensitive: "produce a reality with P," with which P-reality left open. Such a law is not a state of anything; it is a law. NBL simply legislates against it.

**Objection 2 — The distinction is verbal.** Call the law-sensitivity a necessary state of the ground and NBL is satisfied; refuse to, and it is violated. Nothing metaphysical turns on the labeling, so NBL cannot be doing real work.

**Objection 3 — Axiarchism is a developed position that denies NBL, and it is not obviously wrong.** Leslie (1979, 1989) and Rescher hold that ethical requiredness is directly creatively effective; Steinhart has formalized it. If that is coherent, NBL's value instance (NI) is false, and NBL with it.

### Replies

**To 2 (verbal).** The relabeling is not free, and that is the point. If the skeptic calls the sensitivity a state of the ground, then CH applies (it is a state in virtue of which the ground causes a first contingent item), TR applies (it represents the candidates, including producing nothing), and FA applies (it is ahistorical, represents the non-actual, and so is mental). The relabeler has conceded a selecting representation and moved the dispute to FA (§III.3). NBL's work is exactly to make the skeptic choose: either the sensitivity is located in a bearer — and then it is a representing state of a thing, with everything that follows — or it is not, in which case the skeptic holds Objection 1. There is no third labeling, because the channel type is exhaustive by D17, and D17 is what a skeptic who wants a third option must reject by *supplying* one.

**To 1 (nomic primitivism).** This is the real exit, and it should be granted to be coherent: `Toy.DLaw` and `Toy.Axiarch` are models of it. Its costs are three. First, it is available only to a governing-law primitivist — Humeans and powers theorists cannot take it (a, b above) — so it is not a naturalist's default; it is a specific metaphysics of laws, and a minority one. Second, even for the primitivist it requires the law to do something laws are not otherwise asked to do: select among outputs by a property of the outputs with an invariant input. The standard motivations for governing laws (Armstrong's explanation of regularity; Maudlin's grounding of temporal evolution) do not extend to this, and Maudlin's own laws are transition laws. The skeptic must posit a *new kind* of law — a selecting law — for the foundation alone. Third, if the property selected for is descriptive, the production is not favored and the skeptic is at CE (the `DLaw` world is bare); if it is value, the skeptic is an axiarchist, Objection 3.

**To 3 (axiarchism).** Axiarchism is coherent and developed, and the dossier does not pretend otherwise. Its costs are itemized in §III.4 under NI: the loss of Normative Inertness, and with it the resources for evolutionary debunking (Street 2006; Joyce), the causal closure of the physical, and Mackie's queerness argument, whose entire content is that intrinsically efficacious value would be too strange to exist. The axiarchist keeps none of these. There is also the internal instability Leslie's own trajectory displays: pressed on *how* value becomes effective, *Infinite Minds* (2001) answers with minds — which is to concede NBL and locate the sensitivity in a bearer after all. Goff (2019, 2023) makes the same move explicitly, introducing a cosmic mind precisely because values are not "the right kind of things to have a causal influence on the workings of the world independently of the motives of rational agents." The two leading proponents of value-directed cosmology both end up affirming NBL.

### Cost of denial

To deny NBL is to hold that the ground has a law which, with an identical input in every world, selects among first realities by a property of those realities, with the selecting located in no state of anything. This is unavailable to Humeans and to powers theorists; it requires the governing-law primitivist to add a selecting law with no analogue elsewhere; and if the property is value it is axiarchism, with the costs above. `Toy.DLaw` and `Toy.Axiarch` certify the position is consistent.

### Ceiling

NBL cannot be proved against a nomic primitivist who is willing to posit a bearer-free selecting law. It can be shown that this is the *only* position from which NBL can be denied; that it is not the default view of laws on any of the three main accounts; that it asks laws to do something no account of laws was built for; and that its value-directed version collapses, in its own leading proponents, into the view NBL states. The primitivist who holds firm pays with a law that chooses.

### Independent literature

Lewis, "Humean Supervenience Debugged," *Mind* 103 (1994). Armstrong, *What Is a Law of Nature?* (Cambridge, 1983). Maudlin, *The Metaphysics Within Physics* (Oxford, 2007). Bird, *Nature's Metaphysics* (Oxford, 2007). Mumford & Anjum, *Getting Causes from Powers* (Oxford, 2011). Molnar, *Powers* (Oxford, 2003). Beebee, "The Non-Governing Conception of Laws of Nature," *PPR* 61 (2000). Leslie, *Value and Existence* (Blackwell, 1979); *Universes* (Routledge, 1989); *Infinite Minds* (Oxford, 2001). Rescher, *Axiogenesis* (Lexington, 2010). Steinhart, "Six Axiarchic Arguments." Goff, "Did the Universe Design Itself?," *IJPR* 85 (2019); *Why? The Purpose of the Universe* (Oxford, 2023). Hawthorne & Nolan, "What Would Teleological Causation Be?," in *Metaphysical Essays* (Oxford, 2006).

## III.3 — FA: factivity of ahistorical non-mental content

### Statement

If a state is not mental and has no contingent causal history at w, then it represents a reality as an alternative only if that reality is the contingent reality of w, and it represents producing nothing only if no contingent item exists at w.

```
∀ w s, ¬ M.Mental s → ¬ M.Historical w s →
  (∀ r, M.Rep s (.alt r) → r = M.realOf w) ∧ (M.Rep s .nil → ∀ x, ¬ M.realOf w x)
```

In plain terms: a mindless state with no history can carry content only about what is the case. It cannot represent what is not the case, what might have been, or the absence of everything. FA replaces P6. It is not a claim about minds; it is a claim about the *limits of non-mental content*, and the mind conclusion follows from it by elimination, because the selecting state represents producing nothing as an alternative (TR, P5) and something exists.

### The case for FA

The case is an exhaustion of the naturalistic theories of content, each of which grounds content in a relation to something *actual*.

**(a) Selection-history (etiological) theories.** Wright (1973), Millikan (1984), Neander (1995), Garson (2016): a state has the content it was selected to have; misrepresentation is the failure of a state to do what it was selected for. Content of the non-actual is available here — a frog's fly-detector represents *fly* even when firing at a bee — but only because of the history that fixed the function. Godfrey-Smith (1994) states the family trait: these analyses "locate functions in actual selective histories." An ahistorical state has no selected function and so no etiological content at all, factive or otherwise. FA restricts itself to ahistorical states precisely so as to leave this family untouched: biological and artefactual representation of the non-actual is *historical*, and FA says nothing about it.

**(b) Informational (covariation) theories.** Dretske (1981): a state carries the information that P when it covaries with P under the relevant conditions. Information is factive: a state cannot carry the information that P unless P. Dretske's "Misrepresentation" (1986) is the classic statement of what this entails: to get *misrepresentation* — content that can be false — you need to add a function, fixed by learning or selection, that determines which of the things the state covaries with it is *for*. Without that history, informational content cannot be false, and cannot be about what is not the case. This is FA, in Dretske's own hand, for the covariational family.

**(c) Structural (isomorphism / exploitable-resemblance) theories.** Cummins (1989, 1996), Shea (2018), O'Brien & Opie, Gładziejewski & Miłkowski (2017): a state represents a target by sharing structure with it — a map represents terrain by structural correspondence — and the correspondence is *exploited* by a consumer. Two features matter. First, the target must be *actual*: structural correspondence is a relation between two structures, and a merely possible reality is not a structure the state can correspond to; it is nothing. A "structural representation" of a non-actual alternative is a resemblance to nothing. Second, correspondence alone is symmetric and radically indeterminate (Sprevak 2011; Ramsey 2007): a structure corresponds to indefinitely many things, so content is fixed only by the consumer's *use*, which is either historical (a function) or the act of a present user. Ramsey's job-description challenge — that a state must *function as* a stand-in for something, for some system — makes the consumer ineliminable. At a historyless foundation the only candidate consumer is the bearer of the state itself, using it to select; and a bearer that uses a state to select among alternatives, one of which is producing nothing, is exactly what FA says must be a mind.

**(d) Consumer and use theories generally** (Ramsey 2007; Millikan's consumer semantics) share the structure of (c): content is what the state is used as, and use is historical or by a present user.

The exhaustion is then: history (excluded by ahistoricity), covariation (factive without history), structural correspondence (requires an actual target and a consumer), use (historical or by a present user). No naturalistic account delivers content of the non-actual in an ahistorical, mindless state. That is Brentano's thesis arriving by elimination: intentional inexistence — being directed at what does not exist — is the mark of the mental, because nothing non-mental has been shown able to do it without a history.

### The objections, at full strength

**Objection 1 — Physical intentionality (Molnar 2003; Place 1996; Heil 2003; Bird 2007).** Powers are directed at their manifestations whether or not those manifestations ever occur; a soluble salt that never meets water is still directed at dissolving. Directedness at the non-actual is thus ubiquitous in the physical world and not the mark of the mental. A power is an ahistorical, non-mental state with intentional inexistence.

**Objection 2 — Structural representation of possibilia.** A state can be isomorphic to the *structure* a possible reality would have; possible structures are abstract objects and exist necessarily; so the state can stand in a real correspondence relation to a real (abstract) structure, and represent the possible reality via it, with no mind.

**Objection 3 — Platonic and informational metaphysics (Frege; Bealer; Floridi; Wheeler's "it from bit").** Propositions, or information, exist necessarily and are intrinsically about things, including non-actual things. A state could carry non-actual content by bearing a relation to such an abstract content-bearer, with no mind involved.

**Objection 4 — Modal realism (Lewis 1986).** Possible realities are actual at their own worlds. Content directed at them is directed at concrete things, and FA's "non-actual" is merely "not here."

**Objection 5 — Ahistorical teleosemantics (Nanay 2014).** Functions can be grounded in present dispositions to contribute to fitness rather than in past selection, so etiological content need not be historical.

### Replies

**To 1 (physical intentionality).** Two responses, and the first is decisive for the argument's purposes. A power's directedness is at *its own manifestation-type*, fixed by its bearer's nature; it is not directedness at a *range of alternatives*, and it is not directedness at *producing nothing*. FA concerns states that represent alternatives and the empty option. The powers theorist's own leading defender concedes the gap: Oderberg (2017), arguing that physical intentionality is genuine finality, holds that it is *not representational*, that "specific indifference" among alternatives is realised in the mental case by abstraction, and that this "has no correlate in the case of physical powers." So a power is not a counterexample to FA; a power does not represent alternatives at all. The second response: if the powers theorist insists that a power's state *does* represent the range of its possible manifestations, then they are affirming TR for that state, and FA applies to it — the power's state, being ahistorical and representing non-actual alternatives, is mental. That is the physical-intentionality theorist's dilemma: either powers do not represent alternatives (Oderberg; then no counterexample) or they do (then FA makes them mental, which is panpsychism, not naturalism).

**To 2 (structural representation of possibilia).** Correspondence to an abstract structure does not deliver content about a *concrete possible reality*; it delivers, at most, content about the abstract structure. To make the state be *about the reality that would have that structure* — to make it represent the reality *as an alternative* — is the step no correspondence relation performs, because the reality is not there to be corresponded to. And the content-fixing problem (Sprevak; Ramsey) remains: an abstract structure corresponds to every concrete thing that would share it; which of them the state is about is fixed by use. The objection relocates the non-actual content into the *use*, and the user at the foundation is the selecting bearer.

**To 3 (Platonism, informational metaphysics).** FA is a claim about *states of concrete things* that are channels of the production — states in virtue of which their bearers cause first contingent items (CH). An abstract proposition is not such a state; it causes nothing (the standard acausality of abstracta, which the naturalist affirms and which §III.2 relies on). If the skeptic says the *state* carries non-actual content by *bearing a relation to* a proposition, then the relation is one of the naturalistic relations (a)–(d) — a state does not get to be about a proposition by fiat any more than about a reality — and the exhaustion applies to it. Wheeler's "it from bit" and Floridi's informational realism are metaphysics of what the world is made of, not theories of how an ahistorical state comes to be about what does not exist.

**To 4 (modal realism).** Under Lewis's realism the state at w bears no causal, historical, or structural-exploitation relation to the items of another world; worlds are causally isolated by definition. So none of the naturalistic content relations reach across, and "non-actual" in FA — not at w — is exactly what those relations cannot ground. Modal realism makes the alternatives *exist*; it does not make them *available* to a state at w by any naturalistic relation. (It also makes producing nothing a world with no contingent items, which the state at w₀ still cannot be covariationally or structurally related to.)

**To 5 (ahistorical teleosemantics).** Nanay's modal functions are dispositions to contribute to the *fitness* of an organism in nearby possible circumstances. They are ahistorical but not context-free: they require a system with fitness — an organism embedded in an environment, with better and worse ways of going on. The foundation has no environment, no fitness, and no going on; there is nothing for a modal function to be a disposition to contribute to. Nanay's account, applied at the foundation, has no input.

### Cost of denial

To deny FA is to affirm that an ahistorical, mindless state — with no selection history, no function, no consumer, and no actual target — carries content about what is not the case: a merely possible reality, or the absence of any contingent thing. `Toy.NoMind` certifies the position is consistent. No naturalistic theory of content delivers it; each of the four families says explicitly that it cannot. The position amounts to primitive non-mental intentionality directed at the non-existent — the direct denial of Brentano's thesis with nothing offered in its place. Its only developed neighbors — physical intentionality, informational metaphysics — either do not reach alternatives (Oderberg) or do not address the question.

### Ceiling

FA cannot be proved against a skeptic who posits primitive mindless intentionality of the non-actual as a brute feature of the foundation. It can be shown that every naturalistic theory of content denies it; that the two most likely-looking naturalistic counterexamples (powers; structural correspondence) fail on their proponents' own terms; that the position has no instance and no theory; and that it must be posited for the foundation alone, since everywhere else content of the non-actual is either mental or historical. The skeptic who holds firm pays with a kind of content nothing exemplifies and no one has explained.

### Independent literature

Wright, "Functions," *Philosophical Review* 82 (1973). Millikan, *Language, Thought, and Other Biological Categories* (MIT, 1984). Neander, "Misrepresenting and Malfunctioning," *Philosophical Studies* 79 (1995). Godfrey-Smith, "A Modern History Theory of Functions," *Noûs* 28 (1994). Garson, *A Critical Overview of Biological Function* (Springer, 2016). Dretske, *Knowledge and the Flow of Information* (MIT, 1981); "Misrepresentation," in Bogdan (ed.), *Belief* (Oxford, 1986). Cummins, *Meaning and Mental Representation* (MIT, 1989); *Representations, Targets, and Attitudes* (MIT, 1996). Shea, *Representation in Cognitive Science* (Oxford, 2018). Ramsey, *Representation Reconsidered* (Cambridge, 2007). Sprevak, review of Ramsey, *BJPS* 62 (2011). Gładziejewski & Miłkowski, "Structural representations: causally relevant and different from detectors," *Biology & Philosophy* 32 (2017). Molnar, *Powers* (Oxford, 2003). Place, "Intentionality as the Mark of the Dispositional," *Dialectica* 50 (1996). Oderberg, "Finality Revived: Powers and Intentionality," *Synthese* 194 (2017). Nanay, "Teleosemantics without Etiology," *Philosophy of Science* 81 (2014). Lewis, *On the Plurality of Worlds* (Blackwell, 1986). Brentano, *Psychology from an Empirical Standpoint* (1874).

## III.4 — GG and P8 / P8s: the guise of the good, and the balance of reasons

These are treated together because they draw on one literature and stand or fall on one idea: that a being with complete and accurate knowledge of every alternative and every consideration, and with no contingent motivation, selects for the good and not for something else.

### Statements

**GG.** At every world, if the first production is sensitive to some property through a state s, then it is sensitive to maximality on the balance of value-grounded reasons through s.

```
∀ w s (P : M.Reality → Prop), M.Sens w P (.state s) → M.Sens w M.Maximal (.state s)
```

**P8.** If t satisfies the P7-antecedent at w₀ — some state of t is a selecting representation that represents all of Ω and is accurate throughout, and no contingent motivational state bears on the outcome — then (a) no essential motivational disposition of t outweighs the best reasons, and (b) if t acts on the best reasons then the actual reality is maximal on the balance.

**P8s** (satisficing alternative). As P8, with (b) replaced by: if t acts on the best reasons then the actual reality is *good enough*.

### What each does in the argument

GG turns a selecting mind into an *agent* in the argument's sense. By v8.2, CE + NBL + CH + TR + FA give a necessary mind whose state selects the first contingent items for *some* property (`mind_of_CE_NBL`). GG says that property is maximality — the selection is for the good — and that is what makes the state a selecting representation and the production favored. `Toy.DState` certifies that without GG the mind remains and the favoring goes: a necessary mind selecting for a descriptive property, with Tier 4 unavailable.

P8 then takes the agent from "selects for the good" to "the actual reality is maximal on the balance." (a) rules out an essential disposition overriding the best reasons; (b) says acting on the best reasons achieves the best. `exists_maximal` shows (b) commits the argument to a best reality's existing; P8s is the retreat for anyone who denies that.

### The case for GG

**(a) The tradition.** That intentional action is under the guise of the good — that what an agent aims at, it aims at as in some way good — is Aquinas's and Anscombe's thesis (*Intention*, 1957: the "desirability characterization"), defended in contemporary form by Raz (2010) and Tenenbaum (2007). Its content is not that agents always choose well but that what they choose, they choose *as* answering to some consideration in its favor. An agent who selects for a property it in no way regards as favoring is, on this view, not selecting but merely producing.

**(b) The foundation is the case the tradition was made for.** Every standard counterexample to the guise of the good involves contingent psychology: weakness of will, perversity (Stocker 1979), depression, Velleman's (1992) agent who acts on a desire he regards as pointless. The argument's agent has none of these. By 4.2, no contingent motivational state bears on the production; by P5 and P9, its selecting representation covers every alternative and every consideration and is accurate. Whatever moves it is essential, and it knows everything relevant. The question GG answers is: what does such a being select for? The counterexamples do not reach it, because they are all cases where something contingent gets between accurate knowledge and action.

**(c) Selection for a non-evaluative property is a brute essential preference.** Suppose the selector is essentially directed at some descriptive D — "produce a reality with at least one particle," say — while accurately representing that D does not favor its outcomes over the alternatives. Then the being's aim is a fact about it that answers to nothing it represents. It is, at the level of the selector's aim, exactly what CE forbids at the level of the production: a difference (D rather than anything else) to which nothing is sensitive. The theist's package has an essential aim too, at the good; but on the guise-of-the-good view that aim is not an *additional* essential feature of the agent — it is what selecting *is*. Directedness at the good is constitutive of agency; directedness at D is a further brute fact about the being. GG is the claim that the foundation has the constitutive kind and not the brute kind.

### The case for P8

**(a) No essential disposition outweighs the best reasons.** For the argument's agent this is the same claim as GG at the level of motivation rather than aim: an essential disposition contrary to the best reasons, in a being that accurately represents them as best and has no contingent motivation, is a *knowing* essential preference for the worse. It is coherent — Hume's *Dialogues* imagine it, and Law's (2010) evil-god challenge presses it — and it is what P8(a) denies. The case for the denial is (c) above: such a disposition is a brute essential fact with no analogue in the constitutive structure of agency.

**(b) Acting on the best reasons achieves the best.** This has a hidden premise — that the best reality is within the agent's power — and the argument discharges it: `T2_8` establishes that N brings about *every* possible contingent reality, so no possible reality is beyond it. (b) then says: an agent that can produce anything possible, knows everything relevant, and acts on the best reasons, produces what the reasons favor most. The only way that fails is if nothing is favored most — the no-best-world case, for which P8s exists.

### The objections, at full strength

**Objection 1 — Velleman, Stocker, Setiya: the guise of the good is false.** Agents act for reasons they do not see as good (Setiya 2007, *Reasons without Rationalism*); desire the bad as bad (Stocker 1979); act on desires they find pointless (Velleman 1992, "The Guise of the Good"). The thesis is a Thomistic idealization, not a truth about agency.

**Objection 2 — Humean theory of motivation (Exit 4A).** Belief and desire are distinct existences; no amount of accurate representation entails any motivation (Smith 1994, ch. 4; Hume, *Treatise* II.iii.3). The argument's agent may know everything and be essentially moved by anything at all, or by nothing. GG and P8(a) assume an internalism about reasons that Humeans reject.

**Objection 3 — Law's evil god (Law 2010; Hume, *Dialogues* XI).** Everything the argument says about a good necessary agent can be said, symmetrically, about a maximally evil one. The argument's own machinery is neutral between an agent essentially directed at the best and one essentially directed at the worst; P8(a) picks one by fiat.

**Objection 4 — No best world (Rowe 2004; Kraay 2010).** If for every reality there is a better, nothing is maximal; P8(b)'s consequent is unsatisfiable; `exists_maximal` then shows the premises are jointly false.

**Objection 5 — Essential aims are autonomous (Dasgupta 2016).** The argument's own restricted-PSR strategy exempts essentialist facts from explanation. A necessary being's essential directedness at D is such a fact; it needs no explanation; (c) above cannot call it brute.

### Replies

**To 1.** Each counterexample is a case of contingent motivation intervening between knowledge and action — akrasia, perversity, depression, boredom — and 4.2 removes all of them from the foundation. Setiya's argument is the deepest: he holds that acting for a reason does not require representing it as good. But GG does not say the agent *represents* maximality as good; it says the selection is *sensitive to* maximality. Setiya's own positive view — that acting for a reason is acting on a consideration one takes to *explain* the action — is compatible with GG: the argument's agent, with accurate knowledge of every consideration, takes the considerations that favor the outcome to be why it selects. What Setiya denies is a further layer of evaluative representation GG does not require. Velleman's and Stocker's cases require a gap between what the agent knows and what moves it that only contingent psychology supplies.

**To 2.** The Humean is right that in ordinary agents belief and desire are distinct existences. The argument's agent is not an ordinary agent: its motivation is essential (4.2). The Humean thesis, applied here, becomes: a necessary being's *essential* motivation is independent of its accurate and complete knowledge of the considerations. That is not the Humean theory of motivation; it is a claim about necessary essences — that a being can essentially know everything relevant and essentially be moved by something unrelated to it. Nothing in Hume or Smith supports that; their arguments concern the contingent psychology of finite agents. The Humean who presses it is not applying a theory but asserting the possibility GG denies. Its cost is (c): a brute essential preference. `Toy.DState` is its model, and the Humean keeps the mind.

**To 3 (evil god).** Law's symmetry holds for arguments that infer goodness from the *evidence*; it does not hold here, because the argument infers the agent's aim from the *structure of agency* (GG) and from what it is to act on accurately represented reasons (P8). An agent essentially directed at the worst, while accurately representing it as worst, is a knowing essential preference against the reasons — Objection 2's brute preference in its most extreme form. The evil god is not symmetric with the good one; it is the good one plus a brute essential inversion. Law can reply that this begs the question against evil-directedness; the reply is that the argument does not beg it, it *prices* it: the evil god requires denying GG or P8(a), and denying either is affirming an essential motivation unconnected to accurately represented reasons. That the price is the same for evil-directedness as for D-directedness is the point — both are brute.

**To 4 (no best world).** Granted, and priced. `exists_maximal` makes the commitment explicit; P8s removes it. Under P8s the agent acts on the best reasons and the outcome is good enough; what is lost is "unbeaten." The satisficing literature (Slote 1984; Tucker 2016 on motivated submaximization) supplies the model, and the consistency model satisfies P8s. Kraay's multiverse reply — that a God who creates all worlds worth creating faces no no-best-world problem — is a different route the argument does not need. Rowe's own conclusion — that a being who could have done better is not perfectly good — is an objection to *perfect goodness*, which the argument does not claim; §8.4 lists what it does.

**To 5 (essential aims are autonomous).** This is the sharpest objection and it should be conceded partway. Dasgupta's exemption applies to essentialist facts — facts about what a thing is. If directedness at D is part of what the necessary being *is*, then on the argument's own restricted-PSR strategy that fact is autonomous and not brute. So (c) cannot say that D-directedness is brute *as an essential fact*. What (c) can say is this: the theist's and the skeptic's packages both posit an essential directedness, and the question is which is *intelligible as a directedness of a knower*. Directedness at the good is intelligible in that way — it is what the tradition means by agency. Directedness at D in a being that accurately represents D as not favoring is a directedness of a knower that ignores what it knows. Both are autonomous as essential facts; only one is intelligible as agency. GG is the claim that the foundation's selector is an agent in that sense, and Dasgupta's exemption does not decide it.

### Cost of denial

To deny GG: a necessary mind with complete accurate knowledge of every alternative and every consideration, and no contingent motivation, essentially selects for a property it accurately represents as not favoring — a knowing indifference. `Toy.DState` certifies consistency, and certifies that the mind survives. To deny P8(a): the same being essentially prefers the worse while knowing it worse. To deny P8(b) without P8s: a best reality does not exist, and the premises are jointly false; with P8s: the actual reality is good rather than unbeaten.

### Ceiling

GG and P8(a) cannot be proved against a Humean about the motivation of necessary essences, or against Law's evil god. They can be shown to be the guise-of-the-good thesis applied to the one case that removes every standard counterexample; to be denied only by positing a brute essential motivation unconnected to what the being knows; and to be the point at which a skeptic who has conceded a necessary knowing mind can still refuse to call it an agent for the good. P8(b) commits to a best reality, and P8s is certified as the alternative. The skeptic who holds firm keeps the necessary mind and pays with a knower that does not act on what it knows.

### Independent literature

Anscombe, *Intention* (Blackwell, 1957). Raz, "On the Guise of the Good," in Tenenbaum (ed.), *Desire, Practical Reason, and the Good* (Oxford, 2010). Tenenbaum, *Appearances of the Good* (Cambridge, 2007). Velleman, "The Guise of the Good," *Noûs* 26 (1992). Stocker, "Desiring the Bad," *Journal of Philosophy* 76 (1979). Setiya, *Reasons without Rationalism* (Princeton, 2007). Smith, *The Moral Problem* (Blackwell, 1994). Law, "The Evil-God Challenge," *Religious Studies* 46 (2010). Rowe, *Can God Be Free?* (Oxford, 2004). Kraay, "Theism, Possible Worlds, and the Multiverse," *Philosophical Studies* 147 (2010). Slote, "Satisficing Consequentialism," *PAS Supp.* 58 (1984). Tucker, "Satisficing and Motivated Submaximization," *PPR* 93 (2016). Dasgupta, "Metaphysical Rationalism," *Noûs* 50 (2016). Hume, *Dialogues Concerning Natural Religion* (1779), X–XI.

## III.5 — TR: the logical load of the argument (and CH)

*Rewritten in v8.7.* The v8.5 review's central structural finding was that the dossier's rhetorical weight is on CE while the argument's logical load is on TR: TR is what turns "a state sensitive to something" into "a state with content about every possible reality and the absence of all of them," and it had one page. It now has the section CE has. CH keeps its short treatment at the end.

### Statement

**TR.** If the first production's sensitivity to any property runs through a state s, then s represents producing nothing, and every member of Ω, as alternatives.

Lean: `TR_stmt : ∀ w s (P : M.Reality → Prop), M.Sens w P (.state s) → M.Rep s .nil ∧ ∀ r, M.InOmega r → M.Rep s (.alt r)`.

Two clauses, and the first is the one everything rests on. The *field clause* says the state has every member of Ω as content. The *nil clause* says it has producing-nothing as content. D19 is explicit that the nil clause is what makes FA's elimination bite: producing nothing is non-actual at any world with contingent items, so a non-mental ahistorical state cannot represent it (FA), so the state is mental. Without the nil clause the field clause alone would, in a model where Ω has one member, represent only the actual reality, and FA would be silent.

### What TR does

TR is the bridge from *sensitivity* — the v8 primitive `Sens`, which has no axioms (D20) — to *content*. CE gives sensitivity to some property of the candidates; NBL puts it in a state of a thing; CH makes that state a cause; TR gives it the candidates as content; FA makes a state with that content mental. Remove TR and the chain stops at "a state of N through which the production is sensitive to a property and in virtue of which N produces" — which is exactly `Toy.NoTR`, the powers naturalist's package (§8.3), certified since v8.6 to satisfy every field but TR with no mind anywhere.

### The case for TR

**(a) Indicator content is thin, and TR asks for nothing more.** A state through which the production is sensitive to a property of the candidate realities is a state whose contribution to the outcome varies with that property across the candidates. On covariational accounts (Dretske 1981) that is what it is for a state to carry information about the candidates, and "carries information about the candidates" is all TR's field clause means by "represents them as alternatives." TR does not say the state is mental (FA), accurate (P9), or complete (P5).

**(b) Sensitivity to a property of candidates requires the candidates to figure.** This is the sense of `Sens` stated in D20: the candidates *figure* in the producing, as alternatives bearing the property. A state through which the production is sensitive to *maximality* — or to any property that discriminates among the candidates — is one whose contribution depends on how the candidates compare. Comparison is over a field. A state that is not, in any sense, "over" the field cannot be the channel of a sensitivity to a property that ranks the field.

**(c) The nil alternative is in the field.** Producing nothing is a candidate outcome (D2: the empty set is an outcome; D12: ⟨nil⟩ is a content). A state that is sensitive to a property of the candidates is sensitive to a property that the nil candidate either has or lacks — maximality, for instance, is defined by comparison with the empty reality (§1.3: `Maximal r` includes `AtLeast r emptyReality`). So a state channel of a maximality-sensitive production has the nil alternative in its field by the definition of the property it is sensitive to.

### The objections, at full strength

**Objection 1 — Directedness is not content (Molnar 2003; Place 1996; Mumford 1999; Oderberg 2017).** This is the powers naturalist's objection and it is a research program, not a quibble. A disposition is *directed at* its manifestation — it has Brentano's marks of intentionality: directedness at something that may not exist, intensionality — without *representing* it. Oderberg's statement is the sharpest: physical intentionality is directedness at a determinate manifestation-type; what the mental adds is *specific indifference*, "realised by the process of abstraction, which has no correlate in the case of physical powers" (2017, abstract). So the ground's state may be directed at "produce something with D," sensitive to D, and the cause of a D-thing, while representing nothing. `Toy.NoTR` is exactly this, and it is certified.

**Objection 2 — The Dretskean modus tollens.** TR's case cites Dretske; so does FA. But Dretskean indication is *factive*: "R indicates C" entails C. That is what FA relies on, and it cuts the other way. A consistent Dretskean says: an ahistorical non-mental state carries information only about what obtains, hence has no content about non-actual alternatives, hence **TR is false for it**. The argument runs modus ponens (TR, so by FA mental); the Dretskean runs modus tollens (FA, so not TR). Same theory, opposite direction, and the v8.5 dossier never said why ponens.

**Objection 3 — The nil clause is a stipulation.** Even granting the field clause, a state sensitive to D need not carry any content about *producing nothing*. "Nothing" is not a candidate reality with a D-value; a power directed at D is not directed at its own non-manifestation. The v8.5 defense of the nil clause was one sentence ("a state that tracks the field tracks that one too"), and everything rests on it (D19).

**Objection 4 — TR overgenerates.** If any state whose contribution covaries with a property represents that property's bearers, salt's solubility represents water and TR delivers panpsychism.

**Objection 5 — Indicator content is not representation (Ramsey 2007).** Carrying information is what thermometers do; a representation must function as a stand-in for a consumer.

**Objection 6 — The relabeler (III.2's verbal objection, relocated).** A skeptic who calls the ground's law-sensitivity "a necessary state of N" concedes a state channel — and then denies TR and stops. NBL's reply that relabeling triggers CH/TR/FA assumes TR; the relabeler is the powers naturalist.

### Replies

**To 4 (overgeneration).** TR applies only to states through which *the first production* is sensitive to properties of *candidate realities* — states of the necessary ground that are channels of the production of the first contingent items. Salt's solubility is a disposition of a contingent thing exercised in actual circumstances, with a history and an environment; TR says nothing about it.

**To 5 (Ramsey).** The job-description challenge does not defeat TR; it locates the consumer. The bearer uses the state to select (CH: the bearer causes in virtue of it; D4). That consumer is the mind FA delivers.

**To 1 (directedness is not content) — the fork, certified (v8.8).** The reply gives the powers naturalist his own primitive on his own terms and proves what follows from it.

`Powers M` (Lean, optional extension) has one field, `Directed s D` — state s is directed at manifestation-type D — and one axiom, `manif`: an unmasked power manifests its type, so wherever the bearer produces a first item in virtue of a state directed at D, the produced reality has D. That is the powers theorist's own account (Molnar 2003; Mumford & Anjum 2011): a power is individuated by its manifestation and, unmasked, manifests it. At the foundation nothing masks — the ground is invariant across worlds (D3) — so the qualification is idle. A *powers channel* is a necessary state of N through which N produces a first item at every productive world; `NoTR`, `W_Nat` and `W_Pref` all have one.

Now ask which D the powers naturalist's channel is directed at.

*Horn 2 — a determinate type.* Then the state is directed at D the way a magnet is directed at north: the production manifests D and no alternative figures. `W_Nat.powers_witness` certifies what this is: on the bare naturalist's own model, s is a powers channel directed at "a non-empty reality" on the natural `Powers` structure, with no `Sens` through any channel, and CE false. A power directed at a determinate type, with the alternatives not figuring, *is* `W_Nat` — Exit 1, with Exit 1's bill. And `powers_fork` says, for any D that is not maximality on some productive world, that the channel does not track the good there: GG fails for it, the powers naturalist is denying two premises, not one, and the contrast among the D-realities — which non-empty reality? — is a contrast to which nothing bore.

*Horn 1 — maximality.* Then, to deny only TR, the powers naturalist keeps GG: his channel tracks the good, so D is maximality on the balance of value-grounded reasons. `powers_all_tied` certifies the consequence, from `manif` alone with no P7, no P8 and no w₀ restriction: every possible reality is tied on the balance. A power directed at the best manifests the best at every world; so every world's reality is maximal; so each is at least as well supported as every other. That is `all_tied` (§6.4) — the consequence the theist avoids by stating P7/P8 at w₀ only, an escape the powers naturalist does not have, because a power has no "acting on reasons" clause to restrict: its directedness is the same at every world and necessitates. `NoTR.powers_horn1` certifies that Horn 1 is consistent — in exactly the kind of model `powers_all_tied` allows, one in which the balance ties everything (`NoTR`'s `AtLeast := True`). So on Horn 1 "directed at the best" is directed at everything, the balance discriminates nothing, and "something about the outcome mattered" has collapsed into "the outcome had a property every candidate has."

*The theist's state is not a power.* `W_Pref.no_powers_at_maximal`: in the theist's own model, where the selecting state is sensitive to maximality at both worlds and produces the worse at w′ (`residue`), *no* `Powers` structure directs that state at maximality — `manif` would force maximality at w′. This is the formal content of D20: `Sens` is inclination, a power necessitates, and they are not the same relation. It also closes the powers naturalist's best move, which is to say "my channel is directed at the best, and the balance discriminates, just as the theist's does." He cannot have both; the theist can, because the theist's state is not a power.

*The fallible reading, finished (v8.9).* The powers naturalist's remaining position is a directedness at maximality that, unlike a power, may fail at w′. `W_Pref.no_powers_at_maximal` shows it is not a `Powers` structure. So the question is what it *is*, and the way to answer is to ask the powers theorists who allow fallible dispositions, in their own terms.

*Mumford and Anjum.* On *Getting Causes from Powers* (2011), a power *tends toward* its manifestation with a modality weaker than necessity, and the reason it is weaker is interference: other powers can subtract from or prevent the manifestation, and no antecedent can be strengthened enough to exclude every possible interferer. Fallibility is fallibility under interference. At the foundation there is no interference. N is the only fundamental being (P4); every other necessary concrete being is produced by N (`N_anc_of_nec_concrete`); the ground — N's natures and necessary states — is identical across worlds (`T2_2`). There is no second power at the foundation to subtract from the first, and no circumstance at w′ that is absent at w₀. So a Mumford–Anjum tendency at the foundation is unopposed, and an unopposed tendency manifests: that is `manif`, and the fork applies. A tendency that fails with nothing interfering is not a tendency on their account; it is the residue Lowe (2012) and Bird (2016) pressed them on — what "less than necessity" comes to once interference is bracketed — and their answer, that the modality is primitive, supplies no reason the failure world differs from the success world. It supplies nothing, which is what "bare" means.

*Vetter.* On *Potentiality* (2015), a potentiality is individuated by its manifestation and need not manifest; the vase can be fragile and never break. Two things make this fallibility respectable. Potentialities come in degrees, with degree tied to how easily the manifestation is reached; and an unmanifested potentiality is one whose bearer had others, or was not triggered. Apply this at the foundation. N has, on Vetter's account, a potentiality to produce each reality it does produce in some world — one for the best, one for the worse — and at w′ the second manifests. What privileges the first? Either its *degree*: then the potentialities carry a comparative weight over the space of possibilities, which is a propensity structure, `HasProp`, and it meets the anti-chance tier and non-normalizability (III.7). Or nothing: then N's potentialities for the best and the worse are co-present and equal, one manifests, and nothing about N bears on which — which is `W_Nat.fallible_witness` exactly: a fallible directedness at maximality with `Sens` false and the production bare at both worlds. A Vetter potentiality at the foundation is either a propensity or bare; there is no third setting of the dial.

*Bird.* On dispositional essentialism (2007), a disposition is a stimulus–manifestation pair, and it fails to manifest when unstimulated or finked. At the foundation there is no stimulus — nothing is outside the ground — and no fink. A stimulus-free disposition that manifests at one world and not another, with identical bearer and no fink, is not a Birdian disposition; and Bird's own case against physical intentionality (2007, pp. 114–126) turns on dispositions lacking exactly the extrinsic, direction-of-fit features a fallible directedness at *the best* would need.

*What is left.* A state that (a) is not a Mumford–Anjum tendency, because it fails with nothing interfering; (b) is not a Vetter potentiality, because it has no degree and no rival potentiality that explains the failure; (c) is not a Birdian disposition, because it has no stimulus; and yet (d) inclines toward the best among the candidate realities and (e) may not prevail. The only description available of such a state is: *its contribution to the production favors one alternative among the field, and may lose.* That description mentions the alternatives. It is `Sens` in the sense D20 gives it, and it is the theist's state: `W_Pref.fallible_witness` certifies that the theist's selecting state is a fallible directedness at maximality — on the very same generic structure `W_Nat.fallible_witness` uses, with the same causal structure and the same balance — and `Sens` true. The two models differ in `Sens`, `Rep`, `Mental` and in nothing else. So the fallible reading is not a position; it is a fork of its own. Either the alternatives do not figure — `W_Nat`, bare, Exit 1 — or they do, and the powers naturalist holds the theist's inclination while denying that it has the alternatives as content.

That last position is the original `NoTR` with its `Sens` read honestly as inclination among alternatives, and it is where TR's case bites in full. (b) and (c) of the case apply: a state whose contribution depends on how the candidates compare has the field in it by the definition of the property it favors, and a state that favors the best *rather than nothing* has the nil alternative in it too. Indicator content is then not in question — the state's contribution covaries with the comparison across the field — and the powers naturalist's last word is Ramsey's: covariation without a consumer is not representation. The consumer is the bearer, which produces in virtue of the state (CH, D4). What remains philosophical, and is stated as such, is Oderberg's step: a state directed at *whichever* is best among instances it has not produced exhibits the specific indifference that he, defending physical intentionality, reserves for the mental. That is not a theorem. It is a criterion the powers theorists' own best defender supplies, applied to the one state the powers theorists' own accounts cannot describe.

**To 3 (the nil clause) — the lever.** The nil clause is where the fork has teeth, because it is the one candidate a determinate-type power cannot be directed at: a power directed at D is not directed at its own non-manifestation (Molnar's own worry about powers directed at nothing). So a state that has producing-nothing in its field is, on the powers theorist's own account, *not* a physical power. Two routes put nil in the field. First, (c) above: a maximality-sensitive state is sensitive to a property defined by comparison with the empty reality, so the empty reality is in the comparison class. Second, more generally: the first production is a production *rather than none*; a state sensitive to any property of what is produced is sensitive to whether anything is produced, since the property's bearers exist only if something is. A state that could have contributed to nothing being produced, and whose contribution varied with what was, has nil in its field. The powers theorist who denies this must say that the ground's state is directed at "produce a D-thing" in a way that has *no* relation to "produce nothing" — but then the state does not bear on whether there is a first production at all, and the production-rather-than-none is bare, which is CE denied at the empty alternative (D10 is why CE is stated for non-empty worlds; the point here is that the nil contrast is the one the nil clause answers).

**To 2 (the Dretskean modus tollens) — why ponens.** Grant that Dretskean indication is factive and history-free. Then the consistent Dretskean says the ground's ahistorical state indicates only what obtains. There are two cases. If the state is not mental, this is FA, and FA is what the argument asserts. If the state is mental, Dretske's factivity does not apply — the whole point of Dretske's 1986 turn to function was to make room for misrepresentation and non-actual content in *mental* states with history; for ahistorical states the only room is mentality itself. So the Dretskean's modus tollens — "FA, so not TR" — is available only if the state is non-mental, and *that* is what is at issue. The argument does not run ponens by preference; it runs the disjunction: the state is sensitive to the field (CE, NBL, and Horn 1 of the fork), so it has the field as content (TR); if it is non-mental, FA says it cannot; so it is mental. The Dretskean who runs tollens must deny that the state is field-sensitive, which is Horn 2, which is ¬CE. Ponens is not chosen over tollens; the fork forces the Dretskean onto Exit 1.

**To 6 (the relabeler).** Correct, and this is why III.2's verbal reply is no longer the answer to relabeling. The relabeler is the powers naturalist and gets the fork. III.2's reply stands only for the *law*-channel version (Axiarch, DLaw), which NBL prices.

### Cost of denial

To deny TR is to hold that a state of the necessary ground through which the first production is sensitive to a property of the candidate realities, and in virtue of which the ground produces, has no alternative as content — including the alternative of producing nothing. `Toy.NoTR` certifies the position is consistent and mindless. Its price is now certified as a fork with the powers theorist's own primitive and closed on his own accounts. A power (`manif`) directed at a determinate type is the bare naturalist (`W_Nat.powers_witness`); directed at maximality, it ties every possible reality (`powers_all_tied`). A *fallible* directedness is not a Mumford–Anjum tendency (nothing interferes at the foundation), not a Vetter potentiality (no degree, or else a propensity), not a Birdian disposition (no stimulus); it is the same generic structure on the theist's model and the bare naturalist's (`W_Pref.fallible_witness`, `W_Nat.fallible_witness`), which differ only in whether the alternatives figure. So denying TR costs exactly this: holding a state whose contribution favors the best among alternatives it has not produced and may lose — the theist's inclination, described in the theist's terms — while denying that it is about any of them. That is one claim, and it is the claim Oderberg's criterion says is false of the mental's own mark.

### Ceiling

TR cannot be proved against a theorist who asserts, as a primitive, a fallible inclination toward the best among alternatives that is about none of them. What can be shown, and now is: that the powers theorist's own primitive and axiom yield the bare naturalist or the tied world (`powers_fork`); that the theist's discriminating balance is one no power can have (`W_Pref.no_powers_at_maximal`); that the fallible reading is the same structure on both sides (`W_Nat.fallible_witness`, `W_Pref.fallible_witness`) and is not a tendency, potentiality, or disposition on the accounts that allow fallibility; and that what distinguishes the theist from the bare naturalist is exactly whether the alternatives figure. What cannot be shown by theorem is that figuring is content. That step is Oderberg's abstraction criterion applied, and it is philosophical. The powers naturalist's exit is therefore one sentence wide — "the alternatives figure, and the state is about none of them" — and it is a sentence none of the powers accounts writes for him.

### CH

**Statement.** If the first production's sensitivity to any property runs through a state s of a thing, then for some first contingent item m, the bearer of s causes m in virtue of s.

**Case.** CH is the B-framework applied to channels. B1 says a state causes only as a state of its bearer; B2 says bearers cause their states; P0 says whatever the outcome depends on is a cause of it. Its denial is an *epiphenomenal channel* — a state the production tracks but that does no producing — which is not a coherent description of a channel: if s does nothing, the sensitivity runs through whatever does the producing, and that is the channel. `Toy.NoCH` certifies the denial is formally consistent and shows what it amounts to: a sensitivity with no productive realization. CH is near-framework. One note from the v8.5 review (B.8): on the powers view N's dispositional nature *is* a necessary state of N, so CH holds trivially there and the dispute is at TR — which is where this section now puts it.

### Independent literature

Dretske, *Knowledge and the Flow of Information* (MIT, 1981); "Misrepresentation," in Bogdan ed., *Belief* (1986); *Explaining Behavior* (MIT, 1988). Ramsey, *Representation Reconsidered* (Cambridge, 2007). Oderberg, "Finality Revived: Powers and Intentionality," *Synthese* 194 (2017). Molnar, *Powers: A Study in Metaphysics* (Oxford, 2003). Place, "Intentionality as the Mark of the Dispositional," *Dialectica* 50 (1996). Mumford, "Intentionality and the Physical," *Phil. Quarterly* 49 (1999). Mumford & Anjum, *Getting Causes from Powers* (Oxford, 2011). Bird, *Nature's Metaphysics* (Oxford, 2007), pp. 114–126; "Overpowering: How the Powers Ontology Has Overreached Itself," *Mind* 125 (2016). Lowe, "Mumford and Anjum on Causal Necessitarianism and Antecedent Strengthening," *Analysis* 72 (2012). Bauer, "Physical Intentionality, Extrinsicness, and the Direction of Causation," *Acta Analytica* 31 (2016). Vetter, *Potentiality* (Oxford, 2015). Shea, *Representation in Cognitive Science* (Oxford, 2018). Millikan, *Language, Thought, and Other Biological Categories* (MIT, 1984). Neander, *A Mark of the Mental* (MIT, 2017).

## III.6 — Tier 1: P2, P1, P4

Tier 1 is the part of the argument its most prominent naturalist critic accepts (Oppy grants a necessary initial state), and the dossier treats it accordingly: briefly, with the exits clearly marked.

### P2 — every contingent item has a cause

**Statement.** At every world, every contingent item that exists there has a cause there.

```
∀ w x, M.ContingentItem x → M.E w x → ∃ y, M.Causes w y x
```

**Case.** The causal principle is the most thoroughly confirmed generalization there is, and the only place anyone proposes to deny it is the one place it cannot be checked: the first contingent items. P2 is stated for *items* — things and states — not for totalities, so the Hume–Edwards objection (that explaining each member explains the collection) does not touch it; Rowe's reply is not even needed here. What P2 rules out is a contingent thing that exists at a world with nothing at that world producing it: existence from nothing.

**Objections.** (1) Hume's conceivability argument: an uncaused beginning is conceivable, so possible. (2) The a-posteriori objection (Mackie, Oppy): the causal principle is confirmed within the world and cannot be extrapolated to the world's first contingent items. (3) Oppy's own position: the initial state is *necessary*, so there is no first contingent item for P2 to bite on.

**Replies.** (1) Conceivability is not possibility, and Pruss (2006, ch. 2) shows that Hume's argument, taken as a general principle, proves that anything can begin uncaused at any time — a conclusion no one accepts. (2) This is the same objection as against CE, and the same reply applies (§III.1): a skeptic who declines to apply the causal principle at the first contingent items pays with silence about them, not with a naturalist account; and the *denial* — that a contingent thing came from nothing — is `W_P2`, a world nothing exemplifies. (3) Oppy's position satisfies P2: a necessary initial state is not a contingent item. Oppy is not an opponent of Tier 1; he is an instance of it whose ground is a necessary initial state. The argument's disagreement with him begins at Tier 2.

**Cost of denial.** Existence from nothing, once, at the one uncheckable case. **Ceiling.** The Humean who withholds cannot be refuted; the Humean who asserts uncaused contingent existence affirms what nothing exemplifies.

### P1 — ancestry is well-founded

**Statement.** At every world, there is no infinite descending chain of causes.

```
∀ w, WellFounded (fun y x => M.Anc w y x)
```

**What changed in v8.4.** P1 previously said every item has finitely many ancestors, which is stronger than the proofs need and false of any continuum physics taken at face value (an event's past light cone contains infinitely many events). The proofs use P1 only to find *minimal* elements, and well-foundedness suffices for that. So P1 now permits infinite branching — an item with infinitely many causes — and forbids only an infinite regress. This is exactly what causal finitism (Pruss 2018) needs.

**Case.** The Grim Reaper and Benardete paradoxes (Koons 2014; Pruss 2018): an infinite descending chain of causes, each of which acts only if its predecessor did not, yields a contradiction; the diagnosis that avoids the contradiction without arbitrariness is that infinite causal regresses are impossible. The argument does not depend on any particular version of the paradox; it depends on the conclusion the paradoxes are the best argument for.

**Objections.** (1) Schmid (2024): the Grim Reaper argument proves too much — parallel constructions rule out an endless future, which almost everyone accepts — so the paradox must be blocked some other way, and once it is, it does not support finitism. (2) Schmid & Malpass (2023): on branching actualism the Reaper scenarios are not genuinely possible in the way the argument needs, so they cannot be used against infinite pasts. (3) Infinitism (Oppy; Meyer on non-well-founded causation): an infinite regress of contingent causes is simply what reality is like, and nothing is wrong with it.

**Replies.** (1) Schmid's symmetry argument is the serious one. The reply available is Pruss's (2018, ch. 3–4): the past-directed and future-directed cases are not symmetric, because causation runs one way — the Reaper paradoxes exploit that each Reaper's action depends on its *predecessors'*, and the future-directed analogues require dependence on *successors*, which is backward causation. Whether that asymmetry holds up is where the literature currently stands, and the dossier does not claim it settled. (2) Branching actualism, as §7 Exit 2E notes, does not escape the argument; it instantiates the ground as a necessary initial state and relocates the dispute to CE or TR. As a reply to the Reaper argument specifically, it costs the branching actualist the claim that the Reaper scenario is impossible for reasons having nothing to do with finitism — which is a substantive modal commitment of its own. (3) Infinitism is coherent, and `W_P1` is its model. Its cost is the paradoxes, plus a second point: an infinite chain of contingent items is itself a contingent totality, and the infinitist owes an account of it that is not Hume–Edwards (Rowe). The infinitist who says "the chain has no explanation and needs none" is at Exit 1B for the chain.

**Cost of denial.** The Grim Reaper paradox unresolved, or resolved by a diagnosis not yet supplied. **Ceiling.** P1 rests on the paradoxes; if Schmid's symmetry argument succeeds, P1 needs an independent defense the dossier does not have.

### P4 — one fundamental being, the same at every world

**Statement.** There is an N such that at every world N is fundamental (necessary, concrete, uncaused) and every fundamental thing is N.

**Case.** Tier 1 delivers, at each world with a contingent item, a fundamental being (`T1_7`). P4 adds uniqueness and cross-world identity. The case for uniqueness is the coordination problem: two uncaused necessary beings with fixed natures, jointly producing one consistent contingent reality, must either be coordinated by something — which is then a cause of their joint action, and they were not fundamental — or produce independently, in which case their outputs are not one reality but two, with nothing making them cohere. The case for cross-world identity is that a necessary being's identity does not vary with the contingent facts; a fundamental being at one world is a necessary being, and so exists at every world, and is uncaused at every world if uncaused at one (its nature does not change). Note that `T2_15` and `T2_4` do not use P4; it is needed only for `T2_8` (N originates every reality) and for the identification in `identify`.

**Objections.** (1) Plural fundamentals with no coordination problem: two necessary beings each producing its own part of reality, with the parts simply co-existing. (2) A being fundamental at one world but caused at another. (3) Oppy's naturalism, on which the fundamental being is the initial physical state — P4 holds, but the being is not the argument's.

**Replies.** (1) `W_P4` is the model, and it does show the exit is consistent. The cost is what the model displays: two beings, two states, two first contingent items, and nothing that makes the two productions one reality — the "co-existing parts" are two worlds' worth of contingent reality with no relation between them. The pluralist must either accept that or supply a relation, and a relation that makes the productions cohere is a coordination. (2) A necessary being caused at some world is a necessary being that depends, at that world, on something; and if that something is contingent, the necessary being's existence would depend on a contingent thing, contradicting its necessity. If that something is necessary, it is the fundamental being and the first was not. (3) Correct, and the argument agrees: Oppy's initial state *is* N as far as Tier 1–2 go. The disagreement with Oppy is not about P4 but about CE, NBL, TR, and FA — about whether the necessary initial state's production of the first contingent items is bare, lawful, or mental. Oppy is the argument's most important interlocutor precisely because he grants everything up to that point.

**Cost of denial.** Two uncoordinated fundamental beings, or a necessary being that depends on the contingent. **Ceiling.** P4's uniqueness clause rests on the coordination argument, which is compressed here and should be developed; its cross-world clause is close to analytic given the definition of necessity.

### Independent literature

Pruss, *The Principle of Sufficient Reason* (Cambridge, 2006), ch. 2; *Infinity, Causation, and Paradox* (Oxford, 2018). Koons, "A New Kalam Argument: Revenge of the Grim Reaper," *Noûs* 48 (2014). Schmid, "The End Is Near: Grim Reapers and Endless Futures," *Mind* 133 (2024). Schmid & Malpass, "Branching Actualism and Cosmological Arguments," *Philosophical Studies* 180 (2023). Meyer, "Explanatory Regresses and Non-Well-Founded Causation." Oppy, *Arguing About Gods* (Cambridge, 2006); "Uncaused Beginnings," *Faith and Philosophy* 27 (2010). Rowe, *The Cosmological Argument* (Princeton, 1975). Rasmussen, "From a Necessary Being to God," *IJPR* 66 (2009). Pruss & Rasmussen, *Necessary Existence* (Oxford, 2018).

## III.7 — The chance premises: P11, CatOpen and CatU, L4

### What the anti-chance argument claims

It does not claim that objective chance is impossible. It claims that the first production is not *propensity-governed*: not an unfavored production whose outcomes are governed by a propensity distribution. `T2_15` proves this from P11, P12 (itself from CatOpen and CatU), and L4, all stated conditionally on the production's being propensity-governed. Residual chance inside a *favored* production is untouched. The result is conditional on the topology of the outcome space, and the dossier states that plainly.

### P11 — propensities are ordinary probabilities

**Statement.** If the production is propensity-governed, its propensity values form an Archimedean ordered additive structure with a designated zero, and the distribution is a non-negative, finitely additive, monotone measure on a class of regions containing the open ones.

**Case.** This is a proper fragment of the Kolmogorov axioms: finite (not countable) additivity, no normalization, and the Archimedean property that every real number has. Any probability measure in the standard sense satisfies P11. ℚ is certified to satisfy the value-structure axioms in core Lean (`archRat`); ℝ satisfies them by inspection. L2 — the lemma that uncountably many disjoint sets cannot all have positive measure — is proved from P11 (`L2_of_P11`), not assumed.

**Objection.** Non-Archimedean probability (Benci, Horsten & Wenmackers 2013, 2018; Nelson): infinitesimal propensities permit every possible outcome to have positive chance, so L2 fails and the anti-chance argument with it.

**Reply.** This is a genuine, developed position and the dossier does not pretend it is fringe within the philosophy of probability; it is a minority research program. Its costs at the foundation are those Williamson (2007), Pruss (2014, 2018) and Easwaran (2014) press: infinitesimal assignments are radically underdetermined (which ultrafilter?), fail conglomerability, and do not deliver the regularity they were introduced to secure in the cases (countably infinite fair lotteries) that motivate them. And the skeptic who takes this exit must hold that the *first production* — a one-off with no repeatable structure — is governed by hyperreal-valued propensities, which is to adopt the most exotic available account of chance for the single case where no frequency, no symmetry, and no best-system consideration can constrain it.

**Cost of denial.** Hyperreal chance at the foundation. **Ceiling.** P11 cannot be proved against a committed non-Archimedean theorist; it can be shown to be the standard view and to be what every ordinary use of probability assumes. The dossier records that P11 stands on the contested side of a live dispute — Benci, Horsten & Wenmackers have constructed regular non-Archimedean measures (2013; *BJPS* 2018), and Hájek and Easwaran's objections are not decisive against them — and does not claim more than that Pruss's side is the standard one.

### CatOpen and CatU — the topology of the alternatives

**Statements.** CatOpen: if the production is propensity-governed, each category of possible first-stage output is an open region of the similarity topology. CatU: uncountably many categories are realized among possible outputs. P12 follows from them by pure logic (`P12_of_cat`, no axioms).

**Case, rewritten in v8.7 with the empirical status stated (D21; `cosmic_strand_v2.md`).** The two premises now have different standing, and the dossier says so.

*CatOpen is supported empirically.* On the most conservative numbers in the fine-tuning literature — Adams 2019 as baseline, with the widest windows in every case — the region of parameter space that permits stable matter, chemistry, and structure is bounded and has *discontinuous* boundaries in kind: the deuteron is bound or it is not (a bound state exists or does not; the boundary is at roughly −6% on the strong coupling in a Yukawa model); nuclei are stable or they are not (a region of the light-quark-mass plane, with multiple viable islands: Jaffe, Jenkins & Kimchi 2009); galaxies form or never form (the cosmological constant's anthropic window, about two orders of magnitude above the observed value: Weinberg 1987; Martel, Shapiro & Weinberg 1998); the universe expands forever or recollapses; nothing cools to form stars below Q ≈ 10⁻⁶ and everything collapses to black holes above ≈ 10⁻⁴ (Tegmark & Rees 1998); and spacetime has an integer dimension, with exactly 3+1 permitting stable orbits and well-posed dynamics (Tegmark 1997). These are cliffs, not slopes. A reality on one side is not a limit of realities on the other. That is exactly what CatOpen asserts, stated as a claim about the *topology* of the region — bounded, with sharp edges — and not about any measure on it, which is why the normalizability objection (McGrew, McGrew & Vestrup 2001; Colyvan, Garfield & Priest 2005) does not touch it. Popular figures that do not survive the conservative pass are not used: the "±2% strong force" diproton catastrophe is soft at tens of percent (MacDonald & Mullan 2009; Bradford 2009; Barnes 2015), the "±0.5%" Hoyle window is several hundred keV (Epelbaum et al. 2013, 2020; Huang, Adams & Grohs 2019), and the Higgs vev's window may drop out entirely under co-variation (Harnik, Kribs & Perez 2006). What remains is stronger for CatOpen, not weaker: the edges that survive are genuine discontinuities.

*CatU is not established by the constants of our laws, and the dossier withdraws any suggestion that it is.* Collapsing correlated constraints — the diproton, deuteron, neutron–proton mass difference, and Hoyle windows all trace to {m_u, m_d, Λ_QCD, α} — the honest count of independent sharply-bounded constraints is about five: the light-quark-mass island, Λ, Q, the low-entropy initial condition, and dimensionality. Five independent partitions yield finitely many kinds, and *within* each window variation is gradual (stellar lifetimes, carbon yield, structure-formation epoch all vary continuously). So the constants of our laws give a finite partition into sharply-separated kinds with continua inside them — not uncountably many kinds. CatU is therefore a claim about the *space of possible law-structures*: different field content, different forces, different dimensionalities, different topologies — the families of theories, not the parameters of ours. That is a modal claim, defended by the argument in the original case: the families are not exhausted by any countable list, and within families the parameters are continua (Guth 2007). It is not an empirical claim and the dossier does not dress it as one.

*The empirical case against a propensity at the origin does not need CatU.* The natural (Liouville) measure over cosmological initial conditions does not normalize — the phase space is non-compact and the measure is infinite (Schiffrin & Wald 2012) — so there is no well-defined propensity for the first production to be governed by; `HasProp` has no measure to be true with. A naturalist who supplies a measure instead must defend it against the Boltzmann-brain problem (Carroll 2017), the Q-catastrophe (Garriga & Vilenkin), and, in the file, P11 and L4, which close any Archimedean propensity over the kind-partition. A naturalist who rejects all measures has taken Exit 1, rejecting at the foundation alone the measure cosmology uses for initial conditions everywhere else (III.1, cost (c)). Penrose's 10^(10^123) is a ratio of phase-space volumes under that measure and is not used as a probability anywhere in this argument; the qualitative fact it points to — an initial gravitational entropy near zero against a holographic maximum of about 2.6 × 10¹²² k_B (Egan & Lineweaver 2010) — is robust and is the fourth constraint above.

**Objections.** (1) The similarity topology is second-countable — the alternatives form a manifold, parametrized by finitely or countably many real parameters, and manifolds satisfy the countable chain condition, so no uncountable disjoint family of opens exists. (2) There is no similarity topology on the alternatives at all, or none that propensities are defined over, so P12 is vacuous and L4 cannot apply. (3) CatOpen conflates a partition by kind with a topological structure; kinds need not be open. (4) *Added in v8.7:* the categories are countable — discrete physics, finite information, a countable ensemble of computable law-structures (Tegmark's mathematical universe in its countable reading) — so CatU fails whatever CatOpen's status.

**Replies.** (1) The manifold picture is the denial of CatOpen, not of CatU: on a manifold, each "category" is a point or a lower-dimensional locus, not an open set. So the objection amounts to the claim that the possible first stages form a single connected continuum with no categorial discontinuities — that every possible first stage is a small perturbation away from every other, across differences of ontological kind. The conservative data now answers this for the constants of our laws: the discontinuities are real. A skeptic who takes the manifold picture must hold that a first stage with no bound nuclei, or no galaxies, or four spatial dimensions, is approached continuously by first stages with these things, against the physics. (2) If propensities are not defined over any topology on the alternatives, then the propensity account has no distribution to speak of, and "propensity-governed" has no content — which is not an exit from `T2_15` but a concession of it (HasProp is false), and it is what Schiffrin & Wald's non-normalizability delivers. (3) Granted as a demand for clarification: CatOpen does not say kinds are *automatically* open; it says a *similarity* topology, being about similarity, does not make outputs of one kind limits of outputs of another — and the data shows the kinds in question are separated by discontinuities in the physics, not by fiat. (4) This is the live objection to CatU and the dossier concedes its standing. The reply is the modal argument only: countability of the *realized* categories is a claim about the space of possible law-structures, and no one has a countable enumeration of it; but neither has anyone an argument that it is uncountable that does not rest on the continuum of parameters within families, which is exactly what objection (1) contests. CatU's ceiling is here.

**Cost of denial.** Of CatOpen: a single connected continuum of possible first stages across the discontinuities the physics exhibits. Of CatU: a countable space of possible law-structures — a real position, and the cheapest exit from the anti-chance tier for anyone with discrete or finite-information physics. Of both: no propensity distribution at all, which is `¬HasProp` and Exit 1.

**Ceiling.** CatOpen now has empirical support and a low-cost denial only for someone who rejects the physics of the boundaries. CatU is the most technical premise in the argument and its ceiling is low: it is plausible, not proved, and not empirical; a skeptic with a worked-out countable model of law-structure space has a real position. The anti-chance tier does not rest on it alone — non-normalizability closes `HasProp` for anyone using the cosmological measure, and P11/L4 close it for any supplied Archimedean measure — but the *formal* route through `P12_of_cat` does, and the dossier flags this as the place where a mathematically minded opponent should concentrate.

### L4 — the support principle

**Statement.** If the production is propensity-governed, then for every open region with propensity zero, no possible outcome lies in it.

**Case.** A propensity is a disposition of the setup toward its outcomes (Popper; Giere; Mellor). A disposition of strength zero toward an entire open neighborhood is no disposition toward it. L4 is not the claim that probability-zero *points* are impossible — Williamson's infinite sequence of heads is possible and has probability zero, and L4 says nothing against it, because a point is not an open region. It is the claim that the setup cannot land in a neighborhood toward which it has no tendency whatever: possible outcomes lie in the *support* of the propensity distribution. In measure-theoretic terms, a random variable lies in the support of its distribution almost surely; L4 says that for a propensity — a real tendency, not a pattern — "almost surely" is "surely" for open regions.

**Objections.** (1) Probability zero is not impossibility (the standard lesson of continuous distributions); L4 is a metaphysical exclusion principle added to probability, not derived from it. (2) On a Humean best-system account of chance, propensities are not tendencies at all, and the support of the best-system distribution has no such modal force.

**Replies.** (1) Correct, and conceded: L4 is a principle about *propensities* — real tendencies of a setup — not about probability as such. Its content is exactly that zero tendency toward a whole neighborhood excludes outcomes there; it says nothing about points. The skeptic who denies it holds that a setup can produce an outcome in a region toward which it has no tendency at all, and must say what "propensity" then means. (2) As §7 Exit 2B(iv) notes, a Humean chance for a one-off first production is undefined — there is no pattern to systematize — so the Humean does not escape `T2_15`; they concede its antecedent is false.

**Cost of denial.** Outcomes outside the support of a real tendency. **Ceiling.** L4 stands or falls with the propensity conception of chance; against a skeptic who holds that foundational chance is neither a propensity nor a Humean pattern but something else, L4 has nothing to say, and neither does anyone.

### Independent literature

Benci, Horsten & Wenmackers, "Non-Archimedean Probability," *Milan J. Math.* 81 (2013); "Infinitesimal Probabilities," *BJPS* 69 (2018). Williamson, "How probable is an infinite sequence of heads?," *Analysis* 67 (2007). Pruss, "Infinitesimals are too small for countably infinite fair lotteries," *Synthese* 191 (2014); "Underdetermination of infinitesimal probabilities," *Synthese* 198 (2018). Easwaran, "Regularity and Hyperreal Credences," *Philosophical Review* 123 (2014). Guth, "Eternal inflation and its implications," *J. Phys. A* 40 (2007). Lewis, "Humean Supervenience Debugged," *Mind* 103 (1994). Popper, "The Propensity Interpretation of Probability," *BJPS* 10 (1959). Mellor, *The Matter of Chance* (Cambridge, 1971). Giere, "Objective Single-Case Probabilities and the Foundations of Statistics" (1973). Adams, "The Degree of Fine-Tuning in our Universe — and Others," *Physics Reports* 807 (2019). Barnes, "The Fine-Tuning of the Universe for Intelligent Life," *PASA* 29 (2012). Lewis & Barnes, *A Fortunate Universe* (Cambridge, 2016). Tegmark, Aguirre, Rees & Wilczek, "Dimensionless Constants, Cosmology, and Other Dark Matters," *Phys. Rev. D* 73 (2006). Weinberg, "Anthropic Bound on the Cosmological Constant," *PRL* 59 (1987). Tegmark & Rees, *ApJ* 499 (1998). Tegmark, "On the Dimensionality of Spacetime," *CQG* 14 (1997). Epelbaum et al., *PRL* 110 (2013); *EPJA* 56 (2020). Huang, Adams & Grohs, *Astropart. Phys.* 105 (2019). Jaffe, Jenkins & Kimchi, *Phys. Rev. D* 79 (2009). Harnik, Kribs & Perez, *Phys. Rev. D* 74 (2006). MacDonald & Mullan, *Phys. Rev. D* 80 (2009). Schiffrin & Wald, *Phys. Rev. D* 86 (2012). Egan & Lineweaver, *ApJ* 710 (2010). Carroll, arXiv:1702.00850 (2017). McGrew, McGrew & Vestrup, *Mind* 110 (2001). Colyvan, Garfield & Priest, *Synthese* 145 (2005). Hawthorne & Isaacs, "Fine-Tuning Fine-Tuning," in *Knowledge, Belief, and God* (2018). Benci, Horsten & Wenmackers, "Infinitesimal Probabilities," *BJPS* 69 (2018).

## III.8 — P4⁺: no necessary concrete being other than N

**Statement.** Every necessary concrete thing is the N that is fundamental at every world.

**What it does.** P4⁺ identifies the originator with the mind and the agent (`identify`, `main`). Without it, the certified picture is: the selector is a mind (FA), N produces every other necessary being (`originator_produces_mind_and_agent`), and N may or may not be the mind that selects (`W_Id.originator_neither`).

**Case.** Two lines. First, parsimony: having granted one necessary concrete being, a skeptic has every reason not to posit more, and none to posit necessarily generated ones. Second, and more substantively, `originator_produces_mind_and_agent`: any other necessary concrete being is N's *product*, at every world. So denying P4⁺ is not positing an independent necessary being; it is positing that N necessarily produces further necessary beings — a doctrine of necessary generation. That is a theological thesis (Neoplatonic emanation; Leibniz's God who necessarily creates), not a naturalistic one.

**Objections.** (1) Oppy's necessary initial state plus necessary laws, if laws are concrete: two necessary concreta. (2) Emanationist or generation-based theologies. (3) Social-trinitarian views on which the persons are distinct centers of will and so, in the argument's terms, distinct bearers of states that cause.

**Replies.** (1) If laws are concrete and select, this is the denial of NBL (§III.2); if they are concrete and do not select, they are not channels and the argument does not care whether P4⁺ counts them — but on any standard view (Humean, powers, or governing) laws are not *things that bear states and cause*, which is what "concrete being" means here. (2) These are real positions, and `W_Id` certifies they are consistent with everything but P4⁺. Their cost is exactly P4⁺'s content: necessary generation. The argument makes no case against it beyond parsimony, and the dossier does not pretend otherwise; §8.4 lists unity as resting on P4⁺ alone. (3) Whether a Trinitarian view counts one concrete being or three depends on whether the persons are one *bearer of states* or three; Latin/psychological-analogy views count one, social views may count three. The argument takes no position; a social trinitarian who counts three denies P4⁺ and takes the cost in (2).

**Cost of denial.** Necessary generation: the fundamental being necessarily produces further necessary concrete beings. **Ceiling.** P4⁺ rests on parsimony and on the certified fact that its denial is generation, not independence. Against a theology of necessary generation it has no further argument, and it should be understood as the one premise adopted for unity rather than derived from anything deeper.

### Independent literature

Oppy, *Arguing About Gods* (Cambridge, 2006). Leftow, "A Naturalist Cosmological Argument"; *God and Necessity* (Oxford, 2012). Swinburne, *The Existence of God* (Oxford, 2004) on simplicity. Schaffer, "Monism: The Priority of the Whole," *Philosophical Review* 119 (2010).

---

## III.9 — The dossier in one table

| Premise | Ceiling: what cannot be shown | What the holdout pays |
|---|---|---|
| CE | That a skeptic who pays the bill errs; `W_Nat.witness` proves the exit consistent | Exit 1: the whole content of the first stage — five sharply-bounded constraints, conservatively counted — with nothing bearing on any of it; an exemption from contrastive explanation at one point, at a transition from a fixed state, not at a boundary condition; rejection of the cosmological measure or Boltzmann brains under it. The theist pays one yes/no of a kind every libertarian pays |
| NBL | That a nomic primitivist cannot posit a bearer-free selecting law | A law that chooses, with no analogue; if value-directed, axiarchism |
| FA | That primitive mindless intentionality of the non-actual is impossible | Content no theory delivers and nothing exemplifies |
| GG, P8(a) | That a necessary essence cannot be moved by what it knows to be worse — and, conceded, the theist's own agent does so at w′ (`W_Pref.residue`) | A knowing essential preference against reason at w₀; the theist's residue is the same preference's non-prevailing at w′, priced in III.1 |
| P8(b) | That a best reality exists | Replaced by P8s: good enough, not unbeaten |
| TR | That a fallible field-ranging inclination toward the best is content rather than bare directedness; the fork itself is certified (`powers_fork`, v8.8) | Exit 2, on the powers theorist's own axiom: a determinate-type power (= Exit 1's bill, `W_Nat.powers_witness`) or a power at maximality with every reality tied (`powers_all_tied`); the one position between — fallible inclination — is not a power (`W_Pref.no_powers_at_maximal`), not a tendency, potentiality, or disposition on the accounts that allow fallibility, and is the theist's own state minus content (`W_Nat.fallible_witness` = `W_Pref.fallible_witness` in structure); he owes the sentence "the alternatives figure and the state is about none of them" |
| P2 | That the Humean who withholds at the first items errs | Existence from nothing, or silence |
| P1 | That the Grim Reaper paradox survives Schmid's and Malpass's arguments that it motivates only the contradiction of the story | The paradox, unresolved; or infinite descent |
| P4 | Uniqueness, beyond the coordination argument — which is undeveloped; Pruss & Rasmussen bracket it | Two uncoordinated fundamental beings, or island universes (`W_P4`: no formal cost) |
| P11 | That chance is Archimedean, against Benci–Horsten–Wenmackers | Hyperreal chance at a one-off |
| CatOpen | Little: sharp boundaries in kind are in the physics (D21) | Rejection of the discontinuities physics exhibits |
| CatU | That the space of law-structures is uncountable; a modal claim, not empirical | A countable space of possible law-structures — the cheapest exit from the formal anti-chance route; non-normalizability and P11/L4 remain |
| L4 | That propensities are tendencies with support | Outcomes outside any tendency |
| P4⁺ | Anything beyond parsimony | Necessary generation |

Read down the right-hand column: that is the complete list of what a reasonable skeptic can say to avoid the conclusion, and each entry is a named metaphysical thesis with a certified model. That is the standard the project set in §0, and this table is what meeting it looks like.

**Two rows, not one.** v8.5 said the cheapest row was the only one the strongest opponent needs. That was wrong: there are two certified single-premise naturalist packages, and they belong to different opponents. Oppy's bare naturalist denies CE (`W_Nat`) and pays Exit 1's bill. The powers naturalist — anyone with a dispositional metaphysics of the initial state — denies TR (`NoTR`), keeps CE, and pays the fork: field-sensitivity without abstraction, or Exit 1 after all. The argument, at its most compressed, is therefore: **Tier 1 gives a necessary concrete originator, and `god_exists` follows if two things are granted — that something about the first production's outcome mattered, and that a state through which it mattered has the alternatives as content. The bare naturalist denies the first at the price of leaving the whole content of the first stage unexplained. The powers naturalist denies the second, and on his own primitive that is certified to be either the bare naturalist or a world in which every reality is tied; the one position between is a fallible inclination toward the best that ranges over the alternatives and is about none of them, which is no longer a power and is the last thing he has to explain.** Whether either price is worth paying to avoid the conclusion is the judgment the argument is built to force; the conclusion itself, given the premises, is a theorem.

---

# Appendix A — Verbatim Lean definitions and premises

This appendix reproduces, unedited from `NecessaryAgent.lean` (v8.8), the parts of the Lean file that Part I renders in words: the preliminaries and content type (A.0, added v8.7), the value-structure axiomatization behind P11 and its ℚ instance (A.1), the channel type, the model (§1.0) and the definitions (§1.1–1.6) (A.2), the premise statements (§2) and the premise structures (A.3), and — added in v8.7 per the external review — `KnowsAll`, the signatures of `identify` and `main`, and the definition of `God` with the signature of `god_exists` (A.4); and, added in v8.8, the powers extension and the fork's two theorem signatures (A.5). A faithfulness check consists of reading each Lean line against the corresponding sentence of Part I. Everything else in the Lean file is proof, and is the kernel's business. The blocks are regenerated mechanically from the certified file at each version; the review's one discrepancy (A.1's `L2` signature dropping its `:= by`) is a deliberate abbreviation of a proof header.

### A.0 Preliminaries and the content type

```lean
abbrev Pred (α : Type) := α → Prop

def Uncountable (ι : Type) : Prop := ¬ ∃ f : ι → Nat, Function.Injective f

/-- Representational content: a reality as an alternative, or a
    consideration bearing on a reality. -/
inductive Content (R C : Type) where
  | alt  (r : R)          -- r as an alternative
  | cons (c : C) (r : R)  -- consideration c bearing on r
  | nil                   -- producing nothing, as an alternative
  | act  (r : R)          -- r as the reality that actually obtains
```

### A.1 Value structure and measure (P11)

```lean
/-- n-fold sum v + v + … + v (n times), from a binary add and a zero. -/
def iterAdd {V : Type} (add : V → V → V) (zero : V) (v : V) : Nat → V
  | 0 => zero
  | n+1 => add v (iterAdd add zero v n)

/-! ### Archimedean ordered additive structure (the part of ℝ the argument uses). -/
structure ArchOrd (V : Type) where
  le : V → V → Prop
  add : V → V → V
  zero : V
  one : V
  le_refl : ∀ a, le a a
  le_trans : ∀ a b c, le a b → le b c → le a c
  add_assoc : ∀ a b c, add (add a b) c = add a (add b c)
  add_comm : ∀ a b, add a b = add b a
  zero_add : ∀ a, add zero a = a
  add_le_add : ∀ a b c d, le a b → le c d → le (add a c) (add b d)
  /-- Archimedean: no element bounds every multiple of one. -/
  arch : ∀ v, ∃ m : Nat, ¬ le (iterAdd add zero one m) v
  /-- Positive elements are Archimedean too: some multiple reaches one. -/
  arch_pos : ∀ v, le zero v → v ≠ zero → ∃ n : Nat, le one (iterAdd add zero v n)

/-- A finitely additive, monotone, non-negative measure on regions (sets of
    outcomes of type X), with values in an Archimedean ordered structure. -/
structure FinMeasure {V X : Type} (A : ArchOrd V) (μ : (X → Prop) → V) (Open : (X → Prop) → Prop) where
  Meas : (X → Prop) → Prop
  meas_open : ∀ G, Open G → Meas G
  meas_empty : Meas (fun _ => False)
  meas_top : Meas (fun _ => True)
  meas_union : ∀ G H, Meas G → Meas H → Meas (fun x => G x ∨ H x)
  nonneg : ∀ G, A.le A.zero (μ G)
  additive : ∀ G H, Meas G → Meas H → (∀ x, ¬ (G x ∧ H x)) →
    μ (fun x => G x ∨ H x) = A.add (μ G) (μ H)
  mono : ∀ G H, Meas G → Meas H → (∀ x, G x → H x) → A.le (μ G) (μ H)

/-- L2: an uncountable pairwise-disjoint family of open regions cannot all
    have non-zero measure. -/
theorem L2 (m : FinMeasure A μ Open) (hunc : Uncountable ι) (hopen : ∀ i, Open (G i))
    (hdisj : ∀ i j, i ≠ j → ∀ x, ¬ (G i x ∧ G j x)) : ∃ i, μ (G i) = A.zero

/-- ℚ as an Archimedean ordered additive structure. -/
def archRat : ArchOrd Rat where
  le := (· ≤ ·)
  add := (· + ·)
  zero := 0
  one := 1
  le_refl := fun _ => Rat.le_refl
  le_trans := fun _ _ _ => Rat.le_trans
  add_assoc := Rat.add_assoc
  add_comm := Rat.add_comm
  zero_add := Rat.zero_add
  add_le_add := fun _ _ _ _ => RatArch.add_le_add'
  arch := RatArch.arch
  arch_pos := RatArch.arch_pos
```

### A.2 Model and definitions

```lean
/-- A channel through which a production can be sensitive to a property of
    candidate realities: either the laws/dispositions of the ground as such,
    or a particular state of a particular thing. -/
inductive Chan (S : Type) where
  | law
  | state (s : S)

/-! ## The model: primitive types and relations -/

structure Model where
  W : Type
  w₀ : W
  Thing : Type
  State : Type
  bearer : State → Thing
  Consideration : Type
  V : Type                       -- value type of propensities
  vzero : V
  K : Type                       -- qualitative kinds of items (for D1)
  kind : Sum Thing State → K
  -- existence
  E_thing : W → Thing → Prop
  E_state : W → State → Prop     -- bearer is in the state at w
  -- causation (world-relative), on items = things ⊕ states
  Causes    : W → Sum Thing State → Sum Thing State → Prop
  CausesVia : W → Thing → State → Sum Thing State → Prop   -- t causes z in virtue of s
  -- O's outcome in w depends on an item
  DependsOn : W → Sum Thing State → Prop
  -- considerations bear on realities (a reality is a set of items: see `realOf`)
  Bears  : Consideration → Pred (Sum Thing State) → Prop
  -- representation; contents are realities (sets of items) and considerations
  Rep      : State → Content (Pred (Sum Thing State)) Consideration → Prop
  Source   : W → State → State → Prop      -- Source w s s' : s' is a source of s
  Mental   : State → Prop
  Accurate : State → Content (Pred (Sum Thing State)) Consideration → Prop  -- s accurately represents c
  -- modes of production (of O, in w)
  -- sensitivity of O's outcome at w to a property of candidate realities,
  -- THROUGH a channel (law/disposition of the ground, or a state of a thing).
  -- "Favored" and "selected because" are DEFINED from this (v8).
  -- D20: `Sens` carries NO axioms.  It is INCLINATION, not necessitation:
  -- sensitivity to P does not entail that the produced reality has P
  -- (`W_Pref.residue`: sensitive to maximality at w′, produces the worse).
  -- The link from inclination to outcome is P8, at w₀ only (D7).  A
  -- counterfactual/difference-making reading of `Sens` is NOT built in; the
  -- prose gloss "obtains partly because considerations favor it" is
  -- interpretive.  Intended sense: the candidates FIGURE in the producing,
  -- as alternatives bearing P — which is why a determinate-type disposition
  -- (no alternatives figure) is the ¬TR package, not an instance of Sens.
  Sens : W → (Pred (Sum Thing State) → Prop) → Chan State → Prop
  HasProp         : Prop              -- O's outcomes are governed by objective propensities
  -- O's propensity distribution over its outcome space, if any: the open
  -- regions of the similarity topology and the propensity assigned to each.
  -- (Regions are sets of outcomes; outcomes are sets of items.)
  POpen : Pred (Pred (Sum Thing State)) → Prop
  μ     : Pred (Pred (Sum Thing State)) → V
  -- category of an outcome (ontological kind / law-structure), for the
  -- reduction of P12 (optional premises CatU, CatOpen)
  Cat : Type
  cat : Pred (Sum Thing State) → Cat
  -- Tier 4 vocabulary
  MotivState   : State → Prop
  ActsOnBest   : W → Thing → Prop
  EssOutweighs : Thing → Prop         -- an essential motivational disposition outweighs the best reasons
  -- the balance of value-grounded reasons, as a comparative over realities:
  -- AtLeast r r' : on that balance, r is at least as well supported as r'
  AtLeast : Pred (Sum Thing State) → Pred (Sum Thing State) → Prop
  -- satisficing threshold on the balance: r is good enough (optional premise P8s)
  Good : Pred (Sum Thing State) → Prop

namespace Model
variable (M : Model)

abbrev Item := Sum M.Thing M.State
abbrev Region := Pred (Pred M.Item)

def E (w : M.W) : M.Item → Prop
  | .inl t => M.E_thing w t
  | .inr s => M.E_state w s

/-- Ancestry: transitive closure of causation. -/
def Anc (w : M.W) : M.Item → M.Item → Prop := Relation.TransGen (M.Causes w)

/-! ### Modal -/
def Nec (t : M.Thing) : Prop := ∀ w, M.E_thing w t
def NecState (s : M.State) : Prop := ∀ w, M.E_thing w (M.bearer s) → M.E_state w s
def Concrete (t : M.Thing) : Prop := ∃ w y, M.Causes w (.inl t) y

/-! ### Items and firsts -/
def ContingentItem : M.Item → Prop
  | .inl t => ¬ M.Nec t ∧ M.Concrete t
  | .inr s => ¬ M.NecState s ∧ M.Concrete (M.bearer s)

def FirstCont (w : M.W) (x : M.Item) : Prop :=
  M.ContingentItem x ∧ M.E w x ∧ ∀ y, M.Anc w y x → ¬ M.ContingentItem y

/-- F_w : the first-stage output of w (O's outcome in w). -/
def F (w : M.W) : Pred M.Item := fun x => M.FirstCont w x

def Fundamental (w : M.W) (t : M.Thing) : Prop :=
  M.Nec t ∧ M.Concrete t ∧ ∀ y, ¬ M.Causes w y (.inl t)

def InGround : M.Item → Prop
  | .inl t => M.Nec t ∧ M.Concrete t
  | .inr s => M.NecState s ∧ M.Nec (M.bearer s) ∧ M.Concrete (M.bearer s)

def CauseOfF (w : M.W) (x : M.Item) : Prop := ∃ m, M.F w m ∧ M.Causes w x m

/-! ### Realities -/
/-- A reality is a set of items. -/
abbrev Reality := Pred M.Item
/-- The contingent reality of w: the contingent items that exist at w.  Defined,
    not primitive, so that "every possible contingent reality" is fixed by the
    model's own contingent content. -/
def realOf (w : M.W) : M.Reality := fun x => M.ContingentItem x ∧ M.E w x
def InOmega (r : M.Reality) : Prop := ∃ w, M.realOf w = r ∧ ∃ x, M.F w x
def InPhi (φ : Pred M.Item) : Prop := ∃ w, M.F w = φ ∧ ∃ x, φ x
/-- The empty contingent reality. -/
def emptyReality : M.Reality := fun _ => False
/-- A reality is maximal on the balance of value-grounded reasons: at least as
    well supported as every alternative in Ω and as producing nothing. -/
def Maximal (r : M.Reality) : Prop :=
  (∀ r', M.InOmega r' → M.AtLeast r r') ∧ M.AtLeast r M.emptyReality
def AccordsValue (w : M.W) : Prop := M.Maximal (M.realOf w)
/-- O's outcome at w is FAVORED: the production is sensitive, through some
    channel, to maximality on the balance of value-grounded reasons.  The
    gloss "the outcome obtains partly because considerations favor it" is
    INTERPRETIVE (D20): `Sens` carries no counterfactual or difference-making
    axioms, and `W_Pref.residue` shows a favored production may produce the
    worse.  (Defined, v8; gloss flagged, v8.7.) -/
def Favored (w : M.W) : Prop := ∃ ch, M.Sens w M.Maximal ch
/-- The outcome is selected BECAUSE of state s: the production's sensitivity
    to maximality runs through s. (Defined, v8.) -/
def SelectedBecause (w : M.W) (s : M.State) : Prop := M.Sens w M.Maximal (.state s)

def BringsAbout (w : M.W) (t : M.Thing) : Prop :=
  (∀ y, ¬ M.Anc w y (.inl t)) ∧ ∀ x, M.ContingentItem x → M.E w x → M.Anc w (.inl t) x

/-! ### Modes of production -/

/-- Determinism relative to a configuration of the setup: same configuration,
    same outcome. -/
def DeterministicWrt {C : Type} (cfg : M.W → C) : Prop :=
  ∀ w w', cfg w = cfg w' → M.F w = M.F w'

/-- The ground's configuration: the necessary concrete things and their
    necessary states.  It does not mention w. -/
def groundConfig : Pred M.Thing × Pred M.State :=
  (fun t => M.Nec t ∧ M.Concrete t, fun s => M.InGround (.inr s))

def Deterministic : Prop := M.DeterministicWrt (fun _ : M.W => M.groundConfig)

/-- The kinds present in the first-stage output at w. -/
def kindsOf (w : M.W) : Pred M.K := fun k => ∃ x, M.F w x ∧ M.kind x = k

/-- Type-level determinism: the same kinds of first contingent item in every
    world (D1's contrast case). -/
def TypeDeterministic : Prop := ∀ w w', M.kindsOf w = M.kindsOf w'

def RepState (s : M.State) : Prop := ∃ c, M.Rep s c

/-- A selecting representation in O at w. -/
def SelectingRep (w : M.W) (s : M.State) : Prop :=
  (∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m) ∧ M.RepState s ∧ M.SelectedBecause w s

def Agential (w : M.W) : Prop := M.Favored w ∧ ∃ s, M.SelectingRep w s
def Teleological (w : M.W) : Prop := M.Favored w ∧ ¬ M.Agential w
def PropGoverned (w : M.W) : Prop := ¬ M.Deterministic ∧ ¬ M.Favored w ∧ M.HasProp
def Bare (w : M.W) : Prop := ¬ M.Deterministic ∧ ¬ M.Favored w ∧ ¬ M.HasProp

/-! ### Representation -/
def Derived (w : M.W) (s : M.State) : Prop := ∃ s', M.Source w s s'
def Historical (w : M.W) (s : M.State) : Prop := ∃ x, M.Anc w x (.inr s) ∧ M.ContingentItem x

def RepAllOmega (s : M.State) : Prop :=
  M.Rep s .nil ∧
  ∀ r, M.InOmega r → M.Rep s (.alt r) ∧ ∀ c, M.Bears c r → M.Rep s (.cons c r)

def Mind (t : M.Thing) : Prop := ∃ s, M.bearer s = t ∧ M.Mental s
/-- s accurately represents everything it represents. -/
def AccurateAll (s : M.State) : Prop := ∀ c, M.Rep s c → M.Accurate s c
def Knows (t : M.Thing) (c : Content M.Reality M.Consideration) : Prop :=
  ∃ s, M.bearer s = t ∧ M.Rep s c ∧ M.Accurate s c

def Agent (w : M.W) (t : M.Thing) : Prop := ∃ s, M.bearer s = t ∧ M.SelectingRep w s

/-- The antecedent of P7 for agent t in O at w: complete and accurate
    representation, and no dependence on a contingent motivational state. -/
def P7Antecedent (w : M.W) (t : M.Thing) : Prop :=
  (∃ s, M.bearer s = t ∧ M.SelectingRep w s ∧ M.RepAllOmega s ∧ M.AccurateAll s) ∧
  (∀ s, M.MotivState s → M.DependsOn w (.inr s) → M.NecState s)

end Model
```

### A.3 Premises and reductions

```lean
section Stmts
variable (M : Model)
-- framework
abbrev F1_stmt  : Prop := ∀ w x y, M.Causes w x y → M.E w x ∧ M.E w y
abbrev Src_stmt : Prop := ∀ w s s', M.Source w s s' →
          M.Anc w (.inr s') (.inr s) ∧ M.RepState s' ∧ ∀ c, M.Rep s c → M.Rep s' c
-- §2
abbrev E_stmt   : Prop := ∃ x, M.ContingentItem x ∧ M.E M.w₀ x
abbrev L0_stmt  : Prop := ∀ w x, ¬ M.Anc w x x
abbrev B1_stmt  : Prop := ∀ w s z, M.Causes w (.inr s) z ↔ M.CausesVia w (M.bearer s) s z
abbrev B1'_stmt : Prop := ∀ w t s z, M.CausesVia w t s z → t = M.bearer s ∧ M.Causes w (.inl t) z
abbrev B2_stmt  : Prop := ∀ w s, M.E_state w s → M.Causes w (.inl (M.bearer s)) (.inr s)
abbrev P0_stmt  : Prop := ∀ w x, M.DependsOn w x →
          match x with
          | .inl t => ∃ m, M.F w m ∧ M.Causes w (.inl t) m
          | .inr s => ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m
/-- P1 (causal finitism, in the form the proofs use): at every world, ancestry
    is WELL-FOUNDED — there is no infinite descending chain of causes.  This is
    weaker than "finitely many ancestors": it permits infinite branching (an
    item with infinitely many causes, as in a continuum of prior events) and
    forbids only an infinite regress. -/
abbrev P1_stmt  : Prop := ∀ w, WellFounded (fun y x => M.Anc w y x)
abbrev P2_stmt  : Prop := ∀ w x, M.ContingentItem x → M.E w x → ∃ y, M.Causes w y x
abbrev P3_stmt  : Prop := ∀ w, (∃ x, M.F w x) → ¬ M.Bare w
abbrev P4_stmt  : Prop := ∃ N, ∀ w, M.Fundamental w N ∧ ∀ t, M.Fundamental w t → t = N
abbrev P5_stmt  : Prop := ∀ w s, M.SelectingRep w s → M.RepAllOmega s
/-- FA (factivity of ahistorical non-mental content): a state that is not
    mental and has no contingent causal history can carry only content that
    is the case — it can represent a reality as an alternative only if that
    reality obtains, and can represent producing nothing only if nothing
    contingent exists.  Every naturalistic theory of content grounds content
    in relations to ACTUAL things: selection history (Wright, Millikan),
    covariation with actual conditions (Dretske), exploitable isomorphism to
    an actual target (Cummins, Shea).  Without history, informational
    content is factive (Dretske 1981, 1986); misrepresentation and the
    representation of the non-actual require function, which requires
    history.  Denying FA is affirming naturalistically ungrounded content of
    the non-actual in a mindless state. -/
abbrev FA_stmt  : Prop := ∀ w s, ¬ M.Mental s → ¬ M.Historical w s →
          (∀ r, M.Rep s (.alt r) → r = M.realOf w) ∧ (M.Rep s .nil → ∀ x, ¬ M.realOf w x)
/-- P6 (an underived ahistorical representing state is mental) is no longer a
    premise; what the argument needs — that the selecting state and its root
    are mental — follows from FA (`mental_of_nonactual`). -/
abbrev P6_stmt  : Prop := ∀ w s, M.RepState s → ¬ M.Derived w s → ¬ M.Historical w s → M.Mental s
/-- P7 and P8 are principles about an agent's ACTUAL act, so they are stated
    at w₀ only (an explicit exception to D7; see `P7all_stmt`/`P8all_stmt`). -/
abbrev P7_stmt  : Prop := ∀ t, M.P7Antecedent M.w₀ t → M.ActsOnBest M.w₀ t ∨ M.EssOutweighs t
abbrev P8_stmt  : Prop := ∀ t, M.P7Antecedent M.w₀ t →
          ¬ M.EssOutweighs t ∧ (M.ActsOnBest M.w₀ t → M.AccordsValue M.w₀)
abbrev P9_stmt  : Prop := ∀ w s, M.RepState s → ¬ M.Historical w s → M.NecState s → M.AccurateAll s
/-- NI (Normative Inertness): the laws/dispositions of the ground are not, as
    such, sensitive to maximality on the balance of value-grounded reasons.
    Value-sensitivity has no law-channel.  Naturalists rely on this
    everywhere (causal closure, debunking, queerness); axiarchism denies it. -/
abbrev NI_stmt  : Prop := ∀ w, ¬ M.Sens w M.Maximal .law
/-- CH (state channels are causal channels): if the production's sensitivity
    to a property runs through a state of a thing, that state is one in virtue
    of which its bearer causes a member of F.  (The B-framework applied to
    channels.) -/
abbrev CH_stmt  : Prop := ∀ w s (P : M.Reality → Prop), M.Sens w P (.state s) →
          ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m
/-- TR (tracking is indicating): a state through which the production is
    sensitive to a property of candidate realities carries those candidates as
    content — indicator content, deliberately non-mental (Dretske). -/
abbrev TR_stmt  : Prop := ∀ w s (P : M.Reality → Prop), M.Sens w P (.state s) →
          M.Rep s .nil ∧ ∀ r, M.InOmega r → M.Rep s (.alt r)
/-- CE (weak contrastive explicability): at every world with non-empty first-
    stage output, WHICH reality obtains is not totally brute — the production
    is deterministic, or governed by objective propensities (`HasProp`; not
    the stronger `PropGoverned`), or sensitive through some channel to SOME
    property of the candidate realities.  This is a restricted PSR: it asks
    only that something about the outcome mattered, not that the outcome be
    necessitated. -/
abbrev CE_stmt  : Prop := ∀ w, (∃ x, M.F w x) →
          M.Deterministic ∨ M.HasProp ∨ ∃ (P : M.Reality → Prop) (ch : Chan M.State), M.Sens w P ch
/-- NBL (no bearer-free selection): the ground's laws as such select nothing —
    every sensitivity of the first production to a property of the candidates
    runs through a state of a thing.  (Entails NI.)  Humeans accept it because
    laws are regularities, not causes; powers theorists because production is
    by things in virtue of their states; only a nomic primitivist who lets a
    law select a first reality with no prior state to govern denies it. -/
abbrev NBL_stmt : Prop := ∀ w (P : M.Reality → Prop), ¬ M.Sens w P .law
/-- GG (guise of the good): whatever property a state of the ground tracks in
    selecting among candidate realities, the selection is sensitive to
    maximality on the balance of value-grounded reasons.  This is the
    guise-of-the-good thesis (Anscombe, Raz, Tenenbaum) applied to the
    foundation's selector; deniers (Velleman, Stocker) keep the MIND and
    lose only the value conclusion (`mind_of_CE_NBL`). -/
abbrev GG_stmt  : Prop := ∀ w s (P : M.Reality → Prop), M.Sens w P (.state s) → M.Sens w M.Maximal (.state s)
/-- P10, now DERIVED from NI + CH + TR (`P10_of`). Kept as a statement. -/
abbrev P10_stmt : Prop := ∀ w, (∃ x, M.F w x) → (∀ x, M.CauseOfF w x → M.InGround x) →
          M.Favored w → ∃ s, M.SelectingRep w s
-- propensities (2.10–2.12, L4): all conditional on O being propensity-governed,
-- exactly as the prose states them.  Residual chance inside a favored
-- production is untouched (L-tax note).
/-- P11 (real-valued propensities), stated as exactly what is used: the values
    form an Archimedean ordered structure with zero = vzero, and μ is a
    non-negative, finitely additive, monotone measure on a class of regions
    containing the open ones. -/
abbrev P11_stmt : Prop := M.PropGoverned M.w₀ →
          ∃ A : ArchOrd M.V, A.zero = M.vzero ∧ Nonempty (FinMeasure A M.μ M.POpen)
/-- L2 as the argument consumes it (now a theorem, `L2_of_P11`). -/
abbrev L2P11_stmt : Prop := M.PropGoverned M.w₀ → ∀ (ι : Type) (G : ι → M.Region),
          Uncountable ι → (∀ i, M.POpen (G i)) →
          (∀ i j, i ≠ j → ∀ φ, ¬ (G i φ ∧ G j φ)) → ∃ i, M.μ (G i) = M.vzero
abbrev P12_stmt : Prop := M.PropGoverned M.w₀ → ∃ (ι : Type) (G : ι → M.Region),
          Uncountable ι ∧ (∀ i, M.POpen (G i)) ∧ (∀ i, ∃ φ, M.InPhi φ ∧ G i φ) ∧
          (∀ i j, i ≠ j → ∀ φ, ¬ (G i φ ∧ G j φ))
abbrev L4_stmt  : Prop := M.PropGoverned M.w₀ →
          ∀ (G : M.Region), M.POpen G → M.μ G = M.vzero → ∀ w, ¬ G (M.F w)
-- optional premises (not in Core/Axioms; hypotheses of the theorems that use them)
/-- ID: if the kinds of first contingent item are the same in every world,
    so are the items (identity of indiscernibles at the foundation, D1). -/
abbrev ID_stmt  : Prop := M.TypeDeterministic → M.Deterministic
/-- P4⁺: strengthened uniqueness — N is the only necessary concrete thing. -/
abbrev P4plus_stmt : Prop := ∀ N t, (∀ w, M.Fundamental w N) → M.Nec t → M.Concrete t → t = N
/-- SK (self-knowledge of the act; optional, Phase 3): a selecting
    representation represents the reality it selects as the one that obtains.
    With P9 (accuracy) this yields knowledge of the ACTUAL contingent world,
    since a reality is a world's entire contingent content. -/
abbrev SK_stmt  : Prop := ∀ w s, M.SelectingRep w s → M.Rep s (.act (M.realOf w))
/-- P8s (satisficing form of P8; optional, Phase 3): acting on the best reasons
    makes the outcome GOOD ENOUGH rather than maximal.  For readers who deny
    that the balance of value-grounded reasons has a top (Rowe's no-best-
    world problem), this replaces P8. -/
abbrev P8s_stmt : Prop := ∀ t, M.P7Antecedent M.w₀ t →
          ¬ M.EssOutweighs t ∧ (M.ActsOnBest M.w₀ t → M.Good (M.realOf M.w₀))
/-- P7/P8 for all worlds (optional; NOT adopted).  Entail `all_tied`. -/
abbrev P7all_stmt : Prop := ∀ w t, M.P7Antecedent w t → M.ActsOnBest w t ∨ M.EssOutweighs t
abbrev P8all_stmt : Prop := ∀ w t, M.P7Antecedent w t →
          ¬ M.EssOutweighs t ∧ (M.ActsOnBest w t → M.AccordsValue w)
/-- CatU: uncountably many categories are realized by possible first-stage outputs. -/
abbrev CatU_stmt : Prop := M.PropGoverned M.w₀ →
  Uncountable { k : M.Cat // ∃ φ, M.InPhi φ ∧ M.cat φ = k }
/-- CatOpen: each category is an open region of the similarity topology —
    no output is a limit of outputs of other categories. -/
abbrev CatOpen_stmt : Prop := M.PropGoverned M.w₀ → ∀ k, M.POpen (fun φ => M.cat φ = k)
end Stmts

/-- L2 from P11. -/
theorem L2_of_P11 (M : Model) (h : P11_stmt M) : L2P11_stmt M := by
  intro hpg ι G hunc hopen hdisj
  obtain ⟨A, hz, ⟨m⟩⟩ := h hpg
  obtain ⟨i, hi⟩ := L2 G m hunc hopen hdisj
  exact ⟨i, hi.trans hz⟩

/-- Reduction of P12: it follows from CatU and CatOpen.  The disjoint open
    family is the family of category classes. -/
theorem P12_of_cat (M : Model) (hU : CatU_stmt M) (hO : CatOpen_stmt M) : P12_stmt M := by
  intro hpg
  refine ⟨{ k : M.Cat // ∃ φ, M.InPhi φ ∧ M.cat φ = k }, fun i => fun φ => M.cat φ = i.1,
    hU hpg, fun i => hO hpg i.1, fun i => ?_, fun i j hij φ ⟨h1, h2⟩ => hij (Subtype.ext (h1.symm.trans h2))⟩
  obtain ⟨φ, hφ, hk⟩ := i.2
  exact ⟨φ, hφ, hk⟩

/-- **P10 derived.**  If the production is favored — sensitive to maximality
    through some channel — then by NI the channel is not a law, so it is a
    state s of a thing; by CH, s is a state in virtue of which its bearer
    causes a member of F; by TR, s represents the alternatives; and the
    sensitivity running through s is, by definition, the outcome's being
    selected because of s.  Hence a selecting representation exists. -/
theorem P10_of (M : Model) (hNI : NI_stmt M) (hCH : CH_stmt M) (hTR : TR_stmt M) : P10_stmt M := by
  intro w hne _ hfav
  obtain ⟨ch, hch⟩ := hfav
  cases ch with
  | law => exact absurd hch (hNI w)
  | state s =>
    obtain ⟨m, hm, hvia⟩ := hCH w s _ hch
    have hΩ : M.InOmega (M.realOf w) := ⟨w, rfl, hne⟩
    exact ⟨s, ⟨m, hm, hvia⟩, ⟨.nil, (hTR w s _ hch).1⟩, hch⟩

/-- NI is an instance of NBL. -/
theorem NI_of_NBL (M : Model) (h : NBL_stmt M) : NI_stmt M := fun w => h w _

/-- **P3 derived.**  Not bare ⇐ CE + NBL + GG: if which reality obtains is not
    totally brute, then (unless deterministic or chance) some channel is
    sensitive to some property; by NBL it is a state; by GG it is sensitive
    to maximality; so the production is favored. -/
theorem P3_of (M : Model) (hCE : CE_stmt M) (hNBL : NBL_stmt M) (hGG : GG_stmt M) : P3_stmt M := by
  intro w hne hb
  rcases hCE w hne with hd | hp | ⟨P, ch, hs⟩
  · exact hb.1 hd
  · exact hb.2.2 hp
  · cases ch with
    | law => exact hNBL w P hs
    | state s => exact hb.2.1 ⟨.state s, hGG w s P hs⟩

structure Core (M : Model) where
  F1  : F1_stmt M
  Src : Src_stmt M
  E   : E_stmt M
  L0  : L0_stmt M
  B1  : B1_stmt M
  B1' : B1'_stmt M
  B2  : B2_stmt M
  P0  : P0_stmt M
  P1  : P1_stmt M
  P2  : P2_stmt M
  P4  : P4_stmt M
  P5  : P5_stmt M
  FA  : FA_stmt M
  P7  : P7_stmt M
  P8  : P8_stmt M
  P9  : P9_stmt M
  P11 : P11_stmt M
  P12 : P12_stmt M
  L4  : L4_stmt M

/-- Core plus the two premises the prose identifies as the live disagreement. -/
structure Axioms0 (M : Model) extends Core M where
  CE  : CE_stmt M
  NBL : NBL_stmt M
  GG  : GG_stmt M
  CH  : CH_stmt M
  TR  : TR_stmt M

/-- NI, P3 and P10 as consequences of `Axioms0`. -/
theorem Axioms0.NI {M : Model} (A : Axioms0 M) : NI_stmt M := NI_of_NBL M A.NBL
theorem Axioms0.P3 {M : Model} (A : Axioms0 M) : P3_stmt M := P3_of M A.CE A.NBL A.GG
theorem Axioms0.P10 {M : Model} (A : Axioms0 M) : P10_stmt M := P10_of M A.NI A.CH A.TR

/-- The full premise set: adds P4⁺ (no necessary concrete being other than N),
    which identifies the originator, the mind, and the agent.  Adopted on the
    "most solid route": a skeptic who grants P4 has parsimony on the side of
    P4⁺; only a doctrine of necessary generation motivates denying it. -/
structure Axioms (M : Model) extends Axioms0 M where
  P4plus : P4plus_stmt M
```

### A.4 `KnowsAll`, `identify`, `main`, `God`, `god_exists`

```lean
/-- Knowledge of all of Ω, including the empty alternative. -/
def KnowsAll (M : Model) (t : M.Thing) : Prop :=
  M.Knows t .nil ∧
  ∀ r, M.InOmega r → M.Knows t (.alt r) ∧ ∀ c, M.Bears c r → M.Knows t (.cons c r)

/-- Identification: with P4⁺ in the premise set, the mind, the agent, and N
    coincide.  This section (`WithP4plus`) is the only part of the file that
    uses P4⁺; everything in `FullTheorems` is typed over `Axioms0`. -/
theorem identify :
    ∃ N, (∀ w, M.Fundamental w N) ∧ M.Mind N ∧ M.Agent M.w₀ N ∧ KnowsAll M N := by

theorem main :
    -- Tier 1
    (∃ u, M.Fundamental M.w₀ u) ∧
    -- Tier 2
    ¬ M.Deterministic ∧ ¬ M.PropGoverned M.w₀ ∧ M.Favored M.w₀ ∧
    -- Tier 3
    M.Agential M.w₀ ∧
    -- Tiers 2–4 about ONE being: the unique fundamental N brings about every
    -- world's contingent reality, is a mind, knows all of Ω, is the agent in O,
    -- satisfies P7's antecedent, acts on the best reasons, and O's outcome
    -- accords with the balance of value-grounded reasons.
    (∃ N, (∀ w, M.Fundamental w N ∧ ∀ t, M.Fundamental w t → t = N) ∧
      (∀ w, (∃ x, M.ContingentItem x ∧ M.E w x) → M.BringsAbout w N) ∧
      M.Mind N ∧ KnowsAll M N ∧ M.Agent M.w₀ N ∧ M.P7Antecedent M.w₀ N ∧
      M.ActsOnBest M.w₀ N ∧ M.AccordsValue M.w₀) 

/-- GOD, defined (v8.7): the unique fundamental being — necessary, uncaused,
    concrete, the same in every world — which brings about every world's
    contingent reality, is a mind, knows every possible contingent reality and
    the null alternative, is the agent whose state selects the actual first
    production, satisfies P7's antecedent, acts on the best reasons, and whose
    production accords with the balance of value-grounded reasons.
    This is exactly the conjunction `main` concludes about N; the definition
    adds nothing and only names it.  Whether the name is apt is a decision
    about the word (classical theists say this list IS what "God" means);
    that the thing exists, given `Axioms`, is `god_exists`. -/
def God (M : Model) (N : M.Thing) : Prop :=
  (∀ w, M.Fundamental w N ∧ ∀ t, M.Fundamental w t → t = N) ∧
  (∀ w, (∃ x, M.ContingentItem x ∧ M.E w x) → M.BringsAbout w N) ∧
  M.Mind N ∧ KnowsAll M N ∧ M.Agent M.w₀ N ∧ M.P7Antecedent M.w₀ N ∧
  M.ActsOnBest M.w₀ N ∧ M.AccordsValue M.w₀

/-- THE CONCLUSION, named (v8.7).  Given `Axioms`, God exists and is unique.
    The proof is `main` plus the uniqueness clause `main` already carries.
    What this theorem does NOT do is discharge `Axioms`: every field has an
    independence witness below, so the antecedent is not a theorem of logic.
    The argument's claim is that refusing the antecedent has the price stated
    in D22, not that refusing it is contradictory. -/
theorem god_exists : ∃ N, God M N ∧ ∀ N', God M N' → N' = N 
```

### A.5 The TR fork (v8.8–8.9): `Powers`, `PowersChannel`, `powers_all_tied`, `powers_fork`, `FalliblePowers`, `FalliblePowers.actual`

```lean
structure Powers (M : Model) where
  /-- state s is directed at manifestation-type D -/
  Directed : M.State → (M.Reality → Prop) → Prop
  /-- an unmasked power manifests its type: wherever the bearer produces a
      first item in virtue of a state directed at D, the produced reality has D -/
  manif : ∀ s D, Directed s D → ∀ w m, M.F w m → M.CausesVia w (M.bearer s) s m → D (M.realOf w)

    first item at every world with non-empty output.  `NoTR`, `W_Nat` and
    `W_Pref` all have one. -/
def PowersChannel (M : Model) (s : M.State) : Prop :=
  M.NecState s ∧ ∀ w, (∃ x, M.F w x) → ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m

    powers naturalist, from `manif` alone — no P7, no P8, no w₀ restriction. -/
theorem powers_all_tied {s : M.State} (hs : PowersChannel M s)
    (hD : Pw.Directed s M.Maximal) :
    ∀ r r', M.InOmega r → M.InOmega r' → M.AtLeast r r' ∧ M.AtLeast r' r

    at some productive world — D holds there and maximality does not — or
    ties every possible reality on the balance. -/
theorem powers_fork {s : M.State} (hs : PowersChannel M s) {D : M.Reality → Prop}
    (hD : Pw.Directed s D) :
    (∃ w, (∃ x, M.F w x) ∧ D (M.realOf w) ∧ ¬ M.Maximal (M.realOf w)) ∨
    (∀ r r', M.InOmega r → M.InOmega r' → M.AtLeast r r' ∧ M.AtLeast r' r)

    is said about other worlds. -/
structure FalliblePowers (M : Model) where
  Directed : M.State → (M.Reality → Prop) → Prop
  manif₀ : ∀ s D, Directed s D → ∀ m, M.F M.w₀ m → M.CausesVia M.w₀ (M.bearer s) s m → D (M.realOf M.w₀)

    the properties the actual reality has.  `manif₀` is immediate.  This is
    the weakest structure the fallible reading can mean and the one most
    favourable to it. -/
def FalliblePowers.actual (M : Model) (s : M.State) : FalliblePowers M :=
  ⟨fun st D => st = s ∧ D (M.realOf M.w₀), fun _ _ ⟨_, h⟩ _ _ _ => h⟩
```


