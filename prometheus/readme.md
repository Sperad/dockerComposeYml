## 适用场景

Prometheus在记录纯数字时间序列方面表现非常好。它既适用于面向服务器等硬件指标的监控，也适用于高动态的面向服务架构的监控。对于现在流行的微服务，Prometheus的多维度数据收集和数据筛选查询语言也是非常的强大。Prometheus是为服务的可靠性而设计的，当服务出现故障时，它可以使你快速定位和诊断问题。它的搭建过程对硬件和服务没有很强的依赖关系。

Prometheus，它的价值在于可靠性，甚至在很恶劣的环境下，你都可以随时访问它和查看系统服务各种指标的统计信息。 如果你对统计数据需要100%的精确，它并不适用，例如：它不适用于实时计费系统。


## 优缺点
- 缺点: 与zabbix相比，而prometheus更多的配置是通过配置文件还实现，并且prometheus相当消耗资源
- 优点: 它的监控粒度更细，如果需要计算相关数值，最好使用SSD硬盘来提高性能



## 相关工具
- check rules
	go get github.com/prometheus/prometheus/cmd/promtool
	promtool check rules /path/to/example.rules.yml
