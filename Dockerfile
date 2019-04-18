FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build


FROM nginx

# Copy the build folder resulted from the builder phase into the directory where nginx automatically servers all static files. 
COPY --from=builder /app/build /usr/share/nginx/html 
