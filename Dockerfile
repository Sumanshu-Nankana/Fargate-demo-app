FROM ubuntu:20.04

LABEL version="0.1" \
      Author="sumanshunankana@gmail.com" \
      description="Fargate Demo Application"


ENV TZ=Europe/London \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3.9 python3-pip wget curl net-tools

WORKDIR /fargate-demo-app
COPY . /fargate-demo-app
RUN pip install --no-cache-dir -r requirements.txt


# Install Consul
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN apt-get install -y consul

EXPOSE 5000

CMD ["python3", "./app.py"]