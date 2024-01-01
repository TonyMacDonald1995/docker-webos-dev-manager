FROM mber5/broadway-baseimage:latest

ENV FAVICON_URL='https://raw.githubusercontent.com/webosbrew/dev-manager-desktop/main/resources/icon_desktop.svg'
ENV APP_TITLE='webOS Dev Manager'
ENV CORNER_IMAGE_URL='https://raw.githubusercontent.com/webosbrew/dev-manager-desktop/main/resources/icon_desktop.svg'
ENV HOSTS="[]"

RUN apt-get update
RUN apt-get install -y --no-install-recommends dbus-x11 libglib2.0-bin gir1.2-spiceclientgtk-3.0 ssh at-spi2-core
RUN wget --no-check-certificate https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.1/web-os-dev-manager_1.12.1_amd64.deb
RUN apt-get install -y ./web-os-dev-manager_1.12.1_amd64.deb
RUN apt-get clean && apt-get autoclean &&

COPY startapp.sh /usr/local/bin/startapp

CMD ["/usr/local/bin/startapp"]
