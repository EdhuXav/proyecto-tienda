const prisma = require('../../prisma/client');

exports.getAllProductos = async () => {
    return await prisma.producto.findMany();
}

exports.createProducto = async (data) => {
    return await prisma.producto.create({data,});
}

exports.updateProducto = async (id, data) => {
    return await prisma.producto.update({
        where: {id_producto: Number(id)}, data,
    })
};

exports.deleteProducto = async (id) => {
    return await prisma.producto.delete({
        where : {id_producto: Number(id)}
    })
};