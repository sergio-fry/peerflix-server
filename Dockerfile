FROM node:6-alpine

RUN apk --no-cache add ffmpeg git && \
    npm install -g grunt-cli bower

WORKDIR /home/app
COPY . .

RUN npm install && \
    bower install --allow-root && \
    grunt build

VOLUME [ "/tmp/torrent-stream" ]
VOLUME [ "/home/app/.config" ]
EXPOSE 6881 9000

CMD [ "npm", "start" ]
