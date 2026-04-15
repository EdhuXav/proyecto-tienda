const UsuarioService = require('./usuario.service');

exports.getUsuario = async (req, res) => {
    try{
        const data = await UsuarioService.getAllUsuario();
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message});
    }                                                  
}
 
exports.getUsuarioId = async (req, res) => {
    try {
        const data = await UsuarioService.getUsuarioId(req.params.id,);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.creaUsuario = async (req, res) => {
  try {
    const data = await UsuarioService.createUsuario(req.body);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateUsuario = async (req, res) => {
    try {
        const actualizada = await UsuarioService.updateUsuario(
            req.params.id,
            req.body
        );
        res.json(actualizada);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deleteUsuario = async (req, res) => {
    try {
        await UsuarioService.deleteUsuario(req.params.id);
        res.json({ message: "Usuario eliminado correctamente" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};