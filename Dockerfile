# Stage 1: Build Stage
FROM node:16 as build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application source to the container
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Production Stage
FROM nginx:stable-alpine

# Copy the build output from the build stage to the Nginx web root
COPY --from=build /app/build /usr/share/nginx/html

# Expose the default Nginx HTTP port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]