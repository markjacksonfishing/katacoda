
## Types of Expressions

<div class="lecture-text-container">
<p>PromQL is <a href="https://en.wikipedia.org/wiki/Strong_and_weak_typing">strongly and statically typed</a>, meaning that each expression and subexpression has one of a number of predefined types. Passing the wrong type to a function or operator will result in an error.</p>
<p>&nbsp;</p>
<p>There are four types:</p>
<ul>
<li>Scalars: numbers such as 1, 7.6 or NaN.</li>
<li>Vectors: a set of zero or more time series, each with one sample.</li>
<li>Range vectors: a zero of one of more time series, with a series of samples over time.</li>
<li>Strings: are arguments to some functions.</li>
</ul>
</div>


## Vector vs Range Vector

<div class="lecture-text-container">
<p>A vector (or instant vector) might be:</p>
<p><span style="font-family: Arial;"><code>metric{foo="bar"} 3.0</code></span></p>
<p><span style="font-family: monospace;"><code>metric{foo="baz"} 9.7</code></span></p>
<p>&nbsp;</p>
<p>A range vector might be:</p>
<p><code>metric{foo="bar"} <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="deecf0eb9eefeae8edeeebebebecebeeeeee">[email&nbsp;protected]</a> <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="3d0e130d7d0c090b0e0d08080805080d0d0d">[email&nbsp;protected]</a></code></p>
<p><span style="font-family: monospace;"><code>metric{foo="baz"} <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="063f28334637323035363333333431363636">[email&nbsp;protected]</a> <a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="f2cbdcc5b2c3c6c4c1c2c7c7c7cac5c2c2c2">[email&nbsp;protected]</a></code></span></p>
<p><span style="font-family: monospace;">&nbsp;</span></p>
<p>Note that the timestamps (the numbers after the @) don't have to match up across a range vector.</p>
</div>


## Selectors

<div class="lecture-text-container">
<p>Selectors are how you choose which time series to return.</p>
<p><span style="font-family: monospace;"><code>metric{foo="bar"}</code></span></p>
<p>Is a simple selector, which is equivalent to:</p>
<p><span style="font-family: monospace;"><code>{__name__="metric", foo="bar"}</code> </span></p>
<p>This syntactic sugar makes things easier, as (with very few exceptions) all selectors should specify a metric name.</p>
<p>&nbsp;</p>
<p>These can be more complex, and you can have can have multiple matcher on labels:</p>
<ul>
<li><code>=</code> label must have this value</li>
<li><code>!=</code> label must not have this value</li>
<li><code>=~</code> label value must match this regex</li>
<li><code>!~</code> label value must not match this regex</li>
</ul>
<p>These can be mixed and matched:</p>
<p><span style="font-family: monospace;"><code>metric{foo="bar",baz!="meh",baz=~"a.c"}</code> </span></p>
<p>Note that <span style="font-family: monospace;"><code>baz</code></span> was mentioned twice.</p>
<p>Regexes use <a href="https://github.com/google/re2/wiki/Syntax">RE2</a>. Regexes in PromQL are are also fully anchored, meaning that there is an implicit ^ at the start and $ at the end.</p>
</div>


## Selector Safety

<div class="lecture-text-container">
<p>What should a selector like <span style="font-family: monospace;"><code>{}</code></span> or <span style="font-family: monospace;"><code>{foo!=""}</code></span> return?</p>
<p>It could be everything, which could cause performance issues.</p>
<p>Instead as a safety measure, at least one matcher must not match the empty string. This makes it difficult to select all time series by accident.</p>
<p>&nbsp;</p>
<p>It is generally best to always specify both metric name and the <code>job</code> label, so you only get exactly the time series you want.</p>
</div>


## Instant Vector Staleness

<div class="lecture-text-container">
<p>Staleness is how instant selectors choose what time series to return. This behaviour changed in Prometheus 2.0.</p>
<p>Naively you'd return all the matching time series, however you don't want to return a sample from a series that stopped getting new values days ago.</p>
<p>How this is handled is that a series is considered stale after a scrape or rule evaluation no longer returns it, or soon after the scrape target is removed.</p>
<p>An instant selector will look back up to 5 minutes to find a sample. So even if a series isn't stale, if the most recent sample was more than 5 minutes ago it won't be returned. Accordingly it is unwise to have a <code>scrape_interval</code> or <code>evaluation_interval</code> of more than 2 minutes.</p>
<p>&nbsp;</p>
<p>The 5 minutes is specified by the <code>--query.lookback-delta</code> flag. It is rarely a good idea to change it.</p>
<p>Prior to Prometheus 2.0, PromQL would simply look up to 5 minutes back to find a sample.</p>
</div>


## Range Vectors

<div class="lecture-text-container">
<p>A range vector selector is the same as a vector selector, with an added duration:</p>
<p><span style="font-family: monospace;"><code> metric{foo="bar"}[10m]</code></span></p>
<p>This is an inclusive match over time, so all samples from exactly 10 minutes ago up as far as the query evaluation time will be included.</p>
<p>Various suffixes are supported:</p>
<ul>
<li>ms: milliseconds</li>
<li>s: seconds, 1000 milliseconds</li>
<li>m: minutes, 60 seconds</li>
<li>h: hours, 60 minutes</li>
<li>d: days, 24 hours</li>
<li>w: weeks, 7 days</li>
<li>y: years, 365 days</li>
</ul>
<p>A single suffix must be provided. So <span style="background-color: initial; letter-spacing: 0.4px; font-family: monospace;"><code>90m</code></span> is valid, but <span style="background-color: initial; letter-spacing: 0.4px; font-family: monospace;"><code>1h30m</code></span> is not.</p>
<p>From the above values you can see that the possibilities of leap seconds and leap years are ignored when considering durations.</p>
</div>


## Time from when?

<div class="lecture-text-container">
<p>When a query is executed, a time is provided. This defaults to now.</p>
<p>Instant vectors return the most recent sample before this, in accordance with staleness.</p>
<p>Range vectors return everything from the query time looking back as far as the duration.</p>
<p>&nbsp;</p>
<p>You can use offset modifier to ask for older data:</p>
<p><span style="font-family: monospace;"><code>metric{foo="bar"} offset 5m</code></span></p>
<p>This uses the same duration syntax as range vectors.</p>
<p>Only positive offsets are supported, that is you can't look forward in time. You can however change the time the query is run at when using the HTTP API.</p>
</div>


## Exercise: Use Selectors

<div class="lecture-text-container">
<p>Try out some of the following expressions in the expression browser of Prometheus:</p>
<ul>
<li><code>up</code></li>
<li><code>{__name__="up"}</code></li>
<li><code>up[5m]</code></li>
<li><code>up offset 10m</code></li>
<li><code>node_cpu_seconds_total</code></li>
<li><code>node_cpu_seconds_total{mode="idle"}</code></li>
<li><code>node_cpu_seconds_total{mode!="idle"}</code></li>
<li><code>node_cpu_seconds_total{mode=~"user|system"}</code></li>
</ul>
<p>Prior to Node Exporter 0.16.0 you should use <code>node_cpu</code> instead of <code>node_cpu_seconds_total</code>.</p>
<p>The 1st and 3rd query should look similar to:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/QpJ6A8YxQiOUA9z4XPPS" /></p>
</div>
