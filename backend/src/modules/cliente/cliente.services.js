const prisma = require('../../prisma/client');

exports.getAllCliente = async () => {
    return await prisma.cliente.findMany({
        include: {
            persona: true  
        }
    });
};

// Buscar cliente por ID (incluyendo datos de persona)
exports.getClienteId = async (id) => {
    return await prisma.cliente.findUnique({
        where: { id_cliente: Number(id) },
        include: {
            persona: true  
        }
    });
};


//Crear (Insertar)
exports.createCliente = async (data) => {
    return await prisma.cliente.create({data,});
};

//Update
exports.updateCliente = async (id, data) => {
    return await prisma.cliente.update({
        where: {id_cliente: Number(id)}, data,
    });
};

//Delete
exports.deleteCliente = async (id) => {
    return await prisma.cliente.delete({
        where: {id_cliente: Number(id)},
    });
};