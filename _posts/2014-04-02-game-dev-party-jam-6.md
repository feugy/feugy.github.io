---
permalink: gdp-jam-6
title: Game Dev Party, Jam #6
description: Ghost hunter game jam
meta:
  tags:
    - { icon: message, text: "Game Jam" }
    - { icon: code-braces, text: C# }
    - { icon: cog, text: Unity }
  image: gdp-jam-6-header.png
  end: 2014-04-04
  inverted: true
  background:
    color: "#13385B"
---

# "Game Dev Party" association and its jam

This French association has the goal to promote independent game development in Lyon and its region.

If you did not read it before, you'll find more details on the [third jam description][gdp-3]{:target='\_blank'}

This was the sixth jam organized, and as before, 48 hours to make an original game with an heterogeneous team that did not knew with each other.
To comply to jam's theme, games had to be somehow related to New York city.

# The "Ghostbusters" team

The team was composed by one artist (Kevin), a sound designer (Pierre Etienne) and two developers (Alexis and I).
Alexis was also our game designer, as he was the game idea pitcher.

{% include card.html image='/image/gdp-jam-6.jpg' description='From left to right: Pierre Etienne, Damien, Kévin and Alexis. [Team\'s interview](http://gamedevparty.fr/presentation-de-soul-kings/){:target=\'_blank\'}' %}

The initial idea was to make a kind of solo Street Fighter.
Player will use a combination of three buttons to make combos against multiple opponents. They will have predictable patterns, and the player will have to identify and counter them to win the battle.

Alexis did not impose an universe, so Kevin proposed to place our game in the seventies, in New York, against ectoplasmic anomalies...
Remember Ghostbusters ?

# Soulkings, the game

In this game, you're in charge of purging the city from hostiles ghosts, until their boss hiding near Statue of Liberty.
A city map offers you to choose where your help is needed, and four different arenas are hosting furious battles.

You'll get some reward for your effort (even if you lost the battle), to offers you new equipment and special characters (they act as special attack).

{% include card.html image='/image/gdp-jam-soulkings.png' description='Soulkings\' artworks with the [game showcase](http://gamedevparty.fr/jam6-essayez-soul-kings/){:target=\'_blank\'}' %}

As he's working for [Ivory Tower][ivory]{:target='\_blank'}, Alexis has a strong knowledge of game production technics, so it was the opportunity to learn a lot.

Therefore we used [Unity3D][unity]{:target='\_blank'}, a game engine and the matching IDE.
Unity can be programmed in C#, and you used an additional plugin to wire Visual Studio for edition and debugging.
Code was versionned with [Perforce][perforce]{:target='\_blank'}.
The IDE manages every assets in the game, so we did not had to use anything else.

We managed to finished the game in time, and produced a full playable game.
A public showcase occured two weeks after the jam, and Soulkings had enthusiast comments by players !

{% include card.html image='/image/gdp-jam-soulkings.gif' description='Battle on broadway.' %}

# Source code and game

For a better ease of access, source are also available on [Github][gh]{:target='\_blank'} and executables are downloadable [here][dl]{:target='\_blank'}.

[gdp-3]: {% post_url 2012-11-24-game-dev-party-jam-3 %}
[gh]: https://github.com/feugy/soulkings
[perforce]: https://www.perforce.com/
[dl]: https://docs.google.com/file/d/0ByVTTZ_jn2IsVy1JZ1Y0d0hfY28/edit
[unity]: https://unity3d.com/
[ivory]: http://www.ivory-tower.fr/
