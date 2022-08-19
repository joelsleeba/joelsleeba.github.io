---
title: "Outdated Softwares, Code Repositories, and SSH Keys"
date: 2022-08-19T17:03:54
draft: true
tags: ["Linux", "Git"]
---

# Introduction
    What is the best thing to do when you are too lazy to carry around your laptop and want to work on public computers without compromising your security? This is a summary of what I did in the last 3, 4 days trying to figure out how to access and update my GitHub repositories from a public computer. 

    Being the internet security nerd I am, I didn't want to login to my GitHub account from a computer I don't trust. Can't afford to mess with my online accounts. So I wanted a work around. What option must I choose than the good old SSH?

# Day 1
    - FTP server from my phone, access local files on the lab computer, and work on the files in phone with git in the lab computer. But this method soon manifested to be painfully slow
    - 

# Day 2

# Day 3
    - What if I use a LUKS encrypted USB to save my SSH keys?
    - Ah fuck, No cryptsetup, No sudo permission to install that either
    - An idea of disposable SSH keys
    - Creating a script to make SSH keys on demand in any system
    - Successfully generate and SSH to GitHub server
    - Ah fuck! Ubuntu 16.04 and it's outdated openssl, keyring packages has no way to work with ed25519 or rsa-sha2 algorithms. Time to change the computer to another one!
    - Changes computer, but fuck! there's no git installed. How will i git without sudo?
    - Let's build the source code and try installing it to /home/user/.local
    - Yes, git installed smoothly. Smoothest build I've ever seen
    - Let's try the old script we made for SSH. Fingers Crossed!
    - Hurray! Finally a worthy push to the remote. I can rest now. But wait I should document this. Lesgoo


{{< highlight bash "linenos=table,hl_lines=8 15-17,linenostart=199" >}}
// ... code
{{< / highlight >}}

# Takeaway
