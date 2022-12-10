FROM node:12.4-alpine

WORKDIR /app

COPY package.json /app/
RUN npm install

COPY app.js /app/
COPY public /app/

LABEL creator="Austin Loveless"
LABEL maintainer="Michael Act"

CMD node app.js
