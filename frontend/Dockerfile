# Stage 1: Build React app
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .
	
# Build production bundle
RUN yarn run build

# Stage 2: Serve bằng Nginx (nhẹ hơn nhiều so với node)
FROM nginx:alpine

# Copy file build từ stage 1 vào nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Copy file cấu hình nginx riêng vào
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]