# Phase 0 (Build)
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
    
# Phase 1 (Run)
FROM nginx:alpine

# Copy from 0th phase
COPY --from=0 /app/build /usr/share/nginx/html

# nginx handles run on its own 