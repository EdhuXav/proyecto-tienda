
const proveedorService = require('./proveedor.service');

exports.getProveedor = async (req,res) => {
    try {
        const data = await proveedorService.getAllProveedor();
        res.json(data);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

exports.createProveedor = async (req,res) => {
    try {
        const data = await proveedorService.createProveedor(req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}
exports.updateProveedor = async (req,res) => {
    try {
        const data = await proveedorService.updateProveedor(req.params.id ,req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

exports.deleteProveedor = async (req,res) => {
    try {
        const data = await proveedorService.deleteProveedor(req.params.id ,req.body);
        res.json({message: "Eliminado correctamente"});
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}


