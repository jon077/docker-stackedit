FROM alpine:latest
MAINTAINER playniuniu <playniuniu@gmail.com>

ENV STACKEDIT_VERSION 4.3.14

WORKDIR /usr/src/app/

RUN apk add --no-cache --update curl git nodejs \
    && curl -o v${STACKEDIT_VERSION}.tar.gz -sSL https://github.com/benweet/stackedit/archive/v${STACKEDIT_VERSION}.tar.gz \
    && tar -xzf v${STACKEDIT_VERSION}.tar.gz \
    && rm v${STACKEDIT_VERSION}.tar.gz \
    && mv stackedit-${STACKEDIT_VERSION} stackedit \
    && cd stackedit \
    && npm install \
    && apk del curl git

EXPOSE 3000

ENTRYPOINT ["node", "./stackedit/server.js"]
