FROM node:alpine

COPY . .

ENTRYPOINT ["node", "app.js"]