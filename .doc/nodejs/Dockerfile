ARG NODEJS_VERSION=15.0

FROM node:${NODEJS_VERSION}-alpine

RUN apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python
RUN npm install --quiet node-gyp -g

RUN yarn install

WORKDIR /var/www/html

COPY .docker/nodejs/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 775 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["yarn"]