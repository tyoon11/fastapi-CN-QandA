# frontend/Dockerfile
From node:22

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "run", "dev", "--", "--host"]
