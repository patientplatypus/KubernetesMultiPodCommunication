FROM node:latest

RUN npm update

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app
RUN ls

RUN npm install

EXPOSE 3000
CMD npm start