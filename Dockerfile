# ---- Build Stage ----
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build   # build step happens here

# ---- Run Stage ----
FROM node:18-alpine

WORKDIR /app

# Copy only built files and required runtime deps
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
RUN npm install --only=production

EXPOSE 3000
CMD ["node", "dist/app.js"]
