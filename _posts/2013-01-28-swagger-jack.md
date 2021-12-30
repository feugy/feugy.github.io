---
permalink: swagger-jack
title: Swagger-Jack
description: Express middleware for swagger-described API
meta:
  tags:
    - { icon: message, text: Swagger }
    - { icon: code-braces, text: CoffeeScript }
    - { icon: settings, text: express }
    - { icon: settings, text: json-gate }
    - { icon: settings, text: chai }
    - { icon: settings, text: mocha }
  end: 2013-06-20
  image: swagger-jack-header.png
  background:
    color: "#B3E00F"
---

# Auto-descriptive REST API

SOAP has many drawbacks, but powerful strengths also. One of them is WDSL, this specification that allows to describe what’s inside a Web Service: API endpoints, expected parameters, response body, error cases…

When building large systems containing dozens of different Web Services, the need of those kind of API descriptions is crucial, either for people and machines.

But in 2012, we had barely no mean to programmatically describe REST APIs.
As REST is just a collection of principles and good practices and not a specification, the need of description was even greater:
some web services took parameter in URI, some in HTTP headers, query parameter or a combination of all three, some used POST verb for creation and other used PUT...

That's excatly the purpose of [Swagger][swagger]{:target='\_blank'}, a format to describe endpoints of an HTTP WebService.

Swagger uses JSON and [JSON Schema][schema]{:target='\_blank'} to describe various endpoints, their parameters, result and errors.
It does not impose API to follow any rules (it does provide some hints regarding errors or security tokens representation), unlike [JSON-api][api]{:target='\_blank'}.
The JSON descriptor can be hard-coded or dynamically generated, and is published side by side with the HTTP endpoints.

A collection of tools use this descriptor:

- A visualization UI, that provides human-friendly information on APIs, and even allows to forge HTTP requests
- A descriptor editor, to allow non-technical people editing (and describing) the descriptor itself, without writing JSON
- SDKs, to generate an API-specific consumers (like we used to do with WSDL generators) in various languages (JavaScript, Java, .Net, Php, Ruby, Go...)

{% include card.html image='/image/swagger-jack-1.png' description='Official Look & Feel of Swagger UI, on a demo API'%}

# Reconcile code and descriptor

We choose to use Swagger at Worldline, notably for [SmartData][smartdata]{:target='\_blank'} project APIs.

At this time, a small number of Node.js libraries allows to handle the Swagger descriptor, but they all had a huge drawback:

> Code and descriptor was unrelated

Therefore, when a developer changes something in the code, if he forget to update the descriptor, you got the exact opposite of what you expected from Swagger.

> Lack of documentation is better than a bad documentation

Some libraries already had this idea, but from a code point of view, that is generating the descriptor from code.

Our idea was the opposite: _generate_ the code from the descriptor, to benefit from the power of Swagger editors.
As we were using [Express framework][express]{:target='\_blank'} for our Node.js Web Services, we create a middleware able to read a valid swagger descriptor and to generate Express routes.

{% highlight js %}
var express = require('express');
var swagger = require('swagger-jack');

var app = express();

app.use(express.bodyParser())
.use(express.methodOverride())
.use(swagger.generator(app,
require('/api/general.json'), // General API description (types, errors...)
[{
api: require('/api/pets.json'), // Pet API description
controller: require('/controller/pets') // User API code
},{
api: require('/api/shops.json'), // Shop API description
controller: require('/controller/shops') // Shop API code
}])
.use(swagger.validator(app))
.use(swagger.errorHandler())

app.listen(8080);
{% endhighlight %}

The Swagger descriptor can be split into parts, reflecting code organization and responsabilities.
And the actual functions invoked when an Http call is received are still traditionnal Express middlewares.

The only "particular" adaptation we made to Swagger descriptor was the `nickname` attribute to specify the
invoked function name that must be exported by controllers:

{% highlight js %}
// in /api/pets.json
"resourcePath": "/pets",
"apis": [{
"operations": [{
"httpMethod": "POST",
"nickname": "create"
}]
}]
{% endhighlight %}
{% highlight js %}
// in /controller/pets.js
exports.create: function(req, res, next) {
// create a new pet...
}
{% endhighlight %}

`swagger.generator()` will attach the exposed function to an Express route, declaring path, Http method, headers...
to match was is specified in Swagger descriptor

# Extra features

In addition to the route declaration, another middleware (`swagger.validator()`) is provided to validate incoming data against Swagger descriptor.

Headers, path parameters, query parameters and incoming bodies are analyze with [json-gate][gate]{:target='\_blank'}, a JSON-schema library,
and a casted version of parameters is attached to requesst (`req.input`), to decouple controller's code from the actual parameter location (header/query/path/body) that may change with API version.

At last, a generic error middleware can be used to format reported error in a Swagger-compliant Json response.

# Code repository

Swagger-jack is listed in the [Swagger modules list][list]{:target='\_blank'}, but as we did not put effort on it since 2013, it's stuck on the specification previous version.

It has been overcome by the excellent Paypal's [swaggerize-express][swaggerize]{:target='\_blank'}, which also promotes the idea of _"Design driven"_.

Code can be found on [github][gh]{:target='\_blank'}.

[swagger]: https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md
[schema]: http://json-schema.org/
[api]: http://jsonapi.org/

[smartdata]: {% post_url 2011-01-15-smartdata %}
[express]: http://expressjs.com/
[list]: http://swagger.io/open-source-integrations/
[swaggerize]: https://github.com/krakenjs/swaggerize-express
[gh]: https://github.com/worldline/swagger-jack
[gate]: https://github.com/oferei/json-gate
