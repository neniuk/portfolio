ARG NODE_VERSION=24.5.0
FROM node:${NODE_VERSION} AS build

WORKDIR /app

COPY package*.json ./
COPY server/package*.json ./server/
COPY client/package*.json ./client/

RUN npm run install

COPY . .

RUN npm run build

FROM node:${NODE_VERSION} AS prod

ENV NODE_ENV=production
ENV PORT=5000

WORKDIR /app

COPY package*.json ./
COPY server/package*.json ./server/
COPY client/package*.json ./client/

RUN npm run install:prod

COPY --from=build /app/server/dist ./

EXPOSE 5000

CMD ["node", "server/server.js"]
