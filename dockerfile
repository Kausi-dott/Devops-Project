# Stage 1: Build the React app
FROM node:16-alpine as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the build output to the Nginx web directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy the custom Nginx config file
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
