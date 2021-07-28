FROM ubuntu:latest
 
LABEL maintainer="manisharayudu127@gmail.com"

RUN apt-get update && apt-get upgrade -y
 
RUN apt-get install nginx -y
 
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
