FROM node:alpine

COPY . .

RUN chmod +x ./entrypoint.sh

CMD ["./entrypoint.sh"]