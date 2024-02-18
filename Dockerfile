FROM node:18-alpine

LABEL MAINTAINER="reubennellissery@gmail.com"
LABEL BUILD_DATE="2024-02-13"

WORKDIR /app
COPY . .

RUN npm install

CMD ["node", "app.js"]
EXPOSE 80