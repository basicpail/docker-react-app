FROM node:20 as builder
WORKDIR '/home/ssg/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/ssg/app/build /usr/share/nginx/html