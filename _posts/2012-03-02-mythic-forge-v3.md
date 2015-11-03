---
permalink: mythic-forge-v3
title: Mythic-forge v3
description: Going full JavaScript with Node.js (in progress)
meta:
  tags:
    - {icon: message, text: 'Game Engine'}
    - {icon: code-braces, text: JavaScript}
    - {icon: settings, text: Node.js}
    - {icon: settings, text: Backbone}
    - {icon: settings, text: jQuery}
    - {icon: database, text: MongoDB}
    - {icon: format-paint, text: CSS3}
    - {icon: format-paint, text: Inkscape}
  image: mythic-forge-v3-header.png
  end: 2014-06-15
  inverted: true
  background:
    color: '#374845'
---

*Work in progress*

# Game engine as a Service - rebirth from ashes

You may be interested by [part one][mythic-forge-1]{:target='_blank'} and [part two][mythic-forge-2]{:target='_blank'} of the project history.
If you’re hurry, Mythic forge is an online multi-player game engine, where the game designers use online tools to create and make their game evolve without outage for players.

The second version, with its Java-based server (Spring + Hibernate + Groovy + WebSockets) and its JavaScript ([Resthub.js][resthub]{:target='_blank'} + Require.js + ACE) UIs, did not reached its audience.
A bit depressed, I took a month off, thinking a lot about what did not worked.

The answer I found was to return to basics:

> I'll never be a successful game designer, but I love to make tools.
>
> So let's improve by pushing technologies I'm using daily.

Since mid-2011, my daily job was related [Node.js][node]{:target='_blank'}, JavaScript MVC frameworks and [MongoDB][mongo]{:target='_blank'}.

# A total rewrite

This was 7 months I was working on an Open Data service, named [SmartData][sd]{:target='_blank'}, with Node.js, [ElasticSearch][elastic]{:target='_blank'} and MongoDB.
This was a really great experience, because SmartData had to handle and adapt to unstructured data, and especially because Node excels in that field.

In Mythic-Forge, the database model used to be generic, to allow game designers to add their own object classes with custom properties.
As the game logic is also written by game designers in the rule engine, I put a lot of effort to make Groovy rules aware of Hibernate transactions, and allow a maximum dynamism to avoid compilation and deployment.

By using a flexible document-oriented database like Mongo and a dynamic scripting language like JavaScript, I could get rid of all this pain, with the promise of better performances.

I trashed all the Java and Groovy part, and rewrote it in Node.js (named Hyperion), and replaced MySQL with MongoDB.
It took me 10 months.

In the same time, I rewrote also the game designer UI (named Rheia), because it was clear that Resthub.js had a little future.
I was eager to experience [Backbone.js][backbone]{:target='_blank'}. I kept [RequireJS][require]{:target='_blank'}, [jQuery][jquery]{:target='_blank'}, [jQueryUI][jquery-ui]{:target='_blank'} and the [ACE editor][ace]{:target='_blank'}, so it was not so painful.

# New features

Dynamic languages are trendy nowadays, and they might have better productivity.
With Node.js, I really experienced that.

In addition to the [previous features][features]{:target='_blank'}, Hyperions adds notable novelties:

- In-game animations with sprites
- Simplified rule writing with changes detections on object and auto-save
- Meaningful rules with custom object properties without the use of getter/setter
- Optimized network sharing among WebSockets with [Socket.io][sio]{:target='_blank'} and [Stompy][stompy]{:target='_blank'}
- External providers authentication (Github, Google, Twitter) thanks to [Passport][passport]{:target='_blank'}
- Structured objects and types search thanks to MongoDB

{% include card.html image='/image/mythic-forge-v3-1.png' description='Rheia\'s moderation perspective, that allows to edit object\'s custom properties' %}

Game UI files are still managed within a [Git][git]{:target='_blank'} repository thanks to [Gift][gift]{:target='_blank'}, a git command-line wrapper to which I contributed a lot.

And to ease work when authoring Game UI, Atlas was transformed to a framework-agnostic JavaScript library.
It's intended to be embed in the Game UI, and takes care of state sharing above the WebSocket channel, providing a global object repository and a sprites cache.
It comes with few dependencies (async, jQuery, underscore, socket.io client), to let the designer free of using any JavaScript stack.

# A space crusade with Deep-Hulk

With "Tales of Eethia 2" failure, I did not wanted to put too much efforts on writing a game from scratch.
So I created a digital version of ["Space Crusade"][space-crusade]{:target='_blank'}, an 90's board game pretty popular in Europe, taking scene in the [Warhammer 40K][w40]{:target='_blank'} universe.

{% include card.html image='/image/deep-hulk-1.png' description='Chaos forces' %}

Up to 4 players are proposed to fight in a space hulk, where one of them (the alien) plays the hulk inhabitants, and the three others are brave space marines squads, in charge of purging the spaceship from the alien foes.
It was a perfect example of turned-based game, and fits well to Mythic-forge.

The main improvement was the ability for players to play in any order (instead of waiting for others to move all their characters), and to play asynchronously, by replaying others actions at connection.
A chat was also added.

*TODO replay screen video*

Almost 95% of the original board game was digitized, and the game is [alive][deephulk]{:target='_blank'} (but only in french until now).
We played a lot with colleages and friends.

*TODO another screen shot*

Unfortunately, I totally stopped working on Mythic-forge and Deep Hulk since the birth of my lovely daughter on summer 2014.
I regularly have new game ideas, but wait a calmer period before diving again !

[mongo]: https://www.mongodb.org/
[elastic]: https://www.elastic.co/
[backbone]: http://backbonejs.org/
[mythic-forge-1]: {% post_url 2009-04-06-mythic-forge-v1 %}
[mythic-forge-2]: {% post_url 2011-01-22-mythic-forge-v2 %}
[features]: {% post_url 2009-04-06-mythic-forge-v1 %}#functionnalities
[passport]: http://passportjs.org/
[sio]: http://socket.io/
[stompy]: https://github.com/glasseyes42/node-stomp-client
[gift]: https://github.com/notatestuser/gift
[space-crusade]: https://fr.wikipedia.org/wiki/Space_Crusade
[w40]: https://en.wikipedia.org/wiki/Warhammer_40,000
[deephulk]: http://mythic-forge.com/game
[sd]: {% post_url 2011-01-15-smartdata %}
[jquery]: http://jquery.com/
[jquery-ui]: https://jqueryui.com/
[require]: http://requirejs.org/
[node]: https://nodejs.org/en/
[ace]: https://ace.c9.io/
[git]: https://git-scm.com/
[resthub]: {% post_url 2010-07-20-resthub %}