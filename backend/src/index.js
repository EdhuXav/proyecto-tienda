const express = require('express');

const personaRoutes = require('./modules/persona/persona.routes');

const app = express();

app.use(express.json());

app.use('/api/personas', (req, res, next) => {
  console.log('Ruta personas detectada:', req.method, req.url);
  next();
}, personaRoutes);

app.listen(3000, () => {
  console.log('Servidor corriendo en puerto 3000');
});

