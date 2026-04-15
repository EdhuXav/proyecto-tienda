const express = require('express');
const router = express.Router();

const permisoController = require('./permiso.controller');

router.get('/', permisoController.getPermiso);
router.get('/:id', permisoController.getPermisoId);
router.post('/', permisoController.creaPermiso);
router.put('/:id', permisoController.updatePermiso);
router.delete('/:id', permisoController.deletePermiso);

module.exports = router;