# Specify the base image
FROM node:16.15.1

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the necessary ports
EXPOSE 3001

# Start the application
CMD ["npm", "start"]
