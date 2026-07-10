# Домашнее задание к занятию 2 «Кластеризация и балансировка нагрузки»

## Задание 1

### Перенаправление запросов на разные серверы
![Скриншот 1](img/img1.png)


### Конфигурационный файл HAProxy

```
global
    daemon

defaults
    mode tcp
    timeout connect 5s
    timeout client 50s
    timeout server 50s


frontend tcp_front
    bind *:8088
    default_backend tcp_servers


backend tcp_servers
    balance roundrobin

    server s1 127.0.0.1:8888 check
    server s2 127.0.0.1:9999 check
```

## Задание 2

### Три simple python сервера на разных портах

![Скриншот 2](img/img2.png)

### Конфигурационный файл HAProxy

```
global
    log /dev/log local0
    log /dev/log local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

defaults
    log global
    mode http
    option httplog
    option dontlognull
    timeout connect 5s
    timeout client 50s
    timeout server 50s

frontend http_front
    bind *:8088
    mode http

    acl is_example hdr_dom(host) -i example.local

    use_backend servers_weights if is_example
    default_backend no_access

backend servers_weights
    mode http
    balance roundrobin

    server server1 127.0.0.1:8888 weight 2 check
    server server2 127.0.0.1:9999 weight 3 check
    server server3 127.0.0.1:8899 weight 4 check

backend no_access
    mode http
    http-request deny deny_status 403
```

### Перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него

![Скриншот 3](img/img3.png)