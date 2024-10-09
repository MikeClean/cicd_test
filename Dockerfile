# Используем официальный образ Nginx
FROM nginx:latest

# Копируем кастомный конфиг (если есть) и статику в контейнер
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./html /usr/share/nginx/html

# Открываем порт 80
EXPOSE 80