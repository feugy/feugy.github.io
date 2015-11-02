---
permalink: smartdata
title: SmartData
description: An Open, flexible, multi-format data service written in Node.js (in progress)
meta:
  tags:
    - {icon: message, text: 'Open Data'}
    - {icon: message, text: 'SaaS'}
    - {icon: code-braces, text: JavaScript}
    - {icon: settings, text: Express}
    - {icon: settings, text: jQuery}
    - {icon: settings, text: Backbone}
    - {icon: settings, text: RequireJS}
    - {icon: database, text: MongoDB}
    - {icon: database, text: ElasticSearch}
    - {icon: format-paint, text: CSS}
  end: 2012-10-15
  image: smartdata-header.png
---

# Open Data in Worldline

My first major job as software architect in Wordline’s R&D team was to build an asset for Open Data projects.
These days, we had numerous client projects that include an Open Data component, and this was too exotic for classical IT developers.

We choosed to build a service for collecting, processing, storing and distributing the widest range possible of data.
This service should be multi-tenant, always available, and accessible through simple Http(s) APIs. It has been named [SmartData][sd]{:target='_blank'}

# Story of a technological pivot

Worldline teams have a strong Java experience. Therefore SmartData was first written with the state-of-the-art technologies.

- The ingestion and processing toolchain built with [Camel EIP][camel]{:target='_blank'} and [ServiceMix OSGI][service-mix]{:target='_blank'}, to allow data processing customization with simple configuration.
- Data were stored in a CouchDB cluster
- Stored data were accessible through a scalable layer of Jersey Web Services orchestrated with ServiceMix
- The overall system was driven and monitored by a classical [Tomcat][tomcat]{:target='_blank'} + [Spring][spring]{:target='_blank'} + [Hibernate][hibernate]{:target='_blank'} + [MySQL][mysql]{:target='_blank'} REST service
- A [JQuery][jquery]{:target='_blank'} + [RequireJS][require]{:target='_blank'} back-office GUI was built on top of the the REST web service.

After 6 months, SmartData was working, but was too slow, too complicated, made of too many technologies.

Development has been so hard, and the team so improductive and depressed that our leader decided to throw everything away.
One of our colleague, Florian Traverse, gave the idea of using an emerging server technology, [Node.js][node]{:target='_blank'}.
As an R&D team, we quickly studied the tool, and decided to give a try.

TODO First software architecture with Java technologies

# (Giant) Leap of faith

The whole project was rewritten in 4 months, by a team of 6 beginners (but half already productive in JavaScript).
We reached our goals:

- integration chain and consultation services are really scalable layers
- required performances (integration: 3000 Json documents/sec/server, consultation: 275 searches/sec/server)
- keeping the project flexible enough (functionalities have often changed)
- an automated tested (XXX coverage) and humanly understandable code base

TODO Second software architecture with JavaScript technologies

And the team was really enjoying the work !

TODO technologies used

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