const prisma = require('../../prisma/client');

exports.getAllUsuario = async () => {
    return await prisma.usuario.findMany();
};

// Buscar usuario por ID 
exports.getUsuarioId = async (id) => {
    return await prisma.usuario.findUnique({
        where: { id_usuario: Number(id) }
    });
};

//Crear (Insertar)
exports.createUsuario = async (data) => {
    return await prisma.usuario.create({data,});
};

//Update
exports.updateUsuario = async (id, data) => {
    return await prisma.usuario.update({
        where: {id_usuario: Number(id)}, data,
    });
};

//Delete
exports.deleteUsuario = async (id) => {
    return await prisma.usuario.delete({
        where: {id_usuario: Number(id)},
    });
};