FROM node:12-alpine
WORKDIR /docker-yapi
RUN apk add --no-cache git
RUN apk update && apk add bash
RUN mkdir yapi \ 
    && cd yapi \
    && git clone https://gitee.com/mirrors/YApi.git vendors
WORKDIR yapi
COPY ./config.json .
WORKDIR vendors
RUN npm install --production --registry https://registry.npm.taobao.org
EXPOSE 3000