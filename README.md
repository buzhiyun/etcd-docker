etcd 打的docker镜像
- 启动的时候请使用环境变量传入参数
  参数配置 见：https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/configuration.md 

- data目录默认放在镜像内的 /data 目录中

----
测试环境可以用docker-compose 快速构建

docker-compose.yml 内容：

```yaml
version: '3.1'

services:

  etcd-1:
    image: buzhiyun/etcd
    restart: always
    privileged: true
    volumes:
      - ./etcd1-data:/data
    environment:
      ETCD_INITIAL_CLUSTER: etcd-1=http://etcd-1:2380,etcd-2=http://etcd-2:2380,etcd-3=http://etcd-3:2380
    hostname: etcd-1
    networks:
      extnetwork:
        ipv4_address: 172.20.20.11

  etcd-2:
    image: buzhiyun/etcd
    restart: always
    privileged: true
    volumes:
      - ./etcd2-data:/data
    environment:
      ETCD_INITIAL_CLUSTER: etcd-1=http://etcd-1:2380,etcd-2=http://etcd-2:2380,etcd-3=http://etcd-3:2380
    hostname: etcd-2
    networks:
      extnetwork:
        ipv4_address: 172.20.20.12

  etcd-3:
    image: buzhiyun/etcd
    restart: always
    privileged: true
    volumes:
      - ./etcd3-data:/data
    environment:
      ETCD_INITIAL_CLUSTER: etcd-1=http://etcd-1:2380,etcd-2=http://etcd-2:2380,etcd-3=http://etcd-3:2380
    hostname: etcd-3
    networks:
      extnetwork:
        ipv4_address: 172.20.20.13

networks:
   extnetwork:
      ipam:
         config:
         - subnet: 172.20.20.0/24
```


--------------------------------------------------------------
