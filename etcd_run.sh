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

# 配置环境变量  参见 https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/configuration.md
         
if [ 0"$ETCD_NAME" = "0" ];then
  export ETCD_NAME=$(hostname)
fi


if [ 0"$ETCD_DATA_DIR" = "0" ];then
  export ETCD_DATA_DIR="/data"
fi 


if [ 0"$ETCD_LISTEN_PEER_URLS" = "0" ];then
  export ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
fi


if [ 0"$ETCD_LISTEN_CLIENT_URLS" = "0" ];then
  export ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379,http://0.0.0.0:4001"
fi


if [ 0"$ETCD_INITIAL_ADVERTISE_PEER_URLS" = "0" ];then
  export ETCD_INITIAL_ADVERTISE_PEER_URLS="http://$(hostname -i):2380"
fi


if [ 0"$ETCD_ADVERTISE_CLIENT_URLS" = "0" ];then
  export ETCD_ADVERTISE_CLIENT_URLS="http://$(hostname -i):2379"
fi


if [ 0"$ETCD_ENABLE_V2" = "0" ];then
  export ETCD_ENABLE_V2=true
fi

/etcd/etcd 
