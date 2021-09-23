### debian is recommended by official website
FROM ubuntu

#RUN apt-get upate && apt-get install -y \
#  nginx	 \ 
RUN apt-get update 
RUN apt-get install -y nginx

###for another attachments  
#RUN rm  /etc/nginx/nginx.conf

#COPY nginx.conf /etc/nginx/    
         
EXPOSE 80
## this command for stop halting the nginx and keep exiting
CMD ["nginx", "-g", "daemon off;"]
