---
title: "Uniqueness of f(AB) = f(BA)"
date: 2023-09-26T13:30:55+05:30
draft: true

# weight: 1
# aliases: ["/first"]
tags: ["Mathematics"]
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

# Introduction 
It is easily verified that the trace of a matrix has the property $\operatorname{tr}(AB) = \operatorname{tr}(BA)$. Now I will attempt to prove that trace is the unique linear functional upto scaling which satisfy this property.

# Proof
Assume $f$ is a linear functional on $M_n(\mathbb{C})$ such that $f(AB) = f(BA)$. Consider $E_{ij} \in M_n(\mathbb{C})$, the matrix with $e_{ij} =1$ and all the rest of elements $0$. It can be shown that $E_{ii} E_{ij} = E_{ij}$ and $E_{ij}E_{ii} = 0$, the latter when $i \neq j$. Hence $f(E_{ij}) = f(E_{ii}E_{ij}) = f(E_{ij}E_{ii}) = f(0) = 0$ whenever $i \neq j$.

Now if $A = (a_{ij}) \in M_n(\mathbb{C})$, $$A = \sum_{i, j = 1}^n a_{ij}E_{ij}$$.
Hence $f(A) = \sum_{i=1}^n a_{ii}f(E_{ii}) = \lambda \operatorname{tr}(A)$, where $\lambda$ being the appropriate constant. 

