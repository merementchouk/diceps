#import "@preview/clean-math-paper:0.2.7": *

#let date = datetime.today().display("[month repr:long] [day], [year]")

// Modify some arguments, which can be overwritten in the template call
// #page-args.insert("numbering", "1/1")
// #text-args-title.insert("size", 2em)
// #text-args-title.insert("fill", black)
// #text-args-authors.insert("size", 12pt)

// 1. OVERRIDE MARGINS HERE: Assign your custom margin dictionary to page-args
// This forces the template container to initialize with your narrow screen spacing.
#let page-args = (
  margin: (left: 0.25in, right: 0.25in, top: 0.5in, bottom: 0.5in),
  numbering: "1/1",
)

#let text-args-title = (size: 2em, fill: black)
#let text-args-authors = (size: 12pt)

#set par(
  first-line-indent: (amount: 1em, all: true),
)

#show heading: set block(below: 1.5em)

#show: template.with(
  title: "Boolean functions and V-2",
  authors: (
    (name: "Misha Erementchouk"),
  ),
  date: date,
  link-color: rgb("#008002"),
)

// #let scr(it) = math.class("normal", box({
//   show math.equation: set text(stylistic-set: 1)
//   $cal(it)$
// }))



// Set Concrete Math as the math font
#show math.equation: set text(font: "Concrete Math")
// Set Concrete Roman as the main text font (optional)
#set text(font: "Concrete Math")

// 2. The working script workaround
// We intercept the letter, treat it as a text glyph, and apply the font style.
#let scr(letter) = math.class("normal", text(
  font: "New Computer Modern Math",
  stylistic-set: 1,
  math.cal(letter),
))
// // 3. Define a distinct cal() style if needed, or leave it to Concrete's default
// #let scr(it) = math.cal(it)

#let Tilde(it) = math.accent(it, math.tilde, size: 130%)


// Usage:

= Spin representations of Boolean functions

We work over the Boolean alphabet $bb(B)={−1,1}$, with the
convention 1 = True and −1 = False. For a vectorial Boolean function $f :
bb(B)^M -> bb(B)^N$, its truth-table relation is $scr(T)_f = { (bold(x),
    bold(y)) in bb(B)^M times bb(B)^N: bold(y) = f(bold(x)) }$.

We define a spin graph as a weighted graph $cal(G)_f = (cal(V)_f, cal(E)_f,
  A_f)$, where $A_f : cal(E)_f -> bb(R)$ is the weight function, with a
classical spins assigned to the graph nodes, $bold(gamma) : cal(V)_f ->
bb(B)$. To regard such graphs as a spin representation of a Boolean
function, it is convenient to partition the spins into internal (auxiliary)
and boundary (input and output) spins: $bold(gamma) = (bold(tau), bold(x),
  bold(y))$, where $bold(tau) in bb(B)^(|V| - M - N)$, $bold(x) in bb(B)^M$,
$bold(y) in bb(B)^N$ denote auxiliary, input and output spins,
respectively.

The spin configuration defines a partitioning of graph nodes, which can be
characterized by the weighted cut functional

$
  C_(cal(G)_f)(bold(tau), bold(x), bold(y)) = 1/4 sum_(i,j) A_(i,j)(1 −
    gamma_i gamma_j).
$

Consequently, for each external assignment $(bold(x), bold(y))$, we define
the cut boundary value function $F_(cal(G)_f)(bold(x), bold(y)) =
max_(bold(tau))⁡C_(cal(G)_f)(bold(tau), bold(x), bold(y))$.

#definition(title: "Normalized spin representation")[Graph $cal(G)_f$ is a
  *normalized spin representation* of $f$ if there exist constants $C_f^star
  in RR$ and $delta_f > 0$ such that

    $ F_(cal(G)_f)(bold(x), bold(y)) = C_f^star quad "if " (bold(x),
    bold(y)) in scr(T)_f, $ and $ F_(cal(G)_f)(bold(x), bold(y)) <=
    C_f^star - delta_f quad "if " (bold(x), bold(y)) in.not scr(T)_f,. $ ]

In the context of finding the spin configurations delivering the maximum
cut, the value $C_f^star$ is called the *certificate value*, and $delta_f$
is called the *certification gap*. Equivalently, the external projections
of the global maximizers of $C_(cal(G)_f)$ are exactly the truth-table
relation $bb(T)_f$, and all invalid external assignments are separated from
the optimum by at least $delta_f$.

An important property of spin graphs is that they can be used as devices in
circuit representations of Boolean functions. There is, however, an
important structural difference between Boolean circuits and their spin
representations. This difference is reflected by the following definition.

#let StarEq = math.op("StarEq")

#definition(title: "Equality junction")[An *equality junction* of
  arity $m >= 1$ is a normalized spin representation (the complete
  bipartite graph $cal(K)_(1, m)$ with negatively weighted edges) of the
  relation

  $
    StarEq_m ⁡= {(z_0, z_1, …, z_m) in bb(B)^(m+1) : z_i = z_0
      "for all" i = 1, …, m}.
  $

]

The spin $z_0$ is called the hub spin, and $z_1, …, z_m$ are called the
leaf spins. In the standard normalization, the certificate value is $0$, so
coherent assignments attain value $0$, while incoherent assignments attain
value at most $−δ$ for some $δ>0$.

In general, equality junctions of other structures (not necessarily of the
form $cal(K)_(1, m)$) can be defined. Such generalizations are out of our
scope.

The difference between circuit and spin representations of Boolean
functions is manifested in the observation that structurally the same
equality junction can play the role of different devices in Boolean
circuits.

Imposing orientation on the equality junction edges or designating the hub
and the leaves as inputs and outputs endows the junction with two
semantical values, giving opposite circuit interpretations.

If the hub is regarded as an input and the leaves as outputs, then the
equality junction represents the fan-out map $Δ_m: 𝔹 -> 𝔹_m$, defined by

$ Δ_m (z_0) = (z_0, …, z_0). $

Its truth table, or the graph relation, is

$ scr(T)_(Δ_m) = { (z_0, z_1, …, z_m): z_i = z_0 "for all" i}, $

which is exactly $StarEq_m⁡$.

If the leaves are regarded as inputs and the hub as an output, then the
same junction is read as a partial merge $∇_m: "Diag"⁡(𝔹^m) -> 𝔹$, where
$"Diag"⁡(𝔹^m) = {(z,…,z):z in 𝔹}$, acting according to $∇_m (z, …, z) = z$.
Equivalently, its graph relation is

$ scr(T)_(∇_m) = {(z_1, …, z_m, z_0) : z_1= ⋯ =z_m = z_0}. $

With this terminology set, we can formulate a simple but important result.

#theorem(title: "Composition theorem")[ Let $cal(C)$ be a Boolean circuit
  computing a vectorial Boolean function $h: 𝔹^M -> 𝔹^N$. Suppose each
  elementary gate $f_k$ appearing in $𝒞$ has a normalized spin
  representation with certificate value $C_(f_k)^star$. We construct a
  spin graph $𝒢_h$ by taking disjoint copies of these gate
  representations and by replacing each fan-out operation in the circuit
  by a star equality junction with certificate value $0$. Then $𝒢_h$ is a
  normalized spin representation of $h$, with certificate value $C_h^star
  = sum_k C_(f_k)^star$. ]

Since the boundary value function $F_(cal(G)_h)(bold(x) , bold(y))$ is
maximized exactly at $scr(T)_h$, the truth table defining $h$, we have
two immediate conclusions.

#corollary(title: "Forward evaluation")[If the input $bold(x)$ is fixed,
  maximizing $C_h (bold(gamma))$ over $bold(y)$ and $bold(tau)$ reaches
  $C_h^star$ exactly at $bold(y) = h(bold(x))$.]<forward>

#corollary(title: "Inverse evaluation")[ If the output $bold(y)$ is fixed
  and $bold(y) in Im⁡(h)$, then maximizing $C_h (bold(gamma))$ over
  $bold(x)$ and $bold(tau)$ reaches $C_h^star$ exactly on $bold(x) ∈
  h^(−1)(bold(y))$. If $bold(y) in.not Im⁡(h)$, the maximum is strictly
  below $C_h^star$, so any returned configuration is certifiably invalid.
]<inverse>

Although corollaries @forward and @inverse mirror each other, the
complexities of finding the respective maximizing spin configurations,
$bold(y)$ in the forward direction and $bold(x)$ in the inverse direction,
are drastically different. We would like to understand how this asymmetry
and the related complexity manifest in the V-2 dynamics.

= Equality junction conflicts in dynamical realizations

Spin representations can be used for the dynamical evaluation of the
Boolean functions. Within this approach, spins associated with the graph
evolve with time (discrete or continuous) according to the flow. The
characteristic feature of such progression of the spin state of the spin
representation is that it originates from the initial state defined
globally over the whole graph.

The progression of particular spin representations whenever the conflicts
are present or even in the view of possible emergence of the conflicts,
depends on the details of the dynamics governing the evolution of the spin
configuration. Therefore, we will, first, describe the structure of the
arising conflicts as potential features that need to be taken into
consideration in the context of particular dynamical realizations.

The origin of the conflicts is clear: the dynamical realization of the spin
representation is characterized by a definite spin configuration at any
instance, even when such configurations do not match the evaluated function
(the respective cut weight does not return the certificate value). The sole
existence of such a discrepancy at a particular instance bears little
significance, since the point of dynamical realizations is exactly to
progress from a generic computationally irrelevant spin state to a state
representing the evaluated function. Therefore, we need to be more precise
in formulating the problem.

We assume that the spin representations of elementary Boolean functions
forming the circuit are implemented efficiently: given the state of input
spins in subgraphs $cal(G)_k$ representing function $f_k$, the remaining
spins in $cal(G)_k$ reach the required terminal state (within the required
time) with probability one. This corresponds to the common approach of
constructing complex Boolean functions from a library of "well-tested"
realizations of more elementary functions. We will call such efficient spin
representations _smooth_. Of course, a concrete definition of a smooth
representation depends on dynamics, in particular, on equations of motion
governing the evolution of the spin representation. An important example,
of a smooth representation is provided by dynamical evaluations affected by
the Hamming distance separating accessible spin configurations. From such
perspective, a smooth representation is the one that does not have local
maxima that cannot be avoided by inverting one spin.

Let $bold(gamma) in bb(B)^M$ be a spin configuration, then, for a Hamming
radius $d$, we define the $d$-neighborhood of $gamma$ by $B_d (bold(gamma))
= {bold(gamma)′ : d_H (bold(gamma), bold(gamma)′) ≤ d}$. A configuration
$bold(gamma)$ is an *$d$-Hamming local maximum* if $C_λ (bold(gamma)′) ≤
C_λ (bold(gamma)) ∀ bold(gamma)′ ∈ B_d (bold(gamma))$.


#definition(title : "Unit-flip trap-free representation")[ A normalized
    spin representation $cal(G)_f$ is unit-flip trap free if the only
    $1$-Hamming local maxima of $C_(cal(G)_f)$ are certified
    configurations. // Equivalently, whenever $C_(cal(G)_f)(gamma) <
    // C_f^star$, there exists a spin $v in cal(V)_f$ such that
    // $C_(cal(G)_f)("flip"_v gamma) > C_(cal(G)_f) (gamma)$.
]

We want to address the natural question. Say, we have a complex Boolean
function represented by a circuit using only functions, for which we have
smooth representations. Will the spin representation of the complex
function constructed by smooth representations of more elementary functions
be smooth?

// can we translate reliable
// dynamical evaluaiton of elementary functions to the evaluation of composite
// spin representations. In other words, 

// Once this assumption holds, we can assume that all potential barriers
// preventing the spin configuration to converge to the valid state of
// $cal(G)$ are due to the conflicts emerging at the equality junctions.

// - *certified branch*
// - *branch selection*
 - *branch-selection conflict*
 - *downstream and upstream locking*
 - *zero-friction and repair avalanche*


= Coherence defects and gate-saturated incoherent states



= R-spin phase space

For each binary spin $s in bb(B) = {-1, 1}$, we introduce an R-spin
variable $(sigma, X) in bb(B) times [-1, 1]$, with the twisted endpoint
identification $(sigma, 1) ~ (-sigma, -1)$.

Equivalently, each R-spin can be regarded as living on a circle obtained by
gluing the two endpoints of the interval with a spin flip. We denote this
one-spin phase space by $scr(R) = (bb(B) times [-1, 1]) slash ~$. For a
graph with vertex set $V$, the R-spin phase space is $scr(R)^V$. A point of
$scr(R)^V$ is written $bold(italic(Psi)) = ((sigma_v, X_v))_(v in V)$. Away
from the twisted seam, there is a well-defined binary shadow
$pi(bold(italic(Psi))) = (sigma_v)_(v in V) in bb(B)^V$. Thus the R-spin
system has a continuous phase space, but its certificate structure is
inherited from the binary shadow.

The R-spin equations of motion have the form

$ dot(X)_m = sigma_m sum_n sigma_n A_(n,m) phi(X_m - X_n), $

with spin flips occurring when a coordinate crosses the twisted seam.

The important point is that the static certificate theorem concerns the
binary shadow $pi(bold(italic(Psi)))$, whereas the dynamics takes place in the
continuous space $scr(R)^V$.


= Cycle-balance


#theorem(title: "Cycle-balance principle")[
  Consider a circuit-induced R-spin representation with symmetric adjacency
  matrix $A = A^T$ and odd interaction kernel $phi$. Let $cal(Q)_h$ be the
  subfunction quotient graph, and let $B$ be an incidence matrix for
  $cal(Q)_h$. For each equality edge $e$, define its reduced edge state by
  $
    rho_e = sigma_(p_e) sigma_(q_e),
    quad
    Delta_e = X_(q_e) - X_(p_e),
  $
  and its equality flux by
  $
    j_e = A_e rho_e phi(Delta_e).
  $
  If $bold(X)$ denotes the vector of aggregate cluster coordinates, then
  $
    dot(bold(X)) = B bold(j) + bold(j)_"clamp".
  $

  Hence quotient-level stability is the flux-balance condition
  $
    B bold(j) + bold(j)_"clamp" = 0,
  $
  not the condition that all equality junctions are satisfied.

  In particular, in an unclamped quotient component, $dot(bold(X)) = 0$
  whenever $bold(j) in ker B.$
  If $cal(Q)_h$ contains cycles, then $ker B$ is nontrivial. Therefore
  nonzero R-realizable circulations may stabilize the aggregate cluster
  coordinates even when some equality junctions are unsatisfied.
]

#definition[
  A *flow-balanced conflict* is a configuration in which at least one equality
  junction is unsatisfied, but the induced equality-edge fluxes satisfy the
  quotient balance equation
  $
    B bold(j) + bold(j)_"clamp" = 0.
  $
  In the unclamped case this becomes
  $
    B bold(j) = 0.
  $
  If the balancing flux is supported on cycles of the quotient graph, we call
  the configuration a *cycle-supported flow-balanced conflict*.
]


// Local Variables:
// typst-preview--master-file: "/home/misha/Documents/storage/google/science/IM-texts/notes/logic/noteworthy/main.typ"
// End:
