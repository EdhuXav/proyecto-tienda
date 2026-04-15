const express = require('express');
const router = express.Router();

const trabajadorController = require('./trabajador.controller');

router.get('/', trabajadorController.getTrabajador);
router.get('/:id', trabajadorController.getTrabajadorId);
router.post('/', trabajadorController.creaTrabajador);
router.put('/:id', trabajadorController.updateTrabajador);
router.delete('/:id', trabajadorController.deleteTrabajador);

module.exports = router;