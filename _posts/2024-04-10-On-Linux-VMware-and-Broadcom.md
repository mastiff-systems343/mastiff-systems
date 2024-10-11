---
layout: post
title: "On Linux, VMware and Broadcom."
date: 2024-04-10
categories: [technology]
author: Chris
author_avatar: /assets/img/team/Chris-avatar.png
image: /assets/img/blog/4-on-linux.png
excerpt:
---

I fell in love with the idea of Linux when I was 15 or 16 years old. I would read magazines about the Linux operating system and the power of open source, which fascinated me. The idea of a free (free as in freedom and free as in free lunch) operating system that anyone could modify for their own specific needs seemed like a gift from the community to the world. Simply incredible. I wanted to run Linux as my primary operating system, but I was also an aspiring musician and had gone on my first real tour when I was 16. I was working as an assistant engineer in a few recording studios, learning the science of audio engineering in the evenings when I wasn't in class or on the road playing shows, and I had music software I needed to run, none of which worked on Linux.

Around this time, I also discovered emulators. My mom is handicapped (she would kill me if I said she was disabled) from juvenile rheumatoid arthritis, and my dad was a counselor for the state. With my mom's medical bills and her not being able to generate much income, we didn't have much money growing up. We were certainly rich in everything that really mattered, but we watched our pennies. I still find myself being pretty thrifty these days as a result of that experience. I watched all my friends getting game consoles like Nintendos and Sega Genesis, but that was just more money than my parents could spare. It was a bit frustrating, but then I discovered emulators and I was hooked. An emulator is a piece of software that tricks your computer into thinking it was a game console, so I could play a lot of those games my friends were playing, right on my computer. I became obsessed with making technology do things it wasn't necessarily supposed to do.

Then, in the late 90’s heard about an UC Berkley startup called VMware that would allow you to run multiple operating systems on one physical host or computer. The person who started the project saw that, in general, servers weren't fully utilizing all the CPU, RAM, and hard drive space that they had available. They speculated that they could turn one physical server into multiple virtual servers somehow, and that turned into the concept for a hypervisor.

A hypervisor is an operating system (Windows is the most used operating system for desktop computers and Android on smartphones now is the most popular operating system) that lives on a piece of hardware, like a server, in which you can create virtual computers or machines. Virtual machines are very powerful technology. Essentially, you've wrapped a whole computer in one or two files, so you can copy those files all over the place, keep them safe, and move them between multiple hosts in real time without any downtime. It's rather amazing technology that still feels like magic to me even after all these years, and I thoroughly enjoyed being able to work on that technology in my adult career full-time.

In one edition of some Linux magazine, there was an ad for VMware and a phone number, so I just called them on the phone and someone actually answered. They were a tiny startup. We discussed Linux and music software and how I could find a way to run both. I was just a dumb kid who didn't know what he was doing, but it was still amazing that they would just talk to me. At the time, I didn't get to dig into VMware as much as I would have liked; that would come later. I had no idea when I was 16 that I would be able to have a career in both music technology and corporate IT and how well they actually worked together.

I simply fell in love with VMware and the concepts, and as my IT knowledge grew, so did VMware as a company. They certainly had their share of changes in their business as Dell bought them, and they were bought and sold to other companies, but they always managed to navigate the technology landscape in a way that was very good for their users. Most of their users were people like me, server administrators who wanted to squeeze the most performance out of the servers they were working on for their clients. VMware is the backend that powers the world, and almost no one outside of tech circles has heard of them. They make billions of dollars a year now, not bad from a little startup that would answer some 16-year-old kid's silly questions on the phone for free.

Sadly, a huge conglomerate called Broadcom purchased VMware outright, and it seems their intentions are to raise prices to a ridiculous level, remove any perpetual licensing, and just focus on the absolute largest companies in the world. They've made decisions that leave small businesses out of the discussion entirely. Personally, I am increasingly frustrated with this subscription-based world we find ourselves in. I think you should be able to buy software once and use it on your server or computers forever. I hate that you have to pay a monthly fee to use software that you have paid for in the past. VMware's new licensing model makes it so you will have to pay a subscription on your server forever, or your virtual servers stop working. I didn't think that was an ethical decision, and VMware's response to the industry criticisms has been that “Subscription pricing is the industry standard.” I don't think that's an acceptable answer, and I don't care what everyone else does. You need to make the right decision for yourself, and aren't technology leaders supposed to lead regardless of industry? That's something I appreciated about Steve Jobs and Apple at the time that he ran it. He didn't care what the industry was doing; he was going to do what he thought was right and what he thought would make the most sense for his end-users.

I fear that there's a larger trend in the tech industry that I'm increasingly unhappy with. I describe it as the tail wagging the dog. All of these tools - servers, hypervisors, printers - are tools to do something in a business, to run the business, to make the business more profitable, to make it work in some way. It seems very backward to me for a tool to dictate the business, rather than the business dictate the use of the tool that it has chosen. It seems that the tech industry has gotten a little too big for its britches, in my opinion, and has decided that they are so vital and important to business as a whole. In some cases, it's hard to argue. Microsoft Outlook has been the email platform for business for years, despite it not necessarily being the greatest product, but certainly, we can't be held hostage by these tech companies. We can't fall into the subscription trap of forever payments for not that much value back other than things keep working.

That's why, after 20 years of being a VMware administrator, we have decided at Mastiff to not do any new VMware projects. We will certainly maintain, upgrade, and take care of our existing VMware install’s, but we will migrate away from VMware in the future. We are moving to a hypervisor product called Proxmox that does a fantastic job for most of what we need and is fully open source, so they won't ever really have that problem where a big company buys them out. I have personally played with Proxmox off and on for a few years now, and its latest version is quite mature. We also do a lot with Hyper-V, the Microsoft product, and of course, Microsoft Azure and Amazon AWS platforms. 

We also refuse to install or move to Nutanix, the possible up-and-comer to replace VMware in the corporate world, as they too don't have perpetual licensing and cost roughly the same as VMware is raising its prices to. Nutanix will trick you with amazing first-year pricing, but then you are trapped, and it's no better than VMware, and VMware is the more mature product. I hear Nutanix reps give the same line “subscription pricing is industry standard” and it turns my stomach to hear. What a cop out. I thought tech companies didn’t follow the pack? We will work on Nutanix but we wont do a new install with it.

Unfortunately, our days with VMware are numbered due to them clearly not wanting to take care of small business users' needs. It's quite heartbreaking for me, as I've loved this technology since I was a teenager, but it seems like there are, at least from a business standpoint, greener pastures elsewhere. We always want to be at the forefront of new technology that can be disruptive to the industry, so it'll be an interesting few years. Hopefully, this will go down in history as a big giant business mistake for Broadcom and VMware, and companies will learn not to be so disruptive to their users' everyday lives. Once again, open source saves the day!