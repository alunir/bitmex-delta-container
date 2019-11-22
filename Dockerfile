FROM node:13.1.0

RUN cd /home \
 && git clone https://github.com/BitMEX/api-connectors.git

# Install dependencies
RUN cd /home/api-connectors/official-ws/nodejs \
 && npm install \
 && cd ../delta-server \
 && npm install

COPY config.js /home/api-connectors/official-ws/delta-server/

EXPOSE 4444

WORKDIR /home/api-connectors/official-ws/delta-server/

CMD [ "node", "index.js" ]
