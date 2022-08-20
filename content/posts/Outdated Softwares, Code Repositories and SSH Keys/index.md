---
title: "Outdated Softwares, Code Repositories, and SSH Keys"
date: 2022-08-19T17:03:54
draft: true
tags: [Linux, Git]
---

# Introduction
What is the best thing to do when you are too lazy to carry around your laptop and want to work on public computers without compromising your security? This is a summary of what I did in the last 3, 4 days trying to figure out how to access and update my GitHub repositories from the lab computers in my campus.

Being the internet security nerd I am, I didn't want to login to my GitHub account from a computer I don't trust. Can't afford to mess with my online accounts. So I wanted a work around. What option must I choose than the good old SSH?

# Day 1
One day ago I saw my friend [Ashish Kujur](https://github.com/ashishKujur7) working with $\LaTeX$ to make notes of the lectures we had. It looked so cool. I wanted to learn $\LaTeX$ and make notes like that for a long time. This seemed like a perfect opportunity to learn something new. Also, I wanted to score 9+ GPA this semester. Making proper notes seemed a good way to my goal. I forked his repo. But still, I wanted a good and secure workflow setup so that I didn't want to carry my laptop around. So I started trying out various techniques from the BSB computer lab at IISER Thiruvananthapuram. 

1. My first plan was to start an FTP server (I used the inbuild FTP server in the [Material Files](https://play.google.com/store/apps/details?id=me.zhanghai.android.files&hl=en_IN&gl=US) app) from my phone and acces the local files from the lab computer. Later I would run git from the lab PC, make use of the SSH keys in my phone, and push the commits to my remote repo. This way I could keep my GitHub SSH keys secure in my personal device, without exposing them to a public computer.
   - But this soon turned out to be painfully slow. Although git was able to connect to the remote repo and create the .git folder, downloading objects seemed to take eons . I haven't yet figured out what made it so slow. But that was clearly not the way I wanted my work setup.

2. Failing the first plan, I thought to work on the local repo in my phone, accessing it in the lab PC via the same FTP server. But why use the same unsecure FTP server when you can do SFTP (literally Secure-FTP)? That became my next plan. I used [
SFTP Server s0 v1](https://play.google.com/store/apps/details?id=ch.becke.sftp_server__s0_v1&hl=en_IN&gl=US) to connect to the local repo and edit the files there.
    - For some reason the SFTP server kept disconnecting and the latency was too much to bear. I wanted out

3. Day 1, Plan 3. I was back to my dear [Termux](https://termux.dev/en/), which I have used before to sync my [Obsidian](https://obsidian.md/) repositories. I felt comfortable with the platform since I have worked on it before. Because I wanted to edit my files in the PC screen with the ease of a full length keyboard, I had to somehow connect the Termux instance to the Ubuntu PC. I could've started an SFTP server as before, but who want that when you can flex running [Xfce4](https://www.xfce.org/) on your phone. VNC it is. I installed x11-repo, tigerVNC along with Xfce4 into my termux to kickstart a VNC server with a GUI. And it worked! I installed [mousepad](https://docs.xfce.org/apps/mousepad/start) into the Termux instance, and hurrah, I had a working setup with a GUI text editor, with everything localized in my phone.
    - After sometime I noticed the VNC server being shut down everytime I switch to some other app from Termux. It meant that I would not be able to use my phone at all while doing my work. It didn't bother me much, I was in a way pleased by the idea of intense work without the urge to check Instagram frequently, but a quick internet search on VNC server and their low security start to bother me.

4. The fix was pretty simple. Start an SSH server on my Termux instance and then restrict my VNC server to accept connections only from localhost while forwarding the VNC port through the SSH tunnel. 
    - I finished that in a whim, but the idea of having another SSH key to protect my GitHub SSH keys seemed like an overkill. Also like the last time, both the SSH and VNC servers kept crashing every time I switched from Termux.
    
By the end of the day I was tired after all the failed attempts and the realization that the above methods didn't exactly please me for my workflow was discouraging. 

# Day 2

# Day 3
I lost my heart on the project. I was working on the local copy in my USB stick, connecting it to the lab PC . Still the idea of connecting my USB stick to that public USB port with no condoms kept itching the back of my head.

# Day 4
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
sshkeygen() {
    KEYNAME="sleeba $(date +"%d-%m-%Y %H:%M:%S")"
    if [[ ! -e $HOME/.ssh/ ]]; then
        mkdir -p $HOME/.ssh
    fi
    SSHKEY="$HOME/.ssh/$KEYNAME"
    ssh-keygen -t ed25519 -C "unsafe-key" -f "$SSHKEY"
    chmod 600 "$SSHKEY"
    echo -e "\n\nAccess ssh public key in pastebin here:"
    cat "$SSHKEY.pub" | nc termbin.com 9999
    #ssh-add -t 15 "$SSHKEY"
    export SSHKEY
}
{{< / highlight >}}

# Takeaway
