FROM node:11

# Create app directory
WORKDIR /opt/apps/testapp

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8081

CMD [ "npm", "start" ]


