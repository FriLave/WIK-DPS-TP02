FROM node:20-alpine as builder
WORKDIR /app
COPY package*.json .
RUN npm ci

FROM node:20-alpine as runner
WORKDIR /app
COPY --from=builder /app .
COPY . .
EXPOSE 8080
CMD node index.js