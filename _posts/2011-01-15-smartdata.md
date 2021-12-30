---
permalink: smartdata
title: SmartData
description: An Open, flexible, multi-format data service written in Node.js
meta:
  tags:
    - { icon: message, text: "Open Data" }
    - { icon: message, text: "SaaS" }
    - { icon: code-braces, text: JavaScript }
    - { icon: settings, text: Express }
    - { icon: settings, text: jQuery }
    - { icon: settings, text: Backbone }
    - { icon: settings, text: RequireJS }
    - { icon: database, text: MongoDB }
    - { icon: database, text: ElasticSearch }
    - { icon: format-paint, text: CSS }
  end: 2012-10-15
  image: smartdata-header.png
  background:
    color: "#B7D8D3"
---

# Open Data in Worldline

My first major job as software architect in Wordline’s R&D team was to build an asset for Open Data projects.
These days, we had numerous client projects that include an Open Data component, and this was too exotic for classical IT developers.

We choosed to build a service for collecting, processing, storing and distributing the widest range possible of data.
This service should be multi-tenant, always available, and accessible through simple Http(s) APIs. It has been named [SmartData][sd]{:target='\_blank'}

# Story of a technological pivot

Worldline teams have a strong Java experience. Therefore SmartData was first written with the state-of-the-art technologies.

- The ingestion and processing toolchain built with [Camel EIP][camel]{:target='\_blank'} and [ServiceMix OSGI][service-mix]{:target='\_blank'}, to allow data processing customization with simple configuration.
- Data were stored in a CouchDB cluster
- Stored data were accessible through a scalable layer of Jersey Web Services orchestrated with ServiceMix
- The overall system was driven and monitored by a classical [Tomcat][tomcat]{:target='\_blank'} + [Spring][spring]{:target='\_blank'} + [Hibernate][hibernate]{:target='\_blank'} + [MySQL][mysql]{:target='\_blank'} REST service
- A [JQuery][jquery]{:target='\_blank'} + [RequireJS][require]{:target='\_blank'} back-office GUI was built on top of the the REST web service.

After 6 months, SmartData was working, but was too slow, too complicated, made of too many technologies.

Development has been so hard, and the team so improductive and depressed that our leader decided to throw everything away.
One of our colleague, Florian Traverse, gave the idea of using an emerging server technology, [Node.js][node]{:target='\_blank'}.
As an R&D team, we quickly studied the tool, and decided to give a try.

{% include card.html image='/image/smartdata-1.png' description='Software architecture of Java based version' %}

# (Giant) Leap of faith

The whole project was rewritten in 4 months, by a team of 6 beginners (but half already productive in JavaScript).
We reached our goals:

- integration chain and consultation services are really scalable layers
- required performances (integration: 3000 Json documents/sec/server, consultation: 275 searches/sec/server)
- keeping the project flexible enough (functionalities have often changed)
- an automated tested and humanly understandable code base

And the team was really enjoying the work !

{% include card.html image='/image/smartdata-2.png' description='Software architecture of Node.js based version' %}

# Under the wood

Inside SmartData, API are powered by [Express stateless REST servers][express]{:target='\_blank'}, including streaming ingestion API.

The processors chain is a clusterable and configurable chain of simple data processors, ranging from format extractor to data cold/hot storage.
When possible (for JSON, CSV, XML...) data is processed as it flows with streams (XlsX impose to load file in memory).
Specific data processing can be made internally (by providing JavaScript code from the admin UI) or externally (by calling external REST web service).

Cold storage is provided by HoneyComb (now named [RedCurrent][redcurrent]{:target='\_blank'}, a grid storage like Amazon's S3) and unitary data is stored as JSON document in [ElasticSearch][elastic].

Data can be exported as bulk from HoneyComb and also through a REST API, which provides a DSL above [ElasticSearch][elastic]{:target='\_blank'} own query language.
SmartData allows to merge and mix different data sources into a "stream", term used to describe a consultable data sink.

All metadata (data source, streams, user rights, processors configurations...) are stored into [MongoDB][mongo]{:target='\_blank'}.

API are technically described with [Swagger][swagger]{:target='\_blank'} descriptor, thanks to [Swagger Jack][swagger-jack]{:target='\_blank'} express middleware.
A numerous libraries were used, but we may mention [Async][async]{:target='\_blank'}, [Node-Elastical][elastical]{:target='\_blank'}, [Mongoose][mongoose]{:target='\_blank'},
[Underscore][underscore]{:target='\_blank'}, [Request][request]{:target='\_blank'}, [Readable-Stream][readable]{:target='\_blank'}, [Mocha][mocha]{:target='\_blank'},
[Chai][chai]{:target='\_blank'} and [PEG][peg]{:target='\_blank'}.
At this early stage of Node.js (wwe started in version 0.4), we wrote our own logger, configuration manager (with hot reloading) and even an execution sandbox for processors.

Admin UI was first written with [Backbone][backbone]{:target='\_blank'} and [RequireJS][require]{:target='\_blank'}, and was rewrote in 2014 with [Angular][angular]{:target='\_blank'}.

The whole project is composed by 34 node.js packages (processors are individual packages), for a sum of 7500+ sloc.
We use [Istanbul][istanbul]{:target='\_blank'} for coverage and [Plato][plato]{:target='\_blank'} for quality analysis:

    --------------------     Gobal coverage
            74.82%  lines covered (5329)
            82.35%  functions covered (765)
            60.97%  branches covered (2770)
            74.65%  statements covered (5365)

    --------------------     Gobal quality
            101     jsHint error(s)
            7527    single lines of code
            15.34   average complexity
            66.34   average maintainability

{% include card.html description='Presentation given on June \'12 during Techforum (Worldline internal technical conference). Use arrows or space to browse.' content='<iframe src="//feugy.github.io/beyond-object-paradigm" height="400" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; max-width: 100%; width: 100%"> </iframe>' %}

The Open Data trend since have lost its glimmer, and SmartData wasn't involved as desired in client projects.
But Worldline is still using it as backend for numerous internal applications, including strategic ones.

[sd]: http://smartdata.io
[camel]: http://camel.apache.org/
[service-mix]: http://servicemix.apache.org/
[couch]: http://couchdb.apache.org/
[jersey]: https://jersey.java.net/
[spring]: https://spring.io/
[tomcat]: http://tomcat.apache.org/
[hibernate]: http://hibernate.org/orm/
[mysql]: http://dev.mysql.com/doc/refman/5.0/en/
[jquery]: http://jquery.com/
[require]: http://requirejs.org/
[node]: https://nodejs.org/en/
[mongo]: https://www.mongodb.org/
[elastic]: https://www.elastic.co/
[istanbul]: https://github.com/gotwarlost/istanbul
[plato]: https://github.com/jsoverson/plato
[express]: http://expressjs.com/
[redcurrent]: http://redcurrant.io/
[swagger]: http://swagger.io/
[swagger-jack]: https://github.com/worldline/swagger-jack
[require]: http://requirejs.org/
[backbone]: http://backbonejs.org/
[angular]: https://angularjs.org/
[request]: https://github.com/request/request
[mocha]: http://mochajs.org/
[chai]: http://chaijs.com/
[peg]: http://pegjs.org/
[readable]: https://github.com/nodejs/readable-stream
[underscore]: http://underscorejs.org/
[mongoose]: http://mongoosejs.com/
[elastical]: https://github.com/ramv/node-elastical
[async]: https://github.com/caolan/async
