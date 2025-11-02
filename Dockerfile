FROM python:3

RUN apt-get update && apt-get install -y python3-venv python3-setuptools \
    && pip install django==3.2

COPY python-jenkins-argocd-k8s /app
WORKDIR /app
RUN python manage.py migrate

EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]


