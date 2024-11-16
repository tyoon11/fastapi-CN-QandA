# frontend/Dockerfile
FROM node:22-alpine

WORKDIR /src

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "run", "dev", "--", "--host"]
