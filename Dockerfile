FROM node:18 as build

WORKDIR /app

COPY package*.json ./


RUN npm install --save react react-dom @types/react @types/react-dom

RUN npm install react-scripts --save

RUN npm install

# Cache the node_modules directory
COPY . .

FROM node:18-alpine

WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app/node_modules ./node_modules
COPY . .

EXPOSE 3000

CMD ["npm", "start"]