FROM python:3
# Install distutils and Django
RUN apt-get update && apt-get install -y python3-distutils \
    && pip install django==3.2

COPY python-jenkins-argocd-k8s /app
WORKDIR /app
RUN python manage.py migrate

EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]


