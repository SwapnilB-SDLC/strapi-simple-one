# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the necessary dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Copy the environment variables file
COPY .env .env

# Build the Strapi application
RUN npm run build

# Expose the port that Strapi will run on
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "start"]

