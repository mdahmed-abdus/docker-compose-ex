FROM node:20-slim
WORKDIR /app

# Copy package.json and install dependencies before copying the rest of the project
# Refer -
# https://stackoverflow.com/questions/51533448/why-copy-package-json-precedes-copy
# https://www.docker.com/blog/containerizing-an-event-posting-app-built-with-the-mean-stack/#:~:text=common%20practice%20to,application%20code%20layer
COPY package*.json .
RUN npm i

COPY . .

EXPOSE 3000

# Why exec form is preffered over shell form
# Refer -
# https://stackoverflow.com/questions/42805750/differences-between-dockerfile-instructions-in-shell-and-exec-form
# https://docs.docker.com/reference/dockerfile/#shell-and-exec-form
#
# Prefer 'node' command, avoid npm start
# Refer - https://github.com/goldbergyoni/nodebestpractices/blob/master/sections/docker/bootstrap-using-node.md
CMD [ "node", "server.js" ]
