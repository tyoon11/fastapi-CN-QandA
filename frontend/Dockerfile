# frontend/Dockerfile
From node:22

WORKDIR /src


RUN npm install
RUN npm run build

CMD ["npm", "run", "dev"]
