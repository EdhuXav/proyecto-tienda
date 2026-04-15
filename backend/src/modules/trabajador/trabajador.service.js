const prisma = require('../../prisma/client');

exports.getAllTrabajador = async () => {
    return await prisma.trabajador.findMany({
        include: {
            persona: true  
        }
    });
};

// Buscar Trabajador por ID 
exports.getTrabajadorId = async (id) => {
    return await prisma.trabajador.findUnique({
        where: { id_trabajador: Number(id) },
        include: {
            persona: true  
        }
    });
};

//Crear (Insertar)
exports.createTrabajador = async (data) => {
    return await prisma.trabajador.create({data,});
};

//Update
exports.updateTrabajador = async (id, data) => {
    return await prisma.trabajador.update({
        where: {id_trabajador: Number(id)}, data,
    });
};

//Delete
exports.deleteTrabajador = async (id) => {
    return await prisma.trabajador.delete({
        where: {id_trabajador: Number(id)},
    });
};