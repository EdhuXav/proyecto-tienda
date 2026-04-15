const prisma = require('../../prisma/client');

exports.getAllPermiso = async () => {
    return await prisma.permiso.findMany();
};

// Buscar permiso por ID 
exports.getPermisoId = async (id) => {
    return await prisma.permiso.findUnique({
        where: { id_permiso: Number(id) }
    });
};

//Crear (Insertar)
exports.createPermiso = async (data) => {
    return await prisma.permiso.create({data,});
};

//Update
exports.updatePermiso = async (id, data) => {
    return await prisma.permiso.update({
        where: {id_permiso: Number(id)}, data,
    });
};

//Delete
exports.deletePermiso = async (id) => {
    return await prisma.permiso.delete({
        where: {id_permiso: Number(id)},
    });
};