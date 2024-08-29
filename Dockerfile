FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm i

COPY . .

EXPOSE 300
CMD [ "npm", "run", "dev" ]
