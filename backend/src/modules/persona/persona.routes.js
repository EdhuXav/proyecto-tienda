const express = require('express');
const router = express.Router();

const personaController = require('./persona.controller');

router.get('/', personaController.getPersonas);
router.post('/', personaController.createPersona);
router.put('/:id', personaController.updatePersona);
router.delete('/:id', personaController.deletePersona);

module.exports = router;