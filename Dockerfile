FROM node:20-alpine as build
WORKDIR /app
COPY package*.json .
RUN ["npm", "install"]

FROM node:20-alpine as development
USER node
WORKDIR /app
COPY --from=build --chown=node:node /app .
CMD ["npm", "run" ,"develop"]

FROM node:20-alpine as production
USER node
WORKDIR /app
COPY --chown=node:node package*.json .
RUN npm ci && npm cache clean --force
COPY --chown=node:node . .
RUN ["npm", "run", "build"]
EXPOSE 8080
CMD ["node", "index.js"]