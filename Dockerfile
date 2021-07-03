FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# this step will create /app/build directory where your production ready code reside
RUN npm run build

# Next step is to start nginx server that will serve our production ready code

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

