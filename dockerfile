# Stage 1 removed — no build needed

FROM nginx:alpine

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy prebuilt React app
COPY build/ /usr/share/nginx/html
