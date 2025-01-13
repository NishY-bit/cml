# Stage 1: Build the app
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Vite Development Server
FROM node:18
WORKDIR /app
COPY --from=builder /app /app

# Expose the Vite dev server port
EXPOSE 4000

# Start the Vite dev server
CMD ["npm", "run", "dev"]
