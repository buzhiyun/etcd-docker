#! /bin/sh

# 配置文件启动部分
#CULSTEURL="$(hostname)=http://$(hostname -i):2380"
#sed -i "s#0.0.0.0#$(hostname -i)#g" /etcd/etcd.conf
#sed -i "s#localhost#$(hostname -i)#g" /etcd/etcd.conf
#sed -i "s#default#$(hostname)#g" /etcd/etcd.conf
#sed -i "s#CLUSTE_URL#$CULSTEURL#g" /etcd/etcd.conf
#/etcd/etcd --config-file /etcd/etcd.conf
# 不再使用配置文件


# 以命令行结合环境变量参数方式启动
#if [ $ETCD_INITIAL_CLUSTER ];then
#  ARGS=$ARGS" --initial-cluster \"$ETCD_INITIAL_CLUSTER\""
#  echo "set clusteUrl $CLUSTE_URL" 
#fi          
/etcd/etcd --name $(hostname) --data-dir '/data' --listen-peer-urls "http://0.0.0.0:2380" --listen-client-urls "http://0.0.0.0:2379,http://0.0.0.0:4001"  --advertise-client-urls "http://$(hostname -i):2379" --initial-advertise-peer-urls "http://$(hostname -i):2380"
