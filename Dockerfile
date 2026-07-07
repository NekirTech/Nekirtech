# Build-Stage
FROM node:22 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm install -g @quasar/cli
RUN quasar build
# Runtime-Stage
FROM httpd:latest
COPY --from=build /app/dist/spa/ /usr/local/apache2/htdocs/
