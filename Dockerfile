#FROM node:current-alpine3.14
FROM ubuntu 

RUN mkdir /app
WORKDIR /app

#export DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_FRONTEND=noninteractive
# Takes 270sec - do not ALTER BEFORE HERE!!! 
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -qy nodejs npm
RUN npm i -g markserv

COPY *.md /app 
COPY gcloud/ /app/gcloud/ 

# Remove ENTRYPOINT, useless!
#ENTRYPOINT ["/bin/bash" ]
#ENTRYPOINT ["markserv -p 8080 -a 0.0.0.0" ]
#CMD ["/bin/ls"]
CMD ["bash", "-c", "markserv -p 8080 -a 0.0.0.0"]