# frontend/Dockerfile
FROM node:22-alpine

WORKDIR /src

COPY . .

RUN npm install

RUN npm run build

CMD ["npm", "run", "dev", "--", "--host"]
