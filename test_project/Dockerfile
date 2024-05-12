FROM node:latest

WORKDIR /app

COPY index.mjs .
COPY package.json .

RUN npm install
RUN npm update

CMD ["node", "index.mjs"]
