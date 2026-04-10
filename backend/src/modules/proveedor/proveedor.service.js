const prisma = require('../../prisma/client');

exports.getAllProveedor = async () => {
    return await prisma.proveedor.findMany();
};

exports.createProveedor = async (data) => {
    return await prisma.proveedor.create({data,});
};

exports.updateProveedor = async (id,data) => {
    return await prisma.proveedor.update({
    where: {id_proveedor: Number(id)}, data, });
};

exports.deleteProveedor = async (id) => {
    return await prisma.proveedor.delete({
        where: {id_proveedor: Number(id) }
    });
};