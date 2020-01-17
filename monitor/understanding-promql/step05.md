## From Theory to Practice


<div class="lecture-text-container">
<p>The previous sections were were focused on the theoretical.</p>
<p>In this section we'll look at real world examples of PromQL, both the common and the more advanced.</p>
<p>You can take these examples and adapt and apply them to your own use cases.</p>
</div>


## Common Query Patterns in PromQL


<div class="lecture-text-container">
<p>For day to day use, there&rsquo;s only a handful of PromQL patterns you need to know for aggregation.</p>
<p>&nbsp;</p>
<p>For gauges you'll usually <span style="font-family: monospace;"><code>sum()</code></span>, <span style="font-family: monospace;"><code>avg()</code></span>, <span style="font-family: monospace;"><code>min()</code></span> or <span style="font-family: monospace;"><code>max()</code></span> them:</p>
<pre>sum without (instance)(my_gauge)</pre>
<p>&nbsp;</p>
<p>For counters, you'll take a <span style="font-family: monospace;"><code>rate()</code></span> and then <span style="font-family: monospace;"><code>sum()</code></span>:</p>
<pre>sum without (instance)(rate(my_counter_total[5m]))</pre>
<p>&nbsp;</p>
<p><span style="font-family: monospace;">&nbsp;</span></p>
<p>A summary contains <code>_sum</code> and <code>_count</code> counters, from which we can calculate the average event size. This is often the average latency:</p>
<pre>    sum without (instance)(rate(my_summary_latency_seconds_sum[5m]))
/
    sum without (instance)(rate(my_summary_latency_seconds_count[5m]))</pre>
<p>This query pattern works in other situations too, such as a failure ratio:</p>
<pre>    sum without (instance)(rate(my_events_failed_total[5m]))
/
    sum without (instance)(rate(my_events_total[5m]))</pre>
<p>A histogram contains buckets, from which we can calculate say the 90th percentile latency:</p>
<pre>histogram_quantile(<br />    0.9,<br />    sum without (instance)(rate(my_histogram_latency_seconds_bucket[5m])))</pre>
<p>We take the rate of the bucket counters, aggregate up and then calculate the quantile.</p>
<div>&nbsp;</div>
<p>A histogram also contains a <code>_sum</code> and <code>_count</code>, so the summary query from above will work here too.</p>
</div>


## Pitfalls When Aggregating


<div class="lecture-text-container">
<p>To know disk bytes read across each machine, you'd do:</p>
<p><code><span style="font-family: monospace;">sum without(device)(</span><span style="font-family: monospace;">rate(node_disk_bytes_read{job="node"}[5m]))</span>
</code></p>
<p>Never do <span style="font-family: monospace;"><code>rate(sum(...))</code></span> - it doesn't handle counter resets correctly.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>avg(avg(...))</code></span> is also incorrect, you can't take the average of an average. Instead aggregate up the numerator and denominator separately with <span style="font-family: monospace;"><code>sum()</code></span> and then divide.</p>
</div>


## Machine Role Labels


<div class="lecture-text-container">
<p>It is bad practice to apply a label to an entire target that can change during its lifetime, or to have labels that aren't strictly necessary.</p>
<p>Instead you can use role labels to add these to time series dynamically. So say you had a time series machine_role on each machine:</p>
<pre>machine_role{role="apache"} 1</pre>
<p>You can then use <code>*</code> and <code>without</code> to join this with series such as <code>up</code>, and <code>group_left</code> to copy the role over.</p>
<pre>  up
* without(role) group_left(role)
  machine_role{role="apache"}
</pre>
<p>More information on this technique can be found in the article <a href="https://www.robustperception.io/how-to-have-labels-for-machine-roles/" target="_blank" rel="noopener">How to have labels for machine roles</a>. A similar approach can work for metadata such as <a href="https://www.robustperception.io/exposing-the-software-version-to-prometheus/" target="_blank" rel="noopener">version numbers</a>.</p>
</div>


## Threshold from a Metric


<div class="lecture-text-container">
<p>You can use group_left for advanced alerting, if you want alert thresholds to come from another metric rather than being hard coded in rule files.</p>
<p>&nbsp;</p>
<p>You can have one metric with different alert thresholds for different users, that also includes alert routing information:</p>
<pre>threshold{instance="abc",job="node",target="<a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="751435175b161a18">[email&nbsp;protected]</a>"} 0.15
threshold{instance="def",job="node",target="<a class="__cf_email__" href="/cdn-cgi/l/email-protection" data-cfemail="7f1b3f1a511c1012">[email&nbsp;protected]</a>"} 0.20</pre>
<p>And then an alert expression like:</p>
<pre>some_metric &gt; on(job, instance) group_left(target) threshold</pre>
<p>The resulting alert will use the per instance threshold, and have the <code>target</code> label set.</p>
</div>


## Combining Alert Conditions


<div class="lecture-text-container">
<p>Often when defining alerts you'll want several things to be true before the alert fires.</p>
<p>&nbsp;</p>
<p>For example that there's a minimum request rate in addition to too many requests failing:</p>
<pre>  job:request_latency_seconds:mean5m{job="myjob"} &gt; 0.5
and on (job)
  job:requests:rate5m{job="myjob"} &gt; 100
</pre>
<p>&nbsp;</p>
<p>Or that it's the right time of the day:</p>
<pre>  job:request_latency_seconds:mean5m{job="myjob"} &gt; 0.5
and on ()
  hour() &gt; 9 &lt; 17  # From 9am to 5pm UTC.</pre>
</div>


## Finding Big Metrics


<div class="lecture-text-container">
<p>Usually when using PromQL you should always specify a metric name. The exceptions are exploration and performance debugging.</p>
<p>&nbsp;</p>
<p>As an example of performance debugging, let's say you wanted to find your 10 biggest metrics:</p>
<p><code><span style="font-family: monospace;">topk(10, count by (__name__)({__name__=~".+"}))</span><br />
</code></p>
<p><span style="font-family: monospace;">&nbsp;</span></p>
<p>We could also aggregate it by job:</p>
<p><code><span style="font-family: monospace;">topk(10, count by (__name__, job)({__name__=~".+"}))</span><br />
</code></p>
<p>&nbsp;</p>
<p>Or see which jobs have the most time series:</p>
<p><code><span style="font-family: monospace;">topk(10, count by (job)({__name__=~".+"}))</span><br />
</code></p>
<p>&nbsp;</p>
<p>The <span style="font-family: monospace;"><code>__name__=~".+"</code></span> is a way to get around the safety check that at least one matcher must not match the empty string. <code>.+</code> is a regular expression which matches only strings with one or more characters.</p>
</div>
