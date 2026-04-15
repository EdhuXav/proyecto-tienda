const express = require('express');
const router = express.Router();

const usuarioController = require('./usuario.controller');

router.get('/', usuarioController.getUsuario);
router.get('/:id', usuarioController.getUsuarioId);
router.post('/', usuarioController.creaUsuario);
router.put('/:id', usuarioController.updateUsuario);
router.delete('/:id', usuarioController.deleteUsuario);

module.exports = router;