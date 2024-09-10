FROM node:20
WORKDIR /app
RUN apt update &&\
    apt -y install python3 python3-pip gcc make libzstd-dev liburing-dev &&\
    pip3 install setuptools --break-system-packages
COPY . .
RUN yarn
RUN yarn build
RUN npm install -g .
ENTRYPOINT [ "zstd-proxy" ] 