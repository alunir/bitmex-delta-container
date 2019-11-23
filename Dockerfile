FROM node:13.1.0-alpine3.10

RUN apk add --update alpine-sdk gettext

RUN cd /home \
 && git clone https://github.com/BitMEX/api-connectors.git

# Install dependencies
RUN cd /home/api-connectors/official-ws/nodejs \
 && npm install \
 && cd ../delta-server \
 && npm install

WORKDIR /home/api-connectors/official-ws/delta-server/

COPY gencfg config.js.template /home/api-connectors/official-ws/delta-server/

ENV PORT=4444 SYMBOL=XBTUSD BITMEX_KEY= BITMEX_SECRET_KEY= MAX_TABLE_LEN=5000

RUN sh ./gencfg

EXPOSE 4444
CMD [ "node", "index.js" ]
