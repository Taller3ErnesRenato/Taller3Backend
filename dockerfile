# Usa una imagen oficial de Node.js como base
FROM node:18.18.0

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos necesarios para instalar dependencias
COPY package*.json ./

# Instala las dependencias globales y locales
RUN npm install -g sequelize-cli && npm install

# Copia el resto del código al contenedor
COPY . .

# Establece las variables de entorno requeridas
ENV DB_HOST=postgres
ENV DB_DATABASE=postgres
ENV DB_USER=postgres
ENV DB_PASSWORD=your_password
ENV TOKEN_SECRET=9428uywfjkamzc2e9u3oji0d89ashibj

# Expone el puerto que utiliza la aplicación
EXPOSE 4000

# Comando para ejecutar migraciones, seeders y arrancar la aplicación
CMD  npm run dev
