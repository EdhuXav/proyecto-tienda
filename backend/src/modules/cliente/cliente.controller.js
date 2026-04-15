const Clienteservice = require('./cliente.services');

exports.getCliente = async (req, res) => {
    try{
        const data = await Clienteservice.getAllCliente();
        res.json(data)
    } catch(error){
        res.status(500).json({error: error.message});
    }                                                  
}
exports.getClienteId = async (req, res) => {
    try {
        const data = await Clienteservice.getClienteId(req.params.id,);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.creaCliente= async (req, res) => {
  try {
    const data = await Clienteservice.createCliente(req.body);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateCliente = async (req, res) => {
    try {
        const actualizada = await Clienteservice.updateCliente(
            req.params.id,
            req.body
        );
        res.json(actualizada);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deleteCliente = async (req, res) => {
    try {
        await Clienteservice.deleteCliente(req.params.id);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};