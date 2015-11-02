---
permalink: mythic-forge-v2
title: Mythic-forge v2
description: Rise of the JavaScript Game engine
meta:
  tags:
    - {icon: message, text: 'Game Engine'}
    - {icon: code-braces, text: Java}
    - {icon: code-braces, text: Groovy}
    - {icon: code-braces, text: JavaScript}
    - {icon: settings, text: Hibernate}
    - {icon: settings, text: Spring}
    - {icon: settings, text: jQuery}
    - {icon: format-paint, text: CSS3}
    - {icon: format-paint, text: Inkscape}
  image: mythic-forge-v2-header.png
  end: 2012-02-10
  background:
    color: '#F1AC27'
---

# Game engine as a Service - powered by RestHub.js

If you've never heard about Mythic-Forge, have a look at the [first version][mythic-forge-1]{:target='_blank'}.

After a first implentation with a Java-based server and two Flex web applications, it was obvious that Flex was not the right solution.

At work, we were using the [RestHub][resthub]{:target='_blank'} framwork since several months, from which I was an active [contributor][resthub-article]{:target='_blank'}.

It was the perfect opportunity to combine pleasure and work, and Mythic-forge saw its authoring and game UI replaced with JavaScript applications (respectively Promotheus and Japet).

# Technologies adjustments

No more Flex Web applications means a new communication channel between UIs and server.
As the game is multiplayer and online, this channel has to be always wired: web sockets seems a good candidate (early 2011: not widely supported).
But web sockets are just... sockets. I made a quick implementation of the [STOMP][stomp]{:target='_blank'} protocol in Java for my server (none available at this time).

It allows to share state between players and server, but also between game developers.

Thanks to RestHub JavaScript stack, and the [ACE JavaScript editor][ace]{:target='_blank'} I was able to entierly rewrite my game authoring UI... in 4 weeks, which was the quarter of the time spent on the Flex equivalent.

The UI was far more easy and beautiful, with notable additions (shortcuts, syntax highlighting, code validations, icons).
And automatically testable with [Selenium][selenium]{:target='_blank'}

{% include card.html image='/image/mythic-forge-v2-1.png' description='Map authoring with Prometheus UI' %}

# Push to deploy your game

But the biggest addition was the Game UI authoring.
Instead of the generic UI customizable with a JSON file, the game developer is able to *code* its custom game UI in JavaScript.

Promotheus include a very simple IDE proposing a file tree and a tabbed editor with JSHint validation and syntax highlight.
Files (notably binary ones) can be uploaded. Any JavaScript library can be used, the single constraint is to use [RequireJS][require]{:target='_blank'}

Every file save was linked to a commit in a [git][git]{:target='_blank'} repository on server side.
Finally, a deploy button make a git tag, concat and optimze all JS and CSS files (thanks to [Require's optimizer][require-opti]{:target='_blank'}), and copy it to a public folder accessible to players.

It allows game designer to develop within a staging area (using the real game objects and maps), and roll out they work when ready, without game outage !

{% include card.html image='/image/mythic-forge-v2-2.png' description='The game authoring perspective with JavaScript validation' %}

# Tales of Eethia 2

In July 2011, I started to rewrite my first game, using the online IDE provided, always using the RestHub JavaScript stack.
In January 2012, this new version was ready, far more successful than the first one.

{% include card.html image='/image/tales-of-eethia-v2-1.png' description='Game lobby' %}

{% include card.html image='/image/tales-of-eethia-v2-2.png' description='Outside the base' %}

{% include card.html image='/image/tales-of-eethia-v2-3.png' description='Inside buildings' %}

But I didn't put efforts on communication, and very few people had played. Discouraged, I gave up.

{% include card.html content='<video src="/image/mythic-forge-v2.webm" controls></video>' description='Mythic-forge quick features tour' %}

[resthub-article]: {% post_url 2010-07-20-resthub %}
[mythic-forge-1]: {% post_url 2009-04-06-mythic-forge-v1 %}
[resthub]: http://resthub.org/
[stomp]: https://stomp.github.io/
[ace]: https://ace.c9.io/
[selenium]: http://www.seleniumhq.org/
[require]: http://requirejs.org/
[git]: https://git-scm.com/
[require-opti]: http://requirejs.org/docs/optimization.html