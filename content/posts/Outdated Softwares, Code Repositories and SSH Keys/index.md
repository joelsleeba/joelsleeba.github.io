---
title: "Outdated Softwares, Code Repositories, and SSH Keys"
date: 2022-08-21T02:03:54
draft: false
math: true
tags: [Linux, Git, Security]
---

# A pinch of envy
One day I saw my friend [Ashish Kujur](https://github.com/ashishKujur7) working with $\LaTeX$ to make notes of the lectures we had. It looked cool. I wanted to learn $\LaTeX$ and make notes like that for a long time. Making proper notes seemed a good way to my goal. I forked his repo. The plan was to pull from his repo, make my edits, add my observations and later push to my repo. That definitely required a computer.

But what is the best thing to do when you are too lazy to carry around your laptop and want to work on public computers without compromising your security? I wanted a good and secure workflow which I could easily setup in any of the Linux machines in the campus.

I didn't want to login to my GitHub account from a computer I don't trust. Can't afford to mess with my online accounts. So I wanted a workaround. What option must I choose than the good old [SSH](https://en.wikipedia.org/wiki/Secure_Shell "An encrypted protocol which provides shell access to remote systems")? I could easily SSH into GitHub and update my repositories. 

So I started trying out various techniques from the BSB computer lab at IISER Thiruvananthapuram. This is a summary of what I did in the last 3, 4 days trying to figure out how to access and update my GitHub repositories from the computers in my campus.

# FTP server

My first plan was to start an [FTP](https://en.wikipedia.org/wiki/FTP_server "File Transfer Protocol") server in my phone and access the local files from the lab computer. Later I would run git installed in the lab computer, make use of the SSH keys in my phone, and push the commits to my remote repo. This way I could keep my GitHub SSH keys secure in my personal device, without exposing them to a public computer. I used the builtin FTP server in the [Material Files](https://play.google.com/store/apps/details?id=me.zhanghai.android.files&hl=en_IN&gl=US) app for this

But this soon turned out to be painfully slow. Although git was able to connect to the remote repo and create the .git folder, downloading objects seemed to take eons. I haven't yet figured out what made it so slow. But that was clearly not the way I wanted my work setup.


# SFTP Server

Failing the first plan, I thought of working on the local repo in my phone, accessing it in the lab computer via the same FTP server. But why use the same unsecure FTP server when you can do [SFTP](https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol "Secure File Transfer Protocol") (literally Secure-FTP)? That became my next plan. I used [SFTP Server s0 v1](https://play.google.com/store/apps/details?id=ch.becke.sftp_server__s0_v1&hl=en_IN&gl=US "A simple android app which configures and SFTP server") in my phone to access the local repository and edit the files there.

For some reason the SFTP server kept disconnecting and the latency was too much to bear.


# Termux and VNC

Day 1, Plan 3. I was back to my dear [Termux](https://termux.dev/en/ "An android app which emulates a basic Linux shell"), which I have used before to sync my [Obsidian](https://obsidian.md/ "A markdown notetaking app") repositories. I felt comfortable with the platform since I have worked on it before. Because I wanted to edit my files in the bigger screen with the ease of a full length keyboard, I had to somehow connect the Termux instance to the Ubuntu machine. I could've started an SFTP server as before, but who want that when you can flex running [Xfce4](https://www.xfce.org/ "A full blown desktop environment, basically GUI for the terminal") on your phone. [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing "A desktop sharing protocol") it is. I installed x11-repo, tigerVNC along with Xfce4 into my termux to kickstart a VNC server with a GUI. And it worked! I installed [mousepad](https://docs.xfce.org/apps/mousepad/start "Default text editor for Xfce4 desktop") into the Termux instance, and hurrah, I had a working setup with a GUI text editor, with everything localized in my phone.

After sometime I noticed the VNC server being shut down everytime I switch to some other app from Termux. It meant that I would not be able to use my phone at all while doing my work. It didn't bother me much, I was in a way pleased by the idea of intense work without the urge to check Instagram frequently, but a quick internet search on VNC server and their low security start to bother me.


# VNC over SSH

4th plan of the same day. The fix for insecure VNC was pretty simple. Start an SSH server on my Termux instance and then restrict my VNC server to accept connections only from localhost while forwarding the VNC port through the SSH tunnel. 

I finished that in a whim, but the idea of having another SSH key to protect my GitHub SSH keys seemed like an overkill. And in my blunder I intentionally pushed my Termux SSH private authentication keys into the GitHub repo. Also like the last time, both the SSH and VNC servers kept crashing every time I switched from Termux. I had to find another way. 
    
By the end of the day I was tired after all the failed attempts and the realization that the above methods didn't exactly please me for my workflow was discouraging. 


# USB Stick and LUKS
It took me 2, 3 days to try something new. I had lost my heart on the project. I was pulling Ashish's code repo to my USB stick and editing it connecting to the lab computer. I couldn't put my SSH keys in the USB stick, it would've been an easy meal for anyone who gets hands on it. The idea of having a lot of unpushed commits and the need to connect my USB stick into the public USB ports with no safety was itching the back of my head.

So I decided to secure it. [LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup "A Linux disk encription software") encryption was my buddy. Without wasting a moment I started formatting my USB stick with LUKS encryption. But the Ubuntu System in the computer lab couldn't format the USB stick. It needed [_cryptsetup_](https://Linux.die.net/man/8/cryptsetup "Linux programme which takes care of LUKS encryption") to be installed along with [_sudo_](https://en.wikipedia.org/wiki/Sudo "The wet dream of every Linux haxxer") privilege. Which I didn't have.


# An idea of disposable SSH keys

GitHub works in a way that it uses SSH keys added to the user account and allow push requests from systems having the corresponding private key. My idea was to generate SSH keypairs on demand in any machine and then add it to the GitHub account using my phone. And later when I am leaving the session, I would scrub the keys and deauthenticate them from GitHub. This way one required the SSH private key file and the key password of the exact key that I've authenticated with GitHub at the moment. It also ensured that I'll never use the same key for two different sessions. Which in my view was gold standards. But that too had its own challenges.

   1. Recently in 2021, [GitHub reviewed their Git protocol security](https://github.blog/2021-09-01-improving-git-protocol-security-github/) which revoked support for SSH keys generated by the RSA-DSA and [RSA-SHA1 signature algorithm](https://crypto.stackexchange.com/questions/60619/after-googles-collision-attack-is-rsa-sha1-signature-still-safe "A cryptography stackexchange discussion on the security of rsa-sha1"). The ideal algorithm GitHub suggested for generating SSH keys was an [EdDSA](https://en.wikipedia.org/wiki/EdDSA "Edwards-curve Digital Signature Algorithm") algorithm, [ED25519](https://en.wikipedia.org/wiki/EdDSA#Ed25519) based on [elliptic curve cryptography](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm) with support for [RSA-SHA2](https://en.wikipedia.org/wiki/SHA-2). But the Linux machine I was working on till this point had Ubuntu 16.04, released in 2016, more than 8 years back. The software [OpenSSL](https://www.openssl.org/), which takes care of most cryptographic algorithms was so outdated that it couldn't handle either of the ED25519 or RSA-SHA2 algorithms. Although everything else worked fine, because of these missing algorithms, GitHub was revoking my push requests. I had no way to upgrade the Ubuntu distro. I had to change the machine.
  
{{< gallery match="images/software*" loadJQuery="true" previewType="blur" thumbnailResizeOptions="600x600 q90 Lanczos" thumbnailHoverEffect="enlarge">}}

   2. I booted up the nearest computer. It had Ubuntu 18.04, still old, but with the algorithms that I wanted. But when I slayed one dragon another erupted out. The new machine had no git installed in it. That was disappointing. I wouldn't be able to sync any of my work without git. That was the backbone to my workflow. I wanted to install git, being a normal, non-sudo user in that machine. There must be a work around. Google to the rescue. I learned that if I compile the [git source code](https://github.com/git/git) with the necessary parameters and install it into `$USER/.local/bin` I might be able to git it. I typed up this script for installing git from source.
{{< highlight bash "linenos=table 15-17,linenostart=1" >}}
wget -c https://github.com/git/git/archive/refs/heads/master.zip \
-O $HOME/Downloads/git.zip
unzip $HOME/Downloads/git.zip -d $HOME/Downloads
cd $HOME/Downloads/git-master
make configure
./configure --prefix=/home/user/.local
make prefix=/home/user/.local all doc info
make prefix=/home/user/.local install
{{< / highlight >}}
And it worked smoothly. I have only compiled the source code a few times in my life, but this was one of the smoothest installations among them.

With the relief of some success I was about to push again to my GitHub repository. Fingers crossed!. It worked. I pushed my updates successfully into the GitHub remote repo. I can finally rest feeling content that now I can work from any Linux machine anywhere in the world without the need to carry around my laptop. All I need is my phone just to authenticate the disposable SSH keys and later remove them.


# Takeaway

This project was not something entirely new to me. I knew the basics of git, SSH, and enough Linux to compile them all together to make my project work. But the feeling of achieving the ability to work from anywhere on the go is something novel. Afterall it's not the goal but enjoying the path that matters. Now you might think why I was adamant on using SSH keys instead of GitHub authentication tokens. Because I can. 
