const express = require('express');

const personaRoutes = require('./modules/persona/persona.routes');
const proveedorRoutes = require('./modules/proveedor/proveedor.routes');
const productoRoutes = require('./modules/producto/producto.routes');

const app = express();

app.use(express.json());

app.use('/api/personas', (req, res, next) => {
  console.log('Ruta personas detectada:', req.method, req.url);
  next();
}, personaRoutes);

app.use('/api/proveedor', (req, res, next) => {
  console.log('Ruta proveedor detectada:', req.method, req.url);
  next();
}, proveedorRoutes);

app.use('/api/producto', (req, res, next) => {
  console.log('Ruta producto detectada:', req.method, req.url);
  next();
}, productoRoutes);

app.listen(3000, () => {
  console.log('Servidor corriendo en puerto 3000');
});

