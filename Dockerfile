#From chạy môi trường node version18
FROM node:18-alpine
RUN apk add --no-cache python3 g++ make 
WORKDIR /app
COPY . .
RUN yarn install --production
# yarn install để cài đặt các depentdence
CMD [ "node","src/index.js" ]
