# This image is part of the balena.io base image series for IoT devices.
FROM balenalib/rpi-raspbian:latest

# Copy Bins Linux (ARM) ngrok.
COPY ./bin/ngrok /bin

# Create non-root user.
RUN adduser --disabled-password --gecos "" ngrok

# Add config script.
COPY --chown=ngrok ngrok.yml /home/ngrok/.ngrok2/

# Init ngrok config.
COPY entrypoint.sh /

# Basic sanity check.
RUN su ngrok -c 'ngrok --version'

USER ngrok

ENV USER=ngrok

EXPOSE 4040

CMD ["/entrypoint.sh"]