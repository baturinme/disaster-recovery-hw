# Домашнее задание к занятию 1 «Disaster recovery и Keepalived»

## Задание 1

### Скриншот 1
![Процесс настройки Router2](img/img1.png)

### Скриншот 2
![Процесс настройки Router1](img/img2.png)

### Скриншот 3
![Схема](img/img3.png)

## Задание 2

### Конфиги Keepalived на двух виртуальных машинах

![keepalived.conf на двух машинах](img/img4.png)

### Скрипт проверки доступности веб-сервера

```bash
#!/bin/bash

PORT=80
FILE="/var/www/html/index.html"

if ! nc -z 127.0.0.1 $PORT; then
    exit 1
fi

if [ ! -f "$FILE" ]; then
    exit 1
fi

exit 0
```


### Скриншот до "переезда" плавающего ip

![keepalived.conf на двух машинах](img/img5.png)

### Скриншот самого "переезда" плавающего ip

![keepalived.conf на двух машинах](img/img6.png)