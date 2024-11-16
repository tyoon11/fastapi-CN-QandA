# frontend/Dockerfile
FROM node:22-alpine

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "run", "dev", "--", "--host"]
