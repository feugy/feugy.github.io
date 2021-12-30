---
permalink: contributing-to-node
title: Contributing to Nodejs
description: A real open-source experience
meta:
  tags:
    - { icon: message, text: Open Source }
    - { icon: code-braces, text: JavaScript }
    - { icon: cog, text: Nodejs }
  image: nodejs.png
  start: 2017-12-23
  end: 2018-03-11
  background:
    color: "#A6E064"
---

# Fixing recurrent need

The project I was working on was entierly promised-based (and later on, using `async`/`await`).

We also use [power-assser][power-assert]{:target='\_blank'}, a great assertion library which provides very detailed error report and sticks to nodejs's [assert module API][assert]{:target='\_blank'}.

We wrote plenty of tests checking that tested code was rejecting promises:
{% highlight js %}
it('should handle error while getting config from db', async () => {
try {
await config.get()
throw new Error('should have failed')
} catch (err) {
assert(err instanceof Error)
assert(err.message.includes('db failure'))
}
})
{% endhighlight %}

If you forget to check the actual message, then you're not sure that tested code failed for the expected reason.

And here it comes:
{% highlight js %}
it('should handle error while getting config from db', async () => {
try {
await config.get()
} catch (err) {
assert(err instanceof Error)
assert(err.message.includes('db failure'))
return
}
throw new Error('should have failed')
})
{% endhighlight %}

The logic in `catch` clause is pretty verbose:

- it checks that an `Error` is thrown
- it checks an expected pattern in the actual error message
- it stops the test.

The final `throw` ensure the code _has failed for the good reason_.

We wrote the above dozens and dozens of time...
With synchronous code, we could have wrote:
{% highlight js %}
it('should handle error while getting config from db', async () => {
assert.throws(config.get(), err =>
err instanceof Error && err.message.includes('db failure')
)
})
{% endhighlight %}

This is when I decided to propose a change in nodejs' API.

# One does not simply propose a Pull Request

It was Christmas time, I was full of energy and motivation.
I downloaded Node's code on my Windows machine, read how to [build][build-guide]{:target='\_blank'}, [contribute][contribute-guide]{:target='\_blank'}, [write code][style-guide]{:target='\_blank'}, [write tests][test-guide]{:target='\_blank'} and [issue a PR][pr-guide]{:target='\_blank'}.

It took me 2 days (mostly because building and running tests on Windows is crzay long).

Then I made a first [pull request][pr-1]{:target='\_blank'}... ...and retrospectively I'm really ashamed of the naiveness of my contribution:
I turned the existing `assert.throws()` and `assert.doesNotThrow()` to async to they could support my usecase.

I clearly overlooked the impacts of my change, on some functions intensively used in a lot of NPM modules, and in the core itself.
Even the few tests I wrote prouved I was wrong :'(

But thanks the great kidness and patience of the all my reviewers, I didn't lost faith and retried few days later.

The second [pull request][pr-2]{:target='\_blank'} (7th of January) was more acceptable: the idea was to add `assert.rejects()` and `assert.doesNotReject()` to be the promise-based equivalent of the existing functions.

It took me few iterations (11th, 18th of January and 3rd of February) to fully understand my reviewer's directives, and provides something truely aligned with the existing code base and documentation.

Then the PR was suspended for a month, because of side discussions about removing `assert.doesNotThrow()`. Then it would have been a non-sense to add `assert.doesNotReject()`.

But finally, on the 11th of March, the PR was landedon the main branch, and will be part of Node 10!

# Takeways

This was a extremelly long, insightful and educating experience.

Until know, I always shared my side projects as OSS, but actually never worked with an OSS community (except on [OptiKey][optikey]).
I worked with a lot of different people and teams at work (sometime up to 30 devlopers), but always _on site_.

I really learnt:

- _the benefits of mentoring_
  Nodejs codebase is completly different from modern project (React/Angular/Mongo...) codebases.
  The core contributors truely taught me how it worked and what to do to perform consistent changes and additions.

- _it takes patience..._
  OSS is often made by volonteers working during their free time, which necessary makes iteration longer.
  I was working mostly during weekends myself, hence why this simple feature took almost 3 months.
- _...and questioning_
  Having _used_ and _taught_ JavaScript for years doesn't prevented me for doing newcomer mistakes.
  I was tempted to push back on the numerous comments, but after reading them twice or three times, I actually understoog my errors.

That was really a great experience, which I hope I could reiterate in the future!

[power-assert]: https://github.com/power-assert-js/power-assert
[assert]: https://nodejs.org/api/all.html#assert_assert
[pr-1]: https://github.com/nodejs/node/pull/17843
[pr-2]: https://github.com/nodejs/node/pull/18023
[build-guide]: https://github.com/nodejs/node/blob/master/BUILDING.md
[contribute-guide]: https://github.com/nodejs/node/blob/master/CONTRIBUTING.md
[style-guide]: https://github.com/nodejs/node/blob/master/doc/STYLE_GUIDE.md
[test-guide]: https://github.com/nodejs/node/blob/master/doc/guides/writing-tests.md
[pr-guide]: https://github.com/nodejs/node/blob/master/doc/guides/contributing/pull-requests.md

[optikey]: {% post_url 2015-09-18-optikey %}
