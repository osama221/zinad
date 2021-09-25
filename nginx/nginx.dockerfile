###


### debian is recommended by official website
FROM debian:buster-slim

RUN apt-get update && apt-get install -y nginx	 
###to add another attachments  
#RUN rm  /etc/nginx/nginx.conf
## we used copy to enhance the siz of the image
#COPY nginx.conf /etc/nginx/    
#VOLUME ./ usr/share/nginx/html       
EXPOSE 80
## this command for stop halting the nginx and keep exiting
CMD ["nginx", "-g", "daemon off;"]
