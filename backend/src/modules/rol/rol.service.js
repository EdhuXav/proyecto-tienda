const prisma = require('../../prisma/client');

exports.getAllRoles = async() => {
    return await prisma.rol.findMany();
};

exports.createRol = async() => {
    return await prisma.rol.create({data,});
}

exports.updateRol = async() => {
    return await prisma.rol.update({
        where : {id_rol: Number(id)}, data, 
    });
}

exports.deleteRol = async() => {
    return await prisma.rol.delete({
        where: {id_rol: Number(id)}
    });
}