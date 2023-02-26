# Redis 部署

### 单节点
```
  docker-composer up
```


### 主从模式 + 哨兵
```
  docker-compose -f docker-compose-slave.yml up
  docker-compose -f docker-compose-sentinel.yml up
```

### 集群模式 + 哨兵

```
```