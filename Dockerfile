# FROM node:18 as build

# WORKDIR /app

# COPY package*.json ./


# RUN npm install --save react react-dom @types/react @types/react-dom

# RUN npm install react-scripts --save

# RUN npm install

# RUN npm audit fix --force

# # Cache the node_modules directory
# COPY . .

# FROM node:18-alpine

# WORKDIR /app

# # Copy only the necessary files from the build stage
# COPY --from=build /app/node_modules ./node_modules
# COPY . .

# EXPOSE 3000

# CMD ["npm", "start"]


FROM ubuntu

RUN  apt-get update

RUN apt-get install -y nodejs

RUN apt-get install npm -y

COPY . .

RUN npm install

#RUN npm audit fix --force

EXPOSE 3000

CMD ["npm", "start"]