const PermisoService = require('./permiso.service');

exports.getPermiso = async (req, res) => {
    try{
        const data = await PermisoService.getAllPermiso();
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message});
    }                                                  
}
 
exports.getPermisoId = async (req, res) => {
    try {
        const data = await PermisoService.getPermisoId(req.params.id,);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.creaPermiso = async (req, res) => {
  try {
    const data = await PermisoService.createPermiso(req.body);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updatePermiso = async (req, res) => {
    try {
        const actualizada = await PermisoService.updatePermiso(
            req.params.id,
            req.body
        );
        res.json(actualizada);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deletePermiso = async (req, res) => {
    try {
        await PermisoService.deletePermiso(req.params.id);
        res.json({ message: "Permiso eliminado correctamente" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};