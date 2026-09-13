# The Cosmic Strand (v2) — Conservative Fine-Tuning as Support for CatOpen and the Bare Naturalist's Bill

**Status:** Supersedes `teleological_argument_proof.md` ("Glitched Monkeys") and `teleological_argument_proof__1_.md` ("Metaphysical Handoff Blueprint"). Both are retired in full. This document is synchronized with `NecessaryAgent.lean`, design notes D21–D22.

**Rule for this strand:** every number is the *most conservative* (widest-window, most skeptic-friendly) estimate in the peer-reviewed literature, with Adams 2019 (*Physics Reports* 807) as the baseline. Where the literature disagrees, the estimate least favorable to fine-tuning is used. No number is ever converted into a probability that the universe exists, and none is applied to the bare-fact hypothesis, which has no probability by definition.

---

## 1. What this strand does in the argument, and what it doesn't

The Lean argument does not need fine-tuning to reach a necessary mind. It needs it for two narrower jobs.

**Job 1 — empirical support for CatOpen.** The anti-chance tier (P11, L4, CatOpen, CatU) requires that possible first stages of reality fall into *genuinely distinct kinds with sharp boundaries* — that a reality of one kind is not a slight variation on a reality of another kind. The conservative data establishes this: the life-permitting region of parameter space is *bounded* and has *discontinuous* edges (a bound state exists or doesn't; galaxies form or never form; the universe expands forever or recollapses; spacetime has an integer dimension). This is a claim about the *topology* of the region, not its measure, and is therefore immune to the normalizability objection (McGrew–McGrew–Vestrup 2001; Colyvan–Garfield–Priest 2005).

**Job 2 — sizing the bare naturalist's bill.** Exit 1 (deny CE) says nothing bore on which reality the foundation produced. The data specifies what "which reality" contains: five independent, sharply-bounded constraints. The bare naturalist's cost is stated in those terms (D22), not as "astronomically improbable."

**What it cannot do.** (a) It cannot give "odds that nothing bore on it": the bare hypothesis denies there is a measure, and every number below assumes one. (b) It cannot ground CatU (uncountably many kinds): the constants of our laws yield finitely many sharp kinds (~5 independent axes), and variation within each window is gradual. CatU must be defended over the space of possible law-structures — a modal claim — and the empirical case against a propensity at the origin is non-normalizability (§5), not CatU. (c) It cannot support Tier 4 (that the outcome is *best*): "life-permitting" is not "maximal on the balance of value-grounded reasons."

---

## 2. Master table

| Layer | Parameter | Observed | **Conservative window** (source) | Aggressive claim (source) | Boundary | Correlated with |
|---|---|---|---|---|---|---|
| 1 | Strong coupling α_s | — | +17% / −6% (Yukawa model; Adams 2019); up to +50% keeps hydrogen (MacDonald & Mullan 2009) | +6% / −4% (Barrow & Tipler 1986) | Sharp (bound state) | quark masses, α |
| 1 | Diproton binding | unbound | No "disaster": soft boundary at tens of % (Bradford 2009; MacDonald & Mullan 2009; Barnes 2015) | +2% sterilizes (Barrow & Tipler) | Soft | α_s, quark masses |
| 1 | n–p mass difference Δm | 1.293 MeV | ~(m_e, ~2–3 MeV) (Hogan 2000; Adams 2019) | ~±1 MeV | Sharp both ends | m_d−m_u, α, Higgs vev |
| 1 | Fine-structure α | 1/137 | ~2 orders of magnitude for stars (Adams 2008, 2016); factor of a few for chemistry | few % (Barrow) | Gradual (stars) | α_G, α_s |
| 1 | Light quark masses | m_u≈2.2, m_d≈4.7 MeV | multiple viable ("congenial") worlds; a region, not a point (Jaffe, Jenkins & Kimchi 2009; Damour & Donoghue 2008) | narrow (Hogan) | Sharp (nuclear stability) | Higgs vev, Λ_QCD |
| 1 | Higgs vev v | 246 GeV | 0.5 ≲ v/v₀ ≲ 2–5 (ABDS window; Agrawal et al. 1998) — **or unconstrained** if the weak force is removable (Harnik, Kribs & Perez 2006) | factor ~2 | Sharp, or removable | quark masses |
| 2 | Hoyle resonance ε | 379.47(18) keV above 3α | +300 keV (oxygen shortfall) to +500 keV (carbon shortfall), comparable downward (Huang, Adams & Grohs 2019; Epelbaum et al. 2013, 2020) — ~±2–3% in light-quark mass | ±0.5% NN force / ±4% Coulomb (Oberhummer et al. 2000) | Gradual (yield) | quark masses, α |
| 3 | Cosmological constant Λ | ρ_Λ ≈ 1.2×10⁻¹²³ (Planck units) | **anthropic window ~2 orders of magnitude above observed** (ρ_Λ,max ≈ 550 ρ₀; Weinberg 1987 via Barnes 2021; Martel, Shapiro & Weinberg 1998) | the 10⁻¹²⁰ "naturalness" gap — a *different* fact, not a window | Sharp (galaxies form / recollapse) | Q, η |
| 3 | Fluctuation amplitude Q | 2×10⁻⁵ | 10⁻⁶ ≲ Q ≲ 10⁻⁴ (Tegmark & Rees 1998); somewhat wider with co-variation (Adams 2019) | narrower | Sharp-ish both ends | Λ, η |
| 3 | Baryon/photon η | ~6×10⁻¹⁰ | ~1 order of magnitude (Adams 2019) | narrower | Gradual | Q, dark matter |
| 3 | α_G / stellar lifetime | 6×10⁻³⁹ | stars over ~¼ of (α, α_G) space (Adams 2008); α_G/α ≲ 10⁻³⁴ | — | Gradual | α |
| 4 | Low-entropy initial state | S_init ~10⁸⁸ k_B (radiation), gravitational ≈ 0 | **qualitative fact robust**: S_obs = 3.1×10¹⁰⁴, S_max = S_CEH ≈ 2.6×10¹²² k_B (Egan & Lineweaver 2010) | 10^(10^123)-to-1 "probability" (Penrose) — not a probability (Schiffrin & Wald 2012) | Measure-dependent | — |
| 5 | Spacetime dimensionality | 3+1 | exactly 3+1 for predictivity and stability (Tegmark 1997; Ehrenfest 1917) | — | Sharp, discrete | — |

---

## 3. Layer notes (conservative reading)

**Layer 1 — stable matter.** The famous "±2% strong force" figure is model-dependent and, for the diproton, wrong in its consequence: MacDonald & Mullan (2009) and Bradford (2009) show hydrogen survives BBN up to ~+50% on α_s, and Barnes (2015) shows strong-burning stars have familiar luminosities and lifetimes. The sharp boundaries that survive are the deuteron's existence (−6% on α_s in a Yukawa model) and nuclear stability as a function of the light quark masses. Jaffe, Jenkins & Kimchi (2009) find *multiple* viable quark-mass worlds, so the life-permitting region is a region, not a point. The most important conservative datum in the layer is Harnik, Kribs & Perez (2006): a universe with **no weak interaction at all**, with other parameters co-varied, still has BBN, stars burning for billions of years, elements to iron, and supernovae. If co-variation is allowed, the Higgs-vev constraint drops out (Clavelli & White 2006 dispute the oxygen dispersal; the debate is open).

**Layer 2 — carbon and oxygen.** The Hoyle state is real fine-tuning but not the ±0.5% of Oberhummer et al. (2000). Epelbaum et al. (2013; update 2020) give the window as: raise the state by more than ≈300 keV and oxygen becomes scarce; by more than ≈500 keV and carbon does. Huang, Adams & Grohs (2019), using full MESA stellar simulations, find viable C and O over several hundred keV in either direction. Adams (2022) adds a further escape: spallation during planet formation can produce carbon where stars fail. The boundary is a gradient in yield, not a cliff, and it is correlated with Layer 1 (same quark masses and α). A 2020 caveat: updated lattice-QCD scattering lengths disfavor the strict "no tuning at all" reading, so the window is wider than the 1990s claims but not unbounded.

**Layer 3 — structure.** The cosmological constant is the one case that survives every conservative pass, and it must be stated carefully. The "10⁻¹²⁰" is the naturalness gap (observed vs Planck scale); it is not a life-permitting window. The window is Weinberg's: galaxies fail to form if ρ_Λ exceeds ~550 times the matter density at structure formation, i.e. **about two orders of magnitude above the observed value**, with recollapse on the negative side. Two orders of magnitude inside a hundred-and-twenty-order natural range is the coarse-tuning point (Hawthorne & Isaacs; Manson): a wide window still counts against a vastly wider range. Q's window (Tegmark & Rees 1998) is 10⁻⁶ to 10⁻⁴ — below it nothing cools to form stars; above it, disrupted orbits and then direct black-hole collapse. η, Ω, and α_G are constrained by an order of magnitude or more, gradually.

**Layer 4 — the arrow of time.** Penrose's 10^(10^123) is a ratio of phase-space volumes, e^(S_max)/e^(S_init), under the Liouville measure. Schiffrin & Wald (2012) show that measure does not normalize over cosmological phase space; Callender (2004) and Earman (2006) argue the "improbability" of the initial state is ill-defined. What is robust and undisputed is the *qualitative* fact: the initial gravitational entropy was near zero, today's total (~3×10¹⁰⁴ k_B, dominated by supermassive black holes; Egan & Lineweaver 2010) is still ~18 orders below the holographic maximum (~2.6×10¹²² k_B), and the initial state was lower still. This strand asserts the qualitative fact only. Carroll (2017) supplies the second edge: a naturalist who *keeps* the Liouville measure inherits Boltzmann brains and a cognitively unstable cosmology; one who rejects it has no measure for chance.

**Layer 5 — dimensionality.** Tegmark (1997): exactly one time dimension is needed for well-posed, predictive physics; exactly three space dimensions for stable orbits (Ehrenfest 1917) and stable atoms. The boundary is discrete and therefore the cleanest case of a partition into kinds. Stenger's objection that dimensionality is not a "parameter" is correct as far as it goes and is irrelevant to Job 1: a discrete kind-boundary is exactly what CatOpen wants.

**Layer 6 — the biological substrate.** Everything genuinely upstream of evolution (liquid water, carbon chemistry, long-lived stars, planets, an energy gradient) reduces to parameters already counted in Layers 1–3. Nothing new enters here.

---

## 4. Independence: the honest count

The standard models have 31 free parameters (26 in the Standard Model, 5 in ΛCDM; Tegmark, Aguirre, Rees & Wilczek 2006). The advertised fine-tunings of the diproton, deuteron, neutron–proton mass difference, and Hoyle resonance all trace to the same underlying set {m_u, m_d, Λ_QCD, α}, which in turn depends on the Higgs vev through the Yukawa couplings. Collapsing correlated constraints, the conservative count of **independent, sharply-bounded** life-permitting constraints is:

1. Light quark masses / QCD scale — nuclear stability (sharp).
2. Cosmological constant Λ — galaxy formation vs recollapse (sharp; the strongest case).
3. Fluctuation amplitude Q — cooling threshold vs black-hole collapse (sharp-ish).
4. Low-entropy initial condition (qualitatively robust; probabilistically contested).
5. Spacetime dimensionality (sharp, discrete; not a "tuned parameter").

with the Higgs vev / weak scale as a sixth if the weakless-universe escape is disallowed. Adams (2019)'s verdict, adopted here: most parameters can vary by orders of magnitude; Λ, and to lesser degrees Q and the Higgs vev, are the striking cases.

This is what Exit 1 leaves unexplained. It is not "dozens of constants each tuned to one part in a billion." It is five independent cliffs, one of them (Λ) spectacular, all obtaining with nothing bearing on any of them.

---

## 5. The measure problem, and how this strand states its claim

The normalizability objection is correct against any argument that assigns a *probability* to a life-permitting universe: a flat measure over an infinite parameter range does not normalize, and the probability of any finite interval is zero. The replies (Collins's "epistemically illuminated region"; Barnes on finite natural ranges; Hawthorne & Isaacs's measure-free reformulation) are available but contested.

This strand does not need them, because it never asserts a probability. Its claim is topological: *the life-permitting region is a bounded subset of parameter space with discontinuous boundaries that separate genuinely distinct physical kinds.* That is a statement about the shape of the region, checkable layer by layer against the physics, and it is exactly what CatOpen asserts.

The measure problem is then turned against the chance exit. Schiffrin & Wald (2012): the natural measure over cosmological initial conditions is infinite, so "the outcome was chance" has no measure to be chance *with*. Any measure the naturalist supplies instead is one he must defend — against Boltzmann brains (Carroll 2017), against the Q-catastrophe (Garriga & Vilenkin), and against P11/L4 in the Lean, which close any Archimedean propensity over the kind-partition. The bare naturalist who rejects all measures is then rejecting, at the foundation alone, the measure cosmology uses for initial conditions everywhere else. That is item (c) of his bill in D22.

---

## 6. Excluded from this strand, and why

| Claim | Status | Reason |
|---|---|---|
| Biological error rates (DNA proofreading 10⁻⁹–10⁻¹¹; ribosome 10⁻⁴; T-cell 10⁻⁶) | **Excluded** | Evolved, ATP-driven non-equilibrium mechanisms (Hopfield 1974; Ninio 1975). They measure how good the machinery is inside this universe's physics, not how large a window is in the space of possible physics. Evolution is granted. |
| The 10⁻³⁸ "joint intersection" | **Excluded** | Multiplies error-rate ratios as if they were probabilities, and assumes independence among mechanisms that are the same physical principle (kinetic proofreading). |
| Quantum coherence in photosynthesis as a design signal | **Excluded** | The field's own review (Cao et al., *Science Advances* 2020, 18 co-authors) concludes interexciton coherences are too short-lived to be functionally significant; the long-lived signals are vibrational (Duan et al. 2017). |
| Single-photon rod sensitivity | **Excluded** | Real, evolved, design-neutral. |
| Water's anomalous properties; carbon vs silicon | **Excluded** | Qualitative; not quantifiable as fine-tuning in the literature. |
| Penrose's 10^(10^123) as a probability | **Excluded as a probability**; the qualitative low-entropy fact is retained | Non-normalizable measure (Schiffrin & Wald 2012). |
| "±2% strong force" diproton disaster; "±0.5%" Hoyle resonance | **Replaced** by the conservative windows in §2 | Superseded by MacDonald & Mullan 2009, Bradford 2009, Barnes 2015, Epelbaum et al. 2013/2020, Huang–Adams–Grohs 2019. |
| Powerball / grains-of-sand comparisons | **Excluded** | Rhetoric attached to a retired number. |

---

## 7. Caveats

- "Conservative" systematically *understates* the case by design. These are the numbers a critic would have the hardest time widening further.
- The widest windows (weakless universe; diproton survival) are obtained by co-varying several parameters. Whether co-variation is legitimate depends on the theory of how constants are set (Jenkins & Perez 2010 defend it; Barnes 2012 warns it can smuggle in further tunings). Single-parameter variation gives narrower windows.
- Adams (2019)'s widest ranges are often edges of *joint* regions requiring compensating changes in Q, η, or nuclear rates.
- α_s windows differ by a factor of ~3 between square-well and Yukawa nuclear models; the model is reported with the number.
- Layer 4 is the most philosophically contested layer; it is asserted here qualitatively only.

---

## 8. Sources

Adams, F. C. 2008. *JCAP* 08:010. — 2016. *JCAP* 02:042. — 2019. *Physics Reports* 807:1–111. — 2022. *Astropart. Phys.* 141:102731.
Agrawal, V., Barr, S. M., Donoghue, J. F., & Seckel, D. 1998. *Phys. Rev. D* 57:5480.
Barnes, L. A. 2012. *PASA* 29:529. — 2015. *JCAP* 12:050. — 2020. *Ergo* 6:42. — 2021. arXiv:2110.07783.
Barnes, L. A., & Lewis, G. F. 2017. *JCAP* 07:036.
Bradford, R. A. W. 2009. *J. Astrophys. Astr.* 30:119.
Callender, C. 2004. *Brit. J. Phil. Sci.* 55:195.
Cao, J., et al. 2020. "Quantum Biology Revisited." *Science Advances* 6(14):eaaz4888.
Carr, B. J., & Rees, M. J. 1979. *Nature* 278:605.
Carroll, S. M. 2017. "Why Boltzmann Brains Are Bad." arXiv:1702.00850.
Clavelli, L., & White, R. E. 2006. hep-ph/0609050.
Colyvan, M., Garfield, J. L., & Priest, G. 2005. *Synthese* 145:325.
Damour, T., & Donoghue, J. F. 2008. *Phys. Rev. D* 78:014014.
Duan, H.-G., et al. 2017. *PNAS* 114:8493.
Earman, J. 2006. *Stud. Hist. Phil. Mod. Phys.* 37:399.
Egan, C. A., & Lineweaver, C. H. 2010. *ApJ* 710:1825.
Epelbaum, E., Krebs, H., Lähde, T. A., Lee, D., & Meißner, U.-G. 2013. *Phys. Rev. Lett.* 110:112502; update 2020, *Eur. Phys. J. A* 56:139.
Harnik, R., Kribs, G. D., & Perez, G. 2006. *Phys. Rev. D* 74:035006.
Hawthorne, J., & Isaacs, Y. 2018. In *Knowledge, Belief, and God* (OUP).
Hogan, C. J. 2000. *Rev. Mod. Phys.* 72:1149.
Hopfield, J. J. 1974. *PNAS* 71:4135. Ninio, J. 1975. *Biochimie* 57:587.
Huang, L., Adams, F. C., & Grohs, E. 2019. *Astropart. Phys.* 105:13.
Jaffe, R. L., Jenkins, A., & Kimchi, I. 2009. *Phys. Rev. D* 79:065014.
Lewis, G. F., & Barnes, L. A. 2016. *A Fortunate Universe*. CUP.
MacDonald, J., & Mullan, D. J. 2009. *Phys. Rev. D* 80:043507.
Manson, N. A. 2009. *Philosophy Compass* 4:271.
Martel, H., Shapiro, P. R., & Weinberg, S. 1998. *ApJ* 492:29.
McGrew, T., McGrew, L., & Vestrup, E. 2001. *Mind* 110:1027.
Oberhummer, H., Csótó, A., & Schlattl, H. 2000. *Science* 289:88.
Penrose, R. 1989. *The Emperor's New Mind*, p. 343. — 2004. *The Road to Reality*.
Schiffrin, J. S., & Wald, R. M. 2012. *Phys. Rev. D* 86:023521.
Stenger, V. J. 2011. *The Fallacy of Fine-Tuning*. — 2012. arXiv:1202.4359.
Tegmark, M. 1997. *Class. Quantum Grav.* 14:L69.
Tegmark, M., & Rees, M. J. 1998. *ApJ* 499:526.
Tegmark, M., Aguirre, A., Rees, M. J., & Wilczek, F. 2006. *Phys. Rev. D* 73:023505.
Weinberg, S. 1987. *Phys. Rev. Lett.* 59:2607.
