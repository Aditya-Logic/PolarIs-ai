# PolarIs AI — Next.js frontend (dev/demo build)
FROM node:20-alpine

WORKDIR /app

# Install deps first for better layer caching
COPY package.json package-lock.json ./
RUN npm ci

# Copy the rest of the app (services/ is excluded via .dockerignore for this build,
# but harmless either way since it isn't part of the Next.js build)
COPY . .

RUN npm run build

EXPOSE 3000
ENV PORT=3000
ENV NODE_ENV=production

CMD ["npm", "start"]
