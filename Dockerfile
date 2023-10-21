FROM node:alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN set -xv; \
    npm ci

COPY app.js ./

CMD ["app.js"]
