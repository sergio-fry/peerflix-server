FROM node:6-alpine

RUN apk --no-cache add ffmpeg git && \
    npm install -g grunt-cli bower

WORKDIR /app


COPY package.json package-lock.json /app/
RUN npm install

COPY bower.json .bowerrc /app/
RUN bower install --allow-root

COPY . .
RUN grunt build --force

VOLUME [ "/tmp/torrent-stream" ]
VOLUME [ "/root/.config" ]
EXPOSE 6881 9000

CMD [ "npm", "start" ]
