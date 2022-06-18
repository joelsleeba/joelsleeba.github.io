---
title: Change of Basis
date: 2023-10-18T00:57:10
draft: false
comments: true
---
Finding the change of basis matrix to convert the matrix form of a linear transformation from one basis to another was hard for me. It still sometimes warps my brain. So I think I will write this down here.

## Notations and Definitions
Consider $V$ an $n$-dimensional vector space over $\mathbb{C}$. Let $\alpha = \{a_1, a_1, \ldots, a_n\}$ be an ordered basis for our vector space. By the definition of basis, every element $v \in V$ can be uniquely written as a linear combination of basis elements. We define the co-ordinates of $v \in V$ w.r.t basis $\alpha$ to be $[v]\_\alpha = (\alpha_1, \alpha_2, \ldots, \alpha_n)^T$ where $\alpha_i$ are scalars such that $v = \sum_{i = 1}^n \alpha_i a_i$. By the uniqueness of representation of vectors as linear combination of basis elements, we get that $A_\alpha: V \to \mathbb{C}^n : v \to [v]_\alpha$ is a linear isomorphism.

Let $T: V \to V$ be a linear transformation. The matrix form of $T$ w.r.t the basis $\alpha$ which we will denote by $[T]\_\alpha$ is 
$$\begin{bmatrix}
\vert & \vert &   & \vert \\\
[Ta_1]\_\alpha & [Ta_2]\_\alpha & \cdots & [Ta_n]\_\alpha \\\
\vert & \vert &   & \vert \\\
\end{bmatrix}$$

## Change of basis transform
Let $\beta = \{b_1, b_2, \ldots, b_n\}$ be another basis for $V$. Similarly let $[v]\_\beta$ be the co-ordinates of $v$ w.r.t basis $\beta$. By the change of basis linear transformation from the basis $\alpha$ to $\beta$, we mean the unique linear transformation $\uparrow^{\beta}\_\alpha: \mathbb{C}^n \to \mathbb{C}^n$ which maps $[v]\_\alpha \to [v]\_\beta$ for all $v \in V$. Existence and uniqueness can be verified by showing $\uparrow_\alpha^\beta = A_\beta A_\alpha^{-1}$

Also, see that the matrix form of $\uparrow_\alpha^\beta$ w.r.t the standard basis in $\mathbb{C}^n$ denoted by $P$ is
$$\begin{bmatrix}
\vert & \vert &   & \vert \\\
[a_1]\_\beta & [a_2]\_\beta & \cdots & [a_n]\_\beta \\\
\vert & \vert &   & \vert \\\
\end{bmatrix}$$


## Putting things together
Let $T$ be a linear operator on $V$. Let $[T]\_\alpha, [T]\_\beta$ be the matrix form of $T$ w.r.t bases $\alpha, \beta$ respectively. That is $[Tv]\_\alpha = [T]\_\alpha [v]\_\alpha$. Now by the definition of $\uparrow_\alpha^\beta$, we get that $[T]\_\beta[v]\_\beta = [Tv]\_\beta = P[Tv]_\alpha = P[T]\_\alpha[v]\_\alpha = P[T]\_\alpha P^{-1}[v]\_\beta$. Therefore $[T]\_\beta = P[T]\_\alpha P^{-1}$

$$\overset{\beta \leftarrow \beta}{[T]\_\beta} = \overset{\beta \leftarrow \alpha}{P}\overset{\alpha \leftarrow \alpha}{[T]\_\alpha}\overset{\alpha \leftarrow \beta}{P^{-1}}$$
Note that the overline arrow indicates the ordered bases of the domain and range.
