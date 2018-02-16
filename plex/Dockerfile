FROM balenalib/raspberrypi3-debian:build
WORKDIR /app
RUN install_packages apt-utils apt-transport-https
RUN curl https://downloads.plex.tv/plex-media-server-new/1.15.3.876-ad6e39743/debian/plexmediaserver_1.15.3.876-ad6e39743_armhf.deb -o plex.deb \
  && apt-get install -y ./plex.deb \
  && rm plex.deb
RUN rm /lib/systemd/system/plexmediaserver.service
COPY start.sh ./
USER plex
CMD ["bash", "./start.sh"]
