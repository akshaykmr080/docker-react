FROM node:alpine
WORKDIR '/app'
COPY package*.json .
RUN npm install
# This statement is not required as we will be using volumes.
# Leaving it here for backward compatibility
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# nginx will automatically start up, because the default command will start it up. 
