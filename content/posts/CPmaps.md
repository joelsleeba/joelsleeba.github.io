---
title: Completely Positive Maps
date: 2024-01-28T11:13:59+05:30
draft: true

# weight: 1
# aliases: ["/first"]
tags: [""]
author: "Joel Sleeba"
# author: ["Me", "You"] # multiple authors
showToc: false
TocOpen: false
hidemeta: false
comments: false
description: ""
canonicalURL: "https://joelsleeba.github.io/blog/"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: false
ShowBreadCrumbs: false
ShowPostNavLinks: true
ShowWordCount: false
ShowRssButtonInSectionTermList: true
UseHugoToc: true

math: true
tikzjax: false

cover:
    image: "" # image path/url
    alt: "" # alt text
    caption: "" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/joelsleeba/joelsleeba.github.io/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

# Introduction
Let $H$ be a Hilbert space. Then $H^n = \underbrace{H \oplus H \oplus \ldots \oplus H}\_{\text{n times}}$ is again a Hilbert space under the inner product $$\langle u, v \rangle_n  = \sum_{i=1}^n \langle u_i, v_i \rangle, \quad u = (u_1, u_2, \ldots, u_n), v = (v_1, v_2, \ldots, v_n) \in H^n$$. By Gelfand-Naimark's theorem, every C\* algebra $\mathcal{A}$ has an injective representation $(\pi, H_\pi)$ to a Hilbert space.
