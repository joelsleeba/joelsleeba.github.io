---
title: Change of Basis
date: 2023-10-18T00:57:10
draft: true
---
Finding the change of basis matrix to convert the matrix form of a linear transformation from one basis to another was hard for me. It still sometimes warps my brain. So I think I will write this down now.

## Notations and Definitions
Consider $V$ an $n$-dimensional vector space over $\mathbb{C}$. Let $\alpha = \{a_1, a_1, \ldots, a_n\}$ be an ordered basis for our vector space. By the definition of basis every element $v \in V$ can be uniquely written as a linear combination of basis elements. We define the co-ordinates of $v \in V$ w.r.t basis $\alpha$ to be $[v]\_\alpha = (\alpha_1, \alpha_2, \ldots, \alpha_n)^T$ where $\alpha_i$ are such that $v = \sum_{i = 1}^n \alpha_i a_i$.

## Matrix form of a linear transformation
Take a vector. get its co-ordinate. matrix multiply with $[T]$. Get the new co-ordinate vector. construct the vector from basis with the new coordinate. The vector you have now should be the image of the original vector under $T$.

## Change of basis transform
Let $\beta = \{b_1, b_2, \ldots, b_n\}$ be another basis for $V$. Similarly let $[v]_\beta$ be the co-ordinates of $v$ w.r.t basis $\beta$. 

By the change of basis linear transformation from the basis $\alpha$ to $\beta$, we mean the unique linear transformation $\uparrow^{\beta}\_\alpha: \mathbb{C}^n \to \mathbb{C}^n$ which maps $[v]\_\alpha \to [v]\_\beta$. It is easy to prove that $\uparrow_\alpha^\beta$ is a linear isomorphism.

See that the matrix form of $\uparrow_\alpha^\beta$ which we will denote by $[\uparrow_\alpha^\beta]$ is
$$\begin{bmatrix}
\vert & \vert &   & \vert \\\
[a_1]\_\beta & [a_2]\_\beta & \cdots & [a_n]\_\beta \\\
\vert & \vert &   & \vert \\\
\end{bmatrix}$$


## Putting things together
Let $T$ be a linear operator on $V$. Let $[T]\_\beta$ be the matrix form of $T$ w.r.t basis $\beta$. And we have to find $[T]\_\alpha$ the matrix form of $T$ w.r.t $\alpha$.
