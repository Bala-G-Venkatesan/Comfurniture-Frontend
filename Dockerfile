FROM node:16-alpine as dependency
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --production
FROM node:16-alpine as build
WORKDIR /app
COPY . ./
COPY --from=dependency /app/node_modules ./node_modules
RUN npm run build
FROM httpd:2.4.59-alpine as webserver
WORKDIR /usr/local/apache2/htdocs
COPY --from=build /app/build/ ./
EXPOSE 80
ENTRYPOINT [ "httpd-foreground" ]
