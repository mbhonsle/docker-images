#####################################################
## Sample node js container image
## This is an experimental image.
## For production please use the officical node image
#####################################################

# set the base image: we are going to take the ubuntu image
FROM ubuntu

# update the current system
RUN apt-get update

# install node
RUN apt-get install --yes nodejs

# install legacy node
RUN apt-get install --yes nodejs-legacy

# install npm
RUN apt-get install --yes npm

# install express-generator
RUN npm install -g express-generator

# create the project home directory
RUN mkdir ./webapp

# create a project home environment variable
ENV PHOME ./webapp 

# create an express project in the project home
RUN express ${PHOME}/nodesample

# set the working dir to the project home
WORKDIR ${PHOME}/nodesample

# expose the default express port
EXPOSE 3000