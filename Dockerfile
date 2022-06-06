FROM postesviluppo.azurecr.io/alm/sonar:sonar as sonar
ARG projectKey
ARG version
ARG qualityGates
ARG token
ARG server
ENV SONAR_HOST_URL="$server"

FROM node:16-alpine AS build

# Create app directory
WORKDIR /src

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# install node
RUN npm i

# copy website
COPY . .

# run website
RUN npm run build