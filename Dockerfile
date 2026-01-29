FROM node:25.2.1-alpine3.21

EXPOSE 8080
ENV DB_HOST=mysql
RUN addgroup -S expense && adduser -S expense -G expense \
    && mkdir /opt/server \
    && chown expense:expense -R /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js /opt/server/
RUN npm install
USER expense
CMD [ "node","index.js"]
