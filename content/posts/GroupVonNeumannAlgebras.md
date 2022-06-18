---
title: Group von-Neumann Algebras
date: 2023-10-18T12:26:00
draft: true
---

Let $\Gamma$ be a group with discrete topology. We define $\ell^1(\Gamma)$ to be the collection of functions $f: \Gamma \to \mathbb{C}$ such that its norm given by inner product $\langle f, g \rangle = \sum_{\gamma \in \Gamma}f(\gamma)\overline{g(\gamma)}$ is finite. Then $\ell^2(\Gamma)$ is a Hilbert space with respect to this inner product. Moreover the functions $\varepsilon_\gamma: \mu \to \delta_{\gamma, \mu}$(Kronecker delta) form a basis for $\ell^2(\Gamma)$. Consider the linear operator $u_\lambda: \ell^2(\Gamma) \to \ell^2(\Gamma)$ which sends $\varepsilon_\gamma \to \varepsilon_{\lambda \gamma}$. Since $(u_\lambda \varepsilon_\gamma)(\mu) = \delta_{\lambda \gamma, \mu}  = \delta_{\gamma, \lambda^{-1} \mu} = \varepsilon_{\gamma}(\lambda^{-1} \mu)$ by linearity it follows that if $f \in \ell^2(\Gamma)$, then $(u_\lambda f)(\gamma) = f(\lambda^{-1} \gamma)$. This will show that $u_\lambda$ is a unitary operator in $\ell^2(\Gamma)$. Moreover $u_\lambda u_\gamma = u_{\lambda \gamma}$. Thus, $\gamma \to u_\gamma$ gives the regular representation of $\Gamma$ in $B(\ell^2(\Gamma))$
