const productoService = require('./producto.service');

exports.getProductos = async(req, res) => {
    try{
        const data = await productoService.getAllProductos();
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message})
    }
}

exports.createProducto = async(req, res) => {
    try {
        const data = await productoService.createProducto(req.body);
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message})
    }
}

exports.updateProducto = async(req, res) => {
    try{
        const actualizada = await productoService.updateProducto(
            req.params.id, req.body
        );
        res.json(actualizada);
    } catch(error){
        res.status(500).json({ error: error.message });
    }
}

exports.deleteProducto = async(req, res) => { 
    try{
        const data = await productoService.deleteProducto(req.params.id)
        res.json({message: "Producto eliminado correctamente"});
    } catch(error){
        res.status(500).json({ error: error.message });
    }
}