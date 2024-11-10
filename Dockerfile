# Usa una imagen de Node.js como base
FROM node:20

# Crea el directorio de la aplicación
WORKDIR /app

# Copia los archivos necesarios
COPY package*.json ./
COPY truffle-config.js ./
COPY contracts ./contracts
COPY migrations ./migrations
COPY build ./build

# Instala las dependencias
RUN npm install -g truffle
RUN npm install

# Ejecuta el servidor de Ganache CLI y despliega el contrato
EXPOSE 8545
CMD ganache-cli -p 8545 &
