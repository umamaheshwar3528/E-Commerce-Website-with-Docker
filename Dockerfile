# Use official Node.js image as the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Next.js application for production
RUN npm run build

# Ensure files are accessible by all users
RUN chmod -R 755 /app

# Expose the port Next.js is running on
EXPOSE 3000

# Set environment variable to production
ENV NODE_ENV=production

# Command to run the application
CMD ["npm", "start"]
