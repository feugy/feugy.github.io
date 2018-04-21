---
permalink: mini-service
title: mini-service
description: µServices done simply
meta:
  tags:
    - {icon: message, text: µServices}
    - {icon: code-braces, text: JS}
    - {icon: settings, text: Nodejs}
  image: constellation.jpg
  start: 2016-07-21
  end: 2018-05-01
  inverted: true
  background:
    color: '#4965AA'
---

# Start simple and scale big

Over the past couple of years, I've started three projects as MVP (Minimum Viable Products).
In this situation, the team has a short timeframe (around 3 mounths) to build a system used to test both market et the company readiness for a given business case.

Team focuses on building something simple, that could easily evolve.

But if the MVP is successful, then it will be the first iteration of something bigger.
So it also needs the bare minimum robustness and a design who will not prevent it to scale.

Beside the buzz around the word, this is my understanding of µService architecture: start simple and scale big.

# It's about being pragmatic, but not simplistic

While building those projects, we faced more or less the same pattern:

- on the first sprint, team builds a single service (usually a REST API backend)
- soon after it has to interact with some [backing services][backing-services]{:target='_blank'} such as DB/3rd party system/SaaS application...: team adds some abstraction layers through facade objects
- later on those layer/objects get bigger, more complex or more greedy. Team turns them to [standalone services][concurrency]{:target='_blank'}

This pragmatic path is a very reasonable strategy in this context. 
Building facade objects helps reuse, testing (and mocking), and pave the way for further evolution (making the service standalone).
And maybe this will never happen: team has saved setting up complex system (bus event, discovery services...).

But it overlooks some practical concerns:

- how developers could easily run and develop these services locally?
- how operations could deploy services without restarting the full chain, or following a given order?
- how both could leverage from [explicit dependencies][dependencies]{:target='_blank'} without introducing tight coupling?

# Providing seamless developer and operation experience

I built the [mini-service][mini-service]{:target='_blank'} and [mini-client][mini-client]{:target='_blank'} libraries to address the above.

Is imposes very few constraints on services:
{% highlight js %}
// file calc-service.js
module.exports = {
  name: 'calc-service',
  version: '1.0.0',
  init: () => {
    add: (a, b) => a + b,
    subtract: (a, b) => a - b
  }
}
{% endhighlight %}

A service has an `init()` function (could be `asynch`) which exposes a set of functions (APIs).
Those functions could also be `async`, and must take and return string, number, booleans, arrays and plain objects.
(Stream and Buffers are also supported, as single parameter/return).

Using this service as part of the main monolith is easy:

{% highlight js %}
// caller code
const getClient = require('mini-client')

const calc = getClient(require('./calc-service'))
await calc.init()
const sum = await calc.add(10, 5)
console.log(`Result is: ${sum}`)
{% endhighlight %}

Once initialized, the `calc` object will have a method for each API exposed by `./calc-service.js` with the same signature (except they _are_  `async`)


Making `./calc-service.js` a standalone Http server is straightfoward:
{% highlight js %}
// file server.js
const {startServer} = require('mini-service')
startServer(require('./calc-service.js'))
{% endhighlight %}

Then turning the monolith into a µService system is as equally simple:
{% highlight js %}
// caller code
const getClient = require('mini-client')

const calc = getClient({
  remote: 'http://localhost:3000'
}) // was getClient(require('./calc-service'))
await calc.init()
const sum = await calc.add(10, 5)
console.log(`Result is: ${sum}`)
{% endhighlight %}

# The benefits

We've been sucessfully using mini-service and mini-client on a production system for almost two years.
Thanks to it:

- developers can run _locally_ all services as part of a monolith, easier to debug
- there's a tight coupling locally: developers never get an outdated version of a service...
- ...and loose coupling in production: ops could deploy a single service without restarting the whole chain
- the system is resilient: when service B is redeployed in production, service A will adapts as long as there's no signature change
- incompatible services are detected and reported: in production, if service B doesn't provides the API service A expects, comprehensible error will be reported.

And all this is toggled through the `remote` option of mini-client.

Of course there's are more in it: input and output validation, [Open-API][open-api]{:target='_blank'} descriptor, splitting exposed API into groups, and a tons of parameters.
Please checkoug the [documentation!][mini-service]{:target='_blank'}.

[mini-service]: https://feugy.github.io/mini-service
[mini-client]: https://feugy.github.io/mini-client
[backing-services]: https://12factor.net/backing-services
[concurrency]: https://12factor.net/concurrency
[dependencies]: https://12factor.net/dependencies
[open-api]: https://www.openapis.org

