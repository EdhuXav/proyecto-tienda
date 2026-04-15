const express = require('express');
const router = express.Router();

const ClienteController = require('./cliente.controller');

router.get('/', ClienteController.getCliente);
router.get('/:id', ClienteController.getClienteId);
router.post('/', ClienteController.creaCliente);
router.put('/:id', ClienteController.updateCliente);
router.delete('/:id', ClienteController.deleteCliente);

module.exports = router;