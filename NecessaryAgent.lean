/-
  A Necessary Agent — formal skeleton (core Lean 4.33.1, no Mathlib)
  ===================================================================

  Every [D] line of the prose argument (v5) is a theorem here.  Every
  premise of §2 is a field of `Axioms`.  Definitions of §1 are the `def`s in
  `namespace Model`.  Nothing is assumed beyond the fields of `Axioms` plus
  two framework facts, `F1` (causal relata exist at the world in which they
  are related) and `Src` (the unpacking of "derived").

  STATUS
  - Compiles with zero `sorry`; every certified result depends only on
    propext, choice, Quot.sound (see the #print axioms lines at the end).
  - Premises are named propositions (`X_stmt M`).  `Core` bundles the
    framework and Tier 1–2 premises; `Axioms0 extends Core` adds CE, NBL, GG,
    CH, TR (from which P3, NI and P10 are DERIVED); `Axioms extends Axioms0`
    adds P4⁺.  Theorems in `section CoreTheorems` take only `Core`; their
    types certify that they use none of CE, NBL, GG, CH, TR, P4⁺.
  - P4⁺ ADOPTED (v7): no necessary concrete being other than N.  With it,
    `identify` is unconditional and `main` concludes about ONE being — the
    unique fundamental N is the mind, knows all of Ω, is the agent, and its
    production accords with the moral balance.  Rationale: of the premises
    that could settle the count, P4⁺ is the one a skeptic has least reason to
    deny (parsimony); only a doctrine of necessary generation motivates its
    denial.  `Toy.W_Id.three_distinct` is now the independence witness for
    P4⁺: `Axioms0` holds, P4⁺ fails, identity fails.  `identify_of` keeps the
    conditional form for readers who reject P4⁺.
  - Optional premises, stated but not in `Core`/`Axioms`, are hypotheses of
    the theorems that use them: P6′ (`T3_11'`, the route that does not need
    single-source derivation), ID (`T2_4'`, type-level non-determinism), P4⁺
    (`identify`, mind = agent = N), and CatU + CatOpen (`P12_of_cat`: P12
    is a theorem from them; `P12_of_cat` uses no axioms).
  - v7.1 (after external review): three theorems retyped over `Axioms0` so
    that none is proved from premises contradicting its own hypothesis
    (`stateless_originator_is_neither` was vacuous over `Axioms`, whose P4⁺
    already yields a state of N); P4⁺ added to every independence witness's
    "all others hold" list (W_P4 records that P4⁺ fails there along with P4);
    `all_worlds_accord'`: HasProp ∨ every possible first production accords
    with the balance of value-grounded reasons (a consequence of stating the
    Tier 2–4 premises for all worlds; bears on the evidential argument from
    evil); `realOf` defined, `Accurate` content-indexed, MR removed (D12, D14,
    D15).
  - v8.11 — III.4 REWRITTEN (prose only; no Lean change).  The evil-god reply
    is withdrawn: the certified core is symmetric under inverting `AtLeast`
    (D16), the asymmetry lives in reading the balance as value-grounded
    reasons (D15), and inverting it costs a theory of practical reason on
    which the bad is a reason for.  Smith's distinct-existences thesis is
    SATISFIED by the `Rep`/`Sens` split (`NoTR`, `NoMind`), and GG is a claim
    about the content of the essential `Sens`.  The cost of ¬GG is counted
    (`DState`: a second essential feature unconnected to the first), and the
    residue (`W_Pref.residue`) is named in III.4 as shared.
  - v8.10 — P4 NARROWED TO UNIQUENESS.  `Core` is now `CoreNoP4` + P4, and
    `section CoreTheorems` is typed over `CoreNoP4` (only `T2_8` takes
    `Core`).  The types therefore certify which results use uniqueness:
    `no_modal_collapse`, `T2_4`, `T2_15`, `mental_of_nonactual`, and
    `mind_of_CE_NBL` (with CE, NBL, CH, TR explicit) do NOT; `T2_8`,
    `identify`, `main`, `god_exists`, and the originator theorems do.
    `W_P4.two_minds`: in the ¬P4 model both fundamental beings are
    necessary minds — denying P4 is polytheism, not naturalism.  The prose
    (III.6) develops the coordination argument as a trilemma for the second
    being and locates uniqueness at IDF, identity of indiscernible
    fundamentals — anti-haecceitism at the foundation, the commitment CE
    already carries against its haecceitistic exit.  All 49 prior results
    unchanged; #print axioms ×50.
  - v8.9 — THE FALLIBLE READING, finished.  `FalliblePowers` states the
    powers naturalist's escape from `powers_all_tied` with the only axiom it
    can keep (`manif₀`: manifests at w₀).  `FalliblePowers.actual` shows it
    is free — every model with a channel state has one.  `W_Nat.fallible_witness`
    and `W_Pref.fallible_witness`: the SAME generic structure directs the
    channel state at maximality on the bare naturalist's model and on the
    theist's, which differ only in `Sens`, `Rep`, `Mental`.  So fallible
    directedness distinguishes nothing; what distinguishes the theist from
    the bare naturalist is whether the alternatives figure.  The prose (III.5)
    closes the reading on Mumford–Anjum (no interference at the foundation),
    Vetter (degree is a propensity; no degree is bare) and Bird (no
    stimulus).  One sentence remains to the powers naturalist — "the
    alternatives figure and the state is about none of them" — answered by
    Oderberg's abstraction criterion, which is philosophical and stays so.
    #print axioms ×49.
  - v8.8 — THE TR FORK, certified (D23).  The powers naturalist's primitive
    is formalized as an OPTIONAL extension `Powers M` — `Directed s D` with
    the powers theorist's own axiom `manif` (an unmasked power manifests its
    type; nothing masks at the foundation).  Nothing in `Model` or `Axioms`
    changes.  Certified: `powers_all_tied` — a powers channel directed at
    maximality ties every possible reality (all_tied with no P7/P8 and no w₀
    restriction, from `manif` alone); `powers_fork` — a powers channel
    directed at any D either fails to track the good at some productive
    world or ties every reality; `W_Nat.powers_witness` (Horn 2: a powers
    channel directed at a determinate type, no `Sens`, CE false — the bare
    naturalist); `W_Nat.no_powers_at_maximal` and `W_Pref.no_powers_at_maximal`
    (on a discriminating balance no powers structure directs the channel
    state at maximality — the theist's selecting state is an inclination,
    NOT a power); `NoTR.powers_horn1` (Horn 1 consistent only in a tied
    world).  Consequence: the powers naturalist who denies TR and nothing
    else must hold that every possible reality is tied on the balance, or
    his channel does not track the good and the intra-D contrast is bare.
    What remains open is the FALLIBLE reading (a directedness at maximality
    that may fail at w′), which by `W_Pref.no_powers_at_maximal` is not a
    power and is exactly `Sens`-as-inclination — where TR's question returns.
    #print axioms ×47.
  - v8.7 — THE CONCLUSION NAMED, and the exits priced.  (i) `God M N` is
    DEFINED as the conjunction `main` concludes about N (unique fundamental,
    brings about every world's contingent reality, mind, knows all of Ω, agent,
    acts on the best reasons, production accords with the balance), and
    `god_exists` certifies: given `Axioms`, God exists and is unique.  Nothing
    new is assumed; the theorem only names what `main` already proves.
    (ii) The v8.5 review's Lean-side fixes not yet applied are applied: the
    dead `Finite` definition is removed (P1 is well-founded; nothing used it);
    the `Favored` docstring flags its "because" gloss as interpretive (D20);
    the CE docstring says "governed by objective propensities" (= `HasProp`),
    matching the statement rather than the stronger `PropGoverned`.
    (iii) D21 records the empirical status of CatOpen/CatU after a
    conservative survey of the fine-tuning literature: CatOpen (sharp kind-
    boundaries) is supported by the constants of our laws; CatU (uncountably
    many kinds) is NOT — the honest independent count of sharply-bounded
    constraints is ~3–5 — so CatU must be defended over the space of possible
    LAW-STRUCTURES, a modal claim, and the empirical case against chance rests
    on non-normalizability (Schiffrin–Wald 2012), not on CatU.
    (iv) D22 states the two exits a serious naturalist takes and what each
    costs, in the form the prose should use.  (v) D23 records the TR fork
    against the powers naturalist as the argument's central open burden.
  - v8.6 — after the second external review.  (i) `Toy.NoTR` is now mindless
    and representation-free: the POWERS NATURALIST'S complete package — N
    has a necessary state through which the production is sensitive to a
    property and produces, but that represents no alternative — satisfies
    every field but TR.  So there are TWO single-premise naturalist packages
    (¬CE: `W_Nat`; ¬TR: `NoTR`), and §8.3/§III.9's "only CE" claim is
    withdrawn.  (ii) `W_Pref.residue`: the theist's own agent, in the same
    necessary state and satisfying the P7-antecedent, produces the strictly
    WORSE reality at the non-actual world — the libertarian residue is
    certified and is not confined to ties.  (iii) D20 records that `Sens` is
    inclination, not necessitation, and that the "because" gloss on Favored
    is interpretive.  (iv) P1 is well-founded (no "finite" anywhere).
  - v8.5 — THE NATURALIST'S COMPLETE PACKAGE, certified.  `Toy.W_Nat.witness`:
    a necessary concrete initial state that produces one of two genuinely
    different contingent realities, with no chance, no favoring, no
    representation anywhere, and no mind — Oppy's naturalism — satisfies
    EVERY field of `Axioms` except CE.  So the entire disagreement between
    the argument and its strongest opponent is the single premise CE: whether
    anything about the outcome mattered to which reality was produced.
  - v8.4 — P1 WEAKENED to well-foundedness.  "Every item has finitely many
    ancestors" was stronger than any proof used and conflicted with continuum
    physics (a past light cone has infinitely many events).  P1 now says
    ancestry is well-founded at every world: no infinite descending chain of
    causes.  Infinite branching is permitted.  `exists_minimal` is proved by
    well-founded induction; `W_P1` (an infinite descending chain) remains the
    independence witness.
  - v8.3 — Phase 3 (attributes) and latent commitments surfaced.
    `exists_maximal`: the premises ENTAIL that the actual reality is maximal
    on the balance of value-grounded reasons — a top exists.  Rowe's
    no-best-world thesis is therefore not a neutral assumption a reader can
    hold alongside P7/P8; `T4_6s` gives the satisficing alternative under the
    optional premise P8s (acting on the best reasons makes the outcome good
    enough, `Good`).  `knows_actual` (optional SK: a selecting representation
    represents the reality it selects as the one that obtains): the agent
    accurately represents the ACTUAL contingent reality — the entire
    contingent content of the actual world — as actual.  Content gains
    `act r`.
  - v8.2 — P6 REPLACED BY FA, and the mind conclusion closed by elimination.
    P6 ("an underived ahistorical representing state is mental") is gone.
    In its place: FA (factivity of ahistorical non-mental content) — a state
    that is not mental and has no contingent history can represent a reality
    as an alternative only if it obtains, and producing nothing only if
    nothing contingent exists.  Every naturalistic theory of content grounds
    content in relations to actual things (history: Wright/Millikan;
    covariation: Dretske; exploitable isomorphism to an actual target:
    Cummins/Shea); without history, informational content is factive
    (Dretske 1981, 1986).  The selecting state represents producing nothing
    as an alternative (TR, P5), is ahistorical, and the actual world is not
    empty — so it is mental (`mental_of_nonactual`).  Consequences: the
    agent is ALWAYS a mind (`T3_11'` is now unconditional); the root regress
    and `Src` are no longer on the path to the mind conclusion
    (`mind_of_CE_NBL` uses FA directly); `Toy.NoMind` is the FA witness —
    the structural-representation skeptic's world, where an ahistorical
    mindless state represents non-actual alternatives; and the identity
    matrix loses its "agent that is not a mind" rows (`originator_neither`
    replaces `three_distinct`).
  - v8.1 — P3 DERIVED, and the MIND conclusion freed from every value
    premise.  P3 ("no bare selection") follows (`P3_of`) from:
      CE  — weak contrastive explicability: at a world with non-empty output,
            which reality obtains is not TOTALLY brute — the production is
            deterministic, or propensity-governed, or sensitive through some
            channel to SOME property of the candidates (a restricted PSR that
            never necessitates; `no_modal_collapse` certifies the premises
            leave the outcome contingent);
      NBL — no bearer-free selection: the ground's laws as such select
            nothing; every sensitivity runs through a state of a thing
            (entails NI);
      GG  — guise of the good: whatever a state of the ground tracks in
            selecting, the selection is sensitive to maximality.
    `mind_of_CE_NBL`: from Core + CE + NBL + CH + TR (with P6 via the root
    regress) — none of which mentions value — there is a necessary concrete
    mind whose state selects the first contingent items.  GG is needed only
    for Tier 4.  Witnesses: `Bare` (¬CE: totally brute selection),
    `Axiarch` and `DLaw` (¬NBL: value-sensitive law / base-tracking law, no
    bearer), `DState` (¬GG: a state selecting for a non-evaluative property —
    P3 fails, the production is not favored, and a necessary mind still
    exists).
  - v8 — P10 DERIVED.  "Favored" and "selected because" are no longer
    primitives.  The model has a single primitive `Sens w P ch`: the
    production at w is sensitive to property P of candidate realities THROUGH
    channel ch, where a channel is either the laws/dispositions of the ground
    (`Chan.law`) or a state of a thing (`Chan.state s`).  Favored w :=
    ∃ ch, Sens w Maximal ch; SelectedBecause w s := Sens w Maximal (state s).
    P10 follows (`P10_of`) from three premises stated without "favored",
    "represents", or "mental":
      NI  — no law channel is sensitive to maximality as such (Normative
            Inertness: value does no causal work except through states of
            things; naturalists rely on this in causal closure, debunking,
            and the queerness argument);
      CH  — a state channel is a causal channel: the state is one in virtue
            of which its bearer causes a member of F (the B-framework);
      TR  — a state channel carries the candidates as content (indicator
            content, non-mental; Dretske).
    Independence: `Toy.Axiarch` (value-sensitive LAW, no bearer — NI fails,
    the production is favored, no selecting representation; this is
    axiarchism), `Toy.NoCH`, `Toy.NoTR`.  `Toy.DLaw` certifies the deviance
    horn: a law tracking a descriptive property that coincides with
    maximality on every live alternative but is not maximality is BARE
    selection (P3 fails), not favored selection — so "the law tracks the
    base" is the P3 exit, not a P10 exit.  Not circular: NI locates the
    sensitivity (law vs. state of a thing), it does not mention content;
    relabeling the law as "a necessary state of N" concedes a selecting
    representation and moves the dispute to P6.
  - IDENTITY, fully mapped.  Certified from `Axioms0` alone:
    `originator_produces_mind_and_agent` — the mind and the agent are each
    either N or produced by N at every world (via `N_anc_of_nec_concrete`:
    every necessary concrete being other than N has N as an ancestor at every
    world).  Certified consistent with `Axioms` (`Toy.W_Id.matrix`, one
    generic proof over all bearer assignments): every assignment of the
    mind-role and agent-role to N, L, M — one being, either two-being split,
    or three distinct beings.  Only P4⁺ forces one (`identify`); a stateless
    originator forces N to be neither (`stateless_originator_is_neither`).
    P6′ merges mind into agent but leaves the originator apart
    (`agent_ne_originator_under_P6'`).
  - L2 is a theorem (`L2_of_P11`), proved in core Lean from an
    axiomatization of Archimedean ordered values and finitely additive
    measures; the measure-theory fact is no longer assumed.
  - CONSISTENCY: `Toy.premises_consistent` exhibits a finite model of all
    `Axioms` fields (two worlds, one of them with empty contingent reality).
    An earlier draft of this file was inconsistent — P12 was quantified over
    every propensity structure, including the one with no open sets, so
    `Axioms M → False` was provable and every theorem was vacuous.  Any
    future change to the premises must re-check the witnesses.
  - INDEPENDENCE of every contested premise: for each of P1, P2, P4, P5, P6,
    P9, P12, L4, CE, NBL, GG, CH, TR, P4⁺ there is a model (`Toy.*.witness`)
    in which every other `Axioms` field holds, that premise fails, and the
    conclusion it supports fails.  So none of them is idle and none is a
    consequence of the others.  Not covered: P7, P8 (Tier 4's abstract
    vocabulary makes their independence trivial and uninformative), P11 (its
    denial is non-Archimedean chance, Exit 2B(i)), and the framework facts
    F1, Src.

  MODELING DECISIONS (each resolves an ambiguity in the prose; each is a
  commitment the prose must own if it adopts this formalization):
  D1  Items are transworld individuals; existence varies by world.
      Consequence: "outcome" is a token plurality.  A production that fixed
      the outcome's *type* but not its tokens counts as non-deterministic,
      hence falls under L-tax and is bare unless favored or propensity-
      governed.  This shifts weight onto P3.  MADE EXPLICIT: `TypeDeterministic`
      and the optional premise ID (identity of indiscernibles at the
      foundation); `T2_4'` derives type-level non-determinism from ID.
  D2  O's outcome in w is F_w as a set; the empty set counts.  This is what
      makes 2.3 valid without assuming an empty contingent reality is
      impossible.
  D3  Determinism is relative to the ground's configuration, which is
      world-invariant by construction, so `Deterministic` reduces to "F is
      the same in every world."  `causes_in_ground` justifies taking the
      ground as O's setup (prose 2.10).
  D4  `SelectingRep` requires the state to be one *through which* its bearer
      causes an F-member ("in virtue of"), so it is a cause by B1 and no
      appeal to P0 or to "because ⇒ depends" is needed.  P10's consequent is
      literally the definiens of `Agential`.
  D5  Derivation: single source, whole content inherited, source is an
      ancestor (`Src`).  Multi-source or partial derivation is excluded.
      ALTERNATIVE: `T3_11'` reaches the same conclusion (agent is a mind and
      knows all of Ω) from P6′ without `Src` or the regress in 3.7.
  D6  No transfer of "selected because" to sources.  Mind attaches to the
      root state's bearer; agency to the selecting state's bearer.  `T3_11`
      delivers both beings separately; they coincide with N by P4⁺, now a
      field of `Axioms` (`identify`); without P4⁺ they need not
      (`W_Id.matrix`; `identify_of` keeps the conditional form).
  D7  Premises are stated for all worlds (= L3), with the exceptions of the
      chance premises (E, P11, P12, L4, CatU, CatOpen are stated at w₀; D11)
      and of P7 and P8 (v7.3; narrowed v8.7 per review A.3):
      P7 and P8 are stated at w₀ only, because they are principles about an
      agent's actual act; their all-worlds forms (`P7all`, `P8all`) entail
      that every possible contingent reality is tied on the balance
      (`all_tied`), which is left as a recorded consequence of the optional
      forms, not a theorem of `Axioms`.  `Toy.W_Pref` shows the restricted
      premises are consistent with a balance that strictly prefers the actual
      reality.
  D8  Tier 4's "reasons" vocabulary is abstract propositions.  P8 is the
      strengthened form "value-grounded reasons settle the balance," i.e.
      `ActsOnBest → AccordsValue`.  The prose's "good in its essential
      constitution" is not formalized; the result stated is 4.6 + 4.2.
  D9  L2 is PROVED (`L2_of_P11`, via the generic `L2`).  The premise is P11,
      stated as exactly what the proof uses: propensity values form an
      Archimedean ordered additive structure (`ArchOrd`) with zero = vzero,
      and μ is a non-negative, finitely additive, monotone measure on a class
      of regions containing the open ones (`FinMeasure`).  ℚ is certified to
      satisfy `ArchOrd` in core Lean (`archRat`), and every witness model
      uses ℚ-valued propensities; ℝ satisfies the same eight axioms by
      inspection.  Nothing anywhere assumes ℝ or Mathlib.
  D10 P3 and P10 are restricted to worlds whose first-stage output is
      non-empty.  Unrestricted, together with D2 and L-tax, they entail that
      every world has a non-empty F — i.e. they would settle the prose's
      open problem §9.11 by fiat.  Both are only ever applied at w₀, where
      1.3 supplies non-emptiness.
  D11 The propensity structure (open regions `POpen`, distribution `μ`) is
      part of the model.  P12, L2/P11 and L4 are conditional on O being
      propensity-governed at w₀, exactly as the prose states them; residual
      chance inside a favored production is untouched (L-tax note).
  D12 "Knows" is `Knows t c`: some state of t represents content c and is
      accurate *with respect to c* (`Accurate : State → Content → Prop`;
      content-indexed, v7.1).  A content is a reality as an alternative, a
      consideration bearing on a reality, or producing nothing.  `KnowsAll t`
      collects these over all of Ω plus the empty alternative.  P5 requires
      the selecting representation to represent the empty alternative too.
  D14 A reality is a SET OF ITEMS, and the contingent reality of a world is
      DEFINED as the set of contingent items existing there (`realOf`, v7.1).
      Previously `Reality`/`realOf` were primitive and unconstrained, so a
      one-element `Reality` satisfied every premise and "knows every possible
      contingent reality" collapsed.  Now Ω is fixed by the model's own
      contingent content.
  D16 The balance of value-grounded reasons is a comparative `AtLeast r r'`
      over realities (v7.2).  `AccordsValue w` is DEFINED: the contingent
      reality of w is at least as well supported as every alternative in Ω
      and as producing nothing.  Under the all-worlds P7/P8 (not adopted)
      this would force every two possible realities to be tied (`all_tied`);
      under the adopted w₀-forms it does not (`W_Pref`).
  D15 MR ("some value-grounded reasons are moral") is NOT formalized (v7.1).
      In earlier drafts it was a bare atom conjoined to the conclusion and
      connected to nothing; "including moral ones" was never derived.  Tier 4's
      certified result is `AccordsValue`: the outcome accords with the balance
      of value-grounded reasons.  That the balance includes moral reasons is
      an interpretive premise stated in the prose, not a theorem.

  D20 `Sens` is inclination, not necessitation (see the field comment).  The
      restriction of P7/P8 to w₀ (D7) is what keeps inclination from being
      necessitation: with all-worlds P7/P8, `all_tied` follows and the agent
      never produces the worse; with w₀-P7/P8, `W_Pref.residue` shows it may.
      Either way the theist's package contains ONE bare contrast — which of
      the equally-maximal (all-worlds) or whether the inclination won (w₀) —
      as the naturalist's does.  The argument's claim is only that the
      theist's contrast lies among candidates a mind tracks.
  D21 Empirical status of the chance premises (v8.7).  On the most conservative
      numbers in the literature (Adams 2019 as baseline; Epelbaum et al. 2013;
      Huang–Adams–Grohs 2019; Jaffe–Jenkins–Kimchi 2009; Harnik–Kribs–Perez
      2006; Weinberg 1987; Tegmark–Rees 1998; Tegmark 1997), the life-
      permitting region of parameter space has SHARP boundaries in kind —
      deuteron bound/unbound, nuclei stable/unstable, galaxies form/never
      form, expand/recollapse, integer dimensionality — which is what CatOpen
      asserts.  But the honest count of INDEPENDENT sharply-bounded
      constraints is small (Λ, Q, light-quark masses, the low-entropy initial
      state, dimensionality), and variation WITHIN each window is gradual.  So
      the constants of our laws yield finitely many kinds, not uncountably
      many: CatU cannot be grounded there.  CatU is a claim about the modal
      space of possible law-structures (field content, forces, dimension,
      topology) and must be defended as such.  The empirical case against a
      propensity at the origin is that the natural (Liouville) measure over
      cosmological initial conditions does not normalize (Schiffrin & Wald
      2012), so `HasProp` has no measure to be true with; P11/L4 then close
      whatever measure a skeptic supplies instead.  Penrose's 10^(10^123) is
      a ratio of phase-space volumes under that measure and is NOT used as a
      probability anywhere in this argument.  Biological error rates
      (proofreading, translation fidelity) are evolved mechanisms and are not
      fine-tuning data; they are excluded.
  D22 The two exits (v8.7).  Every field has an independence witness, so every
      premise is deniable; the two a serious naturalist takes are these.
      EXIT 1, `W_Nat` (¬CE): the necessary foundation could have produced many
      realities, produced this one, and NOTHING bore on which — no law, no
      propensity, no tendency, no reason.  Its price: (a) the whole content of
      the actual first stage — under D21, Λ inside a ~2-order window against a
      ~120-order natural range, Q inside a ~2-order window, quark masses inside
      a nuclear-stability island, near-zero initial gravitational entropy
      against a 10^122 maximum, 3+1 dimensions — obtains with nothing bearing
      on any of it; (b) contrastive explanation is exempted at exactly one
      point, the foundation, and demanded everywhere above it; (c) the measure
      cosmology uses for initial conditions is rejected (or, kept, delivers
      Boltzmann brains).  EXIT 2, `NoTR` (¬TR): something bore on the outcome
      — the foundation has a necessary state directed at a determinate kind of
      reality — but that state is ABOUT nothing; the alternatives, including
      producing nothing, never figured.  Its price is the fork in D23.  The
      theist's residue (`W_Pref.residue`) is ONE binary fact — whether the
      inclination toward the best prevailed — of the kind every libertarian
      already pays at every free choice; the content of the outcome is
      explained by `Maximal`.  This asymmetry (what is left unexplained: a
      yes/no against the whole first stage; a familiar kind of gap against a
      new one) is the argument's claim over Exit 1.  It bites against a
      naturalist who accepts libertarian agency anywhere; against a
      compatibilist it does not, and the comparison there is content alone.
  D23 The TR fork (v8.7; certified v8.8 — see `Powers`, `powers_fork`).
      `Sens w P (state s)` is primitive, so `NoTR` may stipulate it for a
      determinate-type disposition.  The `Sens` comment says such a
      disposition is one in which "no alternatives figure", i.e. ¬CE, not ¬TR.
      v8.8 gives the powers naturalist his own primitive, `Directed s D`, with
      his own axiom `manif`, and certifies the fork from it:
      (i) `W_Nat.powers_witness` — a powers channel directed at a determinate
      type with no `Sens` is the bare naturalist's model: Horn 2 is ¬CE.
      (ii) `powers_all_tied` / `powers_fork` — a powers channel directed at
      MAXIMALITY ties every possible reality, because `manif` necessitates
      where `Sens` only inclines; so the powers naturalist who keeps GG (his
      channel tracks the good) inherits `all_tied` with no w₀ escape, and the
      one who drops it has a channel that does not track the good and a bare
      contrast among the D-realities.  (iii) `W_Pref.no_powers_at_maximal` —
      the theist's own selecting state, which fails at w′ (`residue`), is
      NOT a power on any `Powers` structure: `Sens` is inclination, and the
      powers naturalist cannot borrow the theist's discriminating balance.
      What remains open: the FALLIBLE reading — a directedness at maximality
      that may fail — which (iii) shows is not a power, and which is exactly
      `Sens`-as-inclination, where the alternatives figure and TR's question
      returns in full.  Ranging over unproduced alternatives is what Oderberg
      (2017) calls specific indifference/abstraction and reserves for the
      mental; the nil alternative is the lever, since a power directed at D
      is not directed at its own non-manifestation (III.5).
  D19 FA is stated for non-mental ahistorical states only.  Historical
      non-mental states may misrepresent and represent the non-actual —
      that is what selection history buys (Millikan) — so FA does not touch
      ordinary biological or artefactual representation.  The `nil`
      alternative is what makes the elimination bite even when Ω has a single
      member (`Toy.A`): "producing nothing" is non-actual at any world with
      contingent items.
  D17 Channels of sensitivity are exhaustively: the ground's laws/dispositions
      as such, or a state of a thing (`Chan`).  A skeptic who posits a third,
      sui generis "value-explanation without a subject" must articulate it;
      the reasons-explanation literature (Dancy, Alvarez) is agent-indexed.
  D18 Sensitivity is intensional: `Sens w P ch` is about the property P, and
      coextension on the live alternatives does not transfer it (Fodor's
      natural-kind constraint; Davidson's anomalism).  `DLaw` realizes this:
      a base-tracking law is sensitive to D, not to maximality.
  D13 Outcomes have a category (`cat`, ontological kind / law-structure).
      CatOpen says each category class is an open region of the similarity
      topology — no output is a limit of outputs of other categories; CatU
      says uncountably many categories are realized in Φ.  P12 follows
      (`P12_of_cat`).  `W_L4` shows both are satisfiable alongside every
      premise except L4.

  NOT FORMALIZED (by design): the skeptic-exit commentary, the ledger, the
  certainty ladder, 3.12 and the downstream-goodness caveat of 4.7.
-/
import Std
set_option autoImplicit false
open Classical

namespace NecessaryAgent

abbrev Pred (α : Type) := α → Prop

def Uncountable (ι : Type) : Prop := ¬ ∃ f : ι → Nat, Function.Injective f

/-- Representational content: a reality as an alternative, or a
    consideration bearing on a reality. -/
inductive Content (R C : Type) where
  | alt  (r : R)          -- r as an alternative
  | cons (c : C) (r : R)  -- consideration c bearing on r
  | nil                   -- producing nothing, as an alternative
  | act  (r : R)          -- r as the reality that actually obtains

/-! ## L2 proved: measure-theoretic lemma from an axiomatized value structure

The only property of "real-valued" propensities the argument uses is that the
values form an Archimedean ordered additive structure and μ is a non-negative,
finitely additive, monotone measure with the open regions measurable.  This
section proves L2 from exactly that.  ℚ is certified to satisfy `ArchOrd`
below (`archRat`); ℝ satisfies the same axioms by inspection; nothing assumes
ℝ or any external library. -/



/-! ### An injective pairing ℕ × ℕ → ℕ : (a, b) ↦ 2^a (2b+1). -/
def pair (a b : Nat) : Nat := 2 ^ a * (2 * b + 1)

theorem pow_succ_mul (n k : Nat) : 2 ^ (n+1) * k = 2 * (2 ^ n * k) := by
  rw [Nat.pow_succ, Nat.mul_comm (2^n) 2, Nat.mul_assoc]

theorem pow_two_mul_odd_inj : ∀ (a c o1 o2 : Nat), 2 ^ a * (2 * o1 + 1) = 2 ^ c * (2 * o2 + 1) →
    a = c ∧ o1 = o2 := by
  intro a
  induction a with
  | zero =>
    intro c o1 o2 h
    cases c with
    | zero => simp at h; omega
    | succ c =>
      exfalso
      rw [pow_succ_mul] at h
      simp at h; omega
  | succ a ih =>
    intro c o1 o2 h
    cases c with
    | zero =>
      exfalso
      rw [pow_succ_mul] at h
      simp at h; omega
    | succ c =>
      rw [pow_succ_mul, pow_succ_mul] at h
      have h' : 2 ^ a * (2 * o1 + 1) = 2 ^ c * (2 * o2 + 1) := by omega
      obtain ⟨rfl, rfl⟩ := ih c o1 o2 h'
      exact ⟨rfl, rfl⟩

theorem pair_inj {a b c d : Nat} (h : pair a b = pair c d) : a = c ∧ b = d :=
  pow_two_mul_odd_inj a c b d h


/-- Pigeonhole for countability: an uncountable type mapped to ℕ has an
    uncountable fiber. -/
theorem uncountable_fiber {ι : Type} (g : ι → Nat) (h : Uncountable ι) :
    ∃ n, Uncountable { i // g i = n } := by
  apply Classical.byContradiction
  intro hno
  have hall : ∀ n, ∃ f : { i // g i = n } → Nat, Function.Injective f := by
    intro n
    apply Classical.byContradiction
    intro hn
    exact hno ⟨n, hn⟩
  let f : ∀ n, { i // g i = n } → Nat := fun n => Classical.choose (hall n)
  have hf : ∀ n, Function.Injective (f n) := fun n => Classical.choose_spec (hall n)
  apply h
  refine ⟨fun i => pair (g i) (f (g i) ⟨i, rfl⟩), ?_⟩
  intro i j hij
  obtain ⟨e, e2⟩ := pair_inj hij
  -- transport f (g j) ⟨j, rfl⟩ to the fiber g i
  have key : ∀ (n : Nat) (hj : g j = n), f (g j) ⟨j, rfl⟩ = f n ⟨j, hj⟩ := by
    intro n hj; cases hj; rfl
  rw [key (g i) e.symm] at e2
  exact congrArg Subtype.val (hf (g i) e2)

/-- Every element of a list ⇒ countable. -/
theorem countable_of_mem_list {S : Type} (l : List S) (hl : ∀ s, s ∈ l) :
    ∃ f : S → Nat, Function.Injective f := by
  suffices h : ∀ l : List S, ∃ f : S → Nat, ∀ s t, s ∈ l → t ∈ l → f s = f t → s = t by
    obtain ⟨f, hf⟩ := h l
    exact ⟨f, fun s t hst => hf s t (hl s) (hl t) hst⟩
  intro l
  induction l with
  | nil => exact ⟨fun _ => 0, fun s _ hs => (by simp at hs)⟩
  | cons a l ih =>
    obtain ⟨f, hf⟩ := ih
    refine ⟨fun s => if s = a then 0 else f s + 1, ?_⟩
    intro s t hs ht hst
    by_cases hsa : s = a <;> by_cases hta : t = a <;> simp [hsa, hta] at hst
    · exact hsa.trans hta.symm
    · exact hf s t (by rcases List.mem_cons.1 hs with h | h; exact absurd h hsa; exact h)
        (by rcases List.mem_cons.1 ht with h | h; exact absurd h hta; exact h) hst

/-- An uncountable type has, for every m, a list of m distinct elements. -/
theorem exists_nodup_list {S : Type} (h : Uncountable S) :
    ∀ m, ∃ l : List S, l.Nodup ∧ l.length = m := by
  intro m
  induction m with
  | zero => exact ⟨[], List.nodup_nil, rfl⟩
  | succ m ih =>
    obtain ⟨l, hnd, hlen⟩ := ih
    have : ∃ s, s ∉ l := by
      apply Classical.byContradiction
      intro hno
      apply h
      exact countable_of_mem_list l (fun s => Classical.byContradiction fun hs => hno ⟨s, hs⟩)
    obtain ⟨s, hs⟩ := this
    exact ⟨s :: l, List.nodup_cons.2 ⟨hs, hnd⟩, by simp [hlen]⟩

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

namespace ArchOrd
variable {V : Type}

def nsmul (A : ArchOrd V) : Nat → V → V
  | 0, _ => A.zero
  | n+1, v => A.add v (nsmul A n v)

variable (A : ArchOrd V)

theorem nsmul_eq_rec (n : Nat) (v : V) : A.nsmul n v = iterAdd A.add A.zero v n := by
  induction n with
  | zero => rfl
  | succ n ih => show A.add v _ = A.add v _; rw [ih]

theorem nsmul_le_nsmul {a b : V} (h : A.le a b) (n : Nat) : A.le (A.nsmul n a) (A.nsmul n b) := by
  induction n with
  | zero => exact A.le_refl _
  | succ n ih => exact A.add_le_add _ _ _ _ h ih

theorem nsmul_add (n : Nat) (a b : V) : A.nsmul n (A.add a b) = A.add (A.nsmul n a) (A.nsmul n b) := by
  induction n with
  | zero => exact (A.zero_add _).symm
  | succ n ih =>
    simp only [nsmul, ih]
    -- a + b + (na + nb) = a + na + (b + nb)
    rw [A.add_assoc, A.add_assoc]
    congr 1
    rw [← A.add_assoc, A.add_comm b, A.add_assoc]

theorem zero_le_nsmul {v : V} (h : A.le A.zero v) (n : Nat) : A.le A.zero (A.nsmul n v) := by
  induction n with
  | zero => exact A.le_refl _
  | succ n ih =>
    have := A.add_le_add _ _ _ _ h ih
    rw [A.zero_add] at this
    exact this

end ArchOrd
open ArchOrd

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

section
variable {V X : Type} {A : ArchOrd V} {μ : (X → Prop) → V} {Open : (X → Prop) → Prop}
variable {ι : Type} (G : ι → X → Prop)

/-- Union of a list of regions. -/
def lunion : List ι → X → Prop
  | [] => fun _ => False
  | i :: l => fun x => G i x ∨ lunion l x

theorem lunion_meas (m : FinMeasure A μ Open) (hopen : ∀ i, Open (G i)) : ∀ l : List ι, m.Meas (lunion G l)
  | [] => m.meas_empty
  | i :: l => m.meas_union _ _ (m.meas_open _ (hopen i)) (lunion_meas m hopen l)

theorem lunion_mem {l : List ι} {x : X} (h : lunion G l x) : ∃ i, i ∈ l ∧ G i x := by
  induction l with
  | nil => exact h.elim
  | cons i l ih =>
    rcases h with h | h
    · exact ⟨i, List.mem_cons_self .., h⟩
    · obtain ⟨j, hj, hjx⟩ := ih h
      exact ⟨j, List.mem_cons_of_mem _ hj, hjx⟩

/-- Core counting step: for a list of n-fiber indices with no repeats,
    length • one ≤ n • μ(union). -/
theorem list_bound (m : FinMeasure A μ Open) (hopen : ∀ i, Open (G i))
    (hdisj : ∀ i j, i ≠ j → ∀ x, ¬ (G i x ∧ G j x))
    (n : Nat) (hn : ∀ i, A.le A.one (nsmul A n (μ (G i)))) :
    ∀ l : List ι, l.Nodup → A.le (nsmul A l.length A.one) (nsmul A n (μ (lunion G l))) := by
  intro l
  induction l with
  | nil =>
    intro _
    exact zero_le_nsmul A (m.nonneg _) n
  | cons i l ih =>
    intro hnd
    obtain ⟨hi, hnd'⟩ := List.nodup_cons.1 hnd
    have hd : ∀ x, ¬ (G i x ∧ lunion G l x) := by
      rintro x ⟨hix, hlx⟩
      obtain ⟨j, hj, hjx⟩ := lunion_mem G hlx
      have hij : i ≠ j := fun e => hi (e ▸ hj)
      exact hdisj i j hij x ⟨hix, hjx⟩
    have hadd : μ (lunion G (i :: l)) = A.add (μ (G i)) (μ (lunion G l)) :=
      m.additive _ _ (m.meas_open _ (hopen i)) (lunion_meas G m hopen l) hd
    show A.le (A.add A.one (nsmul A l.length A.one)) (nsmul A n (μ (lunion G (i :: l))))
    rw [hadd, nsmul_add]
    exact A.add_le_add _ _ _ _ (hn i) (ih hnd')

/-- L2: an uncountable pairwise-disjoint family of open regions cannot all
    have non-zero measure. -/
theorem L2 (m : FinMeasure A μ Open) (hunc : Uncountable ι) (hopen : ∀ i, Open (G i))
    (hdisj : ∀ i j, i ≠ j → ∀ x, ¬ (G i x ∧ G j x)) : ∃ i, μ (G i) = A.zero := by
  apply Classical.byContradiction
  intro hno
  have hpos : ∀ i, ∃ n : Nat, A.le A.one (nsmul A n (μ (G i))) := by
    intro i
    have hne : μ (G i) ≠ A.zero := fun e => hno ⟨i, e⟩
    obtain ⟨n, hn⟩ := A.arch_pos _ (m.nonneg _) hne
    exact ⟨n, by rw [nsmul_eq_rec]; exact hn⟩
  let g : ι → Nat := fun i => Classical.choose (hpos i)
  have hg : ∀ i, A.le A.one (nsmul A (g i) (μ (G i))) := fun i => Classical.choose_spec (hpos i)
  obtain ⟨n, hfib⟩ := uncountable_fiber g hunc
  -- restrict to the fiber
  let G' : { i // g i = n } → X → Prop := fun i => G i.1
  have hopen' : ∀ i, Open (G' i) := fun i => hopen i.1
  have hdisj' : ∀ i j : { i // g i = n }, i ≠ j → ∀ x, ¬ (G' i x ∧ G' j x) :=
    fun i j hij x => hdisj i.1 j.1 (fun e => hij (Subtype.ext e)) x
  have hn' : ∀ i : { i // g i = n }, A.le A.one (nsmul A n (μ (G' i))) := by
    intro i; have := hg i.1; rw [i.2] at this; exact this
  -- Archimedean bound
  obtain ⟨k, hk⟩ := A.arch (nsmul A n (μ (fun _ => True)))
  obtain ⟨l, hnd, hlen⟩ := exists_nodup_list hfib k
  have h1 := list_bound G' m hopen' hdisj' n hn' l hnd
  have h2 : A.le (nsmul A n (μ (lunion G' l))) (nsmul A n (μ (fun _ => True))) :=
    nsmul_le_nsmul A (m.mono _ _ (lunion_meas G' m hopen' l) m.meas_top (fun _ _ => trivial)) n
  have h3 := A.le_trans _ _ _ h1 h2
  rw [hlen, nsmul_eq_rec] at h3
  exact hk h3
end


/-! ### ℚ satisfies `ArchOrd` (core Lean; no Mathlib).  A dense ordered field
witness that the value-structure axioms are the ordinary ones. -/
namespace RatArch


theorem natCast_one' : ((1 : Nat) : Rat) = 1 := rfl
theorem zero_lt_one' : (0 : Rat) < 1 := by decide

theorem not_lt' {a b : Rat} (h : ¬ a < b) : b ≤ a := by
  rcases Rat.le_total (a := a) (b := b) with hab | hba
  · by_cases e : a = b
    · exact e ▸ Rat.le_refl
    · exact absurd (Rat.lt_iff_le_and_ne.2 ⟨hab, e⟩) h
  · exact hba

theorem lt_of_le_of_lt' {a b c : Rat} (h1 : a ≤ b) (h2 : b < c) : a < c := by
  apply Classical.byContradiction
  intro h
  have hca : c ≤ a := not_lt' h
  have hcb : c ≤ b := Rat.le_trans hca h1
  exact (Rat.not_le.2 h2) hcb

theorem iter_nat : ∀ m : Nat, iterAdd (· + ·) (0 : Rat) 1 m = (m : Rat)
  | 0 => rfl
  | m+1 => by
    show 1 + iterAdd (· + ·) (0 : Rat) 1 m = ((m+1 : Nat) : Rat)
    rw [iter_nat m, Rat.natCast_add, natCast_one', Rat.add_comm]

theorem iter_mul (v : Rat) : ∀ n : Nat, iterAdd (· + ·) (0 : Rat) v n = (n : Rat) * v
  | 0 => by show (0 : Rat) = ((0 : Nat) : Rat) * v; rw [show ((0:Nat):Rat) = 0 from rfl, Rat.zero_mul]
  | n+1 => by
    show v + iterAdd (· + ·) (0 : Rat) v n = ((n+1 : Nat) : Rat) * v
    rw [iter_mul v n, Rat.natCast_add, natCast_one', Rat.add_mul, Rat.one_mul, Rat.add_comm]

/-- an integer is ≤ its toNat, cast into ℚ -/
theorem intCast_le_toNat (c : Int) : (c : Rat) ≤ ((c.toNat : Nat) : Rat) := by
  have h : (c : Rat) ≤ ((c.toNat : Int) : Rat) := Rat.intCast_le_intCast.2 (Int.self_le_toNat c)
  rw [Rat.intCast_natCast] at h
  exact h

theorem lt_succ' (x : Rat) : x < x + 1 := by
  have : x + 0 < x + 1 := Rat.add_lt_add_left.2 zero_lt_one'
  rw [Rat.add_zero] at this
  exact this

/-- Archimedean: some natural exceeds any rational. -/
theorem arch (v : Rat) : ∃ m : Nat, ¬ (iterAdd (· + ·) (0 : Rat) 1 m ≤ v) := by
  refine ⟨v.ceil.toNat + 1, ?_⟩
  rw [iter_nat, Rat.natCast_add, natCast_one']
  apply Rat.not_le.2
  have h1 : v ≤ ((v.ceil.toNat : Nat) : Rat) := Rat.le_trans Rat.le_ceil (intCast_le_toNat _)
  exact lt_of_le_of_lt' h1 (lt_succ' _)

/-- Positive rationals reach 1 by iterated addition. -/
theorem arch_pos (v : Rat) (h0 : 0 ≤ v) (hne : v ≠ 0) :
    ∃ n : Nat, 1 ≤ iterAdd (· + ·) (0 : Rat) v n := by
  refine ⟨(v⁻¹).ceil.toNat, ?_⟩
  rw [iter_mul]
  have hu : v⁻¹ ≤ (((v⁻¹).ceil.toNat : Nat) : Rat) := Rat.le_trans Rat.le_ceil (intCast_le_toNat _)
  have := Rat.mul_le_mul_of_nonneg_right hu h0
  rw [Rat.inv_mul_cancel v hne] at this
  exact this

theorem add_le_add' {a b c d : Rat} (h1 : a ≤ b) (h2 : c ≤ d) : a + c ≤ b + d := by
  have e1 : a + c ≤ a + d := Rat.add_le_add_left.2 h2
  have e2 : a + d ≤ b + d := by
    rw [Rat.add_comm a d, Rat.add_comm b d]; exact Rat.add_le_add_left.2 h1
  exact Rat.le_trans e1 e2


end RatArch

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

/-- The zero measure with rational values is a finite measure for any class of
    open regions. -/
def zeroMeasureRat {X : Type} (Open : (X → Prop) → Prop) :
    FinMeasure archRat (fun _ : X → Prop => (0 : Rat)) Open where
  Meas := fun _ => True
  meas_open := fun _ _ => trivial
  meas_empty := trivial
  meas_top := trivial
  meas_union := fun _ _ _ _ => trivial
  nonneg := fun _ => Rat.le_refl
  additive := fun _ _ _ _ _ => (Rat.zero_add 0).symm
  mono := fun _ _ _ _ _ => Rat.le_refl

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

/-! ## The premises (§2), plus two framework facts

Each premise is a named proposition `X_stmt M`, so that a model can be shown
to satisfy some and violate others.  `Core` bundles the framework and Tier
1–2 premises; `Axioms0` adds CE, NBL, GG, CH, TR; `Axioms` adds P4⁺.  P3,
NI and P10 are derived. -/

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

/-- `Core` without P4 (v8.10): what the island-universe skeptic grants.
    Every theorem in `section CoreTheorems` except `T2_8` is typed over this
    structure, and `mind_of_CE_NBL` is typed over it plus CE, NBL, CH, TR.
    Their types therefore certify that the necessary-mind conclusion does not
    use uniqueness: denying P4 yields several necessary grounds, each subject
    to Tiers 2–3, not none. -/
structure CoreNoP4 (M : Model) where
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
  P5  : P5_stmt M
  FA  : FA_stmt M
  P7  : P7_stmt M
  P8  : P8_stmt M
  P9  : P9_stmt M
  P11 : P11_stmt M
  P12 : P12_stmt M
  L4  : L4_stmt M

/-- `CoreNoP4` plus P4.  Field access through the parent is transparent
    (`A.P1`, `A.E`, …); positional constructors list P4 last. -/
structure Core (M : Model) extends CoreNoP4 M where
  P4  : P4_stmt M

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

/-! ## Generic lemma: well-founded transitive relations have minimal elements -/

theorem exists_minimal {α : Type} (r : α → α → Prop) (wf : WellFounded r)
    (trans : ∀ a b c, r a b → r b c → r a c) (p : α → Prop) :
    ∀ x, p x → ∃ m, p m ∧ (m = x ∨ r m x) ∧ ∀ y, p y → ¬ r y m := by
  intro x
  induction x using wf.induction with
  | _ x ih =>
    intro hx
    by_cases h : ∃ y, p y ∧ r y x
    · obtain ⟨y, hy, hyx⟩ := h
      obtain ⟨m, hm, hmy, hmin⟩ := ih y hyx hy
      refine ⟨m, hm, Or.inr ?_, hmin⟩
      rcases hmy with rfl | hmy
      · exact hyx
      · exact trans _ _ _ hmy hyx
    · exact ⟨x, hx, Or.inl rfl, fun y hy hyx => h ⟨y, hy, hyx⟩⟩

/-! ## Tier 1 -/

section CoreTheorems
variable {M : Model} (A : CoreNoP4 M)
include A

theorem anc_exists {w : M.W} {x y : M.Item} (h : M.Anc w y x) : M.E w y ∧ M.E w x := by
  induction h with
  | single h => exact A.F1 _ _ _ h
  | tail _ h ih => exact ⟨ih.1, (A.F1 _ _ _ h).2⟩

omit A in
theorem anc_causes_something {w : M.W} {x y : M.Item} (h : M.Anc w y x) :
    ∃ z, M.Causes w y z := by
  induction h with
  | single h => exact ⟨_, h⟩
  | tail _ _ ih => exact ih

omit A in
theorem anc_last {w : M.W} {x y : M.Item} (h : M.Anc w y x) : ∃ z, M.Causes w z x := by
  induction h with
  | single h => exact ⟨_, h⟩
  | tail _ h _ => exact ⟨_, h⟩

/-- 1.2: from any contingent item existing in w, a first contingent item
    that is it or one of its ancestors. -/
theorem first_exists {w : M.W} {x : M.Item} (hx : M.ContingentItem x) (hex : M.E w x) :
    ∃ m, M.F w m ∧ (m = x ∨ M.Anc w m x) := by
  have trans : ∀ a b c, M.Anc w a b → M.Anc w b c → M.Anc w a c :=
    fun _ _ _ h1 h2 => Relation.TransGen.trans h1 h2
  obtain ⟨m, ⟨hmc, hme⟩, hmx, hmin⟩ :=
    exists_minimal (M.Anc w) (A.P1 w) trans (fun y => M.ContingentItem y ∧ M.E w y) x ⟨hx, hex⟩
  refine ⟨m, ⟨hmc, hme, ?_⟩, hmx⟩
  intro y hym hyc
  exact hmin y ⟨hyc, (anc_exists A hym).1⟩ hym

/-- 1.3 -/
theorem F_nonempty : ∃ m, M.F M.w₀ m := by
  obtain ⟨x, hx, hex⟩ := A.E
  obtain ⟨m, hm, _⟩ := first_exists A hx hex
  exact ⟨m, hm⟩

/-- A world has a contingent item iff its first-stage output is non-empty.
    So Ω may be defined by either condition. -/
theorem contingent_iff_F_nonempty (w : M.W) :
    (∃ x, M.ContingentItem x ∧ M.E w x) ↔ ∃ x, M.F w x := by
  constructor
  · rintro ⟨x, hx, hex⟩
    obtain ⟨m, hm, _⟩ := first_exists A hx hex
    exact ⟨m, hm⟩
  · rintro ⟨m, hm⟩
    exact ⟨m, hm.1, hm.2.1⟩

/-- Scope note / 1.5 generalized: every ancestor of a first contingent item
    is a necessary being or a necessary state of a necessary being. -/
theorem anc_of_first_in_ground {w : M.W} {m y : M.Item} (hm : M.F w m) (hy : M.Anc w y m) :
    M.InGround y := by
  have hnc : ¬ M.ContingentItem y := hm.2.2 y hy
  obtain ⟨z, hz⟩ := anc_causes_something hy
  match y, hz, hnc, hy with
  | .inl t, hz, hnc, _ =>
    have hconc : M.Concrete t := ⟨w, z, hz⟩
    have hnec : M.Nec t := Classical.byContradiction fun hn => hnc ⟨hn, hconc⟩
    exact ⟨hnec, hconc⟩
  | .inr s, hz, hnc, hy =>
    have hvia := (A.B1 w s z).1 hz
    have hbc : M.Causes w (.inl (M.bearer s)) z := (A.B1' w _ s z hvia).2
    have hconc : M.Concrete (M.bearer s) := ⟨w, z, hbc⟩
    have hes : M.E_state w s := (anc_exists A hy).1
    have hbs : M.Causes w (.inl (M.bearer s)) (.inr s) := A.B2 w s hes
    have hbm : M.Anc w (.inl (M.bearer s)) m :=
      Relation.TransGen.trans (Relation.TransGen.single hbs) hy
    have hbnc : ¬ M.ContingentItem (.inl (M.bearer s)) := hm.2.2 _ hbm
    have hbnec : M.Nec (M.bearer s) := Classical.byContradiction fun hn => hbnc ⟨hn, hconc⟩
    have hsnec : M.NecState s := Classical.byContradiction fun hn => hnc ⟨hn, hconc⟩
    exact ⟨hsnec, hbnec, hconc⟩

/-- 1.5: every cause of a first contingent item lies in the ground. -/
theorem causes_in_ground {w : M.W} {x : M.Item} (hx : M.CauseOfF w x) : M.InGround x := by
  obtain ⟨m, hm, hc⟩ := hx
  exact anc_of_first_in_ground A hm (Relation.TransGen.single hc)

/-- 1.4–1.5: a first contingent item has a cause, which is a necessary
    concrete thing or a necessary state of one. -/
theorem first_has_ground_cause {w : M.W} {m : M.Item} (hm : M.F w m) :
    ∃ y, M.Causes w y m ∧ M.InGround y := by
  obtain ⟨y, hy⟩ := A.P2 w m hm.1 hm.2.1
  exact ⟨y, hy, causes_in_ground A ⟨m, hm, hy⟩⟩

/-- 1.6: a first contingent item has a fundamental ancestor. -/
theorem first_has_fundamental_anc {w : M.W} {m : M.Item} (hm : M.F w m) :
    ∃ u, M.Fundamental w u ∧ M.Anc w (.inl u) m := by
  obtain ⟨y, hy, _⟩ := first_has_ground_cause A hm
  have trans : ∀ a b c, M.Anc w a b → M.Anc w b c → M.Anc w a c :=
    fun _ _ _ h1 h2 => Relation.TransGen.trans h1 h2
  obtain ⟨u', hu'm, _, hmin⟩ :=
    exists_minimal (M.Anc w) (A.P1 w) trans (fun z => M.Anc w z m) y (Relation.TransGen.single hy)
  -- u' is a thing
  match u', hu'm, hmin with
  | .inr s, hsm, hmin =>
    exfalso
    have hes : M.E_state w s := (anc_exists A hsm).1
    have hbs : M.Causes w (.inl (M.bearer s)) (.inr s) := A.B2 w s hes
    have hbm : M.Anc w (.inl (M.bearer s)) m :=
      Relation.TransGen.trans (Relation.TransGen.single hbs) hsm
    exact hmin _ hbm (Relation.TransGen.single hbs)
  | .inl u, hum, hmin =>
    have hg : M.InGround (.inl u) := anc_of_first_in_ground A hm hum
    refine ⟨u, ⟨hg.1, hg.2, ?_⟩, hum⟩
    intro c hc
    have hcm : M.Anc w c m := Relation.TransGen.trans (Relation.TransGen.single hc) hum
    exact hmin c hcm (Relation.TransGen.single hc)

/-- 1.7: every contingent item has a fundamental necessary concrete being
    as an ancestor. -/
theorem T1_7 {w : M.W} {x : M.Item} (hx : M.ContingentItem x) (hex : M.E w x) :
    ∃ u, M.Fundamental w u ∧ M.Anc w (.inl u) x := by
  obtain ⟨m, hm, hmx⟩ := first_exists A hx hex
  obtain ⟨u, hu, hum⟩ := first_has_fundamental_anc A hm
  refine ⟨u, hu, ?_⟩
  rcases hmx with rfl | hmx
  · exact hum
  · exact Relation.TransGen.trans hum hmx

theorem fundamental_exists : ∃ u, M.Fundamental M.w₀ u := by
  obtain ⟨x, hx, hex⟩ := A.E
  obtain ⟨u, hu, _⟩ := T1_7 A hx hex
  exact ⟨u, hu⟩

/-! ## Tier 2 -/

/-- 2.1: whatever O's outcome depends on is in the ground. -/
theorem T2_1 {w : M.W} {x : M.Item} (h : M.DependsOn w x) : M.InGround x := by
  have h0 := A.P0 w x h
  match x, h0 with
  | .inl t, ⟨m, hm, hc⟩ => exact causes_in_ground A ⟨m, hm, hc⟩
  | .inr s, ⟨m, hm, hvia⟩ =>
    exact causes_in_ground A ⟨m, hm, (A.B1 w s m).2 hvia⟩

omit A in
/-- 2.2: the ground's configuration is the same in every world. -/
theorem T2_2 (w w' : M.W) :
    (fun _ : M.W => M.groundConfig) w = (fun _ : M.W => M.groundConfig) w' := rfl

omit A in
theorem det_const (h : M.Deterministic) (w w' : M.W) : M.F w = M.F w' := h w w' rfl

/-- 2.3–2.4: O is not deterministic. -/
theorem T2_4 : ¬ M.Deterministic := by
  intro hdet
  obtain ⟨m, hm⟩ := F_nonempty A
  match m, hm with
  | .inl t, hm =>
    have hcont : ¬ M.Nec t := hm.1.1
    obtain ⟨w', hw'⟩ : ∃ w', ¬ M.E_thing w' t :=
      Classical.byContradiction fun h => hcont fun w' => Classical.byContradiction fun hn => h ⟨w', hn⟩
    have : M.F w' (.inl t) := by
      have e := det_const hdet M.w₀ w'
      rw [← e]; exact hm
    exact hw' this.2.1
  | .inr s, hm =>
    have hcont : ¬ M.NecState s := hm.1.1
    obtain ⟨w', _, hw'⟩ : ∃ w', M.E_thing w' (M.bearer s) ∧ ¬ M.E_state w' s :=
      Classical.byContradiction fun h => hcont fun w' hb => Classical.byContradiction fun hn => h ⟨w', hb, hn⟩
    have : M.F w' (.inr s) := by
      have e := det_const hdet M.w₀ w'
      rw [← e]; exact hm
    exact hw' this.2.1

/-- 2.4′ (D1 made explicit): under ID — identity of indiscernibles at the
    foundation — O is not even type-deterministic. -/
theorem T2_4' (ID : ID_stmt M) : ¬ M.TypeDeterministic := fun h => T2_4 A (ID h)

omit A in
/-- L-tax, exhaustiveness. -/
theorem L_tax_exhaustive (hnd : ¬ M.Deterministic) (w : M.W) :
    M.Agential w ∨ M.Teleological w ∨ M.PropGoverned w ∨ M.Bare w := by
  by_cases hf : M.Favored w
  · by_cases ha : ∃ s, M.SelectingRep w s
    · exact Or.inl ⟨hf, ha⟩
    · exact Or.inr (Or.inl ⟨hf, fun h => ha h.2⟩)
  · by_cases hp : M.HasProp
    · exact Or.inr (Or.inr (Or.inl ⟨hnd, hf, hp⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨hnd, hf, hp⟩))

omit A in
/-- L-tax, exclusiveness. -/
theorem L_tax_exclusive (w : M.W) :
    ¬ (M.Agential w ∧ M.Teleological w) ∧ ¬ (M.Agential w ∧ M.PropGoverned w) ∧
    ¬ (M.Agential w ∧ M.Bare w) ∧ ¬ (M.Teleological w ∧ M.PropGoverned w) ∧
    ¬ (M.Teleological w ∧ M.Bare w) ∧ ¬ (M.PropGoverned w ∧ M.Bare w) := by
  refine ⟨fun h => h.2.2 h.1, fun h => h.2.2.1 h.1.1, fun h => h.2.2.1 h.1.1,
          fun h => h.2.2.1 h.1.1, fun h => h.2.2.1 h.1.1, fun h => h.2.2.2 h.1.2.2⟩

/-- 2.6–2.8: the unique fundamental being brings about every possible
    contingent reality. -/
theorem brings_about_of_P4 {N : M.Thing}
    (hN : ∀ w, M.Fundamental w N ∧ ∀ t, M.Fundamental w t → t = N) :
    ∀ w, (∃ x, M.ContingentItem x ∧ M.E w x) → M.BringsAbout w N := by
  refine fun w _ => ⟨?_, ?_⟩
  · intro y hy
    obtain ⟨z, hz⟩ := anc_last hy
    exact (hN w).1.2.2 z hz
  · intro x hx hex
    obtain ⟨u, hu, hux⟩ := T1_7 A hx hex
    have : u = N := (hN w).2 u hu
    subst this; exact hux

omit A in
/-- The one theorem in this section that uses P4.  Typed over `Core`. -/
theorem T2_8 (C : Core M) : ∃ N, ∀ w, (∃ x, M.ContingentItem x ∧ M.E w x) → M.BringsAbout w N := by
  obtain ⟨N, hN⟩ := C.P4
  exact ⟨N, brings_about_of_P4 C.toCoreNoP4 hN⟩

omit A in
/-- 2.9: every member of Φ is a possible outcome of O (definitional under D2). -/
theorem T2_9 {φ : Pred M.Item} (h : M.InPhi φ) : ∃ w, M.F w = φ := by
  obtain ⟨w, hw, _⟩ := h; exact ⟨w, hw⟩

/-- 2.10–2.15: O is not propensity-governed. -/
theorem T2_15 : ¬ M.PropGoverned M.w₀ := by
  intro h
  obtain ⟨ι, G, hunc, hopen, hne, hdisj⟩ := A.P12 h
  obtain ⟨i, hi⟩ := L2_of_P11 M A.P11 h ι G hunc hopen hdisj
  obtain ⟨φ, ⟨w, hFw, _⟩, hφ⟩ := hne i
  have h4 := A.L4 h (G i) (hopen i) hi w
  rw [hFw] at h4
  exact h4 hφ

/-- Reflexive-transitive closure of `Source` starting from s. -/
inductive SrcStar (M : Model) (w : M.W) (s : M.State) : M.State → Prop
  | refl : SrcStar M w s s
  | step {a b : M.State} : SrcStar M w s a → M.Source w a b → SrcStar M w s b

theorem srcstar_anc {w : M.W} {s a : M.State} (h : SrcStar M w s a) :
    a = s ∨ M.Anc w (.inr a) (.inr s) := by
  induction h with
  | refl => exact Or.inl rfl
  | step _ hsrc ih =>
    have hab := (A.Src _ _ _ hsrc).1
    rcases ih with rfl | ih
    · exact Or.inr hab
    · exact Or.inr (Relation.TransGen.trans hab ih)

theorem srcstar_content {w : M.W} {s a : M.State} (h : SrcStar M w s a) :
    ∀ c, M.Rep s c → M.Rep a c := by
  induction h with
  | refl => exact fun _ h => h
  | step _ hsrc ih => exact fun c hc => (A.Src _ _ _ hsrc).2.2 c (ih c hc)

theorem srcstar_repstate {w : M.W} {s a : M.State} (h : SrcStar M w s a) (hs : M.RepState s) :
    M.RepState a := by
  induction h with
  | refl => exact hs
  | step _ hsrc _ => exact (A.Src _ _ _ hsrc).2.1

/-- A selecting representation is an ancestor of an F-member, hence in the
    ground and ahistorical. -/
theorem causal_anc {w : M.W} {s : M.State}
    (hc : ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m) :
    ∃ m, M.F w m ∧ M.Anc w (.inr s) m := by
  obtain ⟨m, hm, hvia⟩ := hc
  exact ⟨m, hm, Relation.TransGen.single ((A.B1 w s m).2 hvia)⟩

theorem selecting_anc {w : M.W} {s : M.State} (hs : M.SelectingRep w s) :
    ∃ m, M.F w m ∧ M.Anc w (.inr s) m := causal_anc A hs.1

omit A in
theorem anc_first_ahistorical {w : M.W} {m : M.Item} {s : M.State}
    (hm : M.F w m) (h : M.Anc w (.inr s) m) : ¬ M.Historical w s := by
  rintro ⟨x, hxs, hxc⟩
  exact hm.2.2 x (Relation.TransGen.trans hxs h) hxc

/-- 3.7: the root (underived) representation.  Given a selecting
    representation s, there is an underived state s* that is s or an
    ancestor of s, inherits all of s's content, is a representing state,
    is ahistorical, and is a necessary state of a necessary concrete being
    in the ground. -/
theorem root_of_state {w : M.W} {s : M.State}
    (hc : ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m) (hrs : M.RepState s) :
    ∃ s', ¬ M.Derived w s' ∧ (s' = s ∨ M.Anc w (.inr s') (.inr s)) ∧
      (∀ c, M.Rep s c → M.Rep s' c) ∧ M.RepState s' ∧ ¬ M.Historical w s' ∧
      M.InGround (.inr s') := by
  obtain ⟨m, hm, hsm⟩ := causal_anc A hc
  have trans : ∀ a b c : M.State, M.Anc w (.inr a) (.inr b) → M.Anc w (.inr b) (.inr c) →
      M.Anc w (.inr a) (.inr c) := fun _ _ _ h1 h2 => Relation.TransGen.trans h1 h2
  have wfS : WellFounded (fun a b : M.State => M.Anc w (.inr a) (.inr b)) :=
    InvImage.wf (fun a : M.State => (Sum.inr a : M.Item)) (A.P1 w)
  obtain ⟨s', hs'star, hs's, hmin⟩ :=
    exists_minimal (fun a b : M.State => M.Anc w (.inr a) (.inr b)) wfS trans
      (SrcStar M w s) s SrcStar.refl
  have hund : ¬ M.Derived w s' := by
    rintro ⟨y, hy⟩
    exact hmin y (SrcStar.step hs'star hy) (A.Src _ _ _ hy).1
  have hs'm : M.Anc w (.inr s') m := by
    rcases hs's with rfl | h
    · exact hsm
    · exact Relation.TransGen.trans h hsm
  refine ⟨s', hund, hs's, srcstar_content A hs'star, srcstar_repstate A hs'star hrs,
    anc_first_ahistorical hm hs'm, anc_of_first_in_ground A hm hs'm⟩

theorem T3_7 {w : M.W} {s : M.State} (hs : M.SelectingRep w s) :
    ∃ s', ¬ M.Derived w s' ∧ (s' = s ∨ M.Anc w (.inr s') (.inr s)) ∧
      (∀ c, M.Rep s c → M.Rep s' c) ∧ M.RepState s' ∧ ¬ M.Historical w s' ∧
      M.InGround (.inr s') := root_of_state A hs.1 hs.2.1

/-- **Mentality by elimination.**  An ahistorical state that represents
    producing nothing as an alternative, at a world where something
    contingent exists, is mental (FA). -/
theorem mental_of_nonactual {w : M.W} {s : M.State} (hah : ¬ M.Historical w s)
    (hnil : M.Rep s .nil) (hne : ∃ x, M.F w x) : M.Mental s := by
  apply Classical.byContradiction
  intro hnm
  obtain ⟨m, hm⟩ := hne
  exact (A.FA w s hnm hah).2 hnil m ⟨hm.1, hm.2.1⟩

/-- 3.8: the root representation is mental; its bearer is a mind. -/
theorem T3_8 {w : M.W} {s' : M.State} (hah : ¬ M.Historical w s') (hnil : M.Rep s' .nil)
    (hne : ∃ x, M.F w x) : M.Mental s' ∧ M.Mind (M.bearer s') :=
  ⟨mental_of_nonactual A hah hnil hne, ⟨s', rfl, mental_of_nonactual A hah hnil hne⟩⟩

/-- 3.9–3.10: an ahistorical necessary representing state is accurate. -/
theorem T3_10 {w : M.W} {s : M.State} (hrep : M.RepState s) (hah : ¬ M.Historical w s)
    (hg : M.InGround (.inr s)) : M.AccurateAll s :=
  A.P9 w s hrep hah hg.1

/-- The selecting representation itself is ahistorical, necessary, in the
    ground, and accurate. -/
theorem selecting_props' {w : M.W} {s : M.State}
    (hc : ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m) (hrs : M.RepState s) :
    ¬ M.Historical w s ∧ M.InGround (.inr s) ∧ M.AccurateAll s := by
  obtain ⟨m, hm, hsm⟩ := causal_anc A hc
  have hah := anc_first_ahistorical hm hsm
  have hg := anc_of_first_in_ground A hm hsm
  exact ⟨hah, hg, T3_10 A hrs hah hg⟩

theorem selecting_props {w : M.W} {s : M.State} (hs : M.SelectingRep w s) :
    ¬ M.Historical w s ∧ M.InGround (.inr s) ∧ M.AccurateAll s := by
  obtain ⟨m, hm, hsm⟩ := selecting_anc A hs
  have hah := anc_first_ahistorical hm hsm
  have hg := anc_of_first_in_ground A hm hsm
  exact ⟨hah, hg, T3_10 A hs.2.1 hah hg⟩

/-- **No modal collapse.**  The premises do not make the produced reality
    necessary: some two worlds have different first-stage outputs.  (This is
    the defect formalization exposed in Gödel/Scott; here it is ruled out by
    theorem, not assumed away.) -/
theorem no_modal_collapse : ∃ w w', M.F w ≠ M.F w' := by
  apply Classical.byContradiction
  intro h
  apply T2_4 A
  intro w w' _
  exact Classical.byContradiction fun hne => h ⟨w, w', hne⟩

/-- **A necessary mind without any value premise.**  From Tier 1, weak
    contrastive explicability (CE), no bearer-free selection (NBL), the
    channel principles CH and TR, and FA (factivity of ahistorical non-mental
    content) — none of which mentions value, favoring, or mentality as a
    premise about representation — there is a necessary concrete being that
    is a mind and whose state selects the first contingent items: the
    selecting state represents producing nothing as an alternative, is
    ahistorical, and so cannot be non-mental.  No root regress, no `Src`.
    GG is needed only for the VALUE conclusion. -/
theorem mind_of_CE_NBL (hCE : CE_stmt M) (hNBL : NBL_stmt M) (hCH : CH_stmt M) (hTR : TR_stmt M) :
    ∃ (t : M.Thing) (s : M.State), M.Nec t ∧ M.Concrete t ∧ M.bearer s = t ∧
      (∃ m, M.F M.w₀ m ∧ M.CausesVia M.w₀ t s m) ∧ M.RepState s ∧
      (∃ P : M.Reality → Prop, M.Sens M.w₀ P (.state s)) ∧
      ∃ t', M.Nec t' ∧ M.Concrete t' ∧ M.Mind t' := by
  have hne := F_nonempty A
  have hΩ : M.InOmega (M.realOf M.w₀) := ⟨M.w₀, rfl, hne⟩
  -- a state channel exists
  have hstate : ∃ (P : M.Reality → Prop) (s : M.State), M.Sens M.w₀ P (.state s) := by
    rcases hCE M.w₀ hne with hd | hp | ⟨P, ch, hs⟩
    · exact absurd hd (T2_4 A)
    · -- propensities: then favored (2.15), and favored sensitivity has a state channel
      have hfav : M.Favored M.w₀ := by
        apply Classical.byContradiction
        intro hf
        exact T2_15 A ⟨T2_4 A, hf, hp⟩
      obtain ⟨ch, hch⟩ := hfav
      cases ch with
      | law => exact absurd hch (hNBL _ _)
      | state s => exact ⟨_, s, hch⟩
    · cases ch with
      | law => exact absurd hs (hNBL _ _)
      | state s => exact ⟨P, s, hs⟩
  obtain ⟨P, s, hs⟩ := hstate
  have hc := hCH _ s P hs
  have hnil : M.Rep s .nil := (hTR _ s P hs).1
  have hrs : M.RepState s := ⟨.nil, hnil⟩
  obtain ⟨hah, hg, _⟩ := selecting_props' A hc hrs
  exact ⟨M.bearer s, s, hg.2.1, hg.2.2, rfl, hc, hrs, ⟨P, hs⟩,
    ⟨M.bearer s, hg.2.1, hg.2.2, ⟨s, rfl, mental_of_nonactual A hah hnil hne⟩⟩⟩

/-- **Structural theorem on the ground.**  Every necessary concrete being other
    than the fundamental one has the fundamental one as an ancestor, at every
    world.  Proof: such a being is not fundamental, so it has a cause; its
    ancestors form a finite strict partial order whose minimal element is a
    thing (B2), uncaused, concrete, and necessary (a contingent one would have
    a cause by P2) — hence fundamental, hence N. -/
theorem N_anc_of_nec_concrete {N : M.Thing}
    (hN : ∀ w, M.Fundamental w N ∧ ∀ t, M.Fundamental w t → t = N) :
    ∀ w t, M.Nec t → M.Concrete t → t ≠ N → M.Anc w (.inl N) (.inl t) := by
  intro w t hnec hconc hne
  have hnotfund : ¬ M.Fundamental w t := fun hf => hne ((hN w).2 t hf)
  have hcaused : ∃ y, M.Causes w y (.inl t) :=
    Classical.byContradiction fun h => hnotfund ⟨hnec, hconc, fun y hy => h ⟨y, hy⟩⟩
  obtain ⟨y, hy⟩ := hcaused
  have trans : ∀ a b c, M.Anc w a b → M.Anc w b c → M.Anc w a c :=
    fun _ _ _ h1 h2 => Relation.TransGen.trans h1 h2
  obtain ⟨u, hut, _, hmin⟩ :=
    exists_minimal (M.Anc w) (A.P1 w) trans (fun z => M.Anc w z (.inl t)) y (Relation.TransGen.single hy)
  match u, hut, hmin with
  | .inr st, hst, hmin =>
    exfalso
    have hes : M.E_state w st := (anc_exists A hst).1
    have hbs : M.Causes w (.inl (M.bearer st)) (.inr st) := A.B2 w st hes
    exact hmin _ (Relation.TransGen.trans (Relation.TransGen.single hbs) hst) (Relation.TransGen.single hbs)
  | .inl u, hut, hmin =>
    have huncaused : ∀ c, ¬ M.Causes w c (.inl u) := fun c hc =>
      hmin c (Relation.TransGen.trans (Relation.TransGen.single hc) hut) (Relation.TransGen.single hc)
    have huconc : M.Concrete u := by
      obtain ⟨z, hz⟩ := anc_causes_something hut; exact ⟨w, z, hz⟩
    have hunec : M.Nec u := by
      apply Classical.byContradiction
      intro hn
      have hcont : M.ContingentItem (.inl u) := ⟨hn, huconc⟩
      obtain ⟨c, hc⟩ := A.P2 w _ hcont (anc_exists A hut).1
      exact huncaused c hc
    have hfund : M.Fundamental w u := ⟨hunec, huconc, huncaused⟩
    have : u = N := (hN w).2 u hfund
    subst this
    exact hut

end CoreTheorems

section FullTheorems
variable {M : Model} (A : Axioms0 M)
include A

/-- 2.16 -/
theorem T2_16 : ¬ M.Bare M.w₀ := A.P3 M.w₀ (F_nonempty A.toCore.toCoreNoP4)

/-- 2.17 -/
theorem T2_17 : M.Agential M.w₀ ∨ M.Teleological M.w₀ := by
  rcases L_tax_exhaustive (T2_4 A.toCore.toCoreNoP4) M.w₀ with h | h | h | h
  · exact Or.inl h
  · exact Or.inr h
  · exact absurd h (T2_15 A.toCore.toCoreNoP4)
  · exact absurd h (T2_16 A)

/-- 2.18 -/
theorem T2_18 : M.Favored M.w₀ := by
  rcases T2_17 A with h | h
  · exact h.1
  · exact h.1

/-! ## Tier 3 -/

/-- 3.3–3.4: O is agential. -/
theorem T3_4 : M.Agential M.w₀ :=
  ⟨T2_18 A, A.P10 M.w₀ (F_nonempty A.toCore.toCoreNoP4) (fun _ hx => causes_in_ground A.toCore.toCoreNoP4 hx) (T2_18 A)⟩

/-- 3.6 -/
theorem T3_6 : ∃ s, M.SelectingRep M.w₀ s ∧ M.RepAllOmega s := by
  obtain ⟨_, s, hs⟩ := T3_4 A
  exact ⟨s, hs, A.P5 M.w₀ s hs⟩

/-- Knowledge of all of Ω, including the empty alternative. -/
def KnowsAll (M : Model) (t : M.Thing) : Prop :=
  M.Knows t .nil ∧
  ∀ r, M.InOmega r → M.Knows t (.alt r) ∧ ∀ c, M.Bears c r → M.Knows t (.cons c r)

omit A in
theorem knowsAll_of_rep {t : M.Thing} {s : M.State} (hb : M.bearer s = t)
    (hall : M.RepAllOmega s) (hacc : M.AccurateAll s) : KnowsAll M t := by
  refine ⟨⟨s, hb, hall.1, hacc _ hall.1⟩, fun r hr => ⟨⟨s, hb, (hall.2 r hr).1, hacc _ (hall.2 r hr).1⟩,
    fun c hc => ⟨s, hb, (hall.2 r hr).2 c hc, hacc _ ((hall.2 r hr).2 c hc)⟩⟩⟩

/-- 3.11: (a) there is a necessary being in the ground that is a mind and
    knows all of Ω (the bearer of the underived root representation);
    (b) the agent in O (bearer of the selecting representation) also knows
    all of Ω. -/
theorem T3_11 :
    (∃ Nstar : M.Thing, M.Nec Nstar ∧ M.Concrete Nstar ∧ M.Mind Nstar ∧ KnowsAll M Nstar) ∧
    (∃ Ag : M.Thing, M.Nec Ag ∧ M.Concrete Ag ∧ M.Agent M.w₀ Ag ∧ M.Mind Ag ∧ KnowsAll M Ag) := by
  obtain ⟨s, hs, hall⟩ := T3_6 A
  have hne := F_nonempty A.toCore.toCoreNoP4
  obtain ⟨s', _, _, hcont, hrep, hah, hg⟩ := T3_7 A.toCore.toCoreNoP4 hs
  have hacc' : M.AccurateAll s' := T3_10 A.toCore.toCoreNoP4 hrep hah hg
  obtain ⟨hahs, hgs, haccs⟩ := selecting_props A.toCore.toCoreNoP4 hs
  have hall' : M.RepAllOmega s' :=
    ⟨hcont _ hall.1, fun r hr => ⟨hcont _ (hall.2 r hr).1, fun c hc => hcont _ ((hall.2 r hr).2 c hc)⟩⟩
  exact ⟨⟨M.bearer s', hg.2.1, hg.2.2, (T3_8 A.toCore.toCoreNoP4 hah hall'.1 hne).2, knowsAll_of_rep rfl hall' hacc'⟩,
         ⟨M.bearer s, hgs.2.1, hgs.2.2, ⟨s, rfl, hs⟩, (T3_8 A.toCore.toCoreNoP4 hahs hall.1 hne).2,
          knowsAll_of_rep rfl hall haccs⟩⟩

/-- 3.11′: the agent itself is a mind — now a corollary of FA, with no regress
    to a root representation and no use of `Src`. -/
theorem T3_11' :
    ∃ Ag : M.Thing, M.Nec Ag ∧ M.Concrete Ag ∧ M.Agent M.w₀ Ag ∧ M.Mind Ag ∧ KnowsAll M Ag :=
  (T3_11 A).2

/-! ### What is certified about the originator, the mind, and the agent -/

/-- The originator produces the mind and the agent: each is N or has N as an
    ancestor at every world.  Together with `identify` (one being under P4⁺)
    and `W_Id.three_distinct` (three beings without it), this is the complete
    certified picture: the roles may be filled by one, two, or three necessary
    beings, but everything other than N is produced by N. -/
theorem originator_produces_mind_and_agent :
    ∃ N, (∀ w, M.Fundamental w N) ∧
      (∃ Nstar, M.Mind Nstar ∧ KnowsAll M Nstar ∧ (Nstar = N ∨ ∀ w, M.Anc w (.inl N) (.inl Nstar))) ∧
      (∃ Ag, M.Agent M.w₀ Ag ∧ KnowsAll M Ag ∧ (Ag = N ∨ ∀ w, M.Anc w (.inl N) (.inl Ag))) := by
  obtain ⟨N, hN⟩ := A.P4
  obtain ⟨⟨Ns, hn1, hn2, hmind, hk1⟩, ⟨Ag, ha1, ha2, hag, _, hk2⟩⟩ := T3_11 A
  refine ⟨N, fun w => (hN w).1, ⟨Ns, hmind, hk1, ?_⟩, ⟨Ag, hag, hk2, ?_⟩⟩
  · by_cases h : Ns = N
    · exact Or.inl h
    · exact Or.inr fun w => N_anc_of_nec_concrete A.toCore.toCoreNoP4 hN w Ns hn1 hn2 h
  · by_cases h : Ag = N
    · exact Or.inl h
    · exact Or.inr fun w => N_anc_of_nec_concrete A.toCore.toCoreNoP4 hN w Ag ha1 ha2 h

/-- If the originator bears no states at all (a "simplicity" premise), then it
    is neither the mind nor the agent.  Stated as a hypothesis, not adopted. -/
theorem stateless_originator_is_neither (hS : ∀ N, (∀ w, M.Fundamental w N) → ∀ st, M.bearer st ≠ N) :
    ∃ N, (∀ w, M.Fundamental w N) ∧ (∀ t, M.Mind t → t ≠ N) ∧ (∀ t, M.Agent M.w₀ t → t ≠ N) := by
  obtain ⟨N, hN⟩ := A.P4
  have hNf : ∀ w, M.Fundamental w N := fun w => (hN w).1
  exact ⟨N, hNf, fun t ⟨st, hb, _⟩ e => hS N hNf st (hb.trans e),
              fun t ⟨st, hb, _⟩ e => hS N hNf st (hb.trans e)⟩

/-! ## Tier 4 -/

/-- 4.2: no contingent motivational state bears on O. -/
theorem T4_2 (w : M.W) : ∀ s, M.MotivState s → M.DependsOn w (.inr s) → M.NecState s :=
  fun _ _ hd => (T2_1 A.toCore.toCoreNoP4 hd).1

/-- 4.1: the agent in O satisfies P7's antecedent. -/
theorem T4_1 : ∃ Ag, M.Agent M.w₀ Ag ∧ M.P7Antecedent M.w₀ Ag := by
  obtain ⟨s, hs, hall⟩ := T3_6 A
  obtain ⟨_, _, hacc⟩ := selecting_props A.toCore.toCoreNoP4 hs
  exact ⟨M.bearer s, ⟨s, rfl, hs⟩, ⟨s, rfl, hs, hall, hacc⟩, T4_2 A M.w₀⟩

/-- 4.3–4.6: O's outcome accords with the balance of value-grounded reasons,
    including moral ones; the agent's act flowed from essential motivational
    states only. -/
theorem T4_6 : ∃ Ag, M.Agent M.w₀ Ag ∧ M.P7Antecedent M.w₀ Ag ∧ M.ActsOnBest M.w₀ Ag ∧
    M.AccordsValue M.w₀ := by
  obtain ⟨Ag, hag, hant⟩ := T4_1 A
  have h7 := A.P7 Ag hant
  obtain ⟨h8a, h8b⟩ := A.P8 Ag hant
  have hbest : M.ActsOnBest M.w₀ Ag := by
    rcases h7 with h | h
    · exact h
    · exact absurd h h8a
  exact ⟨Ag, hag, hant, hbest, h8b hbest⟩

/-- **The premises entail that a best reality exists.**  The actual contingent
    reality is maximal on the balance of value-grounded reasons.  So Rowe's
    no-best-world thesis ("for every reality there is a better") is NOT a
    neutral background assumption a reader can hold alongside the premises:
    accepting P7 and P8 commits one to a top.  Readers who deny a top must
    take the satisficing form P8s (`T4_6s`). -/
theorem exists_maximal : ∃ r, M.InOmega r ∧ M.Maximal r :=
  let ⟨_, _, _, _, hacc⟩ := T4_6 A
  ⟨M.realOf M.w₀, ⟨M.w₀, rfl, F_nonempty A.toCore.toCoreNoP4⟩, hacc⟩

/-- Satisficing Tier 4: with P8s in place of P8, the actual reality is good
    enough rather than maximal.  Takes P8s as an explicit hypothesis. -/
theorem T4_6s (P8s : P8s_stmt M) : ∃ Ag, M.Agent M.w₀ Ag ∧ M.P7Antecedent M.w₀ Ag ∧
    M.ActsOnBest M.w₀ Ag ∧ M.Good (M.realOf M.w₀) := by
  obtain ⟨Ag, hag, hant⟩ := T4_1 A
  have h7 := A.P7 Ag hant
  obtain ⟨h8a, h8b⟩ := P8s Ag hant
  have hbest : M.ActsOnBest M.w₀ Ag := by
    rcases h7 with h | h
    · exact h
    · exact absurd h h8a
  exact ⟨Ag, hag, hant, hbest, h8b hbest⟩

/-- **Knowledge of the actual world** (Phase 3, with SK): the agent accurately
    represents the actual contingent reality — the entire contingent content
    of the actual world — as the one that obtains. -/
theorem knows_actual (SK : SK_stmt M) :
    ∃ Ag, M.Agent M.w₀ Ag ∧ M.Knows Ag (.act (M.realOf M.w₀)) := by
  obtain ⟨s, hs, _⟩ := T3_6 A
  obtain ⟨_, _, hacc⟩ := selecting_props A.toCore.toCoreNoP4 hs
  have hr := SK _ s hs
  exact ⟨M.bearer s, ⟨s, rfl, hs⟩, ⟨s, rfl, hr, hacc _ hr⟩⟩

/-- **Every possible first production is value-accordant, or O has objective
    propensities.**  Since P3, P10, P5, P9, P7, P8 are stated for every world,
    the Tier 2–4 chain runs at any world with non-empty first-stage output.
    (T2_15 refutes propensity-governance only at w₀; HasProp itself is a global
    atom.)  Surfaced because it bears on Exit 4C. -/
theorem all_worlds_accord (P7all : P7all_stmt M) (P8all : P8all_stmt M) :
    ∀ w, (∃ x, M.F w x) → M.HasProp ∨ M.AccordsValue w := by
  intro w hne
  by_cases hp : M.HasProp
  · exact Or.inl hp
  · right
    have hfav : M.Favored w := by
      apply Classical.byContradiction
      intro hf
      exact A.P3 w hne ⟨T2_4 A.toCore.toCoreNoP4, hf, hp⟩
    obtain ⟨s, hs⟩ := A.P10 w hne (fun _ hx => causes_in_ground A.toCore.toCoreNoP4 hx) hfav
    have hall := A.P5 w s hs
    obtain ⟨_, _, hacc⟩ := selecting_props A.toCore.toCoreNoP4 hs
    have hant : M.P7Antecedent w (M.bearer s) :=
      ⟨⟨s, rfl, hs, hall, hacc⟩, fun _ _ hd => (T2_1 A.toCore.toCoreNoP4 hd).1⟩
    have h7 := P7all w _ hant
    obtain ⟨h8a, h8b⟩ := P8all w _ hant
    rcases h7 with h | h
    · exact h8b h
    · exact absurd h h8a

/-- With the balance given structure: unless O has objective propensities,
    every two possible contingent realities are tied on the balance of
    value-grounded reasons (each is at least as well supported as the other),
    and each is at least as well supported as producing nothing. -/
theorem all_tied (P7all : P7all_stmt M) (P8all : P8all_stmt M) (hp : ¬ M.HasProp) :
    ∀ w w', (∃ x, M.F w x) → (∃ x, M.F w' x) →
      M.AtLeast (M.realOf w) (M.realOf w') ∧ M.AtLeast (M.realOf w) M.emptyReality := by
  intro w w' hw hw'
  have h := (all_worlds_accord A P7all P8all w hw).resolve_left hp
  exact ⟨h.1 _ ⟨w', rfl, hw'⟩, h.2⟩

theorem all_worlds_accord' (P7all : P7all_stmt M) (P8all : P8all_stmt M) :
    M.HasProp ∨ ∀ w, (∃ x, M.F w x) → M.AccordsValue w := by
  by_cases hp : M.HasProp
  · exact Or.inl hp
  · exact Or.inr fun w hne => (all_worlds_accord A P7all P8all w hne).resolve_left hp

end FullTheorems

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

section WithP4plus
variable {M : Model} (A : Axioms M)
include A

/-- Identification: with P4⁺ in the premise set, the mind, the agent, and N
    coincide.  This section (`WithP4plus`) is the only part of the file that
    uses P4⁺; everything in `FullTheorems` is typed over `Axioms0`. -/
theorem identify :
    ∃ N, (∀ w, M.Fundamental w N) ∧ M.Mind N ∧ M.Agent M.w₀ N ∧ KnowsAll M N := by
  have P4' := A.P4plus
  obtain ⟨N, hN⟩ := A.P4
  have hNf : ∀ w, M.Fundamental w N := fun w => (hN w).1
  obtain ⟨⟨Ns, hn1, hn2, hmind, _⟩, ⟨Ag, ha1, ha2, hag, _, hknow⟩⟩ := T3_11 A.toAxioms0
  have e1 : Ns = N := P4' N Ns hNf hn1 hn2
  have e2 : Ag = N := P4' N Ag hNf ha1 ha2
  exact ⟨N, hNf, e1 ▸ hmind, e2 ▸ hag, e2 ▸ hknow⟩

/-! ## Summary -/

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
      M.ActsOnBest M.w₀ N ∧ M.AccordsValue M.w₀) := by
  obtain ⟨N0, hN0⟩ := A.P4
  obtain ⟨N, hNf, hmind, hag, hknow⟩ := identify A
  have e : N = N0 := (hN0 M.w₀).2 N (hNf M.w₀)
  subst e
  obtain ⟨Ag, ⟨st, hb, hs⟩, hant, hbest, hacc⟩ := T4_6 A.toAxioms0
  obtain ⟨_, hg, _⟩ := selecting_props A.toAxioms0.toCore.toCoreNoP4 hs
  have eAg : Ag = N := by
    have := A.P4plus N Ag hNf (hb ▸ hg.2.1) (hb ▸ hg.2.2)
    exact this
  subst eAg
  exact ⟨fundamental_exists A.toAxioms0.toCore.toCoreNoP4, T2_4 A.toAxioms0.toCore.toCoreNoP4, T2_15 A.toAxioms0.toCore.toCoreNoP4, T2_18 A.toAxioms0, T3_4 A.toAxioms0,
    ⟨Ag, hN0, brings_about_of_P4 A.toAxioms0.toCore.toCoreNoP4 hN0, hmind, hknow, hag, hant, hbest, hacc⟩⟩

/-- THE CONCLUSION, named (v8.7).  Given `Axioms`, God exists and is unique.
    The proof is `main` plus the uniqueness clause `main` already carries.
    What this theorem does NOT do is discharge `Axioms`: every field has an
    independence witness below, so the antecedent is not a theorem of logic.
    The argument's claim is that refusing the antecedent has the price stated
    in D22, not that refusing it is contradictory. -/
theorem god_exists : ∃ N, God M N ∧ ∀ N', God M N' → N' = N := by
  obtain ⟨_, _, _, _, _, N, hN⟩ := main A
  exact ⟨N, hN, fun N' hN' => (hN.1 M.w₀).2 N' (hN'.1 M.w₀).1⟩

end WithP4plus

/-! ## The TR fork (v8.8): powers against sensitivity

`Sens` is the argument's primitive: the candidates FIGURE in the producing
(D20).  The powers naturalist offers a different primitive — a state DIRECTED
at a determinate manifestation-type D (Molnar 2003; Oderberg 2017): physical
intentionality without representation.  `Powers M` bundles that primitive with
the one axiom powers theorists give it: an unmasked power manifests its type.
At the foundation nothing masks (D3: the ground is invariant across worlds),
so wherever the bearer produces in virtue of a directed state, the produced
reality has D.

`Directed` is NOT a field of `Model`.  The extension is optional; every
theorem below is typed over `Powers M`; nothing in `Axioms` mentions it.

What is certified (D23):
- `powers_all_tied`: a powers channel directed at MAXIMALITY ties every
  possible reality on the balance — `all_tied` for the powers naturalist,
  with no P7/P8 and no w₀ restriction available to him, because a power
  necessitates its manifestation where an inclination (`Sens`) need not.
- `powers_fork`: a powers channel directed at any D either fails to track
  the good at some productive world (D there, maximality not) or ties every
  possible reality.  So the powers naturalist chooses: a determinate D that
  is not maximality — his channel does not track the good, GG fails for it,
  and the contrast among D-realities is bare — or D = maximality with every
  reality tied — his "directed at the best" is directed at everything.
- `W_Nat.no_powers_at_maximal`, `W_Pref.no_powers_at_maximal`: on a
  discriminating balance no powers structure directs the channel state at
  maximality.  In particular the theist's own selecting state (`W_Pref`,
  which fails at w′ per `residue`) is an inclination and NOT a power.
- `W_Nat.powers_witness`: Horn 2 certified — the bare naturalist's model
  carries a powers channel directed at a determinate type with no `Sens`
  at all and CE false.  A power directed at a determinate type is
  `W_Nat` under another name.
- `NoTR.powers_horn1`: Horn 1 certified consistent — directed at
  maximality, every field but TR — in the one kind of model where it can
  be: one in which every reality is tied.

What is NOT certified, and remains the open burden: that a FALLIBLE
directedness at maximality (one that, like `Sens`, may fail at w′) is not a
power at all but an inclination whose alternatives figure — the reading on
which TR's question returns in full.  `Powers.manif` is the powers theorist's
own axiom; a theorist who drops it has dropped the power. -/

/-- The powers naturalist's primitive, with the powers theorist's own axiom. -/
structure Powers (M : Model) where
  /-- state s is directed at manifestation-type D -/
  Directed : M.State → (M.Reality → Prop) → Prop
  /-- an unmasked power manifests its type: wherever the bearer produces a
      first item in virtue of a state directed at D, the produced reality has D -/
  manif : ∀ s D, Directed s D → ∀ w m, M.F w m → M.CausesVia w (M.bearer s) s m → D (M.realOf w)

/-- A powers channel: a necessary state through which its bearer produces a
    first item at every world with non-empty output.  `NoTR`, `W_Nat` and
    `W_Pref` all have one. -/
def PowersChannel (M : Model) (s : M.State) : Prop :=
  M.NecState s ∧ ∀ w, (∃ x, M.F w x) → ∃ m, M.F w m ∧ M.CausesVia w (M.bearer s) s m

section PowersFork
variable {M : Model} (Pw : Powers M)

/-- A powers channel directed at maximality manifests maximality at every
    productive world. -/
theorem powers_all_maximal {s : M.State} (hs : PowersChannel M s)
    (hD : Pw.Directed s M.Maximal) :
    ∀ w, (∃ x, M.F w x) → M.Maximal (M.realOf w) := by
  intro w hne
  obtain ⟨m, hm, hcv⟩ := hs.2 w hne
  exact Pw.manif s _ hD w m hm hcv

/-- Hence every possible reality is tied on the balance: `all_tied` for the
    powers naturalist, from `manif` alone — no P7, no P8, no w₀ restriction. -/
theorem powers_all_tied {s : M.State} (hs : PowersChannel M s)
    (hD : Pw.Directed s M.Maximal) :
    ∀ r r', M.InOmega r → M.InOmega r' → M.AtLeast r r' ∧ M.AtLeast r' r := by
  intro r r' hr hr'
  obtain ⟨w, hw, hne⟩ := hr
  obtain ⟨w', hw', hne'⟩ := hr'
  have h1 := powers_all_maximal Pw hs hD w hne
  have h2 := powers_all_maximal Pw hs hD w' hne'
  rw [hw] at h1; rw [hw'] at h2
  exact ⟨h1.1 r' ⟨w', hw', hne'⟩, h2.1 r ⟨w, hw, hne⟩⟩

/-- A powers channel directed at maximality is inconsistent with a balance
    that strictly prefers any possible reality to any other. -/
theorem powers_no_preference {s : M.State} (hs : PowersChannel M s)
    (hD : Pw.Directed s M.Maximal) :
    ¬ ∃ r r', M.InOmega r ∧ M.InOmega r' ∧ M.AtLeast r r' ∧ ¬ M.AtLeast r' r := by
  rintro ⟨r, r', hr, hr', _, hn⟩
  exact hn (powers_all_tied Pw hs hD r r' hr hr').2

/-- THE FORK.  A powers channel directed at D either fails to track the good
    at some productive world — D holds there and maximality does not — or
    ties every possible reality on the balance. -/
theorem powers_fork {s : M.State} (hs : PowersChannel M s) {D : M.Reality → Prop}
    (hD : Pw.Directed s D) :
    (∃ w, (∃ x, M.F w x) ∧ D (M.realOf w) ∧ ¬ M.Maximal (M.realOf w)) ∨
    (∀ r r', M.InOmega r → M.InOmega r' → M.AtLeast r r' ∧ M.AtLeast r' r) := by
  by_cases h : ∃ w, (∃ x, M.F w x) ∧ ¬ M.Maximal (M.realOf w)
  · obtain ⟨w, hne, hnm⟩ := h
    obtain ⟨m, hm, hcv⟩ := hs.2 w hne
    exact Or.inl ⟨w, hne, Pw.manif s D hD w m hm hcv, hnm⟩
  · right
    intro r r' hr hr'
    obtain ⟨w, hw, hne⟩ := hr
    obtain ⟨w', hw', hne'⟩ := hr'
    have h1 : M.Maximal (M.realOf w) := Classical.byContradiction fun hnm => h ⟨w, hne, hnm⟩
    have h2 : M.Maximal (M.realOf w') := Classical.byContradiction fun hnm => h ⟨w', hne', hnm⟩
    rw [hw] at h1; rw [hw'] at h2
    exact ⟨h1.1 r' ⟨w', hw', hne'⟩, h2.1 r ⟨w, hw, hne⟩⟩

end PowersFork

/-! ### The fallible reading (v8.9)

`powers_all_tied` leaves the powers naturalist one escape: a directedness at
maximality that can FAIL — manifests at w₀, not at w′.  `FalliblePowers`
states that reading with the only axiom it can keep: the type manifests at
the actual world.  Two facts are certified below.

- Every `Powers` structure is a `FalliblePowers` structure (`Powers.fallible`),
  and every model with a channel state has one (`FalliblePowers.actual`):
  the generic structure that directs s at exactly the properties the actual
  reality has.  Fallible directedness is therefore FREE — it costs nothing
  and distinguishes nothing.
- The SAME generic structure lives on `W_Nat` and on `W_Pref`
  (`W_Nat.fallible_witness`, `W_Pref.fallible_witness`): on both, s is
  fallibly directed at maximality, manifests it at w₀, fails at w′.  The two
  models have identical causal structure and identical balance; they differ
  in `Sens`, `Rep`, `Mental` and nothing else.  So "a fallible directedness
  at the best" does not distinguish the powers naturalist from either the
  bare naturalist or the theist.  What distinguishes W_Pref from W_Nat is
  `Sens`: that the alternatives figure.  The powers naturalist who takes the
  fallible reading has said nothing until he says whether they do — and
  then he is `W_Nat` (they do not: bare, CE false) or he has the theist's
  inclination (they do: TR's question, III.5). -/

/-- Fallible directedness: the type manifests at the actual world; nothing
    is said about other worlds. -/
structure FalliblePowers (M : Model) where
  Directed : M.State → (M.Reality → Prop) → Prop
  manif₀ : ∀ s D, Directed s D → ∀ m, M.F M.w₀ m → M.CausesVia M.w₀ (M.bearer s) s m → D (M.realOf M.w₀)

/-- Every power is a fallible power. -/
def Powers.fallible {M : Model} (Pw : Powers M) : FalliblePowers M :=
  ⟨Pw.Directed, fun s D hD m hm hcv => Pw.manif s D hD M.w₀ m hm hcv⟩

/-- The generic fallible structure on any model: s is directed at exactly
    the properties the actual reality has.  `manif₀` is immediate.  This is
    the weakest structure the fallible reading can mean and the one most
    favourable to it. -/
def FalliblePowers.actual (M : Model) (s : M.State) : FalliblePowers M :=
  ⟨fun st D => st = s ∧ D (M.realOf M.w₀), fun _ _ ⟨_, h⟩ _ _ _ => h⟩

end NecessaryAgent


/-! ## Consistency and independence witnesses

Concrete models.  Every witness below states, as a single theorem, exactly
which premise statements hold, which one fails, and which conclusion fails.

Family `Toy.Mk` (two worlds, one with empty contingent reality; one necessary
being N with one necessary state s; a first contingent thing c caused by N in
virtue of s; a downstream contingent d) parametrized by Favored,
SelectedBecause, Rep, Mental, Accurate, HasProp.  Covers: consistency (all
premises), and independence of P3, P10, P5, P6, P9, P12.

Separate models: `W_P2` (an uncaused first contingent item), `W_P4` (two
fundamental beings), `W_P1` (an infinite causal chain), `W_L4` (uncountably
many worlds, a zero-propensity open region containing a possible outcome).

Nothing here is claimed to be philosophically realistic. -/

/-- A list cannot contain an injective image of ℕ. -/
theorem exists_notin_list {α : Type} (f : Nat → α) (hf : Function.Injective f) :
    ∀ l : List α, ∃ n, ∀ m, n ≤ m → f m ∉ l := by
  intro l
  induction l with
  | nil => exact ⟨0, fun _ _ h => by simp at h⟩
  | cons a l ih =>
    obtain ⟨n, hn⟩ := ih
    by_cases hk : ∃ k, f k = a
    · obtain ⟨k, hk⟩ := hk
      refine ⟨max n (k+1), fun m hm hmem => ?_⟩
      rcases List.mem_cons.1 hmem with h | h
      · have : m = k := hf (h.trans hk.symm)
        subst this
        exact Nat.lt_irrefl _ (Nat.lt_of_lt_of_le (Nat.lt_succ_self _) (Nat.le_trans (Nat.le_max_right _ _) hm))
      · exact hn m (Nat.le_trans (Nat.le_max_left _ _) hm) h
    · refine ⟨n, fun m hm hmem => ?_⟩
      rcases List.mem_cons.1 hmem with h | h
      · exact hk ⟨m, h⟩
      · exact hn m hm h

/-- Cantor: ℕ → Bool is uncountable. -/
theorem cantor : NecessaryAgent.Uncountable (Nat → Bool) := by
  rintro ⟨f, hf⟩
  let g : Nat → (Nat → Bool) := fun n =>
    if h : ∃ v, f v = n then Classical.choose h else fun _ => false
  have hg : ∀ v, g (f v) = v := by
    intro v
    have h : ∃ v', f v' = f v := ⟨v, rfl⟩
    show (if h : ∃ v', f v' = f v then Classical.choose h else fun _ => false) = v
    rw [dif_pos h]
    exact hf (Classical.choose_spec h)
  let d : Nat → Bool := fun n => !(g n n)
  have : d (f d) = !(g (f d) (f d)) := rfl
  rw [hg d] at this
  cases hd : d (f d) <;> simp [hd] at this

namespace Toy
open NecessaryAgent

/-- ℕ is an Archimedean ordered additive structure. -/
def archNat : ArchOrd Nat where
  le := (· ≤ ·)
  add := (· + ·)
  zero := 0
  one := 1
  le_refl := Nat.le_refl
  le_trans := fun _ _ _ => Nat.le_trans
  add_assoc := Nat.add_assoc
  add_comm := Nat.add_comm
  zero_add := Nat.zero_add
  add_le_add := fun _ _ _ _ => Nat.add_le_add
  arch := fun v => ⟨v + 1, by
    have key : ∀ m : Nat, iterAdd (· + ·) 0 1 m = m := by
      intro m; induction m with
      | zero => rfl
      | succ m ih => show 1 + iterAdd (· + ·) 0 1 m = m + 1; rw [ih]; omega
    show ¬ iterAdd (· + ·) 0 1 (v+1) ≤ v
    rw [key]; omega⟩
  arch_pos := fun v _ hv => ⟨1, by show 1 ≤ v + 0; omega⟩

inductive T | N | c | d deriving DecidableEq
inductive S | s deriving DecidableEq
abbrev Item := Sum T S

theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .c ∨ x = .inl .d ∨ x = .inr .s := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st; simp

def rank : Item → Nat
  | .inl .N => 0 | .inr .s => 1 | .inl .c => 2 | .inl .d => 3

/-- `v` : whether N causes c IN VIRTUE OF s (the s → c edge). -/
def causesB (v : Bool) : Bool → Item → Item → Bool
  | _,    .inl .N, .inr .s => true
  | true, .inl .N, .inl .c => true
  | true, .inr .s, .inl .c => v
  | true, .inl .c, .inl .d => true
  | _, _, _ => false

def ethingB : Bool → T → Bool
  | _, .N => true | w, .c => w | w, .d => w

theorem causes_rank (v : Bool) : ∀ w x y, causesB v w x y = true → rank x < rank y := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl <;>
    cases w <;> cases v <;> simp_all [causesB, rank]

def allItems : List Item := [.inl .N, .inl .c, .inl .d, .inr .s]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl <;> simp [allItems]

structure Params where
  sens     : Bool → (Pred (Sum T S) → Prop) → Chan S → Prop
  rep      : Content (Pred (Sum T S)) Unit → Prop
  mental   : Prop
  accurate : Prop
  hasProp  : Prop
  viaS     : Bool

/-- The model family. -/
def Mk (P : Params) : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB P.viaS w x y = true
  CausesVia := fun w t _ z => P.viaS = true ∧ t = .N ∧ z = .inl .c ∧ w = true
  DependsOn := fun w x => w = true ∧ (x = .inl .N ∨ (P.viaS = true ∧ x = .inr .s))
  Bears := fun _ _ => True
  Rep := fun _ c => P.rep c
  Source := fun _ _ _ => False
  Mental := fun _ => P.mental
  Accurate := fun _ _ => P.accurate
  Sens := P.sens
  HasProp := P.hasProp
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

section generic
variable (P : Params)
local notation "M" => Mk P

theorem anc_rank {w : Bool} {x y : (M).Item} (h : (M).Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank P.viaS _ _ _ h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank P.viaS _ _ _ h)

theorem nec_N : (M).Nec .N := fun w => by cases w <;> rfl
theorem not_nec_c : ¬ (M).Nec .c := fun h => by have := h false; simp [Mk, ethingB] at this
theorem not_nec_d : ¬ (M).Nec .d := fun h => by have := h false; simp [Mk, ethingB] at this
theorem necstate_s : (M).NecState .s := fun _ _ => trivial
theorem concrete_N : (M).Concrete .N := ⟨true, .inr .s, by simp [Mk, causesB]⟩
theorem concrete_c : (M).Concrete .c := ⟨true, .inl .d, by simp [Mk, causesB]⟩
theorem not_cont_N : ¬ (M).ContingentItem (.inl .N) := fun h => h.1 (nec_N P)
theorem not_cont_s : ¬ (M).ContingentItem (.inr .s) := fun h => h.1 (necstate_s P)
theorem cont_c : (M).ContingentItem (.inl .c) := ⟨not_nec_c P, concrete_c P⟩

theorem E_c {w : Bool} (h : (M).E w (.inl .c)) : w = true := by
  cases w
  · exact absurd (h : ethingB false .c = true) Bool.false_ne_true
  · rfl
theorem E_d {w : Bool} (h : (M).E w (.inl .d)) : w = true := by
  cases w
  · exact absurd (h : ethingB false .d = true) Bool.false_ne_true
  · rfl

theorem F_c : (M).F true (.inl .c) := by
  refine ⟨cont_c P, rfl, ?_⟩
  intro y hy
  have hr := anc_rank P hy
  rcases item_cases y with rfl|rfl|rfl|rfl
  · exact not_cont_N P
  · simp [rank] at hr
  · simp [rank] at hr
  · exact not_cont_s P

theorem F_char : ∀ w x, (M).F w x → w = true ∧ x = .inl .c := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl
  · exact absurd hx.1 (not_cont_N P)
  · exact ⟨E_c P hx.2.1, rfl⟩
  · exfalso
    obtain rfl := E_d P hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (by simp [Mk, causesB] : (M).Causes true (.inl .c) (.inl .d))) (cont_c P)
  · exact absurd hx.1 (not_cont_s P)

theorem fund_N (w : Bool) : (M).Fundamental w .N :=
  ⟨nec_N P, concrete_N P, fun y h => by
    rcases item_cases y with rfl|rfl|rfl|rfl <;> cases w <;> simp_all [Mk, causesB]⟩

theorem empty_world : ¬ ∃ x, (M).F false x := fun ⟨x, hx⟩ => by
  have := (F_char P _ _ hx).1; simp at this

theorem not_det : ¬ (M).Deterministic := by
  intro h
  have e : (M).F true = (M).F false := h true false rfl
  have hc := F_c P
  rw [e] at hc
  exact empty_world P ⟨_, hc⟩

theorem s_underived (w : Bool) : ¬ (M).Derived w .s := fun ⟨_, h⟩ => h
theorem s_ahistorical (w : Bool) : ¬ (M).Historical w .s := by
  rintro ⟨x, hx, hc⟩
  have hr := anc_rank P hx
  rcases item_cases x with rfl|rfl|rfl|rfl
  · exact not_cont_N P hc
  · simp [rank] at hr
  · simp [rank] at hr
  · simp [rank] at hr

-- premise statements, each under the hypotheses it needs
theorem h_F1 : F1_stmt (M) := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl <;>
    cases w <;> rcases hv : P.viaS <;> simp_all [Mk, causesB, ethingB, Model.E]
theorem h_Src : Src_stmt (M) := fun _ _ _ h => h.elim
theorem h_E : E_stmt (M) := ⟨.inl .c, cont_c P, rfl⟩
theorem h_L0 : L0_stmt (M) := fun _ _ h => Nat.lt_irrefl _ (anc_rank P h)
theorem h_B1 : B1_stmt (M) := by
  intro w st z
  cases st
  rcases item_cases z with rfl|rfl|rfl|rfl <;> cases w <;> rcases hv : P.viaS <;> simp [Mk, causesB, hv]
theorem h_B1' : B1'_stmt (M) := by
  intro w t st z h
  cases st
  obtain ⟨hv, rfl, rfl, rfl⟩ := h
  exact ⟨rfl, by simp [Mk, causesB]⟩
theorem h_B2 : B2_stmt (M) := fun w st _ => by cases st; cases w <;> simp [Mk, causesB]
theorem h_P0 : P0_stmt (M) := by
  intro w x ⟨hw, hx⟩
  subst hw
  rcases hx with rfl | ⟨hv, rfl⟩
  · exact ⟨.inl .c, F_c P, by simp [Mk, causesB]⟩
  · exact ⟨.inl .c, F_c P, ⟨hv, rfl, rfl, rfl⟩⟩
theorem h_P1 : P1_stmt (M) := fun _ =>
  Subrelation.wf (fun {_ _} h => anc_rank P h) (InvImage.wf rank Nat.lt_wfRel.wf)
theorem h_P2 : P2_stmt (M) := by
  intro w x hx hex
  rcases item_cases x with rfl|rfl|rfl|rfl
  · exact absurd hx (not_cont_N P)
  · obtain rfl := E_c P hex; exact ⟨.inl .N, by simp [Mk, causesB]⟩
  · obtain rfl := E_d P hex; exact ⟨.inl .c, by simp [Mk, causesB]⟩
  · exact absurd hx (not_cont_s P)
theorem h_P4 : P4_stmt (M) := ⟨.N, fun w => ⟨fund_N P w, fun t ht => by
    cases t
    · rfl
    · exact absurd ht.1 (not_nec_c P)
    · exact absurd ht.1 (not_nec_d P)⟩⟩
theorem h_P5 (hrep : ∀ c, P.rep c) : P5_stmt (M) :=
  fun _ _ _ => ⟨hrep _, fun _ _ => ⟨hrep _, fun _ _ => hrep _⟩⟩
theorem h_FA (hm : P.mental) : FA_stmt (M) := fun _ _ hnm _ => absurd hm hnm
theorem h_P7 : P7_stmt (M) := fun _ _ => Or.inl trivial
theorem h_P8 : P8_stmt (M) := fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩
theorem h_P9 (ha : P.accurate) : P9_stmt (M) := fun _ _ _ _ _ _ _ => ha
theorem h_P11 : P11_stmt (M) := fun _ => ⟨archRat, rfl, ⟨zeroMeasureRat _⟩⟩
theorem h_P12 (h : (∃ ch, ∀ Q, P.sens true Q ch) ∨ ¬ P.hasProp) : P12_stmt (M) := fun hpg => by
  rcases h with ⟨ch, h⟩ | h
  · exact absurd ⟨ch, h _⟩ hpg.2.1
  · exact absurd hpg.2.2 h
theorem h_L4 : L4_stmt (M) := fun _ _ ho => ho.elim
theorem h_P4plus : P4plus_stmt (M) := by
  intro N0 t hN0 hnec _
  have h0 : N0 = T.N := by
    cases N0
    · rfl
    · exact absurd (hN0 true).1 (not_nec_c P)
    · exact absurd (hN0 true).1 (not_nec_d P)
  have ht : t = T.N := by
    cases t
    · rfl
    · exact absurd hnec (not_nec_c P)
    · exact absurd hnec (not_nec_d P)
  exact ht.trans h0.symm
theorem h_P3 (h : (∃ ch, ∀ Q, P.sens true Q ch) ∨ P.hasProp) : P3_stmt (M) := by
  intro w ⟨x, hx⟩ hb
  obtain ⟨rfl, _⟩ := F_char P w x hx
  rcases h with ⟨ch, h⟩ | h
  · exact hb.2.1 ⟨ch, h _⟩
  · exact hb.2.2 h
theorem h_NBL (h : ∀ w Q, ¬ P.sens w Q .law) : NBL_stmt (M) := fun w Q => h w Q
theorem h_NI (h : ∀ w Q, ¬ P.sens w Q .law) : NI_stmt (M) := fun w => h w _
theorem h_CE (h : ∃ ch, ∀ Q, P.sens true Q ch) : CE_stmt (M) := by
  intro w ⟨x, hx⟩
  obtain ⟨rfl, _⟩ := F_char P w x hx
  obtain ⟨ch, h⟩ := h
  exact Or.inr (Or.inr ⟨(Mk P).Maximal, ch, h _⟩)
theorem h_GG (h : ∀ w Q st, P.sens w Q (.state st) → P.sens w (Mk P).Maximal (.state st)) : GG_stmt (M) :=
  fun w st Q hs => h w Q st hs
theorem h_CH (hv : P.viaS = true) (h : ∀ w Q st, P.sens w Q (.state st) → w = true) : CH_stmt (M) := by
  intro w st Q hs
  obtain rfl := h w Q st hs
  cases st
  exact ⟨.inl .c, F_c P, ⟨hv, rfl, rfl, rfl⟩⟩
theorem h_TR (hnil : P.rep .nil) (hrep : ∀ r, P.rep (.alt r)) : TR_stmt (M) :=
  fun _ _ _ _ => ⟨hnil, fun r _ => hrep r⟩

theorem core_of (hrep : ∀ c, P.rep c) (hm : P.mental) (ha : P.accurate)
    (h12 : (∃ ch, ∀ Q, P.sens true Q ch) ∨ ¬ P.hasProp) : Core (M) where
  F1 := h_F1 P; Src := h_Src P; E := h_E P; L0 := h_L0 P; B1 := h_B1 P; B1' := h_B1' P
  B2 := h_B2 P; P0 := h_P0 P; P1 := h_P1 P; P2 := h_P2 P; P4 := h_P4 P
  P5 := h_P5 P hrep; FA := h_FA P hm; P7 := h_P7 P; P8 := h_P8 P; P9 := h_P9 P ha
  P11 := h_P11 P; P12 := h_P12 P h12; L4 := h_L4 P
end generic

/-- the standard channel: sensitivity runs through s at the actual world -/
def viaState : Bool → (Pred (Sum T S) → Prop) → Chan S → Prop :=
  fun w _ ch => ch = .state .s ∧ w = true
theorem viaState_true : ∃ ch, ∀ Q, viaState true Q ch := ⟨.state .s, fun _ => ⟨rfl, rfl⟩⟩
theorem viaState_law : ∀ w Q, ¬ viaState w Q .law := fun _ _ h => by cases h.1
theorem viaState_w : ∀ w Q st, viaState w Q (.state st) → w = true := fun _ _ _ h => h.2

/-! ### Consistency -/
def Pall : Params := ⟨viaState, fun _ => True, True, True, False, true⟩
def M : Model := Mk Pall
theorem P4plus_holds : P4plus_stmt M := h_P4plus Pall
theorem A : Axioms M where
  toCore := core_of Pall (fun _ => trivial) trivial trivial (Or.inl viaState_true)
  CE := h_CE Pall viaState_true
  NBL := h_NBL Pall viaState_law
  GG := h_GG Pall (fun _ _ _ h => h)
  CH := h_CH Pall rfl viaState_w
  TR := h_TR Pall trivial (fun _ => trivial)
  P4plus := P4plus_holds
/-- The full premise set, including P4⁺, is consistent. -/
theorem premises_consistent : Nonempty (Axioms M) := ⟨A⟩

/-! ### Independence of P3 -/
namespace Bare
def P : Params := ⟨fun _ _ _ => False, fun _ => True, True, True, False, true⟩
theorem witness : Nonempty (Core (Mk P)) ∧ NBL_stmt (Mk P) ∧ GG_stmt (Mk P) ∧ CH_stmt (Mk P) ∧ TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ CE_stmt (Mk P) ∧ ¬ P3_stmt (Mk P) ∧ ¬ (Mk P).Favored true :=
  ⟨⟨core_of P (fun _ => trivial) trivial trivial (Or.inr id)⟩,
   fun _ _ h => h, fun _ _ _ h => h.elim, fun _ _ _ h => h.elim, fun _ _ _ h => h.elim, h_P4plus P,
   (fun h => by
      rcases h true ⟨_, F_c P⟩ with hd | hp | ⟨_, _, hs⟩
      · exact not_det P hd
      · exact hp
      · exact hs),
   fun h => h true ⟨_, F_c P⟩ ⟨not_det P, fun ⟨_, h⟩ => h, id⟩,
   fun ⟨_, h⟩ => h⟩
end Bare

/-! ### Independence of NI: the axiarchist world.
Value-sensitivity runs through the LAW channel of the ground; no state of any
thing carries it.  Every other premise holds; NI fails; the production is
favored but there is no selecting representation — P10 fails. -/
namespace Axiarch
def P : Params := ⟨fun w _ ch => ch = .law ∧ w = true, fun _ => True, True, True, False, true⟩
theorem witness : Nonempty (Core (Mk P)) ∧ CE_stmt (Mk P) ∧ GG_stmt (Mk P) ∧ CH_stmt (Mk P) ∧ TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ NBL_stmt (Mk P) ∧ ¬ NI_stmt (Mk P) ∧ (Mk P).Favored true ∧ ¬ P10_stmt (Mk P) ∧ ¬ (Mk P).Agential true :=
  ⟨⟨core_of P (fun _ => trivial) trivial trivial (Or.inl ⟨.law, fun _ => ⟨rfl, rfl⟩⟩)⟩,
   h_CE P ⟨.law, fun _ => ⟨rfl, rfl⟩⟩, (fun _ _ _ h => by cases h.1),
   (fun _ _ _ h => by cases h.1), (fun _ _ _ h => by cases h.1), h_P4plus P,
   (fun h => h true (Mk P).Maximal ⟨rfl, rfl⟩), (fun h => h true ⟨rfl, rfl⟩), ⟨.law, ⟨rfl, rfl⟩⟩,
   (fun h => by
      obtain ⟨_, _, _, hs⟩ := h true ⟨_, F_c P⟩ (fun _ hx => causes_in_ground
        (core_of P (fun _ => trivial) trivial trivial (Or.inl ⟨.law, fun _ => ⟨rfl, rfl⟩⟩)).toCoreNoP4 hx)
        ⟨.law, ⟨rfl, rfl⟩⟩
      cases hs.1),
   (fun h => by obtain ⟨_, _, _, hs⟩ := h.2; cases hs.1)⟩
end Axiarch

/-! ### Independence of CH: a state channel that is not a causal channel. -/
namespace NoCH
def P : Params := ⟨viaState, fun _ => True, True, True, False, false⟩
theorem witness : Nonempty (Core (Mk P)) ∧ CE_stmt (Mk P) ∧ NBL_stmt (Mk P) ∧ GG_stmt (Mk P) ∧ TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ CH_stmt (Mk P) ∧ ¬ (Mk P).Agential true :=
  ⟨⟨core_of P (fun _ => trivial) trivial trivial (Or.inl viaState_true)⟩,
   h_CE P viaState_true, h_NBL P viaState_law, h_GG P (fun _ _ _ h => h), h_TR P trivial (fun _ => trivial), h_P4plus P,
   (fun h => by obtain ⟨_, _, hv, _⟩ := h true .s (fun _ => True) ⟨rfl, rfl⟩; cases hv),
   (fun h => by obtain ⟨_, ⟨_, _, hv, _⟩, _⟩ := h.2; cases hv)⟩
end NoCH

/-! ### Independence of TR: a state channel that carries no content.
THE POWERS NATURALIST'S COMPLETE PACKAGE.  N has a necessary state s through
which the production is sensitive to a property and in virtue of which N
produces c — a disposition directed at a determinate type — but s represents
nothing, and nothing is mental.  Every field of `Axioms` except TR holds
(FA vacuously, since nothing represents).  So there are TWO single-premise
naturalist packages: `W_Nat` (deny CE: nothing mattered) and this one (deny
TR: something mattered, through a state that represents no alternative). -/
namespace NoTR
def P : Params := ⟨viaState, fun _ => False, False, True, False, true⟩
theorem witness : Nonempty (Core (Mk P)) ∧ CE_stmt (Mk P) ∧ NBL_stmt (Mk P) ∧ GG_stmt (Mk P) ∧ CH_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ TR_stmt (Mk P) ∧ ¬ (Mk P).Agential true ∧
    (¬ ∃ t, (Mk P).Mind t) ∧ (¬ ∃ st c, (Mk P).Rep st c) ∧ (Mk P).Favored true := by
  refine ⟨⟨⟨⟨h_F1 P, h_Src P, h_E P, h_L0 P, h_B1 P, h_B1' P, h_B2 P, h_P0 P, h_P1 P, h_P2 P,
      fun _ _ hs => absurd hs.2.1 (fun ⟨_, h⟩ => h), fun _ _ _ _ => ⟨fun _ h => h.elim, fun h => h.elim⟩,
      h_P7 P, h_P8 P, fun _ _ ⟨_, h⟩ => h.elim, h_P11 P, h_P12 P (Or.inl viaState_true), h_L4 P⟩, h_P4 P⟩⟩,
    h_CE P viaState_true, h_NBL P viaState_law, h_GG P (fun _ _ _ h => h), h_CH P rfl viaState_w, h_P4plus P,
    fun h => (h true .s (fun _ => True) ⟨rfl, rfl⟩).1,
    fun h => by obtain ⟨_, _, ⟨_, hr⟩, _⟩ := h.2; exact hr,
    fun ⟨_, _, _, hm⟩ => hm, fun ⟨_, _, h⟩ => h, ⟨.state .s, ⟨rfl, rfl⟩⟩⟩
end NoTR

/-! ### Independence of FA: the structural-representation skeptic.  s is ahistorical, not mental, and represents producing nothing (and every alternative) — non-actual content in a mindless state.  No mind exists; the mind conclusion fails.  This is what denying FA looks like -/
namespace NoMind
def P : Params := ⟨viaState, fun _ => True, False, True, False, true⟩
theorem witness :
    (F1_stmt (Mk P) ∧
    Src_stmt (Mk P) ∧
    E_stmt (Mk P) ∧
    L0_stmt (Mk P) ∧
    B1_stmt (Mk P) ∧
    B1'_stmt (Mk P) ∧
    B2_stmt (Mk P) ∧
    P0_stmt (Mk P) ∧
    P1_stmt (Mk P) ∧
    P2_stmt (Mk P) ∧
    P4_stmt (Mk P) ∧
    P5_stmt (Mk P) ∧
    P7_stmt (Mk P) ∧
    P8_stmt (Mk P) ∧
    P9_stmt (Mk P) ∧
    P11_stmt (Mk P) ∧
    P12_stmt (Mk P) ∧
    L4_stmt (Mk P) ∧
    CE_stmt (Mk P) ∧
    NBL_stmt (Mk P) ∧
    GG_stmt (Mk P) ∧
    CH_stmt (Mk P) ∧
    TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P)) ∧
    ¬ FA_stmt (Mk P) ∧
    ¬ ∃ t, (Mk P).Mind t :=
  ⟨⟨h_F1 P, h_Src P, h_E P, h_L0 P, h_B1 P, h_B1' P, h_B2 P, h_P0 P, h_P1 P, h_P2 P, h_P4 P, h_P5 P (fun _ => trivial), h_P7 P, h_P8 P, h_P9 P trivial, h_P11 P, h_P12 P (Or.inl viaState_true), h_L4 P, h_CE P viaState_true, h_NBL P viaState_law, h_GG P (fun _ _ _ h => h), h_CH P rfl viaState_w, h_TR P trivial (fun _ => trivial), h_P4plus P⟩,
   (fun h => (h true .s id (s_ahistorical P _)).2 trivial (.inl .c) ⟨cont_c P, rfl⟩),
   fun ⟨_, _, _, hm⟩ => hm⟩
end NoMind

/-! ### Independence of P9 -/
namespace NoAcc
def P : Params := ⟨viaState, fun _ => True, True, False, False, true⟩
theorem witness :
    (F1_stmt (Mk P) ∧
    Src_stmt (Mk P) ∧
    E_stmt (Mk P) ∧
    L0_stmt (Mk P) ∧
    B1_stmt (Mk P) ∧
    B1'_stmt (Mk P) ∧
    B2_stmt (Mk P) ∧
    P0_stmt (Mk P) ∧
    P1_stmt (Mk P) ∧
    P2_stmt (Mk P) ∧
    P4_stmt (Mk P) ∧
    P5_stmt (Mk P) ∧
    FA_stmt (Mk P) ∧
    P7_stmt (Mk P) ∧
    P8_stmt (Mk P) ∧
    P11_stmt (Mk P) ∧
    P12_stmt (Mk P) ∧
    L4_stmt (Mk P) ∧
    CE_stmt (Mk P) ∧
    NBL_stmt (Mk P) ∧
    GG_stmt (Mk P) ∧
    CH_stmt (Mk P) ∧
    TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P)) ∧
    ¬ P9_stmt (Mk P) ∧
    ¬ ∃ t, KnowsAll (Mk P) t :=
  ⟨⟨h_F1 P, h_Src P, h_E P, h_L0 P, h_B1 P, h_B1' P, h_B2 P, h_P0 P, h_P1 P, h_P2 P, h_P4 P, h_P5 P (fun _ => trivial), h_FA P trivial, h_P7 P, h_P8 P, h_P11 P, h_P12 P (Or.inl viaState_true), h_L4 P, h_CE P viaState_true, h_NBL P viaState_law, h_GG P (fun _ _ _ h => h), h_CH P rfl viaState_w, h_TR P trivial (fun _ => trivial), h_P4plus P⟩,
   fun h => h true .s ⟨.nil, trivial⟩ (s_ahistorical P _) (necstate_s P) .nil trivial,
   fun ⟨_, ⟨_, _, _, ha⟩, _⟩ => ha⟩
end NoAcc

/-! ### Independence of P5 -/
namespace Narrow
def P : Params := ⟨viaState, fun c => c = .nil ∨ ∃ r, c = .alt r, True, True, False, true⟩
theorem witness :
    (F1_stmt (Mk P) ∧
    Src_stmt (Mk P) ∧
    E_stmt (Mk P) ∧
    L0_stmt (Mk P) ∧
    B1_stmt (Mk P) ∧
    B1'_stmt (Mk P) ∧
    B2_stmt (Mk P) ∧
    P0_stmt (Mk P) ∧
    P1_stmt (Mk P) ∧
    P2_stmt (Mk P) ∧
    P4_stmt (Mk P) ∧
    FA_stmt (Mk P) ∧
    P7_stmt (Mk P) ∧
    P8_stmt (Mk P) ∧
    P9_stmt (Mk P) ∧
    P11_stmt (Mk P) ∧
    P12_stmt (Mk P) ∧
    L4_stmt (Mk P) ∧
    CE_stmt (Mk P) ∧
    NBL_stmt (Mk P) ∧
    GG_stmt (Mk P) ∧
    CH_stmt (Mk P) ∧
    TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P)) ∧
    ¬ P5_stmt (Mk P) ∧
    ¬ ∃ st, (Mk P).SelectingRep true st ∧ (Mk P).RepAllOmega st :=
  ⟨⟨h_F1 P, h_Src P, h_E P, h_L0 P, h_B1 P, h_B1' P, h_B2 P, h_P0 P, h_P1 P, h_P2 P, h_P4 P, h_FA P trivial, h_P7 P, h_P8 P, h_P9 P trivial, h_P11 P, h_P12 P (Or.inl viaState_true), h_L4 P, h_CE P viaState_true, h_NBL P viaState_law, h_GG P (fun _ _ _ h => h), h_CH P rfl viaState_w, h_TR P (Or.inl rfl) (fun r => Or.inr ⟨r, rfl⟩), h_P4plus P⟩,
   (fun h => by
     have hc := ((h true .s ⟨⟨.inl .c, F_c P, ⟨rfl, rfl, rfl, rfl⟩⟩, ⟨.nil, Or.inl rfl⟩, ⟨rfl, rfl⟩⟩).2
       ((Mk P).realOf true) ⟨true, rfl, ⟨_, F_c P⟩⟩ |>.2 () trivial)
     rcases hc with h | ⟨r, hr⟩
     · cases h
     · cases hr),
   (fun ⟨_, _, h⟩ => by
     have hc := (h.2 ((Mk P).realOf true) ⟨true, rfl, ⟨_, F_c P⟩⟩).2 () trivial
     rcases hc with h | ⟨r, hr⟩
     · cases h
     · cases hr)⟩
end Narrow

/-! ### Independence of P12 -/
namespace Chance
def P : Params := ⟨fun _ _ _ => False, fun _ => True, True, True, True, true⟩
theorem witness :
    (F1_stmt (Mk P) ∧
    Src_stmt (Mk P) ∧
    E_stmt (Mk P) ∧
    L0_stmt (Mk P) ∧
    B1_stmt (Mk P) ∧
    B1'_stmt (Mk P) ∧
    B2_stmt (Mk P) ∧
    P0_stmt (Mk P) ∧
    P1_stmt (Mk P) ∧
    P2_stmt (Mk P) ∧
    P4_stmt (Mk P) ∧
    P5_stmt (Mk P) ∧
    FA_stmt (Mk P) ∧
    P7_stmt (Mk P) ∧
    P8_stmt (Mk P) ∧
    P9_stmt (Mk P) ∧
    P11_stmt (Mk P) ∧
    L4_stmt (Mk P) ∧
    CE_stmt (Mk P) ∧
    NBL_stmt (Mk P) ∧
    GG_stmt (Mk P) ∧
    CH_stmt (Mk P) ∧
    TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P)) ∧
    ¬ P12_stmt (Mk P) ∧
    (Mk P).PropGoverned true :=
  ⟨⟨h_F1 P, h_Src P, h_E P, h_L0 P, h_B1 P, h_B1' P, h_B2 P, h_P0 P, h_P1 P, h_P2 P, h_P4 P, h_P5 P (fun _ => trivial), h_FA P trivial, h_P7 P, h_P8 P, h_P9 P trivial, h_P11 P, h_L4 P, (fun _ _ => Or.inr (Or.inl trivial)), (fun _ _ h => h), (fun _ _ _ h => h.elim), fun _ _ _ h => h.elim, fun _ _ _ h => h.elim, h_P4plus P⟩,
   (fun h => by
     obtain ⟨ι, G, hunc, hopen, _, _⟩ := h ⟨not_det P, fun ⟨_, h⟩ => h, trivial⟩
     exact hunc ⟨fun i => (hopen i).elim, fun i => (hopen i).elim⟩),
   ⟨not_det P, fun ⟨_, h⟩ => h, trivial⟩⟩
end Chance

/-! ### The deviance horn: a law tracking the descriptive base is BARE, not favored.
The law channel is sensitive to a descriptive property D ("non-empty") that
COINCIDES with maximality on every live alternative (every member of Ω is
non-empty and, here, maximal) but is not the same property (they differ at
the empty reality).  NI holds — the law is not sensitive to maximality as
such.  But then the production is not favored, so it is BARE: this world
violates P3, not NI.  A skeptic who says "the law tracks the base, and that
is selection for value" is taking the brute-selection exit under another
name. -/
namespace DLaw
def D : Pred (Sum T S) → Prop := fun r => ∃ x, r x
def P : Params := ⟨fun w Q ch => ch = .law ∧ w = true ∧ Q = D, fun _ => True, True, True, False, true⟩
theorem D_ne_max : (Mk P).Maximal ≠ D := by
  intro h
  have : D (Mk P).emptyReality := h ▸ ⟨fun _ _ => trivial, trivial⟩
  obtain ⟨x, hx⟩ := this
  exact hx
theorem coincide_on_Omega : ∀ r, (Mk P).InOmega r → (D r ↔ (Mk P).Maximal r) := by
  rintro r ⟨w, rfl, ⟨m, hm⟩⟩
  exact ⟨fun _ => ⟨fun _ _ => trivial, trivial⟩, fun _ => ⟨m, hm.1, hm.2.1⟩⟩
theorem witness :
    Nonempty (Core (Mk P)) ∧ CE_stmt (Mk P) ∧ NI_stmt (Mk P) ∧ GG_stmt (Mk P) ∧ CH_stmt (Mk P) ∧ TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ NBL_stmt (Mk P) ∧
    (Mk P).Sens true D .law ∧ ¬ (Mk P).Favored true ∧ (Mk P).Bare true ∧ ¬ P3_stmt (Mk P) :=
  ⟨⟨core_of P (fun _ => trivial) trivial trivial (Or.inr id)⟩,
   (fun w ⟨x, hx⟩ => by
      obtain ⟨rfl, _⟩ := F_char P w x hx
      exact Or.inr (Or.inr ⟨D, .law, rfl, rfl, rfl⟩)),
   (fun _ h => D_ne_max h.2.2), (fun _ _ _ h => by cases h.1), (fun _ _ _ h => by cases h.1), (fun _ _ _ h => by cases h.1), h_P4plus P,
   (fun h => h true D ⟨rfl, rfl, rfl⟩),
   ⟨rfl, rfl, rfl⟩,
   (fun ⟨_, h⟩ => D_ne_max h.2.2),
   ⟨not_det P, fun ⟨_, h⟩ => D_ne_max h.2.2, id⟩,
   (fun h => h true ⟨_, F_c P⟩ ⟨not_det P, fun ⟨_, h⟩ => D_ne_max h.2.2, id⟩)⟩
end DLaw

/-! ### Independence of GG: a state channel that selects for a non-evaluative
property.  CE, NBL, CH, TR all hold; the selecting state tracks D, not
maximality; so the production is not favored and P3 fails — but by
`mind_of_CE_NBL` a necessary MIND still exists.  A skeptic who denies the
guise of the good loses the value conclusion and keeps the mind. -/
namespace DState
def D : Pred (Sum T S) → Prop := fun r => ∃ x, r x
def P : Params := ⟨fun w Q ch => ch = .state .s ∧ w = true ∧ Q = D, fun _ => True, True, True, False, true⟩
theorem D_ne_max : (Mk P).Maximal ≠ D := by
  intro h
  have : D (Mk P).emptyReality := h ▸ ⟨fun _ _ => trivial, trivial⟩
  obtain ⟨x, hx⟩ := this
  exact hx
theorem core : Core (Mk P) := core_of P (fun _ => trivial) trivial trivial (Or.inr id)
theorem hCE : CE_stmt (Mk P) := fun w ⟨x, hx⟩ => by
  obtain ⟨rfl, _⟩ := F_char P w x hx
  exact Or.inr (Or.inr ⟨D, .state .s, rfl, rfl, rfl⟩)
theorem hNBL : NBL_stmt (Mk P) := fun _ _ h => by cases h.1
theorem hCH : CH_stmt (Mk P) := by
  rintro w st _ ⟨_, rfl, _⟩; cases st
  exact ⟨.inl .c, F_c P, ⟨rfl, rfl, rfl, rfl⟩⟩
theorem hTR : TR_stmt (Mk P) := fun _ _ _ _ => ⟨trivial, fun _ _ => trivial⟩
theorem witness :
    Nonempty (Core (Mk P)) ∧ CE_stmt (Mk P) ∧ NBL_stmt (Mk P) ∧ CH_stmt (Mk P) ∧ TR_stmt (Mk P) ∧
    P4plus_stmt (Mk P) ∧ ¬ GG_stmt (Mk P) ∧ ¬ (Mk P).Favored true ∧ ¬ P3_stmt (Mk P) ∧
    (∃ t, (Mk P).Nec t ∧ (Mk P).Concrete t ∧ (Mk P).Mind t) :=
  ⟨⟨core⟩, hCE, hNBL, hCH, hTR, h_P4plus P,
   (fun h => D_ne_max (h true .s D ⟨rfl, rfl, rfl⟩).2.2),
   (fun ⟨_, h⟩ => D_ne_max h.2.2),
   (fun h => h true ⟨_, F_c P⟩ ⟨not_det P, fun ⟨_, h⟩ => D_ne_max h.2.2, id⟩),
   (by obtain ⟨_, _, _, _, _, _, _, _, t, ht⟩ := mind_of_CE_NBL core.toCoreNoP4 hCE hNBL hCH hTR; exact ⟨t, ht⟩)⟩
end DState

/-! ### Independence of P2: an uncaused first contingent item.
Things N, c, c', d; state s of N.  c is contingent, exists only at `true`,
causes d, and has no cause.  c' is caused by N in virtue of s.  F_true = {c, c'}. -/
namespace W_P2
inductive T | N | c | c' | d deriving DecidableEq
inductive S | s deriving DecidableEq
abbrev Item := Sum T S
theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .c ∨ x = .inl .c' ∨ x = .inl .d ∨ x = .inr .s := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st; simp
def rank : Item → Nat
  | .inl .N => 0 | .inr .s => 1 | .inl .c => 2 | .inl .c' => 2 | .inl .d => 3
def causesB : Bool → Item → Item → Bool
  | _,    .inl .N, .inr .s  => true
  | true, .inl .N, .inl .c' => true
  | true, .inr .s, .inl .c' => true
  | true, .inl .c, .inl .d  => true
  | true, .inl .c', .inl .d => true
  | _, _, _ => false
def ethingB : Bool → T → Bool
  | _, .N => true | w, _ => w
theorem causes_rank : ∀ w x y, causesB w x y = true → rank x < rank y := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl <;>
    cases w <;> simp_all [causesB, rank]
def allItems : List Item := [.inl .N, .inl .c, .inl .c', .inl .d, .inr .s]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl|rfl <;> simp [allItems]

def M : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB w x y = true
  CausesVia := fun w t _ z => t = .N ∧ z = .inl .c' ∧ w = true
  DependsOn := fun w x => w = true ∧ (x = .inl .N ∨ x = .inr .s)
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ _ _ => False
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun w _ ch => ch = .state .s ∧ w = true
  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

theorem anc_rank {w : Bool} {x y : M.Item} (h : M.Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank _ _ _ h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank _ _ _ h)
theorem nec_N : M.Nec .N := fun w => by cases w <;> rfl
theorem not_nec {t : T} (h : t ≠ .N) : ¬ M.Nec t := fun hn => by
  have := hn false; cases t <;> simp_all [M, ethingB]
theorem necstate_s : M.NecState .s := fun _ _ => trivial
theorem not_cont_N : ¬ M.ContingentItem (.inl .N) := fun h => h.1 nec_N
theorem not_cont_s : ¬ M.ContingentItem (.inr .s) := fun h => h.1 necstate_s
theorem cont_c : M.ContingentItem (.inl .c) := ⟨not_nec (by simp), ⟨true, .inl .d, rfl⟩⟩
theorem cont_c' : M.ContingentItem (.inl .c') := ⟨not_nec (by simp), ⟨true, .inl .d, rfl⟩⟩
theorem E_true {t : T} (h : t ≠ .N) {w : Bool} (he : M.E w (.inl t)) : w = true := by
  cases w
  · exfalso; cases t <;> simp_all [M, Model.E, ethingB]
  · rfl
theorem no_anc_c {w : Bool} {y : M.Item} (h : M.Anc w y (.inl .c)) : False := by
  obtain ⟨z, hz⟩ := anc_last h
  rcases item_cases z with rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB] at hz
theorem F_c : M.F true (.inl .c) := ⟨cont_c, rfl, fun _ h _ => no_anc_c h⟩
theorem F_c' : M.F true (.inl .c') := by
  refine ⟨cont_c', rfl, ?_⟩
  intro y hy
  have hr := anc_rank hy
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl
  · exact not_cont_N
  · simp [rank] at hr
  · simp [rank] at hr
  · simp [rank] at hr
  · exact not_cont_s
theorem F_char : ∀ w x, M.F w x → w = true ∧ (x = .inl .c ∨ x = .inl .c') := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl
  · exact absurd hx.1 not_cont_N
  · exact ⟨E_true (by simp) hx.2.1, Or.inl rfl⟩
  · exact ⟨E_true (by simp) hx.2.1, Or.inr rfl⟩
  · exfalso
    obtain rfl := E_true (by simp) hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB true (.inl .c) (.inl .d) = true)) cont_c
  · exact absurd hx.1 not_cont_s
theorem fund_N (w : Bool) : M.Fundamental w .N :=
  ⟨nec_N, ⟨true, .inr .s, rfl⟩, fun y h => by
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [M, causesB]⟩
theorem not_det : ¬ M.Deterministic := by
  intro h
  have e : M.F true = M.F false := h true false rfl
  have hc := F_c
  rw [e] at hc
  have := (F_char _ _ hc).1; simp at this

theorem witness :
    (F1_stmt M ∧ Src_stmt M ∧ E_stmt M ∧ L0_stmt M ∧ B1_stmt M ∧ B1'_stmt M ∧ B2_stmt M ∧
     P0_stmt M ∧ P1_stmt M ∧ CE_stmt M ∧ NBL_stmt M ∧ GG_stmt M ∧ P4_stmt M ∧ P5_stmt M ∧ P6_stmt M ∧ P7_stmt M ∧
     P8_stmt M ∧ P9_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P11_stmt M ∧ P12_stmt M ∧ L4_stmt M ∧ P4plus_stmt M) ∧
    ¬ P2_stmt M ∧
    -- 1.7 fails: c has no fundamental ancestor
    ¬ ∃ u, M.Fundamental true u ∧ M.Anc true (.inl u) (.inl .c) := by
  refine ⟨⟨?F1, fun _ _ _ h => h.elim, ⟨.inl .c, cont_c, rfl⟩, fun w x h => Nat.lt_irrefl _ (anc_rank h),
    ?B1, ?B1', fun w st _ => by cases st; cases w <;> rfl, ?P0,
    (fun _ => Subrelation.wf (fun {_ _} h => anc_rank h) (InvImage.wf rank Nat.lt_wfRel.wf)), ?CE, (fun _ _ h => by cases h.1), (fun _ _ _ h => h), ?P4,
    fun _ _ _ => ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩, fun _ _ _ _ _ => trivial,
    fun _ _ => Or.inl trivial, fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩, fun _ _ _ _ _ _ _ => trivial,
    ?CH, (fun _ _ _ _ => ⟨trivial, fun _ _ => trivial⟩), fun _ => ⟨archRat, rfl, ⟨zeroMeasureRat _⟩⟩,
    fun h => absurd ⟨.state .s, rfl, rfl⟩ h.2.1, fun _ _ ho => ho.elim, ?P4plus⟩, ?P2, ?concl⟩
  case F1 =>
    intro w x y h
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl <;>
      cases w <;> simp_all [M, causesB, ethingB, Model.E]
  case B1 =>
    intro w st z; cases st
    rcases item_cases z with rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB]
  case B1' =>
    intro w t st z h; cases st
    obtain ⟨rfl, rfl, rfl⟩ := h
    exact ⟨rfl, rfl⟩
  case P0 =>
    intro w x ⟨hw, hx⟩
    subst hw
    rcases hx with rfl|rfl
    · exact ⟨.inl .c', F_c', rfl⟩
    · exact ⟨.inl .c', F_c', ⟨rfl, rfl, rfl⟩⟩
  case CE =>
    intro w ⟨x, hx⟩
    obtain ⟨rfl, _⟩ := F_char w x hx
    exact Or.inr (Or.inr ⟨M.Maximal, .state .s, rfl, rfl⟩)
  case P4 =>
    refine ⟨.N, fun w => ⟨fund_N w, fun t ht => ?_⟩⟩
    cases t
    · rfl
    all_goals exact absurd ht.1 (not_nec (by simp))
  case CH =>
    rintro w st _ ⟨hst, rfl⟩
    cases st
    exact ⟨.inl .c', F_c', ⟨rfl, rfl, rfl⟩⟩
  case P4plus =>
    intro N0 t hN0 hnec _
    have h0 : N0 = T.N := by
      cases N0
      · rfl
      all_goals exact absurd (hN0 true).1 (not_nec (by simp))
    have ht : t = T.N := by
      cases t
      · rfl
      all_goals exact absurd hnec (not_nec (by simp))
    exact ht.trans h0.symm
  case P2 =>
    intro h
    obtain ⟨y, hy⟩ := h true (.inl .c) cont_c rfl
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl <;> simp [M, causesB] at hy
  case concl =>
    rintro ⟨u, _, hu⟩
    exact no_anc_c hu
end W_P2

/-! ### Independence of P4: two fundamental necessary beings.
N with state s1 produces c1 (→ d1) at `true`; N2 with state s2 produces
c2 (→ d2) at `false`.  Both N and N2 are uncaused at every world, so P4's
uniqueness fails, and no single being brings about both worlds' realities. -/
namespace W_P4
inductive T | N | N2 | c1 | c2 | d1 | d2 deriving DecidableEq
inductive S | s1 | s2 deriving DecidableEq
abbrev Item := Sum T S
theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .N2 ∨ x = .inl .c1 ∨ x = .inl .c2 ∨ x = .inl .d1 ∨ x = .inl .d2 ∨
    x = .inr .s1 ∨ x = .inr .s2 := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st <;> simp
def rank : Item → Nat
  | .inl .N => 0 | .inl .N2 => 0 | .inr .s1 => 1 | .inr .s2 => 1
  | .inl .c1 => 2 | .inl .c2 => 2 | .inl .d1 => 3 | .inl .d2 => 3
/-- component: 0 for N's family, 1 for N2's -/
def comp : Item → Nat
  | .inl .N => 0 | .inr .s1 => 0 | .inl .c1 => 0 | .inl .d1 => 0
  | .inl .N2 => 1 | .inr .s2 => 1 | .inl .c2 => 1 | .inl .d2 => 1
def causesB : Bool → Item → Item → Bool
  | _,     .inl .N,  .inr .s1 => true
  | _,     .inl .N2, .inr .s2 => true
  | true,  .inl .N,  .inl .c1 => true
  | true,  .inr .s1, .inl .c1 => true
  | true,  .inl .c1, .inl .d1 => true
  | false, .inl .N2, .inl .c2 => true
  | false, .inr .s2, .inl .c2 => true
  | false, .inl .c2, .inl .d2 => true
  | _, _, _ => false
def ethingB : Bool → T → Bool
  | _, .N => true | _, .N2 => true
  | w, .c1 => w | w, .d1 => w | w, .c2 => !w | w, .d2 => !w
theorem causes_rank : ∀ w x y, causesB w x y = true → rank x < rank y ∧ comp x = comp y := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
    cases w <;> simp_all [causesB, rank, comp]
def allItems : List Item :=
  [.inl .N, .inl .N2, .inl .c1, .inl .c2, .inl .d1, .inl .d2, .inr .s1, .inr .s2]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> simp [allItems]
def bearer : S → T | .s1 => .N | .s2 => .N2

def M : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := bearer
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB w x y = true
  CausesVia := fun w t st z =>
    (w = true ∧ t = .N ∧ st = .s1 ∧ z = .inl .c1) ∨ (w = false ∧ t = .N2 ∧ st = .s2 ∧ z = .inl .c2)
  DependsOn := fun w x =>
    (w = true ∧ (x = .inl .N ∨ x = .inr .s1)) ∨ (w = false ∧ (x = .inl .N2 ∨ x = .inr .s2))
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ _ _ => False
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun w _ ch => (ch = .state .s1 ∧ w = true) ∨ (ch = .state .s2 ∧ w = false)

  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

theorem anc_rank {w : Bool} {x y : M.Item} (h : M.Anc w x y) : rank x < rank y ∧ comp x = comp y := by
  induction h with
  | single h => exact causes_rank _ _ _ h
  | tail _ h ih =>
    have := causes_rank _ _ _ h
    exact ⟨Nat.lt_trans ih.1 this.1, ih.2.trans this.2⟩
theorem nec_N : M.Nec .N := fun w => by cases w <;> rfl
theorem nec_N2 : M.Nec .N2 := fun w => by cases w <;> rfl
theorem not_nec {t : T} (h1 : t ≠ .N) (h2 : t ≠ .N2) : ¬ M.Nec t := fun hn => by
  have hf := hn false; have ht := hn true; cases t <;> simp_all [M, ethingB]
theorem necstate (st : S) : M.NecState st := fun _ _ => trivial
theorem not_cont_thing {t : T} (h : M.Nec t) : ¬ M.ContingentItem (.inl t) := fun hc => hc.1 h
theorem not_cont_state (st : S) : ¬ M.ContingentItem (.inr st) := fun h => h.1 (necstate st)
theorem cont_c1 : M.ContingentItem (.inl .c1) := ⟨not_nec (by simp) (by simp), ⟨true, .inl .d1, rfl⟩⟩
theorem cont_c2 : M.ContingentItem (.inl .c2) := ⟨not_nec (by simp) (by simp), ⟨false, .inl .d2, rfl⟩⟩
theorem E_c1 {w : Bool} (h : M.E w (.inl .c1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .c1 = true) Bool.false_ne_true
  · rfl
theorem E_d1 {w : Bool} (h : M.E w (.inl .d1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .d1 = true) Bool.false_ne_true
  · rfl
theorem E_c2 {w : Bool} (h : M.E w (.inl .c2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .c2 = true) Bool.false_ne_true
theorem E_d2 {w : Bool} (h : M.E w (.inl .d2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .d2 = true) Bool.false_ne_true
theorem anc_c1 {w : Bool} {y : M.Item} (h : M.Anc w y (.inl .c1)) : y = .inl .N ∨ y = .inr .s1 := by
  have := anc_rank h
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> simp_all [rank, comp] <;> rfl
theorem anc_c2 {w : Bool} {y : M.Item} (h : M.Anc w y (.inl .c2)) : y = .inl .N2 ∨ y = .inr .s2 := by
  have := anc_rank h
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> simp_all [rank, comp] <;> rfl
theorem F_c1 : M.F true (.inl .c1) := ⟨cont_c1, rfl, fun y hy => by
  rcases anc_c1 hy with rfl|rfl
  · exact not_cont_thing nec_N
  · exact not_cont_state _⟩
theorem F_c2 : M.F false (.inl .c2) := ⟨cont_c2, rfl, fun y hy => by
  rcases anc_c2 hy with rfl|rfl
  · exact not_cont_thing nec_N2
  · exact not_cont_state _⟩
theorem F_char : ∀ w x, M.F w x → (w = true ∧ x = .inl .c1) ∨ (w = false ∧ x = .inl .c2) := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
  · exact absurd hx.1 (not_cont_thing nec_N)
  · exact absurd hx.1 (not_cont_thing nec_N2)
  · exact Or.inl ⟨E_c1 hx.2.1, rfl⟩
  · exact Or.inr ⟨E_c2 hx.2.1, rfl⟩
  · exfalso; obtain rfl := E_d1 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB true (.inl .c1) (.inl .d1) = true)) cont_c1
  · exfalso; obtain rfl := E_d2 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB false (.inl .c2) (.inl .d2) = true)) cont_c2
  · exact absurd hx.1 (not_cont_state _)
  · exact absurd hx.1 (not_cont_state _)
theorem uncaused_N (w : Bool) : ∀ y, ¬ M.Causes w y (.inl .N) := fun y h => by
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [M, causesB]
theorem uncaused_N2 (w : Bool) : ∀ y, ¬ M.Causes w y (.inl .N2) := fun y h => by
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [M, causesB]
theorem fund_N (w : Bool) : M.Fundamental w .N := ⟨nec_N, ⟨true, .inr .s1, rfl⟩, uncaused_N w⟩
theorem fund_N2 (w : Bool) : M.Fundamental w .N2 := ⟨nec_N2, ⟨true, .inr .s2, rfl⟩, uncaused_N2 w⟩

theorem witness :
    (F1_stmt M ∧ Src_stmt M ∧ E_stmt M ∧ L0_stmt M ∧ B1_stmt M ∧ B1'_stmt M ∧ B2_stmt M ∧
     P0_stmt M ∧ P1_stmt M ∧ P2_stmt M ∧ CE_stmt M ∧ NBL_stmt M ∧ GG_stmt M ∧ P5_stmt M ∧ P6_stmt M ∧ P7_stmt M ∧
     P8_stmt M ∧ P9_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P11_stmt M ∧ P12_stmt M ∧ L4_stmt M) ∧
    ¬ P4_stmt M ∧ ¬ P4plus_stmt M ∧
    -- 2.8 fails: no single being brings about every world's contingent reality
    ¬ ∃ N0, ∀ w, (∃ x, M.ContingentItem x ∧ M.E w x) → M.BringsAbout w N0 := by
  refine ⟨⟨?F1, fun _ _ _ h => h.elim, ⟨.inl .c1, cont_c1, rfl⟩, fun w x h => Nat.lt_irrefl _ (anc_rank h).1,
    ?B1, ?B1', ?B2, ?P0,
    (fun _ => Subrelation.wf (fun {_ _} h => (anc_rank h).1) (InvImage.wf rank Nat.lt_wfRel.wf)), ?P2, ?CE, ?NBL, (fun _ _ _ h => h),
    fun _ _ _ => ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩, fun _ _ _ _ _ => trivial,
    fun _ _ => Or.inl trivial, fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩, fun _ _ _ _ _ _ _ => trivial,
    ?CH, (fun _ _ _ _ => ⟨trivial, fun _ _ => trivial⟩), fun _ => ⟨archRat, rfl, ⟨zeroMeasureRat _⟩⟩,
    fun h => absurd ⟨.state .s1, Or.inl ⟨rfl, rfl⟩⟩ h.2.1, fun _ _ ho => ho.elim⟩, ?P4, ?P4plus, ?concl⟩
  case F1 =>
    intro w x y h
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
      rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
      cases w <;> simp_all [M, causesB, ethingB, Model.E]
  case B1 =>
    intro w st z
    cases st <;> rcases item_cases z with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB, bearer]
  case B1' =>
    intro w t st z h
    rcases h with ⟨rfl, rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl, rfl⟩
    · exact ⟨rfl, rfl⟩
    · exact ⟨rfl, rfl⟩
  case B2 => intro w st _; cases st <;> cases w <;> rfl
  case P0 =>
    intro w x hx
    rcases hx with ⟨rfl, rfl | rfl⟩ | ⟨rfl, rfl | rfl⟩
    · exact ⟨.inl .c1, F_c1, rfl⟩
    · exact ⟨.inl .c1, F_c1, Or.inl ⟨rfl, rfl, rfl, rfl⟩⟩
    · exact ⟨.inl .c2, F_c2, rfl⟩
    · exact ⟨.inl .c2, F_c2, Or.inr ⟨rfl, rfl, rfl, rfl⟩⟩
  case P2 =>
    intro w x hx hex
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hx (not_cont_thing nec_N)
    · exact absurd hx (not_cont_thing nec_N2)
    · obtain rfl := E_c1 hex; exact ⟨.inl .N, rfl⟩
    · obtain rfl := E_c2 hex; exact ⟨.inl .N2, rfl⟩
    · obtain rfl := E_d1 hex; exact ⟨.inl .c1, rfl⟩
    · obtain rfl := E_d2 hex; exact ⟨.inl .c2, rfl⟩
    · exact absurd hx (not_cont_state _)
    · exact absurd hx (not_cont_state _)
  case CE =>
    intro w ⟨x, hx⟩
    rcases F_char w x hx with ⟨rfl, _⟩ | ⟨rfl, _⟩
    · exact Or.inr (Or.inr ⟨M.Maximal, .state .s1, Or.inl ⟨rfl, rfl⟩⟩)
    · exact Or.inr (Or.inr ⟨M.Maximal, .state .s2, Or.inr ⟨rfl, rfl⟩⟩)
  case NBL =>
    rintro w _ (⟨h, _⟩ | ⟨h, _⟩) <;> cases h
  case CH =>
    rintro w st _ (⟨h, rfl⟩ | ⟨h, rfl⟩)
    · cases h; exact ⟨.inl .c1, F_c1, Or.inl ⟨rfl, rfl, rfl, rfl⟩⟩
    · cases h; exact ⟨.inl .c2, F_c2, Or.inr ⟨rfl, rfl, rfl, rfl⟩⟩
  case P4 =>
    rintro ⟨N0, hN⟩
    have h1 := (hN true).2 _ (fund_N true)
    have h2 := (hN true).2 _ (fund_N2 true)
    subst h1; cases h2
  case P4plus =>
    intro h
    have := h .N .N2 fund_N nec_N2 ⟨true, .inr .s2, rfl⟩
    cases this
  case concl =>
    rintro ⟨N0, hN⟩
    have hb1 := (hN true ⟨.inl .c1, cont_c1, rfl⟩).2 _ cont_c1 rfl
    have hb2 := (hN false ⟨.inl .c2, cont_c2, rfl⟩).2 _ cont_c2 rfl
    rcases anc_c1 hb1 with h | h <;> rcases anc_c2 hb2 with h' | h' <;>
      cases h <;> cases h'

/-- DENYING P4 IS NOT A NATURALIST EXIT (v8.10).  In the ¬P4 model there are
    two fundamental beings, and each is a necessary concrete mind.  With
    `mind_of_CE_NBL` typed over `CoreNoP4`, this is what the island-universe
    skeptic gets by denying uniqueness: several necessary minds, not none. -/
theorem two_minds :
    (∀ w, M.Fundamental w .N) ∧ (∀ w, M.Fundamental w .N2) ∧ (T.N ≠ T.N2) ∧
    M.Mind .N ∧ M.Mind .N2 :=
  ⟨fund_N, fund_N2, by simp, ⟨.s1, rfl, trivial⟩, ⟨.s2, rfl, trivial⟩⟩
end W_P4

/-! ### Independence of P1: an infinite causal chain.
N with state s; contingent things c n (n : ℕ) existing only at `true`, with
c (n+1) causing c n.  c 0 causes nothing and so is not concrete.  Every c n
(n ≥ 1) is a contingent item with a contingent ancestor; F is empty in every
world; c 1 has infinitely many ancestors and no fundamental one. -/
namespace W_P1
inductive T | N | c (n : Nat)
inductive S | s
abbrev Item := Sum T S
/-- rank decreases along causation (N→s, c (n+1)→c n). -/
def rank : Item → Nat
  | .inl .N => 1 | .inr .s => 0 | .inl (.c n) => n
def comp : Item → Nat
  | .inl .N => 0 | .inr .s => 0 | .inl (.c _) => 1
def Causes (w : Bool) : Item → Item → Prop
  | .inl .N, .inr .s => True
  | .inl (.c m), .inl (.c n) => w = true ∧ m = n + 1
  | _, _ => False
def Ething (w : Bool) : T → Prop
  | .N => True | .c _ => w = true

def M : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := Ething
  E_state := fun _ _ => True
  Causes := Causes
  CausesVia := fun _ _ _ _ => False
  DependsOn := fun _ _ => False
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ _ _ => False
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun _ _ _ => False

  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

theorem causes_rank {w : Bool} {x y : Item} (h : Causes w x y) : rank y < rank x ∧ comp x = comp y := by
  rcases x with ⟨_|m⟩|⟨⟩ <;> rcases y with ⟨_|n⟩|⟨⟩ <;> simp_all [Causes, rank, comp]
theorem anc_rank {w : Bool} {x y : M.Item} (h : M.Anc w x y) : rank y < rank x ∧ comp x = comp y := by
  induction h with
  | single h => exact causes_rank h
  | tail _ h ih =>
    have := causes_rank h
    exact ⟨Nat.lt_trans this.1 ih.1, ih.2.trans this.2⟩
theorem nec_N : M.Nec .N := fun _ => trivial
theorem not_nec_c (n : Nat) : ¬ M.Nec (.c n) := fun h => by have := h false; simp [M, Ething] at this
theorem cont_c (n : Nat) : M.ContingentItem (.inl (.c (n+1))) :=
  ⟨not_nec_c _, ⟨true, .inl (.c n), ⟨rfl, rfl⟩⟩⟩
/-- No first contingent item anywhere: F is empty. -/
theorem F_empty (w : Bool) (x : M.Item) : ¬ M.F w x := by
  intro hx
  rcases x with ⟨_|n⟩|⟨⟩
  · exact hx.1.1 nec_N
  · -- c n: its concreteness needs n = m+1; then c (n+1) is a contingent ancestor
    obtain ⟨hnc, ⟨w', y, hy⟩⟩ := hx.1
    have hw : w = true := hx.2.1
    subst hw
    exact hx.2.2 (.inl (.c (n+1))) (Relation.TransGen.single ⟨rfl, rfl⟩) (cont_c n)
  · exact hx.1.1 (fun _ _ => trivial)
theorem anc_c1 {y : M.Item} (h : M.Anc true y (.inl (.c 1))) : ∃ n, y = .inl (.c n) := by
  have := anc_rank h
  rcases y with ⟨_|n⟩|⟨⟩
  · simp [rank, comp] at this
  · exact ⟨n, rfl⟩
  · rename_i st; cases st; simp [comp] at this

theorem witness :
    (F1_stmt M ∧ Src_stmt M ∧ E_stmt M ∧ L0_stmt M ∧ B1_stmt M ∧ B1'_stmt M ∧ B2_stmt M ∧
     P0_stmt M ∧ P2_stmt M ∧ CE_stmt M ∧ NBL_stmt M ∧ GG_stmt M ∧ P4_stmt M ∧ P5_stmt M ∧ P6_stmt M ∧ P7_stmt M ∧
     P8_stmt M ∧ P9_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P11_stmt M ∧ P12_stmt M ∧ L4_stmt M ∧ P4plus_stmt M) ∧
    ¬ P1_stmt M ∧
    -- 1.7 fails: c 1 has no fundamental ancestor
    ¬ ∃ u, M.Fundamental true u ∧ M.Anc true (.inl u) (.inl (.c 1)) := by
  refine ⟨⟨?F1, fun _ _ _ h => h.elim, ⟨.inl (.c 1), cont_c 0, rfl⟩, fun w x h => Nat.lt_irrefl _ (anc_rank h).1,
    ?B1, fun _ _ _ _ h => h.elim, fun w st _ => by cases st; trivial, fun _ _ h => h.elim,
    ?P2, fun w ⟨x, hx⟩ => absurd hx (F_empty w x), (fun _ _ h => h), (fun _ _ _ h => h.elim), ?P4,
    fun w st ⟨⟨m, hm, _⟩, _⟩ => absurd hm (F_empty w m), fun _ _ _ _ _ => trivial,
    fun _ _ => Or.inl trivial, fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩, fun _ _ _ _ _ _ _ => trivial,
    (fun _ _ _ h => h.elim), (fun _ _ _ h => h.elim), fun _ => ⟨archRat, rfl, ⟨zeroMeasureRat _⟩⟩,
    fun h => (h.2.2 : False).elim, fun _ _ ho => ho.elim, ?P4plus⟩,
    ?P1, ?concl⟩
  case F1 =>
    intro w x y h
    rcases x with ⟨_|m⟩|⟨⟩ <;> rcases y with ⟨_|n⟩|⟨⟩ <;> simp_all [M, Causes, Ething, Model.E]
  case B1 =>
    intro w st z; cases st
    rcases z with ⟨_|n⟩|⟨⟩ <;> simp [M, Causes]
  case P2 =>
    intro w x hx hex
    rcases x with ⟨_|n⟩|⟨⟩
    · exact absurd nec_N hx.1
    · have hw : w = true := hex
      subst hw
      exact ⟨.inl (.c (n+1)), ⟨rfl, rfl⟩⟩
    · exact absurd (fun _ _ => trivial) hx.1
  case P4 =>
    refine ⟨.N, fun w => ⟨⟨nec_N, ⟨true, .inr .s, trivial⟩, fun y h => ?_⟩, fun t ht => ?_⟩⟩
    · rcases y with ⟨_|n⟩|⟨⟩ <;> simp [M, Causes] at h
    · rcases t with _|n
      · rfl
      · exact absurd ht.1 (not_nec_c n)
  case P4plus =>
    intro N0 t hN0 hnec _
    have h0 : N0 = T.N := by
      rcases N0 with _ | n
      · rfl
      · exact absurd (hN0 true).1 (not_nec_c n)
    have ht : t = T.N := by
      rcases t with _ | n
      · rfl
      · exact absurd hnec (not_nec_c n)
    exact ht.trans h0.symm
  case P1 =>
    intro h
    have key : ∀ x : M.Item, (∃ n, x = .inl (.c n)) → False := by
      intro x
      induction x using (h true).induction with
      | _ x ih =>
        rintro ⟨n, rfl⟩
        have step : M.Causes true (.inl (.c (n+1))) (.inl (.c n)) := ⟨rfl, rfl⟩
        exact ih _ (Relation.TransGen.single step) ⟨n+1, rfl⟩
    exact key _ ⟨1, rfl⟩
  case concl =>
    rintro ⟨u, hu, hanc⟩
    obtain ⟨n, hn⟩ := anc_c1 hanc
    cases hn
    exact not_nec_c n hu.1
end W_P1

/-! ### Independence of L4: a zero-propensity open region containing a possible outcome.
Worlds are ℕ → Bool (uncountably many).  N with state s; at each world w a
first contingent thing c w (→ d w) exists only at w, caused by N in virtue of
s.  O is unfavored and propensity-governed.  The open regions are the
singletons {F_v}; every propensity is the designated zero.  P12 holds (Cantor);
L2 holds trivially; L4 fails at the actual world's own region. -/
namespace W_L4
inductive T | N | c (v : Nat → Bool) | d (v : Nat → Bool)
inductive S | s
abbrev Item := Sum T S
abbrev Wd := Nat → Bool
def rank : Item → Nat
  | .inl .N => 0 | .inr .s => 1 | .inl (.c _) => 2 | .inl (.d _) => 3
def Causes (w : Wd) : Item → Item → Prop
  | .inl .N, .inr .s => True
  | .inl .N, .inl (.c v) => v = w
  | .inr .s, .inl (.c v) => v = w
  | .inl (.c v), .inl (.d u) => v = w ∧ u = w
  | _, _ => False
def Ething (w : Wd) : T → Prop
  | .N => True | .c v => v = w | .d v => v = w
def w0 : Wd := fun _ => false
/-- The first-stage output of world v, as a region-independent set. -/
def Fset (v : Wd) : Pred Item := fun x => x = .inl (.c v)
theorem Fset_inj {v u : Wd} (h : Fset v = Fset u) : v = u := by
  have : Fset u (.inl (.c v)) := h ▸ rfl
  exact T.c.inj (Sum.inl.inj this)
/-- Category of an outcome: the world whose output it is (or w0 if none). -/
noncomputable def catF (φ : Pred Item) : Wd :=
  if h : ∃ v, φ = Fset v then Classical.choose h else w0
theorem catF_Fset (v : Wd) : catF (Fset v) = v := by
  have h : ∃ u, Fset v = Fset u := ⟨v, rfl⟩
  show (if h : ∃ u, Fset v = Fset u then Classical.choose h else w0) = v
  rw [dif_pos h]
  exact (Fset_inj (Classical.choose_spec h)).symm

noncomputable def M : Model where
  W := Wd
  w₀ := w0
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Wd
  cat := catF
  E_thing := Ething
  E_state := fun _ _ => True
  Causes := Causes
  CausesVia := fun w t _ z => t = .N ∧ z = .inl (.c w)
  DependsOn := fun _ x => x = .inl .N ∨ x = .inr .s
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ _ _ => False
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun _ _ _ => False

  HasProp := True
  POpen := fun G => ∃ v : Wd, G = fun φ => catF φ = v
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

theorem causes_rank {w : Wd} {x y : Item} (h : Causes w x y) : rank x < rank y := by
  rcases x with ⟨_|v|v⟩|⟨⟩ <;> rcases y with ⟨_|u|u⟩|⟨⟩ <;> simp_all [Causes, rank]
theorem anc_rank {w : Wd} {x y : M.Item} (h : M.Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank h)
theorem causes_exists {w : Wd} {x y : Item} (h : Causes w x y) : M.E w x ∧ M.E w y := by
  rcases x with ⟨_|v|v⟩|⟨⟩ <;> rcases y with ⟨_|u|u⟩|⟨⟩ <;> simp_all [Causes, M, Ething, Model.E]
theorem anc_exists' {w : Wd} {x y : M.Item} (h : M.Anc w x y) : M.E w x := by
  induction h with
  | single h => exact (causes_exists h).1
  | tail _ _ ih => exact ih
theorem flip_ne (w : Wd) : (fun n => !(w n)) ≠ w := fun h => by
  have := congrFun h 0; cases w 0 <;> simp at this
theorem nec_N : M.Nec .N := fun _ => trivial
theorem not_nec_c (v : Wd) : ¬ M.Nec (.c v) := fun h =>
  flip_ne v ((h (fun n => !(v n)) : v = fun n => !(v n)).symm)
theorem not_nec_d (v : Wd) : ¬ M.Nec (.d v) := fun h =>
  flip_ne v ((h (fun n => !(v n)) : v = fun n => !(v n)).symm)
theorem necstate_s : M.NecState .s := fun _ _ => trivial
theorem not_cont_N : ¬ M.ContingentItem (.inl .N) := fun h => h.1 nec_N
theorem not_cont_s : ¬ M.ContingentItem (.inr .s) := fun h => h.1 necstate_s
theorem cont_c (w : Wd) : M.ContingentItem (.inl (.c w)) := ⟨not_nec_c w, ⟨w, .inl (.d w), ⟨rfl, rfl⟩⟩⟩
theorem E_items (w : Wd) : ∀ x : M.Item, M.E w x → x ∈ [Sum.inl T.N, Sum.inr S.s, Sum.inl (T.c w), Sum.inl (T.d w)] := by
  intro x hx
  rcases x with ⟨_|v|v⟩|⟨⟩
  · exact List.Mem.head _
  · have : v = w := hx; subst this; exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  · have : v = w := hx; subst this
    exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))
  · exact List.Mem.tail _ (List.Mem.head _)
theorem F_c (w : Wd) : M.F w (.inl (.c w)) := by
  refine ⟨cont_c w, rfl, ?_⟩
  intro y hy
  have hr := anc_rank hy
  rcases y with ⟨_|v|v⟩|⟨⟩
  · exact not_cont_N
  · simp [rank] at hr
  · simp [rank] at hr
  · exact not_cont_s
theorem F_char : ∀ w x, M.F w x → x = .inl (.c w) := by
  intro w x hx
  rcases x with ⟨_|v|v⟩|⟨⟩
  · exact absurd hx.1 not_cont_N
  · have : v = w := hx.2.1; subst this; rfl
  · exfalso
    have : v = w := hx.2.1; subst this
    have step : M.Causes v (.inl (.c v)) (.inl (.d v)) := ⟨rfl, rfl⟩
    exact hx.2.2 _ (Relation.TransGen.single step) (cont_c v)
  · exact absurd hx.1 not_cont_s
theorem F_eq (w : Wd) : M.F w = Fset w := by
  funext x
  apply propext
  constructor
  · exact F_char w x
  · rintro rfl; exact F_c w
theorem F_inj {v u : Wd} (h : M.F v = M.F u) : v = u := by
  rw [F_eq, F_eq] at h; exact Fset_inj h
theorem cat_F (v : Wd) : M.cat (M.F v) = v := by
  show catF (M.F v) = v
  rw [F_eq]; exact catF_Fset v
theorem not_det : ¬ M.Deterministic := fun h =>
  flip_ne w0 (F_inj (h _ w0 rfl))
theorem propgov : M.PropGoverned w0 := ⟨not_det, fun ⟨_, h⟩ => h, trivial⟩

theorem witness :
    (F1_stmt M ∧ Src_stmt M ∧ E_stmt M ∧ L0_stmt M ∧ B1_stmt M ∧ B1'_stmt M ∧ B2_stmt M ∧
     P0_stmt M ∧ P1_stmt M ∧ P2_stmt M ∧ CE_stmt M ∧ NBL_stmt M ∧ GG_stmt M ∧ P4_stmt M ∧ P5_stmt M ∧ P6_stmt M ∧ P7_stmt M ∧
     P8_stmt M ∧ P9_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P11_stmt M ∧ P12_stmt M ∧ P4plus_stmt M) ∧
    ¬ L4_stmt M ∧
    -- 2.15 fails: O is propensity-governed
    M.PropGoverned w0 ∧
    -- the reduced premises also hold here
    CatU_stmt M ∧ CatOpen_stmt M := by
  refine ⟨⟨fun _ _ _ h => causes_exists h, fun _ _ _ h => h.elim, ⟨.inl (.c w0), cont_c w0, rfl⟩,
    fun w x h => Nat.lt_irrefl _ (anc_rank h), ?B1, ?B1', fun w st _ => by cases st; trivial, ?P0,
    ?P1, ?P2, (fun _ _ => Or.inr (Or.inl trivial)), (fun _ _ h => h), (fun _ _ _ h => h.elim), ?P4,
    fun _ _ _ => ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩, fun _ _ _ _ _ => trivial,
    fun _ _ => Or.inl trivial, fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩, fun _ _ _ _ _ _ _ => trivial,
    (fun _ _ _ h => h.elim), (fun _ _ _ h => h.elim), fun _ => ⟨archRat, rfl, ⟨zeroMeasureRat _⟩⟩, ?P12, ?P4plus⟩, ?L4, propgov, ?CatU, ?CatOpen⟩
  case B1 =>
    intro w st z; cases st
    rcases z with ⟨_|v|v⟩|⟨⟩ <;> simp [M, Causes] <;>
      exact ⟨fun h => by subst h; rfl, fun h => T.c.inj h⟩
  case B1' =>
    intro w t st z h
    obtain ⟨rfl, rfl⟩ := h
    cases st
    exact ⟨rfl, rfl⟩
  case P0 =>
    intro w x hx
    rcases hx with rfl | rfl
    · exact ⟨_, F_c w, rfl⟩
    · exact ⟨_, F_c w, ⟨rfl, rfl⟩⟩
  case P1 =>
    intro w
    exact Subrelation.wf (fun {_ _} h => anc_rank h) (InvImage.wf rank Nat.lt_wfRel.wf)
  case P2 =>
    intro w x hx hex
    rcases x with ⟨_|v|v⟩|⟨⟩
    · exact absurd hx not_cont_N
    · have : v = w := hex; subst this; exact ⟨.inl .N, rfl⟩
    · have : v = w := hex; subst this; exact ⟨.inl (.c v), ⟨rfl, rfl⟩⟩
    · exact absurd hx not_cont_s
  case P4 =>
    refine ⟨.N, fun w => ⟨⟨nec_N, ⟨w, .inr .s, trivial⟩, fun y h => ?_⟩, fun t ht => ?_⟩⟩
    · rcases y with ⟨_|v|v⟩|⟨⟩ <;> simp [M, Causes] at h
    · rcases t with _|v|v
      · rfl
      · exact absurd ht.1 (not_nec_c v)
      · exact absurd ht.1 (not_nec_d v)
  case P12 =>
    intro _
    refine ⟨Wd, fun v => fun φ => catF φ = v, cantor, fun v => ⟨v, rfl⟩,
      fun v => ⟨M.F v, ⟨v, rfl, ⟨_, F_c v⟩⟩, cat_F v⟩, ?_⟩
    intro v u hvu φ ⟨h1, h2⟩
    exact hvu (h1.symm.trans h2)
  case P4plus =>
    intro N0 t hN0 hnec _
    have h0 : N0 = T.N := by
      rcases N0 with _ | v | v
      · rfl
      · exact absurd (hN0 w0).1 (not_nec_c v)
      · exact absurd (hN0 w0).1 (not_nec_d v)
    have ht : t = T.N := by
      rcases t with _ | v | v
      · rfl
      · exact absurd hnec (not_nec_c v)
      · exact absurd hnec (not_nec_d v)
    exact ht.trans h0.symm
  case L4 =>
    intro h
    exact h propgov _ ⟨w0, rfl⟩ rfl w0 (cat_F w0)
  case CatU =>
    intro _
    -- the realized categories are all of Wd, via v ↦ ⟨v, F v⟩
    rintro ⟨f, hf⟩
    apply cantor
    refine ⟨fun v => f ⟨v, M.F v, ⟨v, rfl, ⟨_, F_c v⟩⟩, cat_F v⟩, fun v u h => ?_⟩
    have := hf h
    exact congrArg Subtype.val this
  case CatOpen =>
    intro _ k
    exact ⟨k, rfl⟩
end W_L4

/-! ### What the premises permit about identity: originator, mind, agent.
N is the unique fundamental being and necessarily produces two further
necessary beings, L and M.  There are two representing states: r (underived)
and s (whose source is r).  s is the selecting representation.  The model is
parametrized by WHO bears r (the mind), WHO bears s (the agent), and whether
s is mental.  Every member of the family satisfies all of `Axioms`
(`W_Id.axioms`), so every assignment of the three roles to N, L, M that the
family realizes is consistent with the premises:

  bearer of r | bearer of s | reading
  ------------+-------------+---------------------------------------------
      N       |     N       | one being: originator = mind = agent
      N       |     M       | originator is the mind; another being acts
      L       |     N       | originator acts; another being is the mind
      L       |     L       | mind = agent, but not the originator
      L       |     M       | three distinct beings

`originator_neither` and `agent_ne_originator` are the corollaries for the
last row (with FA, the agent is always a mind; the parameter `mentalS` is
now inert and kept only for continuity).  Together with `identify` (P4⁺ forces row 1) and
`originator_produces_mind_and_agent` (N produces whoever else there is), this
is the complete certified picture. -/
namespace W_Id
inductive T | N | L | M | c | d deriving DecidableEq
inductive S | r | s deriving DecidableEq
abbrev Item := Sum T S
/-- which necessary being bears a state -/
inductive Who | N | L | M deriving DecidableEq
def Who.toT : Who → T | .N => .N | .L => .L | .M => .M
theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .L ∨ x = .inl .M ∨ x = .inl .c ∨ x = .inl .d ∨ x = .inr .r ∨ x = .inr .s := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st <;> simp
def rank : Item → Nat
  | .inl .N => 0 | .inl .L => 1 | .inl .M => 1 | .inr .r => 2 | .inr .s => 3 | .inl .c => 4 | .inl .d => 5
def causesB (br bs : Who) (w : Bool) (x y : Item) : Bool :=
  (x = .inl .N ∧ y = .inl .L) ∨ (x = .inl .N ∧ y = .inl .M) ∨
  (x = .inl br.toT ∧ y = .inr .r) ∨ (x = .inl bs.toT ∧ y = .inr .s) ∨      -- B2
  (x = .inr .r ∧ y = .inr .s) ∨ (x = .inl br.toT ∧ y = .inr .s) ∨          -- source; B1′
  (w = true ∧ x = .inr .s ∧ y = .inl .c) ∨ (w = true ∧ x = .inl bs.toT ∧ y = .inl .c) ∨
  (w = true ∧ x = .inl .c ∧ y = .inl .d)
def ethingB : Bool → T → Bool
  | _, .N => true | _, .L => true | _, .M => true | w, .c => w | w, .d => w
theorem causes_rank (br bs : Who) : ∀ w x y, causesB br bs w x y = true → rank x < rank y := by
  intro w x y h
  cases br <;> cases bs <;>
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
    cases w <;> simp_all [causesB, rank, Who.toT]
def allItems : List Item := [.inl .N, .inl .L, .inl .M, .inl .c, .inl .d, .inr .r, .inr .s]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> simp [allItems]
def bearer (br bs : Who) : S → T | .r => br.toT | .s => bs.toT

def Mk (br bs : Who) (_mentalS : Prop) : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := bearer br bs
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB br bs w x y = true
  CausesVia := fun w t st z =>
    (t = br.toT ∧ st = .r ∧ z = .inr .s) ∨ (t = bs.toT ∧ st = .s ∧ z = .inl .c ∧ w = true)
  DependsOn := fun w x => w = true ∧ (x = .inl bs.toT ∨ x = .inr .s)
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ st st' => st = .s ∧ st' = .r
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun w _ ch => ch = .state .s ∧ w = true

  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun _ _ => True
  Good := fun _ => True

section generic
variable (br bs : Who) (mentalS : Prop)
local notation "M" => Mk br bs mentalS

theorem anc_rank {w : Bool} {x y : (M).Item} (h : (M).Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank br bs _ _ _ h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank br bs _ _ _ h)
theorem nec_N : (M).Nec .N := fun w => by cases w <;> rfl
theorem nec_L : (M).Nec .L := fun w => by cases w <;> rfl
theorem nec_M : (M).Nec .M := fun w => by cases w <;> rfl
theorem not_nec_c : ¬ (M).Nec .c := fun h => by have := h false; simp [Mk, ethingB] at this
theorem not_nec_d : ¬ (M).Nec .d := fun h => by have := h false; simp [Mk, ethingB] at this
theorem necstate (st : S) : (M).NecState st := fun _ _ => trivial
theorem not_cont_thing {t : T} (h : (M).Nec t) : ¬ (M).ContingentItem (.inl t) := fun hc => hc.1 h
theorem not_cont_state (st : S) : ¬ (M).ContingentItem (.inr st) := fun h => h.1 (necstate br bs mentalS st)
theorem E_c {w : Bool} (h : (M).E w (.inl .c)) : w = true := by
  cases w; · exact absurd (h : ethingB false .c = true) Bool.false_ne_true
  · rfl
theorem E_d {w : Bool} (h : (M).E w (.inl .d)) : w = true := by
  cases w; · exact absurd (h : ethingB false .d = true) Bool.false_ne_true
  · rfl
theorem cont_c : (M).ContingentItem (.inl .c) :=
  ⟨not_nec_c br bs mentalS, ⟨true, .inl .d, by simp [Mk, causesB]⟩⟩
theorem no_cont_anc {y : (M).Item} (hy : rank y < 4) : ¬ (M).ContingentItem y := by
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl
  · exact not_cont_thing br bs mentalS (nec_N br bs mentalS)
  · exact not_cont_thing br bs mentalS (nec_L br bs mentalS)
  · exact not_cont_thing br bs mentalS (nec_M br bs mentalS)
  · simp [rank] at hy
  · simp [rank] at hy
  · exact not_cont_state br bs mentalS _
  · exact not_cont_state br bs mentalS _
theorem F_c : (M).F true (.inl .c) :=
  ⟨cont_c br bs mentalS, rfl, fun _ hy => no_cont_anc br bs mentalS (anc_rank br bs mentalS hy)⟩
theorem F_char : ∀ w x, (M).F w x → w = true ∧ x = .inl .c := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl
  · exact absurd hx.1 (not_cont_thing br bs mentalS (nec_N br bs mentalS))
  · exact absurd hx.1 (not_cont_thing br bs mentalS (nec_L br bs mentalS))
  · exact absurd hx.1 (not_cont_thing br bs mentalS (nec_M br bs mentalS))
  · exact ⟨E_c br bs mentalS hx.2.1, rfl⟩
  · exfalso; obtain rfl := E_d br bs mentalS hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (by simp [Mk, causesB] : (M).Causes true (.inl .c) (.inl .d)))
      (cont_c br bs mentalS)
  · exact absurd hx.1 (not_cont_state br bs mentalS _)
  · exact absurd hx.1 (not_cont_state br bs mentalS _)
theorem uncaused_N (w : Bool) : ∀ y, ¬ (M).Causes w y (.inl .N) := fun y h => by
  cases br <;> cases bs <;>
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [Mk, causesB, Who.toT]
theorem fund_N (w : Bool) : (M).Fundamental w .N :=
  ⟨nec_N br bs mentalS, ⟨true, .inl .L, by simp [Mk, causesB]⟩, uncaused_N br bs mentalS w⟩
theorem fund_only_N (w : Bool) : ∀ t, (M).Fundamental w t → t = .N := by
  intro t ht
  cases t
  · rfl
  · exact absurd (by simp [Mk, causesB] : (M).Causes w (.inl .N) (.inl .L)) (ht.2.2 _)
  · exact absurd (by simp [Mk, causesB] : (M).Causes w (.inl .N) (.inl .M)) (ht.2.2 _)
  · exact absurd ht.1 (not_nec_c br bs mentalS)
  · exact absurd ht.1 (not_nec_d br bs mentalS)
/-- The only selecting representation is s, so the only agent is s's bearer. -/
theorem agent_only : ∀ w t, (M).Agent w t → t = bs.toT := by
  rintro w t ⟨st, hb, ⟨m, hm, hvia⟩, _, _⟩
  obtain ⟨rfl, rfl⟩ := F_char br bs mentalS w m hm
  cases st
  · rcases hvia with ⟨_, _, h⟩ | ⟨_, h, _⟩
    · cases h
    · cases h
  · exact hb.symm
theorem selecting_s : (M).SelectingRep true .s :=
  ⟨⟨.inl .c, F_c br bs mentalS, Or.inr ⟨rfl, rfl, rfl, rfl⟩⟩, ⟨.nil, trivial⟩, ⟨rfl, rfl⟩⟩
theorem mind_only : ∀ t, (M).Mind t → t = br.toT ∨ t = bs.toT := by
  rintro t ⟨st, rfl, _⟩
  cases st
  · exact Or.inl rfl
  · exact Or.inr rfl
theorem s_ahistorical (w : Bool) : ¬ (M).Historical w .s :=
  fun ⟨_, hx, hc⟩ => no_cont_anc br bs mentalS
    (Nat.lt_trans (anc_rank br bs mentalS hx) (show rank (Sum.inr S.s) < 4 from Nat.lt_succ_self 3)) hc

theorem axioms : Axioms0 (M) where
  F1 := by
    intro w x y h
    cases br <;> cases bs <;>
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
      rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;>
      cases w <;> simp_all [Mk, causesB, ethingB, Model.E, Who.toT]
  Src := by
    rintro w st st' ⟨rfl, rfl⟩
    exact ⟨Relation.TransGen.single (by simp [Mk, causesB]), ⟨.nil, trivial⟩, fun _ _ => trivial⟩
  E := ⟨.inl .c, cont_c br bs mentalS, rfl⟩
  L0 := fun _ _ h => Nat.lt_irrefl _ (anc_rank br bs mentalS h)
  B1 := by
    intro w st z
    cases br <;> cases bs <;> cases st <;>
      rcases item_cases z with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [Mk, causesB, bearer, Who.toT]
  B1' := by
    intro w t st z h
    rcases h with ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl, rfl⟩
    · exact ⟨rfl, by simp [Mk, causesB]⟩
    · exact ⟨rfl, by simp [Mk, causesB]⟩
  B2 := fun w st _ => by cases st <;> simp [Mk, causesB, bearer]
  P0 := by
    intro w x ⟨hw, hx⟩
    subst hw
    rcases hx with rfl | rfl
    · exact ⟨.inl .c, F_c br bs mentalS, by simp [Mk, causesB]⟩
    · exact ⟨.inl .c, F_c br bs mentalS, Or.inr ⟨rfl, rfl, rfl, rfl⟩⟩
  P1 := fun _ => Subrelation.wf (fun {_ _} h => anc_rank br bs mentalS h) (InvImage.wf rank Nat.lt_wfRel.wf)
  P2 := by
    intro w x hx hex
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hx (not_cont_thing br bs mentalS (nec_N br bs mentalS))
    · exact absurd hx (not_cont_thing br bs mentalS (nec_L br bs mentalS))
    · exact absurd hx (not_cont_thing br bs mentalS (nec_M br bs mentalS))
    · obtain rfl := E_c br bs mentalS hex; exact ⟨.inl bs.toT, by simp [Mk, causesB]⟩
    · obtain rfl := E_d br bs mentalS hex; exact ⟨.inl .c, by simp [Mk, causesB]⟩
    · exact absurd hx (not_cont_state br bs mentalS _)
    · exact absurd hx (not_cont_state br bs mentalS _)
  P4 := ⟨.N, fun w => ⟨fund_N br bs mentalS w, fund_only_N br bs mentalS w⟩⟩
  P5 := fun _ _ _ => ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩
  FA := fun _ _ hnm _ => absurd trivial hnm
  P7 := fun _ _ => Or.inl trivial
  P8 := fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => trivial, trivial⟩⟩
  P9 := fun _ _ _ _ _ _ _ => trivial
  P11 := fun h => absurd ⟨.state .s, rfl, rfl⟩ h.2.1
  P12 := fun h => absurd ⟨.state .s, rfl, rfl⟩ h.2.1
  L4 := fun h => absurd ⟨.state .s, rfl, rfl⟩ h.2.1
  CE := by
    intro w ⟨x, hx⟩
    obtain ⟨rfl, _⟩ := F_char br bs mentalS w x hx
    exact Or.inr (Or.inr ⟨(M).Maximal, .state .s, rfl, rfl⟩)
  NBL := fun _ _ h => by cases h.1
  GG := fun _ _ _ h => h
  CH := by
    rintro w st _ ⟨hst, rfl⟩
    cases st
    · cases hst
    · exact ⟨.inl .c, F_c br bs mentalS, Or.inr ⟨rfl, rfl, rfl, rfl⟩⟩
  TR := fun _ _ _ _ => ⟨trivial, fun _ _ => trivial⟩

/-- The possibility matrix: for every assignment of the mind-role and
    agent-role to N, L, M, and either mentality of s, every premise holds,
    N is the only fundamental being, the agent is exactly the bearer of s,
    and the minds are exactly the bearer of r (plus the bearer of s if s is
    mental). -/
theorem matrix :
    Nonempty (Axioms0 (M)) ∧
    (∀ w t, (M).Fundamental w t → t = .N) ∧
    (∀ w t, (M).Agent w t → t = bs.toT) ∧ (M).Agent true bs.toT ∧
    (∀ t, (M).Mind t → t = br.toT ∨ t = bs.toT) ∧ (M).Mind br.toT ∧ (M).Mind bs.toT :=
  ⟨⟨axioms br bs mentalS⟩, fund_only_N br bs mentalS, agent_only br bs mentalS, ⟨.s, rfl, selecting_s br bs mentalS⟩, mind_only br bs mentalS, ⟨.r, rfl, trivial⟩, ⟨.s, rfl, trivial⟩⟩
end generic

/-- With FA the agent is always a mind (`T3_11'`), so the three-way split
    of v6.5 is gone.  What remains possible without P4⁺: the ORIGINATOR is
    neither the mind nor the agent — N produces L (a mind that knows) and M
    (a mind that knows and selects), and is itself neither; P4⁺ fails. -/
theorem originator_neither :
    Nonempty (Axioms0 (Mk .L .M True)) ∧
    (∀ w t, (Mk .L .M True).Fundamental w t → t = .N) ∧
    (∀ w t, (Mk .L .M True).Agent w t → t = .M) ∧
    (∀ t, (Mk .L .M True).Mind t → t = .L ∨ t = .M) ∧
    (Mk .L .M True).Mind .L ∧ (Mk .L .M True).Mind .M ∧ (Mk .L .M True).Agent true .M ∧
    (T.N ≠ T.L ∧ T.N ≠ T.M ∧ T.L ≠ T.M) ∧
    ¬ P4plus_stmt (Mk .L .M True) :=
  ⟨(matrix .L .M True).1, (matrix .L .M True).2.1, (matrix .L .M True).2.2.1,
   (matrix .L .M True).2.2.2.2.1, (matrix .L .M True).2.2.2.2.2.1, (matrix .L .M True).2.2.2.2.2.2,
   (matrix .L .M True).2.2.2.1, ⟨by simp, by simp, by simp⟩,
   (fun h => by
      have := h .N .L (fund_N .L .M True) (nec_L .L .M True) ⟨true, .inr .r, by simp [Mk, causesB, Who.toT]⟩
      cases this)⟩

/-- The knowing-and-selecting mind need not be the originator. -/
theorem agent_ne_originator :
    Nonempty (Axioms0 (Mk .L .M True)) ∧
    (∀ w t, (Mk .L .M True).Agent w t → t = .M) ∧ (Mk .L .M True).Mind .M ∧ T.N ≠ T.M :=
  ⟨(matrix .L .M True).1, (matrix .L .M True).2.2.1, ⟨.s, rfl, trivial⟩, by simp⟩

/-- Originator is a mind; a distinct being (also a mind, by FA) acts. -/
theorem originator_is_mind_not_agent :
    Nonempty (Axioms0 (Mk .N .M False)) ∧ (Mk .N .M False).Mind .N ∧
    (∀ w t, (Mk .N .M False).Agent w t → t = .M) ∧ (Mk .N .M False).Mind .M ∧ T.N ≠ T.M :=
  ⟨(matrix .N .M False).1, (matrix .N .M False).2.2.2.2.2.1, (matrix .N .M False).2.2.1,
   (matrix .N .M False).2.2.2.2.2.2, by simp⟩

/-- Originator acts (and, by FA, is a mind); another mind exists. -/
theorem originator_is_agent_and_mind_with_another_mind :
    Nonempty (Axioms0 (Mk .L .N False)) ∧ (Mk .L .N False).Agent true .N ∧ (Mk .L .N False).Mind .N ∧
    (Mk .L .N False).Mind .L ∧ T.N ≠ T.L :=
  ⟨(matrix .L .N False).1, (matrix .L .N False).2.2.2.1, (matrix .L .N False).2.2.2.2.2.2,
   (matrix .L .N False).2.2.2.2.2.1, by simp⟩

/-- Mind and agent coincide in a being that is not the originator. -/
theorem mind_is_agent_not_originator :
    Nonempty (Axioms0 (Mk .L .L False)) ∧ (Mk .L .L False).Mind .L ∧ (Mk .L .L False).Agent true .L ∧
    T.N ≠ T.L :=
  ⟨(matrix .L .L False).1, (matrix .L .L False).2.2.2.2.2.1, (matrix .L .L False).2.2.2.1, by simp⟩

/-- All three roles in the originator. -/
theorem all_one :
    Nonempty (Axioms0 (Mk .N .N False)) ∧ (Mk .N .N False).Mind .N ∧ (Mk .N .N False).Agent true .N :=
  ⟨(matrix .N .N False).1, (matrix .N .N False).2.2.2.2.2.1, (matrix .N .N False).2.2.2.1⟩
end W_Id

/-! ### The restricted P7/P8 do not entail ties: a discriminating balance.
One necessary being N with one necessary selecting state s.  At the actual
world N produces c1 (→ d1); at the other world N produces c2 (→ d2), in
virtue of the same state.  The balance strictly prefers the actual reality:
`AtLeast r r'` iff r is the actual reality or r' is the empty reality.
Every field of `Axioms` holds (P7/P8 at w₀), but the all-worlds P8 fails at
the other world, and the alternative reality is NOT at least as well
supported as the actual one — so `all_tied`'s conclusion fails. -/
namespace W_Pref
inductive T | N | c1 | c2 | d1 | d2 deriving DecidableEq
inductive S | s deriving DecidableEq
abbrev Item := Sum T S
theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .c1 ∨ x = .inl .c2 ∨ x = .inl .d1 ∨ x = .inl .d2 ∨ x = .inr .s := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st; simp
def rank : Item → Nat
  | .inl .N => 0 | .inr .s => 1 | .inl .c1 => 2 | .inl .c2 => 2 | .inl .d1 => 3 | .inl .d2 => 3
def causesB : Bool → Item → Item → Bool
  | _,     .inl .N,  .inr .s  => true
  | true,  .inl .N,  .inl .c1 => true
  | true,  .inr .s,  .inl .c1 => true
  | true,  .inl .c1, .inl .d1 => true
  | false, .inl .N,  .inl .c2 => true
  | false, .inr .s,  .inl .c2 => true
  | false, .inl .c2, .inl .d2 => true
  | _, _, _ => false
def ethingB : Bool → T → Bool
  | _, .N => true | w, .c1 => w | w, .d1 => w | w, .c2 => !w | w, .d2 => !w
theorem causes_rank : ∀ w x y, causesB w x y = true → rank x < rank y := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;>
    cases w <;> simp_all [causesB, rank]
def allItems : List Item := [.inl .N, .inl .c1, .inl .c2, .inl .d1, .inl .d2, .inr .s]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> simp [allItems]

/-- the actual reality, as a set of items: {c1} (d1 causes nothing, so is not concrete) -/
def actual : Pred Item := fun x => x = .inl .c1

def M : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB w x y = true
  CausesVia := fun w t _ z => t = .N ∧ ((w = true ∧ z = .inl .c1) ∨ (w = false ∧ z = .inl .c2))
  DependsOn := fun _ x => x = .inl .N ∨ x = .inr .s
  Bears := fun _ _ => True
  Rep := fun _ _ => True
  Source := fun _ _ _ => False
  Mental := fun _ => True
  Accurate := fun _ _ => True
  Sens := fun _ _ ch => ch = .state .s

  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun r r' => r = actual ∨ r' = (fun _ => False)
  Good := fun _ => True

theorem anc_rank {w : Bool} {x y : M.Item} (h : M.Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank _ _ _ h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank _ _ _ h)
theorem nec_N : M.Nec .N := fun w => by cases w <;> rfl
theorem not_nec {t : T} (h : t ≠ .N) : ¬ M.Nec t := fun hn => by
  have hf := hn false; have ht := hn true; cases t <;> simp_all [M, ethingB]
theorem necstate_s : M.NecState .s := fun _ _ => trivial
theorem not_cont_N : ¬ M.ContingentItem (.inl .N) := fun h => h.1 nec_N
theorem not_cont_s : ¬ M.ContingentItem (.inr .s) := fun h => h.1 necstate_s
theorem cont_c1 : M.ContingentItem (.inl .c1) := ⟨not_nec (by simp), ⟨true, .inl .d1, rfl⟩⟩
theorem cont_c2 : M.ContingentItem (.inl .c2) := ⟨not_nec (by simp), ⟨false, .inl .d2, rfl⟩⟩
theorem E_c1 {w : Bool} (h : M.E w (.inl .c1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .c1 = true) Bool.false_ne_true
  · rfl
theorem E_d1 {w : Bool} (h : M.E w (.inl .d1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .d1 = true) Bool.false_ne_true
  · rfl
theorem E_c2 {w : Bool} (h : M.E w (.inl .c2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .c2 = true) Bool.false_ne_true
theorem E_d2 {w : Bool} (h : M.E w (.inl .d2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .d2 = true) Bool.false_ne_true
theorem no_cont_anc {y : M.Item} (hy : rank y < 2) : ¬ M.ContingentItem y := by
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl
  · exact not_cont_N
  · simp [rank] at hy
  · simp [rank] at hy
  · simp [rank] at hy
  · simp [rank] at hy
  · exact not_cont_s
theorem F_c1 : M.F true (.inl .c1) := ⟨cont_c1, rfl, fun _ hy => no_cont_anc (anc_rank hy)⟩
theorem F_c2 : M.F false (.inl .c2) := ⟨cont_c2, rfl, fun _ hy => no_cont_anc (anc_rank hy)⟩
theorem F_char : ∀ w x, M.F w x → (w = true ∧ x = .inl .c1) ∨ (w = false ∧ x = .inl .c2) := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
  · exact absurd hx.1 not_cont_N
  · exact Or.inl ⟨E_c1 hx.2.1, rfl⟩
  · exact Or.inr ⟨E_c2 hx.2.1, rfl⟩
  · exfalso; obtain rfl := E_d1 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB true (.inl .c1) (.inl .d1) = true)) cont_c1
  · exfalso; obtain rfl := E_d2 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB false (.inl .c2) (.inl .d2) = true)) cont_c2
  · exact absurd hx.1 not_cont_s
theorem fund_N (w : Bool) : M.Fundamental w .N :=
  ⟨nec_N, ⟨true, .inr .s, rfl⟩, fun y h => by
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [M, causesB]⟩
theorem realOf_true : M.realOf true = actual := by
  funext x
  apply propext
  constructor
  · rintro ⟨hc, he⟩
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hc not_cont_N
    · rfl
    · exact absurd (E_c2 he) (by decide)
    · exfalso
      obtain ⟨w, y, hy⟩ := hc.2
      rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB] at hy
    · exact absurd (E_d2 he) (by decide)
    · exact absurd hc not_cont_s
  · rintro rfl
    exact ⟨cont_c1, rfl⟩
theorem realOf_false_ne : M.realOf false ≠ actual := by
  intro h
  have : M.realOf false (.inl .c1) := h ▸ rfl
  exact absurd (E_c1 this.2) (by decide)
theorem realOf_true_ne_empty : M.realOf true ≠ (fun _ => False) := by
  intro h
  have : M.realOf true (.inl .c1) := ⟨cont_c1, rfl⟩
  rw [h] at this; exact this
theorem realOf_false_ne_empty : M.realOf false ≠ (fun _ => False) := by
  intro h
  have : M.realOf false (.inl .c2) := ⟨cont_c2, rfl⟩
  rw [h] at this; exact this

theorem axioms : Axioms M where
  F1 := by
    intro w x y h
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;>
      cases w <;> simp_all [M, causesB, ethingB, Model.E]
  Src := fun _ _ _ h => h.elim
  E := ⟨.inl .c1, cont_c1, rfl⟩
  L0 := fun _ _ h => Nat.lt_irrefl _ (anc_rank h)
  B1 := by
    intro w st z; cases st
    rcases item_cases z with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB]
  B1' := by
    rintro w t st z ⟨ht, h⟩
    subst ht; cases st
    rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> exact ⟨rfl, rfl⟩
  B2 := fun w st _ => by cases st; cases w <;> rfl
  P0 := by
    intro w x hx
    cases w
    · rcases hx with rfl | rfl
      · exact ⟨.inl .c2, F_c2, rfl⟩
      · exact ⟨.inl .c2, F_c2, ⟨rfl, Or.inr ⟨rfl, rfl⟩⟩⟩
    · rcases hx with rfl | rfl
      · exact ⟨.inl .c1, F_c1, rfl⟩
      · exact ⟨.inl .c1, F_c1, ⟨rfl, Or.inl ⟨rfl, rfl⟩⟩⟩
  P1 := fun _ => Subrelation.wf (fun {_ _} h => anc_rank h) (InvImage.wf rank Nat.lt_wfRel.wf)
  P2 := by
    intro w x hx hex
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hx not_cont_N
    · obtain rfl := E_c1 hex; exact ⟨.inl .N, rfl⟩
    · obtain rfl := E_c2 hex; exact ⟨.inl .N, rfl⟩
    · obtain rfl := E_d1 hex; exact ⟨.inl .c1, rfl⟩
    · obtain rfl := E_d2 hex; exact ⟨.inl .c2, rfl⟩
    · exact absurd hx not_cont_s
  P4 := ⟨.N, fun w => ⟨fund_N w, fun t ht => by
    cases t
    · rfl
    all_goals exact absurd ht.1 (not_nec (by simp))⟩⟩
  P5 := fun _ _ _ => ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩
  FA := fun _ _ hnm _ => absurd trivial hnm
  P7 := fun _ _ => Or.inl trivial
  P8 := fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => Or.inl realOf_true, Or.inl realOf_true⟩⟩
  P9 := fun _ _ _ _ _ _ _ => trivial
  P11 := fun h => absurd ⟨.state .s, rfl⟩ h.2.1
  P12 := fun h => absurd ⟨.state .s, rfl⟩ h.2.1
  L4 := fun h => absurd ⟨.state .s, rfl⟩ h.2.1
  CE := fun _ _ => Or.inr (Or.inr ⟨M.Maximal, .state .s, rfl⟩)
  NBL := fun _ _ h => by cases h
  GG := fun _ _ _ h => h
  CH := by
    rintro w st _ hst
    cases st
    cases w
    · exact ⟨.inl .c2, F_c2, ⟨rfl, Or.inr ⟨rfl, rfl⟩⟩⟩
    · exact ⟨.inl .c1, F_c1, ⟨rfl, Or.inl ⟨rfl, rfl⟩⟩⟩
  TR := fun _ _ _ _ => ⟨trivial, fun _ _ => trivial⟩
  P4plus := by
    intro N0 t hN0 hnec _
    have h0 : N0 = T.N := by
      cases N0
      · rfl
      all_goals exact absurd (hN0 true).1 (not_nec (by simp))
    have ht : t = T.N := by
      cases t
      · rfl
      all_goals exact absurd hnec (not_nec (by simp))
    exact ht.trans h0.symm

/-- The same agent, in the same necessary state, satisfying the P7-antecedent
    at the OTHER world, produces the strictly worse reality. -/
theorem residue : M.P7Antecedent false .N ∧ ¬ M.Maximal (M.realOf false) :=
  ⟨⟨⟨.s, rfl, ⟨⟨.inl .c2, F_c2, ⟨rfl, Or.inr ⟨rfl, rfl⟩⟩⟩, ⟨.nil, trivial⟩, rfl⟩,
      ⟨trivial, fun _ _ => ⟨trivial, fun _ _ => trivial⟩⟩, fun _ _ => trivial⟩, fun _ h _ => h.elim⟩,
   fun hmax => by
     rcases hmax.1 _ ⟨true, rfl, ⟨_, F_c1⟩⟩ with h1 | h1
     · exact realOf_false_ne h1
     · exact realOf_true_ne_empty h1⟩

/-- THE THEIST'S RESIDUE, certified.  All of `Axioms` holds; the balance
    strictly prefers the actual reality; the all-worlds P8 fails; and at the
    non-actual world the very same agent, in the same necessary state, with
    the same complete accurate representation, satisfies the P7-antecedent
    and produces the worse reality.  Nothing in the ground distinguishes the
    world where it acted on the best reasons from the world where it did not.
    This is the libertarian residue, and it is not confined to ties. -/
theorem witness :
    Nonempty (Axioms M) ∧ ¬ P8all_stmt M ∧
    M.AtLeast (M.realOf true) (M.realOf false) ∧ ¬ M.AtLeast (M.realOf false) (M.realOf true) ∧
    M.P7Antecedent false .N ∧ ¬ M.Maximal (M.realOf false) := by
  refine ⟨⟨axioms⟩, ?_, Or.inl realOf_true, ?_, residue.1, residue.2⟩
  · intro h
    have hacc := (h false .N residue.1).2 trivial
    exact residue.2 hacc
  · rintro (h | h)
    · exact realOf_false_ne h
    · have : M.realOf true (.inl .c1) := ⟨cont_c1, rfl⟩
      rw [h] at this; exact this
end W_Pref

namespace W_Nat
inductive T | N | c1 | c2 | d1 | d2 deriving DecidableEq
inductive S | s deriving DecidableEq
abbrev Item := Sum T S
theorem item_cases (x : Item) :
    x = .inl .N ∨ x = .inl .c1 ∨ x = .inl .c2 ∨ x = .inl .d1 ∨ x = .inl .d2 ∨ x = .inr .s := by
  rcases x with ⟨t⟩|⟨st⟩
  · cases t <;> simp
  · cases st; simp
def rank : Item → Nat
  | .inl .N => 0 | .inr .s => 1 | .inl .c1 => 2 | .inl .c2 => 2 | .inl .d1 => 3 | .inl .d2 => 3
def causesB : Bool → Item → Item → Bool
  | _,     .inl .N,  .inr .s  => true
  | true,  .inl .N,  .inl .c1 => true
  | true,  .inr .s,  .inl .c1 => true
  | true,  .inl .c1, .inl .d1 => true
  | false, .inl .N,  .inl .c2 => true
  | false, .inr .s,  .inl .c2 => true
  | false, .inl .c2, .inl .d2 => true
  | _, _, _ => false
def ethingB : Bool → T → Bool
  | _, .N => true | w, .c1 => w | w, .d1 => w | w, .c2 => !w | w, .d2 => !w
theorem causes_rank : ∀ w x y, causesB w x y = true → rank x < rank y := by
  intro w x y h
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;>
    cases w <;> simp_all [causesB, rank]
def allItems : List Item := [.inl .N, .inl .c1, .inl .c2, .inl .d1, .inl .d2, .inr .s]
theorem mem_allItems : ∀ x : Item, x ∈ allItems := by
  intro x; rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> simp [allItems]

/-- the actual reality, as a set of items: {c1} (d1 causes nothing, so is not concrete) -/
def actual : Pred Item := fun x => x = .inl .c1

def M : Model where
  W := Bool
  w₀ := true
  Thing := T
  State := S
  bearer := fun _ => .N
  Consideration := Unit
  V := Rat
  vzero := 0
  K := Unit
  kind := fun _ => ()
  Cat := Unit
  cat := fun _ => ()
  E_thing := fun w t => ethingB w t = true
  E_state := fun _ _ => True
  Causes := fun w x y => causesB w x y = true
  CausesVia := fun w t _ z => t = .N ∧ ((w = true ∧ z = .inl .c1) ∨ (w = false ∧ z = .inl .c2))
  DependsOn := fun _ x => x = .inl .N ∨ x = .inr .s
  Bears := fun _ _ => True
  Rep := fun _ _ => False
  Source := fun _ _ _ => False
  Mental := fun _ => False
  Accurate := fun _ _ => True
  Sens := fun _ _ _ => False

  HasProp := False
  POpen := fun _ => False
  μ := fun _ => 0
  MotivState := fun _ => False
  ActsOnBest := fun _ _ => True
  EssOutweighs := fun _ => False
  AtLeast := fun r r' => r = actual ∨ r' = (fun _ => False)
  Good := fun _ => True

theorem anc_rank {w : Bool} {x y : M.Item} (h : M.Anc w x y) : rank x < rank y := by
  induction h with
  | single h => exact causes_rank _ _ _ h
  | tail _ h ih => exact Nat.lt_trans ih (causes_rank _ _ _ h)
theorem nec_N : M.Nec .N := fun w => by cases w <;> rfl
theorem not_nec {t : T} (h : t ≠ .N) : ¬ M.Nec t := fun hn => by
  have hf := hn false; have ht := hn true; cases t <;> simp_all [M, ethingB]
theorem necstate_s : M.NecState .s := fun _ _ => trivial
theorem not_cont_N : ¬ M.ContingentItem (.inl .N) := fun h => h.1 nec_N
theorem not_cont_s : ¬ M.ContingentItem (.inr .s) := fun h => h.1 necstate_s
theorem cont_c1 : M.ContingentItem (.inl .c1) := ⟨not_nec (by simp), ⟨true, .inl .d1, rfl⟩⟩
theorem cont_c2 : M.ContingentItem (.inl .c2) := ⟨not_nec (by simp), ⟨false, .inl .d2, rfl⟩⟩
theorem E_c1 {w : Bool} (h : M.E w (.inl .c1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .c1 = true) Bool.false_ne_true
  · rfl
theorem E_d1 {w : Bool} (h : M.E w (.inl .d1)) : w = true := by
  cases w; · exact absurd (h : ethingB false .d1 = true) Bool.false_ne_true
  · rfl
theorem E_c2 {w : Bool} (h : M.E w (.inl .c2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .c2 = true) Bool.false_ne_true
theorem E_d2 {w : Bool} (h : M.E w (.inl .d2)) : w = false := by
  cases w; · rfl
  · exact absurd (h : ethingB true .d2 = true) Bool.false_ne_true
theorem no_cont_anc {y : M.Item} (hy : rank y < 2) : ¬ M.ContingentItem y := by
  rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl
  · exact not_cont_N
  · simp [rank] at hy
  · simp [rank] at hy
  · simp [rank] at hy
  · simp [rank] at hy
  · exact not_cont_s
theorem F_c1 : M.F true (.inl .c1) := ⟨cont_c1, rfl, fun _ hy => no_cont_anc (anc_rank hy)⟩
theorem F_c2 : M.F false (.inl .c2) := ⟨cont_c2, rfl, fun _ hy => no_cont_anc (anc_rank hy)⟩
theorem F_char : ∀ w x, M.F w x → (w = true ∧ x = .inl .c1) ∨ (w = false ∧ x = .inl .c2) := by
  intro w x hx
  rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
  · exact absurd hx.1 not_cont_N
  · exact Or.inl ⟨E_c1 hx.2.1, rfl⟩
  · exact Or.inr ⟨E_c2 hx.2.1, rfl⟩
  · exfalso; obtain rfl := E_d1 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB true (.inl .c1) (.inl .d1) = true)) cont_c1
  · exfalso; obtain rfl := E_d2 hx.2.1
    exact hx.2.2 _ (Relation.TransGen.single (rfl : causesB false (.inl .c2) (.inl .d2) = true)) cont_c2
  · exact absurd hx.1 not_cont_s
theorem fund_N (w : Bool) : M.Fundamental w .N :=
  ⟨nec_N, ⟨true, .inr .s, rfl⟩, fun y h => by
    rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp_all [M, causesB]⟩
theorem realOf_true : M.realOf true = actual := by
  funext x
  apply propext
  constructor
  · rintro ⟨hc, he⟩
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hc not_cont_N
    · rfl
    · exact absurd (E_c2 he) (by decide)
    · exfalso
      obtain ⟨w, y, hy⟩ := hc.2
      rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB] at hy
    · exact absurd (E_d2 he) (by decide)
    · exact absurd hc not_cont_s
  · rintro rfl
    exact ⟨cont_c1, rfl⟩
theorem realOf_false_ne : M.realOf false ≠ actual := by
  intro h
  have : M.realOf false (.inl .c1) := h ▸ rfl
  exact absurd (E_c1 this.2) (by decide)
theorem realOf_true_ne_empty : M.realOf true ≠ (fun _ => False) := by
  intro h
  have : M.realOf true (.inl .c1) := ⟨cont_c1, rfl⟩
  rw [h] at this; exact this
theorem realOf_false_ne_empty : M.realOf false ≠ (fun _ => False) := by
  intro h
  have : M.realOf false (.inl .c2) := ⟨cont_c2, rfl⟩
  rw [h] at this; exact this

theorem not_det : ¬ M.Deterministic := by
  intro h
  have e : M.F true = M.F false := h true false rfl
  have hc := F_c1
  rw [e] at hc
  rcases F_char _ _ hc with ⟨h1, _⟩ | ⟨_, h2⟩
  · cases h1
  · cases h2

/-- The naturalist's complete package.  Every field of `Axioms` — including
    P4⁺, NBL, GG, CH, TR, FA — holds; only CE fails.  There is no mind, no
    representation, no favoring, no chance: a necessary initial state that
    produces one of several genuinely different contingent realities, with
    nothing about the outcome mattering to which. -/
theorem witness :
    (F1_stmt M ∧ Src_stmt M ∧ E_stmt M ∧ L0_stmt M ∧ B1_stmt M ∧ B1'_stmt M ∧ B2_stmt M ∧
     P0_stmt M ∧ P1_stmt M ∧ P2_stmt M ∧ P4_stmt M ∧ P5_stmt M ∧ FA_stmt M ∧ P7_stmt M ∧
     P8_stmt M ∧ P9_stmt M ∧ P11_stmt M ∧ P12_stmt M ∧ L4_stmt M ∧
     NBL_stmt M ∧ GG_stmt M ∧ CH_stmt M ∧ TR_stmt M ∧ P4plus_stmt M) ∧
    ¬ CE_stmt M ∧
    -- the naturalist's world: non-deterministic, no chance, no favoring, no mind, no representation
    ¬ M.Deterministic ∧ ¬ M.HasProp ∧ ¬ M.Favored true ∧ M.Bare true ∧
    (¬ ∃ t, M.Mind t) ∧ (¬ ∃ st c, M.Rep st c) ∧
    -- but genuinely different possible realities
    M.realOf true ≠ M.realOf false := by
  refine ⟨⟨?F1, fun _ _ _ h => h.elim, ⟨.inl .c1, cont_c1, rfl⟩, fun _ _ h => Nat.lt_irrefl _ (anc_rank h),
    ?B1, ?B1', fun w st _ => by cases st; cases w <;> rfl, ?P0,
    (fun _ => Subrelation.wf (fun {_ _} h => anc_rank h) (InvImage.wf rank Nat.lt_wfRel.wf)), ?P2, ?P4,
    fun _ _ hs => hs.2.2.elim, fun _ _ _ _ => ⟨fun _ h => h.elim, fun h => h.elim⟩,
    fun _ _ => Or.inl trivial, fun _ _ => ⟨fun h => h, fun _ => ⟨fun _ _ => Or.inl realOf_true, Or.inl realOf_true⟩⟩,
    fun _ _ ⟨_, h⟩ => h.elim,
    fun h => h.2.2.elim, fun h => h.2.2.elim, fun h => h.2.2.elim,
    fun _ _ h => h, fun _ _ _ h => h.elim, fun _ _ _ h => h.elim, fun _ _ _ h => h.elim, ?P4plus⟩,
    ?CE, not_det, id, fun ⟨_, h⟩ => h, ⟨not_det, fun ⟨_, h⟩ => h, id⟩,
    fun ⟨_, _, _, hm⟩ => hm, fun ⟨_, _, h⟩ => h, ?diff⟩
  case F1 =>
    intro w x y h
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl <;> rcases item_cases y with rfl|rfl|rfl|rfl|rfl|rfl <;>
      cases w <;> simp_all [M, causesB, ethingB, Model.E]
  case B1 =>
    intro w st z; cases st
    rcases item_cases z with rfl|rfl|rfl|rfl|rfl|rfl <;> cases w <;> simp [M, causesB]
  case B1' =>
    rintro w t st z ⟨ht, h⟩
    subst ht; cases st
    rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> exact ⟨rfl, rfl⟩
  case P0 =>
    intro w x hx
    cases w
    · rcases hx with rfl | rfl
      · exact ⟨.inl .c2, F_c2, rfl⟩
      · exact ⟨.inl .c2, F_c2, ⟨rfl, Or.inr ⟨rfl, rfl⟩⟩⟩
    · rcases hx with rfl | rfl
      · exact ⟨.inl .c1, F_c1, rfl⟩
      · exact ⟨.inl .c1, F_c1, ⟨rfl, Or.inl ⟨rfl, rfl⟩⟩⟩
  case P2 =>
    intro w x hx hex
    rcases item_cases x with rfl|rfl|rfl|rfl|rfl|rfl
    · exact absurd hx not_cont_N
    · obtain rfl := E_c1 hex; exact ⟨.inl .N, rfl⟩
    · obtain rfl := E_c2 hex; exact ⟨.inl .N, rfl⟩
    · obtain rfl := E_d1 hex; exact ⟨.inl .c1, rfl⟩
    · obtain rfl := E_d2 hex; exact ⟨.inl .c2, rfl⟩
    · exact absurd hx not_cont_s
  case P4 =>
    exact ⟨.N, fun w => ⟨fund_N w, fun t ht => by
      cases t
      · rfl
      all_goals exact absurd ht.1 (not_nec (by simp))⟩⟩
  case P4plus =>
    intro N0 t hN0 hnec _
    have h0 : N0 = T.N := by
      cases N0
      · rfl
      all_goals exact absurd (hN0 true).1 (not_nec (by simp))
    have ht : t = T.N := by
      cases t
      · rfl
      all_goals exact absurd hnec (not_nec (by simp))
    exact ht.trans h0.symm
  case CE =>
    intro h
    rcases h true ⟨_, F_c1⟩ with hd | hp | ⟨_, _, hs⟩
    · exact not_det hd
    · exact hp
    · exact hs
  case diff =>
    intro h
    have : M.realOf false (.inl .c1) := h ▸ ⟨cont_c1, rfl⟩
    exact absurd (E_c1 this.2) (by decide)
end W_Nat

/-! ### The TR fork, witnessed (v8.8).  See `Powers`, `powers_fork`. -/

namespace W_Nat
/-- The natural powers structure on any model: s is directed at D iff every
    productive world's reality has D.  `manif` is then immediate.  This is
    the weakest reading of "directed at D" that satisfies the powers
    theorist's own axiom, so it is the one most favourable to him. -/
def Pw : Powers M where
  Directed := fun st D => st = .s ∧ ∀ w, (∃ x, M.F w x) → D (M.realOf w)
  manif := fun _ _ ⟨_, h⟩ w m hm _ => h w ⟨m, hm⟩

theorem channel : PowersChannel M .s :=
  ⟨necstate_s, fun w hne => by
    cases w
    · exact ⟨.inl .c2, F_c2, rfl, Or.inr ⟨rfl, rfl⟩⟩
    · exact ⟨.inl .c1, F_c1, rfl, Or.inl ⟨rfl, rfl⟩⟩⟩

/-- s is directed at a determinate type: "a non-empty reality". -/
theorem directed_nonempty : Pw.Directed .s (fun r => ∃ x, r x) :=
  ⟨rfl, fun _ ⟨x, hx⟩ => ⟨x, hx.1, hx.2.1⟩⟩

theorem not_maximal_false : ¬ M.Maximal (M.realOf false) := fun hmax => by
  rcases hmax.1 _ ⟨true, rfl, ⟨_, F_c1⟩⟩ with h | h
  · exact realOf_false_ne h
  · exact realOf_true_ne_empty h

/-- On the bare naturalist's discriminating balance, NO powers structure
    directs s at maximality: `manif` would force maximality at `false`. -/
theorem no_powers_at_maximal : ¬ ∃ Pw' : Powers M, Pw'.Directed .s M.Maximal :=
  fun ⟨Pw', hD⟩ => not_maximal_false (powers_all_maximal Pw' channel hD false ⟨_, F_c2⟩)

/-- HORN 2, certified.  On the bare naturalist's own model: s is a powers
    channel, directed at a determinate type, with no `Sens` through any
    channel — and CE fails.  A power directed at a determinate type, with
    the alternatives not figuring, IS the bare naturalist. -/
theorem powers_witness :
    PowersChannel M .s ∧ Pw.Directed .s (fun r => ∃ x, r x) ∧
    (∀ w P ch, ¬ M.Sens w P ch) ∧ ¬ CE_stmt M ∧
    (¬ ∃ Pw' : Powers M, Pw'.Directed .s M.Maximal) :=
  ⟨channel, directed_nonempty, fun _ _ _ h => h, witness.2.1, no_powers_at_maximal⟩

/-- THE FALLIBLE READING, on the bare naturalist's model.  The generic
    fallible structure directs s at maximality — it manifests maximality at
    w₀ and fails at w′ — with no `Sens` through any channel, the production
    bare at both worlds, and CE false.  A fallible directedness at the best,
    with the alternatives not figuring, IS the bare naturalist. -/
theorem fallible_witness :
    (FalliblePowers.actual M .s).Directed .s M.Maximal ∧ ¬ M.Maximal (M.realOf false) ∧
    (∀ w P ch, ¬ M.Sens w P ch) ∧ M.Bare true ∧ M.Bare false ∧ ¬ CE_stmt M :=
  ⟨⟨rfl, ⟨fun _ _ => Or.inl realOf_true, Or.inl realOf_true⟩⟩,
   not_maximal_false, fun _ _ _ h => h, witness.2.2.2.2.2.1,
   ⟨not_det, fun ⟨_, h⟩ => h, id⟩, witness.2.1⟩
end W_Nat

namespace W_Pref
theorem channel : PowersChannel M .s :=
  ⟨necstate_s, fun w hne => by
    cases w
    · exact ⟨.inl .c2, F_c2, rfl, Or.inr ⟨rfl, rfl⟩⟩
    · exact ⟨.inl .c1, F_c1, rfl, Or.inl ⟨rfl, rfl⟩⟩⟩

/-- THE THEIST'S STATE IS NOT A POWER.  In the theist's own model, where the
    selecting state s is sensitive to maximality at both worlds and produces
    the worse at w′ (`residue`), no powers structure directs s at maximality.
    `Sens` is inclination (D20); a power would necessitate.  The powers
    naturalist cannot borrow the theist's discriminating balance. -/
theorem no_powers_at_maximal : ¬ ∃ Pw' : Powers M, Pw'.Directed .s M.Maximal :=
  fun ⟨Pw', hD⟩ => residue.2 (powers_all_maximal Pw' channel hD false ⟨_, F_c2⟩)

/-- THE FALLIBLE READING, on the theist's model.  The SAME generic structure
    directs the theist's selecting state at maximality — manifests at w₀,
    fails at w′ (`residue`) — and here `Sens` holds at both worlds.  Compare
    `W_Nat.fallible_witness`: same fallible directedness, same causal
    structure, same balance.  The two models differ in `Sens`, `Rep`,
    `Mental` and nothing else. -/
theorem fallible_witness :
    (FalliblePowers.actual M .s).Directed .s M.Maximal ∧ ¬ M.Maximal (M.realOf false) ∧
    (∀ w P, M.Sens w P (.state .s)) ∧ M.Favored true ∧ M.Favored false :=
  ⟨⟨rfl, ⟨fun _ _ => Or.inl realOf_true, Or.inl realOf_true⟩⟩,
   residue.2, fun _ _ => rfl, ⟨.state .s, rfl⟩, ⟨.state .s, rfl⟩⟩
end W_Pref

namespace NoTR
def Pw : Powers (Mk P) where
  Directed := fun st D => st = .s ∧ ∀ w, (∃ x, (Mk P).F w x) → D ((Mk P).realOf w)
  manif := fun _ _ ⟨_, h⟩ w m hm _ => h w ⟨m, hm⟩

theorem channel : PowersChannel (Mk P) .s :=
  ⟨necstate_s P, fun w hne => by
    cases w
    · exact absurd hne (empty_world P)
    · exact ⟨.inl .c, F_c P, rfl, rfl, rfl, rfl⟩⟩

/-- HORN 1, certified consistent.  `NoTR`'s balance ties everything
    (`AtLeast := True`), so s IS directed at maximality here, every field but
    TR holds, and — as `powers_all_tied` says it must — every possible reality
    is tied.  This is the only kind of model in which a power directed at
    maximality can live. -/
theorem powers_horn1 :
    PowersChannel (Mk P) .s ∧ Pw.Directed .s (Mk P).Maximal ∧
    (∀ r r', (Mk P).InOmega r → (Mk P).InOmega r' → (Mk P).AtLeast r r' ∧ (Mk P).AtLeast r' r) ∧
    ¬ TR_stmt (Mk P) :=
  ⟨channel, ⟨rfl, fun _ _ => ⟨fun _ _ => trivial, trivial⟩⟩,
   powers_all_tied Pw channel ⟨rfl, fun _ _ => ⟨fun _ _ => trivial, trivial⟩⟩,
   witness.2.2.2.2.2.2.1⟩
end NoTR

end Toy

#print axioms NecessaryAgent.main
#print axioms NecessaryAgent.god_exists
#print axioms NecessaryAgent.identify
#print axioms NecessaryAgent.T3_11'
#print axioms NecessaryAgent.T2_4'
#print axioms Toy.premises_consistent
#print axioms Toy.Bare.witness
#print axioms Toy.Axiarch.witness
#print axioms Toy.NoCH.witness
#print axioms Toy.NoTR.witness
#print axioms Toy.DLaw.witness
#print axioms Toy.DState.witness
#print axioms NecessaryAgent.no_modal_collapse
#print axioms NecessaryAgent.mind_of_CE_NBL
#print axioms NecessaryAgent.P3_of
#print axioms NecessaryAgent.exists_maximal
#print axioms NecessaryAgent.T4_6s
#print axioms NecessaryAgent.knows_actual
#print axioms Toy.NoMind.witness
#print axioms Toy.NoAcc.witness
#print axioms Toy.Narrow.witness
#print axioms Toy.Chance.witness
#print axioms Toy.W_P2.witness
#print axioms Toy.W_P4.witness
#print axioms Toy.W_P1.witness
#print axioms Toy.W_L4.witness
#print axioms NecessaryAgent.P12_of_cat
#print axioms NecessaryAgent.L2_of_P11
#print axioms NecessaryAgent.archRat
#print axioms Toy.W_Id.originator_neither
#print axioms Toy.W_Id.agent_ne_originator
#print axioms Toy.W_Id.matrix
#print axioms Toy.W_Id.originator_is_mind_not_agent
#print axioms Toy.W_Id.originator_is_agent_and_mind_with_another_mind
#print axioms Toy.W_Id.mind_is_agent_not_originator
#print axioms Toy.W_Id.all_one
#print axioms NecessaryAgent.originator_produces_mind_and_agent
#print axioms NecessaryAgent.stateless_originator_is_neither
#print axioms NecessaryAgent.all_worlds_accord'
#print axioms NecessaryAgent.all_tied
#print axioms Toy.W_Pref.witness
#print axioms Toy.W_Nat.witness
#print axioms NecessaryAgent.powers_all_tied
#print axioms NecessaryAgent.powers_fork
#print axioms Toy.W_Nat.powers_witness
#print axioms Toy.W_Pref.no_powers_at_maximal
#print axioms Toy.NoTR.powers_horn1
#print axioms Toy.W_Nat.fallible_witness
#print axioms Toy.W_Pref.fallible_witness
#print axioms Toy.W_P4.two_minds
