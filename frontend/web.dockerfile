# Étape de build
FROM node:latest AS build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Étape de déploiement
FROM ghcr.io/static-web-server/static-web-server:2

COPY --from=build /app/dist /public