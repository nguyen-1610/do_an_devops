# Stage 1: Base image
FROM node:20-alpine

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy package.json trước để tận dụng Docker cache
COPY package.json yarn.lock* ./

# Cài dependencies
RUN yarn install

# Copy toàn bộ source code vào container
COPY . .

# Expose port backend (khớp với PORT trong .env)
EXPOSE 8001

# Lệnh chạy server
CMD ["node", "server.js"]