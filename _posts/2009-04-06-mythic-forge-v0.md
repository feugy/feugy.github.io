---
permalink: 2009/mythic-forge-v0
title: Mythic-forge v0
description: Game engine as a Service
meta:
  tags: 
    - {icon: chat_bubble, text: 'Game Engine'}
    - {icon: language, text: Java}
    - {icon: language, text: AS3}
    - {icon: language, text: Groovy}
    - {icon: build, text: Hibernate}
    - {icon: build, text: Spring}
    - {icon: build, text: Flex}
  image: mythic-forge-v0-header.png
  end: 2012-02-10
  background:
    color: '#F1AC27'
---

*Work in progress*

# An online service for game developers

Playing games is fun, but creating games is funniest.
Playing with others make fun even greater. And playing from everywhere at anytime is really fun.

So the idea behind Mythic-forge was to create online multi-player games.
But games that can evolve and grow, allowing players to invest time and effort on story telling. 

Because developing such games is a long-running process, Mythic-forge comes as an online service itself.

It's splitted in two:
- an web application for the game developer, for game authoring
- an web application for players: the game itself

A major concern was to have something really agile: while the game developer enriches its game (maps, objects, characters, actions...), the game client has to reflect those changes.
And a full rebuild and redeployment was not acceptable, so dynamic technologies was choosen to give Mythic-forge enough flexibility and dynamism.

# Serious gaming

At this time (April, 2009), I was starting my career as lead developer at Atos Worldline, and I needed to improve my knowledge on Java Web Services.

This side-project was not only for having fun, it was a pretext to learn the just-born Java Spring ecosystem.

All this work was really valuable as it helped me to be more confident in my daily work, and to innovate a lot. 

# Tales of Eethia beta game

In November 2010, after one year and half development, a first playable game was available: Tales of Eethia.

It was a survival game, where the player was lost on a distant hostile planet (something like Frank Herbert's Dune), and has to work for a mining company (Eemincorp) to survive.

We played during two months, making the game evolved during the beta (adding exchange system and fights for example), while two dozens of players where participating.  

{% include card.html image='/image/mythic-forge-v0.gif' description='Living addition of player inventory to game UI'%}

# Technologies inside

To reflect this various goals, the server side was done with Tomcat (quickly replaced by Jetty) web server, hosting a Spring application.

Data was stored in a MySQL database, accessed through Hibernate Object Relationnal Mapper, with full text search thanks to Hibernate Search (Lucene under the wood).

All the dynamic part (the games rules) was powered by Groovy scripts.

And both web applications was AS3 Flex applications, using Flash's proprietary protocol (AMF) for sharing data with server, allowing fast updates at a time when WebSockets was not availables.

All assets (maps, characters, UIs...) where crafted during the development.  
  
# Bitbucket repository

Mercurial sources can be found on [Bitbucket][1].

[1]: https://bitbucket.org/feugy/mythic-forge