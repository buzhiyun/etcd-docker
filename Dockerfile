FROM        alpine
WORKDIR     /etcd
RUN         sed -i 's#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g' /etc/apk/repositories
RUN         apk add --update ca-certificates openssl && \
            apk del --purge tar openssl
VOLUME      /data
EXPOSE      2379 2380 4001 7001
ADD         etcd* /etcd/ 
CMD         ["/etcd/etcd_run.sh"]
#ENTRYPOINT  ["/etcd/etcd_run.sh"]
