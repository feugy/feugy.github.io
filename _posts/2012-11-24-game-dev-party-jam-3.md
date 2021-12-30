---
permalink: gdp-jam-3
title: Game Dev Party, Jam #3
description: First Jam experience
meta:
  tags:
    - { icon: message, text: "Game Jam" }
    - { icon: code-braces, text: JavaScript }
    - { icon: repeat, text: Socket.io }
    - { icon: settings, text: Node.js }
    - { icon: settings, text: Express }
    - { icon: settings, text: Backbone }
    - { icon: settings, text: jQuery }
    - { icon: format-paint, text: CSS3 }
  image: gdp-jam-3-header.png
  end: 2012-11-26
  background:
    color: "#D0AD8A"
---

# The "Game Dev Party" association

This French association has the goal to promote independent game development in Lyon and its region.

Historically, Lyon hosts several game studio, more or less known ([Infogrames][7]{:target='\_blank'}, [Electronics Arts][3]{:target='\_blank'}, [Namco Bandai][5]{:target='\_blank'}, [Ivory Tower][2]{:target='\_blank'}, [Arkane][4]{:target='\_blank'}, [Artefacts Studio][6]{:target='\_blank'}...)
and a multitude of tiny structures and individuals working in this field.

Game Dev Party organize information conferences, workshops, picnic and two game jame per year.

A game jam is a specific kind of hackathon, open to everyone: it starts on friday evening with pitch selections, where teams are created, and ends on sunday evening, when created games are presented to public.
Teams are between 3 and 8 persons, gathering every needed specialities: game designer, artists, sound designers and, of course, programmers.
They are free to reuse any software needed ([Unity 3D][8]{:target='\_blank'} is widely used) and ship on any platform, but the game has to be original and development bounded to the 48 hours.

# The writers and Tabulas

We founded a 5 people team named _"the writers"_, including (from left to right) an artist (Gwen), a sound & game designer (Max), another artist (Charles) and two programmers (me and Julien).
Except from Charles and Max who are brothers, we didn't knew each other before the weekend.

{% include card.html image='/image/gdp-jam-3.jpg' description='The team and its [interview](http://gamedevparty.fr/gdpjam3-the-writers/){:target=\'_blank\'}' %}

The pitch proposed by Max was the following: "you're a writter that has hacked God's computer. He's writing the apocalypse, planned on December 21, 2012: you have to be faster than him."

It ends at a race writing-game, including bonuses and maluses if you mistype words. We made a single and a multi player mode.
We called it _"Tabulas"_, because the game's background changed a bit and mention an ancient Mayan stone table, on which the player is writing history's end.

As the principles was really simple, we did not rushed a lot, giving enought time to artists and sound designer to produce polished graphic, sound and music.

{% include card.html image='/image/gdp-jam-tabulas.png' description='Tabulas artworks and the [showcase](http://gamedevparty.fr/showcase-tabulas/){:target=\'_blank\'}' %}

# Technologies inside

Neither Julien and I have done game programming seriously before: we were both regular web developers (Julien masters Php).
As I didn't want to impose anything, I did not even mention [Mythic-forge][10]{:target='\_blank'}, so we started from scratch, and decided to make a web application in JavaScript.

Being productive in a 48 hours challenge is really important, and we used a classical JavaScript stack: [jQuery][11]{:target='\_blank'}, [Backbone][12]{:target='\_blank'}, [Hogan][13]{:target='\_blank'} (mustache templating), [RequireJS][14]{:target='\_blank'}.
Git saved use a couple of time also. [Buzz][15]{:target='\_blank'}, a JavaScript sound library, was a nice discovery.

And at last, because it does not cost too much and because he had enought time, we added a Node.js [Express][9]{:target='\_blank'} server with [Socket.io][sio]{:target='\_blank'} to include a dual-mode against other player.

# The produced game

On sunday evening, the game was ready enought to make a bug-free live demonstration, which is pretty rare in this kind of situation.
Audience really loved graphics and music, and game's atmosphere in general. They were also impressed because we did not reuse any game-related assets during the jam.

{% include card.html image='/image/gdp-jam-tabulas.gif' description='Single player demonstration' %}

The code source is available on [Github][17]{:target='\_blank'}, and the game is hosted by Julien.

_Edit - Julien's server is now down, I will deploy Tabulas on public hosting in near future_

Since the jam's end, we gave a little time fixing some glitches, adding [Vagrant][18]{:target='\_blank'} deployment support and some unit tests.

[1]: http://gamedevparty.fr
[2]: http://www.ivory-tower.fr/
[3]: http://www.ea.com/fr/lyon
[4]: http://www.arkane-studios.com/uk/index.php
[5]: https://www.bandainamcoent.fr/
[6]: http://www.artefacts-studio.fr/
[7]: https://en.wikipedia.org/wiki/Infogrames_Entertainment,_SA
[8]: https://unity3d.com/
[9]: http://expressjs.com/
[10]: http://mythic-forge.com/
[11]: http://jquery.com/
[13]: http://backbonejs.org/
[12]: http://twitter.github.io/hogan.js/
[14]: http://requirejs.org/
[15]: http://buzz.jaysalvat.com/
[sio]: http://socket.io/
[17]: https://github.com/jubianchi/gdpjam3
[18]: https://www.vagrantup.com/
