# Используем базовый образ Python
FROM python:3.10-alpine

# Создаем директорию для приложения
RUN mkdir /usr/src/pure_celery
WORKDIR /usr/src/pure_celery

# Копируем файлы приложения
COPY ./my_app /usr/src/pure_celery/my_app/
COPY requirements.txt /usr/src/pure_celery/

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Запускаем Celery в фоновом режиме
CMD celery -A my_app.tasks worker --loglevel=info
