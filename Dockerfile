FROM node:8-alpine

WORKDIR /srv/app
COPY ./src/package.json ./
RUN yarn install
COPY ./src/* ./
ADD ./src/views ./views
ADD ./src/public ./public

ENTRYPOINT [ "node", "server.js" ]