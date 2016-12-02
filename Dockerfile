# Base image
from ubuntu:trusty

# Setup env
ENV DEBIAN_FRONTEND noninteractive

# Install requirements
RUN apt-get update && apt-get install -y software-properties-common && \
        apt-get install -y python-pip libffi-dev python-dev libssl-dev wget \
        supervisor unzip curl jq

# Get flask-ask
RUN pip install flask-ask

# Get ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
        -O /tmp/ngrok.zip && cd /tmp && unzip ngrok.zip && install -m 755 \
        ngrok /usr/local/bin

# Copy resources
COPY src/* /opt/alexa/
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add alexa user
RUN useradd -m alexa -d /opt/alexa && chown alexa:alexa -R /opt/alexa

# Ports to expose
EXPOSE 4040
EXPOSE 5000

# here we go
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
