FROM node:12
WORKDIR /home/node/app
COPY app /home/node/app
RUN npm install
CMD APPID=$appid npm run app
EXPOSE 9999

# docker run --name nodeapp -p 9999:9999 nodeapp
# docker build -t nodeapp .
# docker run -p 9999:9999 -e appid=123 nodeapp -d