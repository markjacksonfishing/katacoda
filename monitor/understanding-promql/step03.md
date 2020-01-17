## Functions


<div class="lecture-text-container">
<p>Prometheus has 46 functions as of 2.0.</p>
<p>&nbsp;</p>
<p>These functions over a variety of functionality, from math, to counters and include various Prometheus-specific requirements.</p>
<p>All functions return either an instant vector or a scalar.</p>
</div>

## Math Functions

<div class="attachment-data">&nbsp;</div>
<div class="lecture-text-container">
<p>The simplest functions are the math functions. They all take in a vector and return a vector, and generally do what you'd expect.</p>
<ul>
<li><code>abs</code>: Absolute value</li>
<li><code>ceil</code>: Ceiling, round up to next biggest integer</li>
<li><code>exp</code>: Natural exponent</li>
<li><code>floor</code>: Floor, round down to next smallest integer</li>
<li><code>ln</code>: Natural logarithm</li>
<li><code>log2</code>: Logarithm base 2</li>
<li><code>log10</code>: Logarithm base 10</li>
<li><code>round</code>: Round to nearest integer</li>
<li><code>sqrt</code>: Square root</li>
</ul>
<p>In addition <code>round</code> takes a 2nd optional scalar argument to change what you're rounding to. For example <code>round(some_vector, 10)</code> would round to the nearest 10.</p>
<p>For example if you wanted to know how many orders of magnitude your Prometheus's memory usage was (roughly how many digits are in the number) you could use:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/YqEP6OsTZOtiVvU8G3dA" /></p>
<p>&nbsp;</p>
</div>

## Clamping

<div class="attachment-data">&nbsp;</div>
<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>clamp_min</code></span> and <span style="font-family: monospace;"><code>clamp_max</code></span> put lower and upper bound on values respectively.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>clamp_min(vector, 0)</code></span> will put a lower bound of 0 on vector. This can be useful if you sometimes get spurious values, or incorrectly implemented counters.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>As an example if you considered any time that Prometheus's goroutine count was under 600 to be the same as it being 600, you might do:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/hgvenKccQrutcnluOZod" /></p>
</div>


## Timestamps

<div class="lecture-text-container">
<p>&nbsp;</p>
<p>As mentioned already, each query has a time it's executed at.</p>
<p>This is not the current time.</p>
<p><span style="font-family: monospace;"><code>time()</code></span> takes no arguments, and returns this as a scalar in seconds. This is measured in Unix time.</p>
<p>This is usually used to subtract times in gauges from. For example <span style="font-family: monospace;"><code>time() - process_start_time_seconds</code></span> is the number of seconds since a process started:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/kkG5aA2Qnu6C1vRo7f1A" /></p>
<p>&nbsp;</p>
<p>Prometheus 2.0 also added a <span style="font-family: monospace;"><code>timestamp()</code></span> function.</p>
<p>This takes in an instant vector and returns a vector with the timestamp of the each of the samples. This should usually be used directly on a selector, as functions and operators usually change the timestamp to the query execution time.</p>
<p>&nbsp;</p>
</div>


## Time and Dates


<div class="lecture-text-container">
<p>There are a number of functions that deal with times and dates.</p>
<ul>
<li><code>day_of_month</code>: The day of the month, 1-31.</li>
<li><code>day_of_week</code>: The day of the week, 0-6. 0 is Sunday.</li>
<li><code>days_in_month</code>: The number of days in the month, 28-31.</li>
<li><code>hour</code>: The hour of the day, 0-23.</li>
<li><code>minute</code>: The minute of the hour, 0-59.</li>
<li><code>month</code>: The month of the year, 1-12.</li>
<li><code>year</code>: The year.</li>
</ul>
<div>&nbsp;</div>
<p>These all take an instant vector and return an instant vector. However it defaults to <span style="font-family: monospace;"><code>vector(time())</code></span> so will return a single valued instant vector. For example <span style="font-family: monospace;"><code>year()</code></span> might return <span style="font-family: monospace;"><code>{}:2017</code></span>.</p>
<p>All times in Prometheus are UTC.</p>
<p>&nbsp;</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/AaiJ4HsISH2JaYcTKU4o" /></p>
</div>


## Gauge Range Vectors

<div class="lecture-text-container">
<p>There are a number of functions that take in range vectors of gauges. They all return instant vectors.</p>
<p><span style="font-family: monospace;"><code>changes()</code></span> is the number of times each time series changed value. Useful for <span style="font-family: monospace;"><code>changes(process_start_time_seconds[1h])</code></span> to spot crash looping services:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/r3tpAY1WSEaKFpf2lUee" /></p>
<p>&nbsp;</p>
<p><span style="font-family: monospace; background-color: initial; letter-spacing: 0.4px;"><code>deriv()</code></span> uses a least-squares regression to estimate per-second change in a time series. Handy for telling if a gauge is not only too high, but getting worse. For example to see the direction memory usage is change over time you might do:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/78CRKSExTexjux2bL58T" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>predict_linear(range vector, scalar)</code> </span>also uses a least-squares regression, and uses it to predict where the time series will be in the given amount of seconds.</p>
<p>For example <span style="font-family: monospace;"><code>predict_linear(node_filesystem_free{job="node"}[4h], 3600)</code></span> uses the last 4 hours of data to predict how much free disk space you'll have in an hour:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/N0JGMNYeSzKqSHOTC3L0" /></p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>holt_winters(range vector, sf scalar, tf scalar)</code></span> smooths a time series based on past data.</p>
<p>Sf is the Smoothing Factor, the lower it is the more old data matters. Tf is the Trend factor, the higher it is the more trends in data are considered. Both should be between 0 and 1.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>idelta()</code></span> returns the difference between the last two samples. This is useful for very advanced uses cases.</p>
</div>


## Counter Range Vectors

<div class="lecture-text-container">
<p>Just as there are functions for ranges of gauges, there are functions for ranges of counters. These all return instant vectors.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>rate()</code></span> calculates per-second increase of a counter, allowing for resets and extrapolating at edges to provide better results.</p>
<p>This is the most common function you will use in PromQL.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>increase()</code></span> is syntactic sugar around <span style="font-family: monospace;">rate()</span>, it returns the increase across the period. So <span style="font-family: monospace;"><code>increase(metric[1h])</code></span> is the per-hour increase. Only use <span style="font-family: monospace;"><code>increase()</code></span> for display, use <span style="font-family: monospace;"><code>rate()</code></span> in rules and alerts.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>irate()</code></span> only looks at the last two data points and returns the per-second rate. It produces very responsive graphs, but doesn't do well for alerting or longer time frames.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>resets()</code></span> counts the number of counter resets. Useful mostly for debugging. If you want to track how often a process restarts, a timestamp gauge and <span style="font-family: monospace;"><code>changes()</code></span> is better.</p>
<p>&nbsp;</p>
<p>It is recommended to use a range of at least 2.5x the <code><span style="font-family: monospace;">scrape_interva</span>l</code> with range vector functions, so as to be resilient to failed scrapes. For example for a 10s <span style="font-family: monospace;">scrape_interval</span> you would usually use at least a 30s range, such as <span style="font-family: monospace;"><code>rate(my_counter_total[30s])</code></span>.</p>
<p>&nbsp;</p>
<p>A counter before applying <span style="font-family: monospace;">rate()</span>:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/0iK4Xi3HRzeUwVWCIIl3" /></p>
<p>The same counter after applying rate():</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/ig848WY8Tma9loJZkSXK" /><span class="redactor-invisible-space"><br /></span></p>
</div>


## Aggregating Across Time


<div class="lecture-text-container">
<p>There are range vector functions that work across time to aggregate each time series, and returns an instant vector.</p>
<ul>
<li><code>avg_over_time</code>: The average of the values</li>
<li><code>sum_over_time</code>: The sum of the values</li>
<li><code>count_over_time</code>: The number of values</li>
<li><code>min_over_time</code>: The minimum value</li>
<li><code>max_over_time</code>: The maximum value</li>
<li><code>stddev_over_time</code>: Standard deviation of the values</li>
<li><code>stdvar_over_time</code>: Standard variance of the values</li>
<li><code>quantile_over_time</code>: The given quantile of the values.</li>
</ul>
<p>So for example <code>avg_over_time</code> can be used to smooth graphs:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/j1AeMUBiRwuItjUdkXRS" /></p>
<p><code>quantile_over_time</code> takes an additional parameter to indicate the quantile. For example <code>quantile_over_time(.95, process_resident_memory_bytes)</code> would give the 95th percentile memory usage. All values are given equal weight.</p>
<p>These functions should only be used with gauges.</p>
</div>


## Subqueries

<div class="lecture-text-container">
<p>What if you wanted to use <code>max_over_time</code> on the result of a <code>rate</code>?</p>
<p>There's no function that takes in an instant vector expression and returns a range vector, however there is a feature called subqueries.</p>
<p>A subquery takes an instant vector expression and evaluates it at various points in a time range, producing a range vector.</p>
<p>For example:</p>
<pre>max_over_time(rate(process_cpu_seconds_total[5m])[1h:])</pre>
<p>would calculate the average CPU usage over a 5 minute period, and then find the highest value that'd have over the past hour. This is like a range vector selector, however it's applied to an expression and has a colon.</p>
<p>&nbsp;</p>
<p>By default subqueries use the default evaluation interval as defined in the <code>global</code> section of your configuration file, however you can override this by specifying an interval after the colon:</p>
<pre>max_over_time(rate(process_cpu_seconds_total[5m])[1h:2m])</pre>
<p>This can be useful when you don't need as much resolution, and so you can reduce the number of evaluation steps.</p>
<p>While you can control the interval of the subquery evaluations, as with elsewhere in Prometheus the alignment is undefined.</p>
<p>One thing to be wary of with subqueries is that while they're useful for ad-hoc exploration, they relatively expensive to evaluate due to all the sub-evaluations. Thus if a subquery is being used in a rule or dashboard, it would be wise to use a recording rule instead so each step only has to be calculated once.</p>
</div>


## Histograms

<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>histogram_quantile(scalar, vector)</code></span> calculates the given quantile. It should be passed a gauge instant vector, which means applying <span style="font-family: monospace;"><code>rate()</code></span> or <span style="font-family: monospace;"><code>irate()</code></span> first.</p>
<p>This is the first function that we have come across will return fewer time series than are passed into it in normal circumstances.</p>
<p>&nbsp;</p>
<p>To get the 95th percentile of a histogram called <code>hh</code> you'd do <code>histogram_quantile(0.95, rate(hh_bucket[5m]))</code></p>
<p>&nbsp;</p>
<p>For example the 95th percentile latency of Prometheus compactions might look like:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/E0m7rjHdT8aoTL0AtvR2" /></p>
</div>


## Switching Types


<div class="lecture-text-container">
<p>Sometimes you need to switch between scalars and vectors.</p>
<p><span style="font-family: monospace;"><code>vector(scalar)</code></span> returns a vector with a single time series with the given value and no labels. <code>vector(1)</code> for example.</p>
<p><span style="font-family: monospace;"><code>scalar(vector)</code></span> returns a scalar with the value of the time series in the vector passed in. If there's not exactly one time series in the vector, NaN is returned.</p>
<p>&nbsp;</p>
<p>For example to round to time to the nearest hour you could do <span style="font-family: monospace;"><code>scalar(round(vector(time()), 3600))</code></span><span style="background-color: initial; letter-spacing: 0.4px;">:</span></p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/e0CJfqFERDyX6qYPajVn" /></p>
<p>Use <span style="font-family: monospace;"><code>scalar</code></span> sparingly, most of the time you actually need label matching which is discussed in the section on operators.</p>
</div>


## Altering Labels

<div class="lecture-text-container">
<p>There are two functions to manipulate labels. These should be used sparingly, it is best to fix the source of the labels so they're right in the first place.</p>
<p><code>label_replace(vector, dst_label string,  replacement string, src_label string, regex string)</code> is the most complicated function in PromQL. It allows you to set a label based on a regex applied to a label. If the regex doesn't match, the original time series is returned.</p>
<p><code>label_join(vector, dst_label string, separator string, src_label string...)</code> joins the values of multiple labels with the given separator.</p>
<p>&nbsp;</p>
<p>As an example you could remove the /dev/ prefix from the <code>device</code> label and put output it the <code>example</code> label with:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/oqJw01zuRqSpYyPskmiQ" /></p>
</div>


## Sorting


<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>sort(vector)</code></span> and <span style="font-family: monospace;"><code>sort_desc(vector)</code></span> returned a sorted vector. NaNs always sort to the end, so these functions aren't simple reverses of each other.</p>
<p>&nbsp;</p>
<p>These are only useful for display purposes.</p>
<p>&nbsp;</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/7vF4q6kASK6r4UESlxg7" /></p>
</div>


## Missing values


<div class="lecture-text-container">
<p>How do you deal with a time series that's not there? You could write a non-trivial expression to synthesise one if it's missing.</p>
<p>&nbsp;</p>
<p>Or use <span style="font-family: monospace;"><code>absent(vector)</code></span>. This returns nothing if there are any time series in the vector. If there are no time series, it returns 1 with labels taken from the selector - so use this directly on selectors.</p>
<p><span style="font-family: monospace;"><code>absent(up{job="node"})</code></span> would return <span style="font-family: monospace;"><code>{job="node"}:1</code></span> if you had no node exporters.</p>
<p>&nbsp;</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/FPfBPQMTOGmPDpKRX8C2" /></p>
</div>


## Other Functions


<div class="lecture-text-container">
<p><code><span style="font-family: monospace;">delta(</span>)</code> calculates difference in time series over a duration, with some extrapolation. Not really useful. Any time you think you want <span style="font-family: monospace;"><code>delta()</code></span>, you actually want <span style="font-family: monospace;"><code>deriv()</code></span> if it's a gauge or <span style="font-family: monospace;"><code>increase()</code></span> if it's a counter.</p>
<p>Prior to 2.0, there were also the <span style="font-family: monospace;"><code>drop_common_labels(vector)</code></span> and <span style="font-family: monospace;"><code>count_scalar(vector)</code></span> functions.</p>
<p>&nbsp;</p>
<p>Do not use any of these functions.</p>
</div>
