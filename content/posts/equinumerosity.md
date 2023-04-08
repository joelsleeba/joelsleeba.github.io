---
title: "Equinumerosity"
date: 2021-07-21T11:33:52+05:30
draft: false
math: true
tags: ["Set Theory"]
---
>*This is me testing $\LaTeX$ for my blog. Don't judge me for this. :)*

**Question**: If $A_1 =_c A_2$ and $B_1 =_c B_2$ prove that $(A_1 \to B_1 ) =_c (A_2 \to B_2 )$. 
Or in other words If the cardinality of $A_1$ and $B_1$  are equal to that of $A_2$ and $B_2$ respectively, then the cardinality of the set of functions from $A_1 \to B_1$ is equal to that of the set of functions from $A_2 \to B_2$
(from Notes on Set Theory, Yiannis Moschovakis, Chapter 2, Exercise 2.33)

<!-- _test cirle_
{{< tikz >}}
  \begin{tikzpicture}
    \draw (0,0) circle (1in);
  \end{tikzpicture}
{{< /tikz >}} -->

**Proof:** Let $\sigma : A_1 \to A_2$ and $\phi : B_1 \to B_2$ be two bijections.
And $f: A_1 \to B_1$ be any map. Define $g = \phi \cdot f \cdot \sigma^{-1}$. We claim that this map $T:(f \to g)$ is a bijection.

### Is $T$ well defined?
Verify that $T(f):=\phi \cdot f \cdot \sigma^{-1}$ is indeed a map from $(A_2 \to B_2)$

### Is $T$ onto?
Let $g_0$ be any arbitary map from $(A_2 \to B_2)$. Then $T(\phi^{-1} \cdot g_0 \cdot \sigma) = \phi \cdot \phi^{-1} \cdot g_0 \cdot \sigma \cdot \sigma^{-1} = g_0$

### Is $T$ one-one?
Let $T(f_1) = T(f_2)$

$
    \implies \quad      \phi \cdot       f_1 \cdot \sigma^{-1}          =   \phi \cdot            f_2 \cdot \sigma^{-1} 
\\
	\implies \quad  \phi^{-1} \phi \cdot f_1 \cdot \sigma^{-1} \sigma \ = \ \phi^{-1} \phi \cdot  f_2 \cdot \sigma^{-1} \sigma
\\
	\implies  \quad                      f_1                            =                         f_2 \\
$

Note that since $\phi$ and $\sigma$ are bijections, their inverses are well defined and function property of equal input gives equal output. 

Hence $T$ is a bijection from $(A_1 \to B_1 ) \to (A_2 \to B_2 )$ and therefore $(A_1 \to B_1 ) =_c (A_2 \to B_2 )$
