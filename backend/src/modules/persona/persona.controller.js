const personaService = require('./persona.service');

exports.getPersonas = async (req, res) => {
    try{
        const data = await personaService.getAllPersonas();
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message});
    }                                                  
}

exports.createPersona = async (req, res) => {
  try {
    const data = await personaService.createPersona(req.body);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updatePersona = async (req, res) => {
    try {
        const actualizada = await personaService.updatePersona(
            req.params.id,
            req.body
        );
        res.json(actualizada);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deletePersona = async (req, res) => {
    try {
        await personaService.deletePersona(req.params.id);
        res.json({ message: "Eliminado correctamente" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};