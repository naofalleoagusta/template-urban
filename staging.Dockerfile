FROM node:16-alpine

# Create app directory
WORKDIR /usr/src/app

ENV ASSET_PREFIX=https://staging-template.sirclocdn.com/urban

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Building app
RUN npm run build:staging

RUN npm ci --only=production

EXPOSE 3000

# Running the app
CMD ["npm", "start"]