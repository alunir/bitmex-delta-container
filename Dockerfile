FROM node:13.1.0

WORKDIR /home

RUN git clone https://github.com/BitMEX/api-connectors.git

# Install dependencies
RUN cd api-connectors/official-ws/nodejs \
 && npm install \
 && cd ../delta-server \
 && npm install

COPY config.js /home/api-connectors/official-ws/delta-server/

EXPOSE 4444

CMD [ "node", "/home/api-connectors/official-ws/delta-server/index.js" ]
