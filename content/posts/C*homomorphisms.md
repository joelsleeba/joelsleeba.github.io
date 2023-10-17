---
title: "States of a C* algebra"
date: 2023-09-25T23:48:19+05:30
draft: false

# weight: 1
# aliases: ["/first"]
tags: ["math"]
author: "Joel Sleeba"
# author: ["Me", "You"] # multiple authors
showToc: false
TocOpen: false
hidemeta: false
comments: false
description: ""
canonicalURL: "https://joelsleeba.github.io/"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: false
ShowReadingTime: false
ShowBreadCrumbs: false
ShowPostNavLinks: true
ShowWordCount: false
ShowRssButtonInSectionTermList: true
UseHugoToc: true
#cover:
#    image: "<image path/url>" # image path/url
#    alt: "<alt text>" # alt text
#    caption: "<text>" # display caption under cover
#    relative: false # when using page bundles set this to true
#    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/joelsleeba/joelsleeba.github.io/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

# Things to remember
1. Every C* homomorphism is a bounded linear map which preserve multiplication and involution.
2. Every C* algebra is a Banach algebra, and therefore also a Banach space under the norm.
3. Every * homomorphism from C* algebra to the set of complex numbers is a linear functional of this Banach space.
4. Every * homomorphism between C* algebras are norm decreasing. _(Thm 2.1.7, Murphy)_
5. Hence every multiplicative * linear functional of this C* algebra is in the closed unit ball of the dual space of the Banach space.
6. A hermitian linear functional are those linear functional (need not be a * homomorphism) which satisfy $f(a) = \overline{f(a^\*)}$ for all $a$ in the C* algebra.
7. Positive linear functionals of a C* algebra are those linear functionals (need not be a * homomorphism) where the image of the positive elements of the C* algebra lie the non-negative real line. Clearly positive linear functionals are hermitian.
8. Every multiplicative * linear functional is positive.
9. A bounded linear functional $\phi$ in a unital C* algebra is positive if and only if $\|\phi\| = \phi(1)$. _(Cor. 3.3.4, Murphy)_
10. Every hermitian linear functional can be written as the difference of two positive linear functionals. _(Jordan decomposition, Thm 3.3.10, Murphy)_
11. States are defined to be those positive linear functionals with norm 1.
12. Convex combinations of states are again states.
13. Pure states of a C* algebra are those states which cannot be written as a convex combination of any other state.

So essentially every multiplicative * linear functional on a C* algebra can be written as a linear combination of pure states.
