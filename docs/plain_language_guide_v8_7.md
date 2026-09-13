# The Necessary Agent Argument — A Plain-Language Guide (v8.13)

This is a companion to the full argument and to `NecessaryAgent.lean`. It uses no symbols and no jargon that isn't explained on the spot. Its job is to let you understand each premise well enough to decide whether you accept it, and to understand exactly what follows if you do — no more and no less.

Three things to know before starting.

**The logic has been checked by a computer.** Every step from the premises to the conclusion has been verified by a proof-checking program (Lean 4.33.1; sixty-four certified results; zero unproven steps; nothing assumed beyond the three standard axioms of Lean's logic). So the question "does the conclusion really follow?" is settled: it does. The only questions left are whether the premises are true. That's what this guide is for.

**The conclusion is now stated as a single theorem.** The full argument concludes to one thing — a unique necessary being that is a mind, knows every way reality could have been, chose this one, and chose it for the good. Version 8.7 gives that conjunction a name, `God`, and certifies the theorem `god_exists`: *given the premises, God exists and is unique.* Nothing new is assumed in that step; it only names what the argument already proved. Whether the name is apt is discussed in §4.

**What "proof" means here.** The argument is a proof in the sense every argument in philosophy is: the conclusion follows from the premises, and the premises are defended. It is not a proof in the sense of compelling assent from anyone whatsoever, and no argument can be, because a thoughtful person can always reject a premise instead. What this argument does that others don't is show — by building explicit models and checking them — that every contested premise *can* be rejected without contradiction, and say exactly what rejecting each one costs. So the honest form of the conclusion is: God exists, or you take one of two specific exits, and here is the bill for each (§5).

---

## 1. Three ideas you need

**Contingent and necessary.** Something is *contingent* if it could have failed to exist — you, this planet, the particular laws of physics. Something is *necessary* if it could not have failed to exist no matter what. Most people think numbers are like that; the argument is about whether anything *concrete* — anything that can actually do something — is.

**Possible worlds.** A "world" here means a complete way everything could have been. The actual world is one of them. Saying something is contingent just means: there's a possible world where it doesn't exist.

**The first production.** Trace any contingent thing back through its causes. The argument will show that you eventually reach things that are contingent but whose causes are all *necessary* — the first contingent things, produced directly by whatever is necessary. The argument calls that event *the first production*, and almost everything turns on what kind of event it is.

---

## 2. The premises, in plain words

Each premise comes with three things: what it says, why someone would accept it, and what you commit to if you reject it. The formal name is in brackets so you can find it in the full document.

### Tier 1 — Getting to a necessary source

**Something contingent exists.** [E]
*Why accept it:* You exist, and you could have not existed.
*If you reject it:* You hold that nothing could have been otherwise — that everything, including you, is necessary. Almost no one believes this. (Note: the tempting escape "maybe the universe itself is necessary and follows uniquely from its foundation" is *this* exit. If the foundation fixes everything, nothing is contingent.)

**Every contingent thing has a cause.** [P2]
*Why accept it:* It's the most thoroughly confirmed generalization there is. Nothing has ever been observed to pop into existence from nothing.
*If you reject it:* You hold that at least one contingent thing — specifically, one of the very first ones — exists with nothing at all that produced it. You accept "existence from nothing" for exactly one case: the one that can't be checked.

**Causes don't go back forever.** [P1]
*Why accept it:* An infinite chain of causes, each waiting on the one before, leads to well-known paradoxes (the "Grim Reaper" arguments). Note this does *not* say a thing can't have infinitely many causes at once — it only rules out an infinite backward chain.
*If you reject it:* You accept an infinite regress of causes and owe an answer to the paradoxes. (Fair warning: the current literature — Schmid, Malpass — argues the paradoxes show only that the story is contradictory, not that infinite chains are impossible. This premise's defense is real but not finished.)

**There's exactly one uncaused necessary thing, and it's the same one in every possible world.** [P4]
*Why accept it:* If there were two, something would have to coordinate them into producing one consistent reality — and that something would be a cause of them, so they weren't uncaused after all.
*If you reject it:* You accept two or more independent foundations of reality that happen to fit together for no reason — or two foundations producing two disconnected realities ("island universes").
*Honest status (v8.10):* the computer now confirms this premise does only one job — it makes the mind *one*. Everything up to "there is a necessary mind that chose this world" holds without it, and in the model where it fails there are *two* necessary minds. So rejecting it doesn't get you out of a mind at the foundation; it gets you more than one. What keeps the count at one is that two such minds — same nature, same complete knowledge of every possibility, same lean toward the good — would differ in nothing except a bare "this one, not that one," which is the same move the skeptic already had to make to escape the key premise. The argument pays for refusing that move once.

*From these four it follows (and has been machine-checked) that there is exactly one necessary, uncaused, concrete thing that every contingent thing ultimately comes from. Call it N. Notably, the argument's most prominent naturalist critic — Graham Oppy — accepts all of this. He just thinks N is the initial state of the universe.*

### Tier 2 — What kind of event the first production is

**The first production wasn't fixed in advance.** [this follows from Tier 1; it's not a separate premise]
Since N is the same in every possible world, but different worlds have different contingent things, N didn't determine which world came out. Something about the first production was open.

**It wasn't a matter of chance either — at least not in the ordinary sense.** [P11, the "categories" premises, L4]
This one has three parts, and it's the most technical part of the argument. In plain terms:
- If it was chance, the chances behave like ordinary probabilities (they add up, they're not infinitesimal). [P11]
- The possible first stages of reality come in genuinely different kinds with sharp edges between them — a reality of one kind isn't a slight variation on a reality of another kind. [CatOpen] And there are more kinds than any ordinary probability can be spread over. [CatU]
- If a whole region of possibilities has zero chance, nothing in that region can happen. [L4]
Together these show that you can't spread ordinary probability over that many separate kinds of outcome.

*What the data says (new in v8.7):* The sharp edges are real. On the most conservative numbers in the physics literature, the region of possible constants that permits stable matter, chemistry, and galaxies has genuine discontinuities: nuclei hold together or they don't; galaxies form or they never do; the universe expands forever or recollapses; space has three dimensions or some other whole number. That supports the "sharp edges" premise. But the honest count of *independent* sharp constraints is small — about five — so the constants of *our* laws give you finitely many kinds, not endlessly many. The "more kinds than probability can cover" premise has to be defended over the space of possible *law-structures* (different forces, different particles, different dimensions), which is a philosophical claim, not a measured one. Separately, the strongest empirical point against chance is that the measure cosmologists use for initial conditions doesn't even normalize (Schiffrin and Wald 2012) — so "it was chance" has no measure to be chance *with*.

*If you reject it:* Either you believe in infinitesimal chances at the origin of everything (chances so small that every alternative was "equally" likely and the one that happened explains nothing); or you believe every possible way reality could have begun is finitely describable, so there are only countably many kinds — in which case the chance over them is either the same for all (and then, by the argument's own rules, no kind could happen), or tilted toward some kinds for a reason (which is a law that chooses), or tilted for no reason (which is just "nothing bore on it" dressed as a number); or you believe something can happen even though there was zero tendency toward it.

**Something about the outcome mattered.** [CE — the single most important premise]
This is the one the whole argument turns on, so read it slowly. It says: when the first production happened, *which* reality came out was not a total blank. Either N fixed it (we've seen it didn't), or chance governed it (we've seen it didn't), or *something about the possible outcomes played a role* in which one was produced.
It does not say the outcome was forced. It does not say it was fully explained. It says only that the difference between the reality that was produced and the ones that weren't was a difference *to which something was sensitive* — that it wasn't a difference that made no difference to anything.
*Why accept it:* This is the weakest version of "things don't just happen for no reason at all" that there is. We use something like it everywhere: when an outcome varies with no known cause, we look for one, or we call it chance; we never conclude that literally nothing bore on it.
*If you reject it:* You take **Exit 1** in §5. The full document calls this "the bare naturalist." It's a consistent position, and the computer has confirmed that. §5 says what it costs.

**Whatever mattered, mattered through some state of some thing — not through a law floating free.** [NBL]
*Why accept it:* Laws don't do things; things do things. If something about the outcome played a role in the production, that role was played by some feature of N.
*If you reject it:* You hold that a law, belonging to nothing, chose among possible realities — with N identical in every world — for reasons located in no state of anything. That's a law that acts like an agent. (This view has real defenders — Leslie's "axiarchism," Rescher, Mulgan — so it's a genuine exit, just an unpopular one.)

### Tier 3 — From "something mattered" to "a mind chose"

**If a state of N was sensitive to the possible outcomes, then that state carried those outcomes as content — it was *about* them.** [TR]
This is the second most important premise, and the one a sophisticated naturalist is most likely to reject. It says: you can't be sensitive to alternatives — including the alternative of producing nothing at all — unless those alternatives are somehow present to you. And a possible reality that doesn't exist can only be present to something *as represented*.
*Why accept it:* Think about what it would mean for a mere disposition to "choose" among options it has no grip on. A power to produce something is not a choice among possibilities; it's just a tendency. If the possibilities genuinely figured in what happened, something had them in view.
*If you reject it:* You take **Exit 2** in §5. The full document calls this "the powers naturalist." It's the other consistent way out.

**A state with no mind and no history can only represent what actually is the case.** [FA]
*Why accept it:* Every scientific account of how something can be *about* something else works by relating it to something real — its history, what it reliably tracks, what it's structurally similar to. None of them can make a mindless, history-less thing be about what *isn't* the case: a merely possible reality, or the absence of everything. Being directed at the non-existent is the classic mark of a mind.
*If you reject it:* You hold that a mindless thing with no history can be about things that don't exist — a kind of content that no theory has ever explained and nothing has ever been shown to have.

*From these, plus the earlier ones, it follows — machine-checked — that N is a mind, that it accurately represents every possible way reality could have been, and that it is the thing that selected this one. This conclusion does not use any premise about value or goodness.*

### Tier 4 — From "a mind chose" to "chose for the good"

**Whatever a selecting mind at the origin was tracking, it was tracking what's better.** [GG]
*Why accept it:* This is the old idea that an agent aims at what it sees as good. The usual counterexamples — weakness, perversity, depression — all involve contingent psychology, and N has none: it knows everything relevant and has no contingent motives. What would such a being select for, if not the good? Selecting for some arbitrary feature would be a brute, unexplained preference in a being that knows better.
*If you reject it:* You keep the necessary mind — that conclusion survives — but you hold it's a knowing mind that selects for something it knows to be no better. You lose the goodness, not the mind.

**Such a mind acts on the best reasons, and acting on the best reasons produces the best.** [P7, P8]
*Why accept it:* A being that accurately knows every consideration and has no contingent motive has nothing to pull it away from the best reasons; and a being that can produce any possible reality, acting on the best reasons, produces the best.
*If you reject it:* Either you hold that N essentially prefers the worse while knowing it's worse (this is the "evil god" option), or you hold there is no best reality — for every reality there's a better one — in which case the argument offers a fallback premise (P8s): N produced something *good enough*, not the best.
*Honest note:* these two are stated only about the actual world, not every possible world. That restriction is what keeps the argument from concluding that every possible reality is equally good. It also means the argument's own picture has a gap — see §5.

### The unity premise

**There's no necessary concrete thing other than N.** [P4⁺]
*Why accept it:* Having accepted one necessary being, there's no reason to add more — and the argument proves that any other necessary being would have to be *produced* by N. So rejecting this means believing N necessarily generates further necessary beings.
*If you reject it:* The argument still concludes there's a necessary mind that chose this world — but it might not be N itself; it might be something N necessarily produced. Rejecting this is a theological position (emanation, necessary generation), not a skeptical one.

### The bookkeeping premises

There are a handful of framework premises the full document lists (called B1, B2, F1, P0, CH, Src, P5, P9). They say things like: a thing's states belong to it; if an outcome depends on something, that something is one of its causes; a state that selects among alternatives represents them accurately and completely. They are stated precisely in the full document, and each can be checked. None of them is where anyone's disagreement lives.

---

## 3. What follows — step by step

1. **Something contingent exists, everything contingent has a cause, and causes don't go back forever.** So there's a first contingent layer of things, and whatever produced it is necessary and uncaused. There's exactly one such thing: N.
2. **N is the same in every possible world, but the worlds differ.** So N's production of the first contingent things wasn't fixed by N's nature. It was open.
3. **It wasn't ordinary chance either**, because ordinary probability can't cover that many genuinely different kinds of outcome — and physics supplies no measure for it to be chance with.
4. **Something about the outcome mattered** (CE). Not a law floating free, so it mattered through a state of N (NBL).
5. **A state through which the alternatives mattered carries them as content** (TR) — including the alternative of producing nothing.
6. **Nothing mindless and history-less can carry content about what doesn't exist** (FA). So that state of N is mental. **N is a mind.**
7. **A knowing mind with no contingent motives selects for the good** (GG). Acting on the best reasons, and able to produce anything, it produced the best (P7, P8).
8. **There's nothing necessary and concrete besides N** (P4⁺). So the source, the mind, and the chooser are one being.

---

## 4. What the argument concludes — in plain words

If you accept the premises, then:

> There is exactly one thing that could not have failed to exist and can do things. Everything else that exists came from it. It is a mind. It accurately grasps every way reality could have been — including the option of there being nothing at all — and it is the thing that selected this world. It selected this world because this world was best, acting on the best reasons, with no motive that could have been otherwise. And, with one small extra premise, it knows what it made.

That conjunction is what the Lean file now calls `God`, and `god_exists` is the certified theorem that, given the premises, exactly one such being exists.

Here is what it does **not** establish, and doesn't claim to:

- That this being is a *person* in any rich sense — conscious, self-aware, someone you could address. "Mind" here means only: a thing with a state that is about things. The argument reaches that by elimination, not by any positive account.
- That it is *loving*, *just*, or *merciful*.
- That it is good in anything beyond the founding act. It says nothing about ongoing care for the world.
- That it is *all-powerful* in any sense stronger than "everything possible comes from it."
- Anything about evil. The argument locates where the problem of evil bites (the claim that this world's founding was for the best) but doesn't answer it.

Whether what *is* established deserves the name "God" is a decision about the word. Classical theists — Aquinas, for one — say that a necessary, unique, creating, knowing, good first cause simply *is* what "God" means, and the rest is theology. Skeptics say it's a necessary mind, and calling it God is a choice. Both are reading the same list correctly.

---

## 5. The two exits, and what they cost

Every premise on the checklist can be rejected, and the computer has confirmed each rejection is consistent. But most of the exits — everything is necessary, things pop into existence from nothing, causes go back forever, a law belonging to nothing chooses — are exits almost nobody wants. Two are the ones a serious naturalist actually takes. Each rejects one premise and one only, granting everything else.

### Exit 1: "It just happened." (rejects CE — the bare naturalist)

To take this exit you have to believe all of the following at once.

There is a foundation of reality that couldn't have failed to exist, and it could have produced many different realities. It produced this one — with a cosmological constant sitting in a window about two orders of magnitude wide against a natural range of about a hundred and twenty, with density fluctuations in a similar window, with quark masses inside the island where nuclei hold together, with a starting state of almost zero entropy against a maximum of ten to the hundred and twenty-second, with three dimensions of space — and *nothing whatsoever bore on which*. Not a law, not a roll of dice, not a tendency, not a reason. Not "we don't know why" but "there is no why."

And you believe this at exactly one point. Everywhere else in science, if something came out one way rather than another and you said "no reason, nothing bore on it," you'd be laughed out of the room. At the foundation, you make the one exception.

And to keep chance out of it, you have to throw away the measure cosmologists use to reason about initial conditions everywhere else — or keep it, and accept that by that measure you are probably a random fluctuation imagining your past.

Those five numbers are the most conservative in the literature; the popular "one part in a trillion trillion" figures for the strong force and the carbon resonance are dead, and this exit's bill is stated without them. What survives is smaller and sharper: five independent constraints, each with a boundary that is a cliff, not a slope.

### Exit 2: "It had a tendency, but no view." (rejects TR — the powers naturalist)

To take this exit you have to believe: something about the outcome *did* matter. The foundation had a built-in lean toward a certain kind of reality, and that lean played a role in what came out. But the lean wasn't *about* anything. The alternatives — including the alternative of producing nothing at all — never figured. The foundation didn't have them in view in any sense; it just did what tendencies do, the way a magnet points north without considering south.

The squeeze on this exit has now been checked by the computer, using the powers theorist's own idea of a tendency: a tendency has a type, and when nothing blocks it, it produces that type. (At the foundation nothing blocks anything.) So ask: what is the foundation's tendency *toward*?

If it's toward some definite kind of thing — "a reality with matter in it," say — then the tendency produces that kind and the alternatives never figure. The computer confirms that this is just Exit 1 wearing a different coat: on the bare naturalist's own model, the foundation's state can be exactly such a tendency, and "something bore on it" is false. You pay Exit 1's bill, and on top of that your tendency doesn't track what's *good*, so you've dropped a second premise, not one.

If it's toward *the best* — so that something did bear on it, and it was the good — then, because a tendency produces its type wherever it's unblocked, the foundation produces the best in every possible world. Which means every possible reality is "the best," which means none is better than any other: the scale has no tilt at all. The computer confirms this too. "Aiming at the best" turns out to mean "aiming at whatever," and "something mattered" collapses.

The only way between the horns is a tendency toward the best that can *fail* — one that leans toward the best but sometimes doesn't get there. On the powers theorist's usual rule (a tendency produces its type when nothing blocks it) that is not a tendency; but the leading powers theorists do not all hold that rule — Mumford and Anjum hold that a tendency can fail with nothing blocking it, as a basic fact about the kind of thing a tendency is. That is exactly the kind of state the theist attributes to the foundation: a lean toward one option among several that may not prevail. So the powers naturalist can have the theist's state; what he denies is that it is *about* the options.

Earlier versions of this guide said the computer had checked that this kind of lean "is free" and "fits the bare naturalist's picture and the theist's equally." That has been withdrawn (v8.14): the checked result turned out to say only that the actual world is best on each model's scale, and nothing about the state, so it was deleted. What the computer *does* confirm is the two horns above for a tendency that cannot fail. The fallible case is not checked by the computer at all; it is where the philosophical argument for the premise (that a state which leans over the options has them as content) has to do its work, and it is the main open question.

### The honest part: the argument's own gap

A mind that inclines toward the best but isn't *forced* to choose it could have chosen worse — and in some possible world, the argument's own models show, it does. Nothing about the mind explains why, in this world, its inclination won. So the theist's picture also has exactly one thing at the origin that nothing explains.

Here is the difference, and it is a difference in kind, not flavor. What the theist leaves unexplained is one yes-or-no fact: whether the inclination toward the best prevailed. The *content* of the outcome — why this reality and not another — is explained: it was the best. What the bare naturalist leaves unexplained is the entire content: all five constraints, with nothing bearing on any of them. And the theist's gap is the ordinary gap in every free choice anyone ever makes; if you believe people sometimes genuinely could have done otherwise, you already accept this exact kind of gap every day. The bare naturalist's gap is a new kind, at the foundation, that nobody accepts anywhere else.

That comparison bites against a skeptic who believes in free will. Against one who thinks every choice is fully determined, it doesn't, and the comparison there rests on content alone: one yes/no against the whole first stage.

The argument's claim is that the first account is a better account of why this world exists. That claim is a judgment, and the argument can't make it for you. But it can — and now does — show you exactly what each side is declining to explain.

---

## 6. Your decision checklist

Go through the premises and mark each one. If you mark every box "accept," the conclusion follows and there is no logical escape — the computer has checked that. If you mark any box "reject," you've found your exit, and the right-hand column tells you what you're now committed to.

| Premise | Accept? | If you reject it, you hold that… |
|---|---|---|
| Something contingent exists | ☐ | …everything is necessary (including "the universe follows uniquely from its foundation") |
| Everything contingent has a cause | ☐ | …something came from nothing, once, where it can't be checked |
| Causes don't regress forever | ☐ | …an infinite backward chain, paradoxes and all |
| One uncaused necessary source, same in every world | ☐ | …*several* necessary minds, told apart by nothing but "this one, not that one" — not fewer |
| No ordinary chance at the origin | ☐ | …infinitesimal chance, or one seamless continuum of all possible realities (against the physics), or outcomes with zero tendency |
| **Something about the outcome mattered** (CE) | ☐ | …nothing whatsoever bore on which reality came out — **Exit 1, the bare naturalist** |
| It mattered through a state of the source, not a free-floating law | ☐ | …a law belonging to nothing that chooses (axiarchism) |
| **A state sensitive to alternatives is about them** (TR) | ☐ | …the alternatives figured but were held by nothing — **Exit 2, the powers naturalist** |
| Mindless, history-less things can't be about the non-existent | ☐ | …content no theory explains and nothing has |
| A knowing origin-mind selects for the good | ☐ | …a mind that knows better and selects for something else (keeps the mind, loses the goodness) |
| It acts on the best reasons, and that produces the best | ☐ | …an essentially perverse knower, or no best reality (fallback: "good enough") |
| Nothing necessary and concrete besides the source | ☐ | …the source necessarily generates other necessary beings |

If your only unchecked boxes are the two in bold, you are in the company of the most careful naturalists, and §5 is a fair description of what you and the theist each pay. If you checked everything, the conclusion in §4 is yours — and it has a name and a theorem.

---

## Note added in v8.14 (after the third external review; the Exit 2 section above was rewritten to match in v8.15)

Two things this guide says in the strong form should be read with the v8.14 corrections in mind. First, the powers-naturalist's exit (denying TR) is **not** "one sentence wide": the machine-checked result that seemed to show his "fallible" position is the same as the theist's turned out to certify only that the actual world is best on each model's scale — it said nothing about the state at all — and it has been deleted. What is certified is narrower: a directedness that *necessitates* the best either ties every possibility or contradicts a discriminating scale. The rest is the philosophical case for TR. Second, denying uniqueness (P4) is "polytheism" only for a second being that *also* selects; a second being that merely produces, with no selecting state, is consistent with every other premise, and the argument currently has no price for it. Both points are in the argument's §III.5 and §III.6.
