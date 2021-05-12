FROM node:16-alpine3.11 as build-stage
WORKDIR /usr/frontend
COPY frontend-example-docker-master .
RUN npm install --save webpack
RUN npm run build
FROM nginx
COPY default.conf /etc/nginx/conf.d
COPY --from=build-stage /usr/frontend/dist /usr/share/nginx/html


