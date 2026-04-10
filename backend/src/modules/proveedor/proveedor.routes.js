const express = require('express');
const router = express.Router();

const proveedorController = require('./proveedor.controller');

router.get('/',proveedorController.getProveedor);
router.post('/',proveedorController.createProveedor);
router.put('/:id',proveedorController.updateProveedor);
router.delete('/:id',proveedorController.deleteProveedor);

module.exports = router;