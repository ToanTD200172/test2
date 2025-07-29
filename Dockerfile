# Sử dụng node 18 phiên bản Alpine nhẹ gọn
FROM node:18-alpine

# Cài đặt các công cụ build cần thiết cho package có native addon
RUN apk add --no-cache python3 g++ make

# Set thư mục làm việc
WORKDIR /app

# Copy package.json và yarn.lock để tận dụng cache Docker cho các bước cài đặt dependencies
COPY package.json yarn.lock ./

# Cài đặt dependencies chỉ cho production (bỏ các devDependencies)
RUN yarn install --production

# Copy phần còn lại của source code (chỉ khi có thay đổi mới copy giúp tối ưu cache)
COPY . .

# Đặt biến NODE_ENV để đảm bảo chạy ở môi trường production
ENV NODE_ENV=production

# Chạy ứng dụng Node
CMD ["node", "src/index.js"]
