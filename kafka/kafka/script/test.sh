#/bin/bash
#
#
# Topic
#
# 	[ok]创建topic
/bin/bash /opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181  --replication-factor 1 --partitions 3 --topic TopicLog-test
#
# 	[ok]topic列表
/bin/bash /opt/kafka/bin/kafka-topics.sh --list --zookeeper zookeeper:2181
#
# 	[ok]topic详情
/bin/bash /opt/kafka/bin/kafka-topics.sh --describe --zookeeper zookeeper:2181 --topic TopicLog-test
#
#	删除topic
/bin/bash /opt/kafka/bin/kafka-run-class.sh kafka.admin.DeleteTopicCommand --zookeeper zookeeper:2181 --topic TopicLog-test
#
#
#
# 生产者
#
# 	[ok]向topic发消息
/bin/bash /opt/kafka/bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic TopicLog-test
#
#
#
# 消费者
#
# 	【ok】可以读取到实时发送到kafka的数据，不能读取到历史数据。
/bin/bash /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic TopicLog-test
#
# 	[ok]从开始偏移量（offset）读取数据
/bin/bash /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic TopicLog-test --from-beginning
#
#  消费偏移量
/bin/bash /opt/kafka/bin/kafka-run-class.sh kafka.tools.ConsumerOffsetChecker --bootstrap-server 127.0.0.1:9092 --group TopicLog-consumer-group



#  kafka_2.12-2.3.0