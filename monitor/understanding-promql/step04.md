
## Aggregators


<div class="lecture-text-container">
<p>Aggregation is a key feature of PromQL, and is done using a type of operator called aggregators.</p>
<p>The aggregators are:</p>
<ul>
<li><code>sum</code>: The sum of the values</li>
<li><code>count</code>: The number of values</li>
<li><code>count_values</code>: How many times each value appears</li>
<li><code>min</code>: The minimum value</li>
<li><code>max</code>: The maximum value</li>
<li><code>avg</code>: The average of the values</li>
<li><code>stddev</code>: The standard deviation of the values</li>
<li><code>stdvar</code>: The standard variance of the values</li>
<li><code>topk</code>: The top k values</li>
<li><code>bottomk</code>: The bottom k values</li>
<li><code>quantile</code>: The given quantile of the values.</li>
</ul>
<p>They take an instant vector, and return an instant vector.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>count(up{job="node"})</code></span> would return the number of node exporters, as a single time series with no labels. In this case there is only one node exporter:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/wFInPcWZSQaGWUg1YqVP" /></p>
<p><span style="font-family: monospace;"><code>topk</code></span> and <span style="font-family: monospace;"><code>bottomk</code></span> take a parameter which is the number of series to return. For example <span style="font-family: monospace;"><code>topk(3, node_filesystem_size)</code></span> would return the 3 biggest filesystems:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/wEJjhYGSR9C1HQLu5seG" />Note that the results from <code>topk</code> and <code>bottomk</code> are sorted, and that when used in graph you get the top/bottom samples at each point rather than across the entire graph. That is to say that a <code>topk(5, metric)</code> on a graph can have more than 5 lines.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>quantile()</code></span> takes a parameter for the quantile. For example <span style="font-family: monospace;"><code>quantile(.95, process_resident_memory_bytes)</code></span> would return the 95th percentile memory usage across instances. So 5% of instances have higher memory usage, and 95% have lower memory usage than this.</p>
<p>&nbsp;</p>
<p><span style="font-family: monospace;"><code>count_values()</code></span> takes a parameter for the output label name for the value. For example if you have a series with two 3s and four 5s then <span style="font-family: monospace;"><code>count_values("value", vector)</code></span> would return<span style="font-family: monospace;"> <code>{"value": "3"}: 2, {"value": "5"}: 4</code></span>.</p>
</div>


## Choosing Output Labels


<div class="lecture-text-container">
<p>Aggregating to a single value without labels isn't too useful in general.</p>
<p>You will usually want to maintain some or all labels and, have many output time series.</p>
<p>The <span style="font-family: monospace;"><code>without</code></span> modifier says to use all the labels in the output - except the ones listed.</p>
<p>For example, the number of disks per machine would be <span style="font-family: monospace;"><code>count without(device)(node_disk_bytes_read{job="node"})</code>:</span></p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/K0YTLfr9Sf6mJzWnc6O0" /></p>
<p>Correctly using the <span style="font-family: monospace;"><code>without</code></span> modifier is key to having useful aggregations.</p>
<p>&nbsp;</p>
<p>Can also use the <span style="font-family: monospace;"><code>by</code></span> modifier, which says to only output the given labels.</p>
<p>This requires you to know every single label that you care about, so if you've a cross-job label like <code>availability_zone</code> or <code>env</code> you would have to list it.</p>
<p>This makes expressions hard to share across teams and organisations, so prefer <span style="font-family: monospace;"><code>without</code></span>.</p>
<p>&nbsp;</p>
<p>Prior to 2.0 there's was a submodifier <span style="font-family: monospace;"><code>keep_common</code></span> on <span style="font-family: monospace;"><code>by</code></span>. This was to be avoided, as it breaks in fun ways.</p>
</div>


## Operators

<div class="lecture-text-container">
<p>This is where things start to get really interesting. There are three types of binary operator:</p>
<ul>
<li>Arithmetic: <code>+ - * / % ^</code></li>
<li>Comparison:<code> == != &gt; &gt;= &lt; &lt;=</code></li>
<li>Logical/Set: <code>and unless or</code></li>
</ul>
<p>The <span style="font-family: monospace;"><code>absent()</code></span> function serves the role of a "not" logical/set operator.</p>
<div>&nbsp;</div>
</div>


## Arithmetic


<div class="lecture-text-container">
<p>The arithmetic operators do the math you'd expect: addition, subtraction, multiplication, division, modulus and exponent.</p>
<p>&nbsp;</p>
<p>If one argument is a scalar and the other is a scalar, the result is a scalar such as for <span style="font-family: monospace;"><code>2 + 2</code>:</span></p>
<p><span style="font-family: monospace;"><img class="img-responsive" src="https://www.filepicker.io/api/file/1uNlIxUdSpW1rh3OBakr" /><br /></span></p>
<p>&nbsp;</p>
<p>If one argument is a vector and the other is a scalar, the result is a vector such as for <span style="font-family: monospace;"><code>my_metric + 2</code>:</span></p>
<p><span style="font-family: monospace;"><img class="img-responsive" src="https://www.filepicker.io/api/file/SSbuRNPKS3CTMF8E5yr9" /><br /></span></p>
<p>&nbsp;</p>
<p>The metric name will be excluded from the output time series, and similarly with any function or operator that can change the value.</p>
</div>


## Simple Binary Operator Matching

<div class="lecture-text-container">
<p>What happens when you try to do arithmetic on two vectors?</p>
<p>Prometheus has to match up time series from the left hand side (LHS) and right hand side (RHS).</p>
<p>If everything matches up perfectly ignoring metric names on LHS and RHS, you'll get an output time series.</p>
<p>&nbsp;</p>
<p>For example to calculate the proportion of free inodes on all filesystems:</p>
<pre>  node_filesystem_files_free
/
  node_filesystem_files
</pre>
<p>&nbsp;</p>
<p>This will produce a result like:<img class="img-responsive" src="https://www.filepicker.io/api/file/zCfY8L3QTtWWHWCqKWxi" /></p>
<p>You'll note that some of the results are NaN for some special filesystems, as <code>node_filesystem_files</code><span class="redactor-invisible-space"> is 0 and dividing by 0 produces a NaN.</span></p>
</div>


## Matching Your Time Series


<div class="lecture-text-container">
<p>What if things don't match up?</p>
<p>You can use the <span style="font-family: monospace;"><code>ignoring</code></span> modifier, which is similar to <span style="font-family: monospace;"><code>without</code></span> for aggregations.</p>
<p>LHS and RHS are bucketed on the labels, bar those that you are ignoring.</p>
<p>&nbsp;</p>
<p>There's also an <span style="font-family: monospace;"><code>on</code></span> modifier, which is similar to <span style="font-family: monospace;"><code>by</code></span> for aggregations. Prefer <span style="font-family: monospace;"><code>ignoring</code></span>.</p>
<p>&nbsp;</p>
<p>If there's exactly one time series in matching buckets on both sides, operation will go ahead.</p>
<p>If there's zero on one side, operation will not go ahead due to no match.</p>
<p>If there's many time series in a bucket, you'll get an error.</p>
<p>&nbsp;</p>
<p>For example to get the ratio of idle time to total cpu time:</p>
<pre>  sum without (cpu)(rate(node_cpu{mode="idle"}[5m]))
/ ignoring (mode)
  sum without (cpu,mode)(rate(node_cpu[5m]))</pre>
<p><span style="background-color: initial; letter-spacing: 0.4px;">Here the LHS has </span><span style="background-color: initial; letter-spacing: 0.4px;">a <code>mode</code> label but the RHS doesn't, so we ignore <code>mode</code> when doing the division. This produces a result like:</span></p>
<p><span style="background-color: initial; letter-spacing: 0.4px;"><img class="img-responsive" src="https://www.filepicker.io/api/file/L2DLeA7ESvuvHxDh28El" /><br /></span></p>
</div>


## Many to One


<div class="lecture-text-container">
<p>Sometimes you want to do a Many to One match.</p>
<p>In the last page we calculated idle CPU as a ratio of total. What if we wanted to do that for all CPU modes?</p>
<p>&nbsp;</p>
<p>We would use the <span style="font-family: monospace;"><code>group_left</code></span> modifier. Many is the left side. We keep all the labels on the many side, and copy over any labels listed in the <span style="font-family: monospace;"><code>group_left</code></span>.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>This gives us the expression:</p>
<pre>  sum without (cpu)(rate(node_cpu[5m]))
/ ignoring(mode) group_left
  sum without (mode, cpu)(rate(node_cpu[5m]))</pre>
<p>&nbsp;</p>
<p>The bucketing will look like:</p>
<table border="1"><colgroup><col /><col /></colgroup>
<tbody>
<tr>
<td>
<p style="text-align: center;">LHS</p>
</td>
<td>
<p style="text-align: center;">RHS</p>
</td>
</tr>
<tr>
<td>
<p>{mode=&rdquo;idle&rdquo;,instance=&rdquo;machine1&Prime;,job=&rdquo;node&rdquo;}</p>
</td>
<td rowspan="3">
<p>{instance=&rdquo;machine1&Prime;,job=&rdquo;node&rdquo;}</p>
</td>
</tr>
<tr>
<td>
<p>{mode=&rdquo;user&rdquo;,instance=&rdquo;machine1&Prime;,job=&rdquo;node&rdquo;}</p>
</td>
</tr>
<tr>
<td>
<p>{mode=&rdquo;system&rdquo;,instance=&rdquo;machine1&Prime;,job=&rdquo;node&rdquo;}</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>And the in the expression browser would look like:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/EZpehlJcQqO5yL2bO8yU" /></p>
<p><span style="font-family: monospace;"><code>group_right</code></span> is similar, switching LHS and RHS. You are unlikely to have a need for it.</p>
</div>


## Comparison Operators


<div class="lecture-text-container">
<p>Matching works the same as for binary operators.</p>
<p>Vector and vector will keep the LHS time series if the comparison is true.</p>
<p>Scalar and vector will keep the vector time series if the comparison is true.</p>
<p>Scalar and scalar is an error. No sane vector can be returned here.</p>
<p>&nbsp;</p>
<p>To find down targets you would use <code>up == 0</code>, here for example nothing is down so you see an empty result:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/0bbKf1szSw5eJPXIuG5l" /></p>
<p>By comparison, <code>up != 0</code> shows all the things which are up:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/TkSqmp8eRTG7GbKrCOeq" /></p>
</div>


## Bool vs Filtering


<div class="lecture-text-container">
<p>The default mode of comparisons is to filter.</p>
<p>You can add the <span style="font-family: monospace;"><code>bool</code></span> modifier to return 0/1 instead. 1 means true.</p>
<p><code>bool</code> also allows scalar/scalar comparisons to work.</p>
<p>Filtering is what you want for alerts. However it is difficult to work with elsewhere as you can end up with no time series in a bucket if everything is filtered. For example if you wanted to count the number of instances with a limit of fewer than 1024 file descriptors, then <code>count(process_max_fds &lt; 1024)</code> would return nothing if there were no such instances:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/PX0VBYoET6q1zSdQbvum" /></p>
<p>However <code>sum(process_max_fds &lt; bool 1024)</code><span class="redactor-invisible-space"> will return the 0 you expect in this circumstance:</span></p>
<p><span class="redactor-invisible-space"><img class="img-responsive" src="https://www.filepicker.io/api/file/QRgiye18SQmcYP3K1wGm" /><span class="redactor-invisible-space"><br /></span></span></p>
<p>&nbsp;</p>
<p>You can mix <code>bool</code> with other aggregators. For example to find the proportion of instances where a metric is greater than 42:</p>
<pre>avg without(instance)(some_metric &gt; bool 42)</pre>
</div>


## Logical/Set Operators


<div class="lecture-text-container">
<p><span style="font-family: monospace;"><code>and</code></span>, <span style="font-family: monospace;"><code>unless</code></span>, and <span style="font-family: monospace;"><code>or</code></span> don't follow quite the same matching rules. All logical operators are many-to-many.</p>
<ul>
<li><code>and</code> returns LHS time series if there's at least one matching time series on RHS</li>
<li><span style="font-family: monospace;"><code>unless</code></span> is opposite of <span style="font-family: monospace;"><code>and</code></span>, needs there to be no match on RHS</li>
<li><span style="font-family: monospace;"><code>or</code></span> returns the LHS if present, otherwise the RHS.</li>
</ul>
<p>As an example you could use this to get the CPU usage of processes, unless they were using less than 100MB of RAM:</p>
<p><img class="img-responsive" src="https://www.filepicker.io/api/file/Ebx4Bz0ZQPuT9UhmPNcJ" /></p>
<p>&nbsp;</p>
<p>Scalars are not supported by these operators, instead munge another time series into what you need. For example <span style="font-family: monospace;"><code>X or up * 0  </code></span>is typical.</p>
</div>
