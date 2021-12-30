---
permalink: mythic-forge-v1
title: Mythic-forge v1
description: Game engine as a Service
meta:
  tags:
    - { icon: message, text: "Game Engine" }
    - { icon: code-braces, text: Java }
    - { icon: code-braces, text: Groovy }
    - { icon: code-braces, text: AS3 }
    - { icon: settings, text: Hibernate }
    - { icon: settings, text: Spring }
    - { icon: settings, text: Flex }
    - { icon: format-paint, text: Inkscape }
  image: mythic-forge-v1-header.png
  end: 2011-02-20
  inverted: true
  background:
    color: "#12586A"
---

# An online service for game developers

Playing games is fun, but creating games is funniest.
Playing with others make fun even greater. And playing from everywhere at anytime is a must have.

So the idea behind Mythic-forge was to create online multi-player games.
But games that can evolve and grow, allowing players to invest time and effort on story telling.

Because developing such games is a long-running process, Mythic-forge comes as an online service itself.

It's splitted in two:

- an web application for the game developer, for game authoring (Koios)
- an web application for players: the game itself (Atlas)

And powered by a REST API server (Chronos)

A major concern was to have something really agile: while the game developer enriches its game (maps, objects, characters, actions...), the game client has to reflect those changes.
And a full rebuild and redeployment was not acceptable, so dynamic technologies was choosen to give Mythic-forge enough flexibility and dynamism.

# Serious gaming

At this time (April, 2009), I was starting my career as lead developer at Atos Worldline, and I needed to improve my knowledge on Java Web Services.

This side-project was not only for having fun, it was a pretext to learn the just-born Java Spring ecosystem.

All this work was really valuable as it helped me to be more confident in my daily work, and to innovate a lot.

# Functionnalities

This first version proposed from Game developer perspective:

- 2D maps, with fields definition, image uploads, and maps creation with drag'n drop
- Game object/characters classes, with position on maps, and illimited number of custom typed fields
- Character actions, with a rule engine, where rule has two methods: canExecute() and execute()
- Turned-based actions, with static rules
- JSON editor for game UI customization
- Moderation view, to track (and see) in realtime players behaviors
- Administration view, with server logs, realtime graph of connected players and mainteance switch

From player perspective:

- Character creation at first connection
- Map display
- A dynamic action menu on clic, and optional parameters input when required by selected rule
- Game event log
- Various panel to display static data (inventory, object characteristics...)
- A craft system to create various buildings and objects
- Chat with other players/admins
- A logbook player can write and share with others

{% include card.html image='/image/mythic-forge-v1.gif' description='Living addition of player inventory to game UI'%}

# Technologies inside

To reflect this various goals, the server side was realized in Java with [Jetty][jetty]{:target='\_blank'} web server, hosting a [Spring 3][spring]{:target='\_blank'} application (with Spring Security).
The whole project is built and packaged as a [Maven][mvn]{:target='\_blank'} multi-modules project.

Data was stored in a [MySQL][mysql]{:target='\_blank'} database, accessed through [Hibernate][hibernate]{:target='\_blank'} Object Relationnal Mapper, with full text search thanks to [Hibernate Search][hibernate]{:target='\_blank'} ([Lucene][lucene]{:target='\_blank'} under the wood).

All the dynamic part (the rule engine) was powered by [Groovy][groovy]{:target='\_blank'} scripts.

And both web applications was AS3 [Flex 4][flex]{:target='\_blank'} applications, using [GraniteDS][gds]{:target='\_blank'} to share whole objects graphs between server and applications.
GraniteDS worked with Flash prorietary protocola AMF, at a time when WebSockets was not availables.
Flex web applications were automatically tested with [Selenium Flex][sfapi]{:target='\_blank'}.

All assets (maps, characters, UIs...) where crafted during the development in SVG with [Inkscape][inkscape]{:target='\_blank'}.

{% include card.html image='/image/mythic-forge-v1.png' description='Art works and SVG drawings'%}

# Tales of Eethia beta game

In November 2010, after one year and half development, a first playable game was available: Tales of Eethia.

It was a survival game, where the player was lost on a distant hostile planet (something like Frank Herbert's Dune), and has to work for a mining company (Eemincorp) to survive.

We played during two months on an instance hosted at [OVH][ovh]{:target='\_blank'}, making the game evolved during the beta (adding exchange system and fights for example), while two dozens of players where participating.

{% include card.html image='/image/tales-of-eethia-1.png' description='Screenshots of Tales of Eethia Game UI'%}

After this beta test, it appears that:

1. The generic game web application was not flexible. Using a JSON customizable UI was far enought of an immersive UI for gamers.
1. A slow rule engine. Any player click ends up to rules evaluation, with multiple (transactionnal) database access. Not enought reactive !
1. Handwork game: numerous bugs on the game logic embedded in rules, due to the lack of automated testing.

An open road for the [second version]({% post_url 2011-01-22-mythic-forge-v2 %}) of Mythic-Forge !

# Bitbucket repository

Mercurial sources can be found on [Bitbucket][bitbucket]{:target='\_blank'}.

[bitbucket]: https://bitbucket.org/feugy/mythic-forge
[gds]: http://www.granitedataservices.com/
[spring]: https://docs.spring.io/spring/docs/3.0.x/spring-framework-reference/html/index.html
[ovh]: https://www.ovh.com
[inkscape]: https://inkscape.org/
[sfapi]: https://code.google.com/p/sfapi/
[flex]: http://www.adobe.com/fr/products/flex.html
[groovy]: http://www.groovy-lang.org/
[mysql]: http://dev.mysql.com/doc/refman/5.0/en/
[hibernate]: http://hibernate.org/orm/
[hibernate-search]: http://hibernate.org/search/
[lucene]: https://lucene.apache.org/core/
[jetty]: http://www.eclipse.org/jetty/
[mvn]: https://maven.apache.org/
