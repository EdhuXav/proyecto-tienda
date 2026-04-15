const express = require('express');


const personaRoutes = require('./modules/persona/persona.routes');
const proveedorRoutes = require('./modules/proveedor/proveedor.routes');
const authRoutes = require('./modules/login/login.routes');
const clienteRoutes = require('./modules/cliente/cliente.routes');
const TrabajadorRoutes = require('./modules/trabajador/trabajador.routes')
const usuarioRoutes = require('./modules/usuario/usuario.routes')
const permisoRoutes = require('./modules/permiso/permiso.routes')
const app = express();




// 🔥 Middleware
app.use(express.json());

app.use('/api/personas', (req, res, next) => {
  console.log('Ruta personas detectada:', req.method, req.url);
  next();
}, personaRoutes);

app.use('/api/proveedor', (req, res, next) => {
  console.log('Ruta proveedor detectada:', req.method, req.url);
  next();
}, proveedorRoutes);

app.use('/api/login', (req, res, next) => {
  console.log('Ruta auth detectada:', req.method, req.url);
  next();
}, authRoutes);

app.use('/api/cliente', (req, res, next) => {
  console.log('Ruta cliente detectada:', req.method, req.url);
  next();
}, clienteRoutes);

app.use('/api/trabajador', (req, res, next) => {
  console.log('Ruta trabajador detectada:', req.method, req.url);
  next();
}, TrabajadorRoutes);

app.use('/api/usuario', (req, res, next) => {
  console.log('Ruta usuario detectada:', req.method, req.url);
  next();
}, usuarioRoutes);

app.use('/api/permiso', (req, res, next) => {
  console.log('Ruta permiso detectada:', req.method, req.url);
  next();
}, permisoRoutes);

app.listen(3000, '0.0.0.0', () => {
  console.log('Servidor corriendo en puerto 3000');
});
