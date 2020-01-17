## Accessing PromQL

<div class="lecture-text-container">
<p>There are three ways to get to PromQL:</p>
<ul>
<li>HTTP API</li>
<li>Recording Rules</li>
<li>Console Templates</li>
</ul>
<p>The HTTP API is by far the most common. The Expression browser, Grafana and any other tooling all use it.</p>
<p>Recording rules let you run queries regularly inside Prometheus, and are also used for alerting.</p>
<p>Console templates are part of a templating system inside Prometheus, and we won't look at them further in this course.</p>
<p>&nbsp;</p>
</div>


## HTTP API


<div class="lecture-text-container">
<p>Query at one point in time using <span style="font-family: monospace;"><code>query</code></span>:</p>
<pre>GET http://localhost:9090/api/v1/query?query=QUERY&amp;time=1463084221</pre>
<p>The the time is optional, and defaults to now. You can also request range vectors with the <span style="font-family: monospace;"><code>query</code></span> endpoint..</p>
<p>&nbsp;</p>
<p>Query at regular steps using <span style="font-family: monospace;"><code>query_range</code></span>:</p>
<pre>GET http://localhost:9090/api/v1/query_range?query=QUERY&amp;start=1463080621&amp;end=1463084221&amp;step=60</pre>
<p>This is over 3600 seconds, and will return 61 time slices.</p>
</div>


## Query Range Computational Model


<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>query_range</code></span> runs each step independently of the other steps.</p>
<p>There's some performance optimisations, but you'd get the exact same results if you were to call <span style="font-family: monospace;"><code>query</code></span> 61 times for each of the steps individually.</p>
<p>This means that <span style="font-family: monospace;"><code>topk(5, X)</code></span> can return far more than 5 time series on a graph, as each time slice is independent.</p>
<p>&nbsp;</p>
<p>Beware that too small a duration on an rate/increase compared to the <span style="font-family: monospace;">step</span> will miss samples, as range vectors only include data inside their duration. So if you have <span style="font-family: monospace;"><code>rate(my_counter_total[1m])</code></span> with a <span style="font-family: monospace;"><code>step</code></span> URL parameter of 600 (5 minutes), you'll miss 80% of your data.</p>
</div>


## Getting Data Aligned to a Day


<div class="lecture-text-container">
<p>How would you get request count bucketed to a day?</p>
<p>PromQL has no feature to do this, and seems unlikely it'll ever have one.</p>
<p>However you can pass in day aligned times to <span style="font-family: monospace;"><code>query_range</code></span>.</p>
<pre>GET http://localhost:9090/api/v1/query_range?query=QUERY&amp;start=2018-04-11T00:00:00Z&amp;end=2018-04-11T23:00:00Z&amp;step=3600</pre>
<p>This would run the query at the start of every hour for the 11th of April 2018.</p>
<p>&nbsp;</p>
<p>Similarly for sub-queries. There's no support in PromQL for these, but you can use tooling around the HTTP API to emulate them by doing the inner query then using the result in the outer query.</p>
</div>


## Recording Rules


<div class="lecture-text-container">
<p>On a regular basis, Prometheus runs a set of expressions and stores the results.</p>
<p>Alerts are another type of recording rules.</p>
<p>&nbsp;</p>
<p>As of Prometheus 2.0, rules are part of a group and rules within each group are executed in order.</p>
<p>&nbsp;</p>
<p>In other systems, similar features are known as continuous queries and composite metrics.</p>
</div>


## When to use rules?


<div class="lecture-text-container">
<p>There are several cases where you'll want to use rules:</p>
<ul>
<li>To pre-compute expensive queries (touching &gt;100-1000 time series)</li>
<li>When you need a range vector input, but only have a vector output
<ul>
<li>For example, feeding a <span style="font-family: monospace;"><code>rate()</code></span> of a counter into <span style="font-family: monospace;"><code>predict_linear()</code></span></li>
<li>It can be okay to use subqueries here, if they don't involve much computation.</li>
</ul>
</li>
<li>To produce aggregates that'll be picked up by federation</li>
<li>Alerting</li>
</ul>
</div>


## Rule Naming


<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>aggregation_level:metric:operations</code></span> is the standard.</p>
<p>Aggregation level are things like instance, job, shard, device.</p>
<p>Metric is the metric name.</p>
<p>Operations are <code>rate5m</code>, <code>ratio</code>, <code>histogram_quantile</code> etc. Prepend the most recent ones.</p>
<p>Ratio convention is A_per_B for the metric and "ratio" for the operation.</p>
<p>For average calculated from summary/histogram, strip the \_sum/\_count and use "mean" as the operation.</p>
<p>Some examples:</p>
<ul>
<li><span style="font-family: monospace;"><code>mode:node_cpu:rate5m</code></span> - Machine CPU usage aggregated up by mode, i.e. per-mode across all machines.</li>
<li><span style="font-family: monospace;"><code>instance_mode:node_cpu:rate5m</code></span> - Machine CPU usage aggregated up by mode and instance, i.e. per-mode per-machine.</li>
<li><span style="font-family: monospace;"><code>instance:process_open_fds_per_process_max_fds:ratio</code></span> - Per-instance ratio of file descriptors used.</li>
</ul>
<p>The advantage of this naming scheme is that it is easy when looking at an expression to tell which labels are in play, and thus makes it easier to spot if there is a mistake in how labels are being handled.</p>
</div>


## Using Rules


<div class="lecture-text-container">
<p>Rules go in separate files to the main Prometheus configuration. Like other Prometheus configuration files, they are in YAML format.</p>
<p>For example you could have a rules.yml with the following content:</p>
<pre>groups:
  - name: group_name
    rules:
    - record: mode:node_cpu:rate5m
      expr: &gt;
        sum without (cpu, instance) (rate(node_cpu{job="node"}[5m]))    
    - record: instance_mode:node_cpu:rate5m      
      expr: &gt;        
        sum without (cpu) (rate(node_cpu{job="node"}[5m]))
    - record: instance:process_open_fds_per_process_max_fds:ratio
       expr: &gt;
         process_open_fds / process_max_fds
</pre>
<p>&nbsp;</p>
<p>This would be included in a Prometheus configuration file via:</p>
<pre>rule_files:
  - rules.yml   # Globs are supported for the filename
</pre>
<div>&nbsp;</div>
<p>Note that the format of rules files changed in Prometheus 2.0.</p>
</div>


## Rule Anti-Patterns


<div class="lecture-text-container">
<p>Do not use rules to undo benefits of labels, e.g.</p>
<p><code><span style="color: #c0504d;"><span style="font-family: monospace;">node_cpu_idle = node_cpu{mode="idle"}   # Don't do this </span>
	</span>
</code></p>
<p>&nbsp;</p>
<p>Do not use colons for other things:</p>
<p><code><span style="font-family: monospace;"><span style="color: #c0504d;">node_cpu:idle = node_cpu{mode="idle"}   # Don't do this</span></span>
</code></p>
<p>&nbsp;</p>
<p>Colons are for your use in recording rules for tracking what aggregations and operations have been performed, and should not be exposed by instrumentation.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Do not filter in recording rules, e.g.</p>
<p><code><span style="font-family: monospace;"><span style="color: #c0504d;">down_instances = (up == 0)  # Don't do this</span></span>
</code></p>
<p>This can cause a metric to be empty, which is difficult to deal with. If you find the need to do this, use the <code>bool</code> modifier to ensure there are always output time series.</p>
</div>
