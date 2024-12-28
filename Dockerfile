FROM node:18-alpine

WORKDIR /app

COPY . .


EXPOSE 3000



CMD ["npm", "start"]


# FROM ubuntu

# RUN  apt-get update

# RUN apt-get install -y nodejs

# RUN apt-get install npm -y

# COPY . .

# RUN npm install

# # Attempt to fix vulnerabilities, but continue if it fails
# RUN npm audit fix --force || echo "Continuing despite npm audit fix failures"

# EXPOSE 3000

# CMD ["npm", "start"]