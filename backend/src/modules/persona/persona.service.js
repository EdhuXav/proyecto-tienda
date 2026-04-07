const prisma = require('../../prisma/client');

exports.getAllPersonas = async () => {
    return await prisma.persona.findMany();
};

//Crear (Insertar)
exports.createPersona = async (data) => {
    return await prisma.persona.create({data,});
};

//Update
exports.updatePersona = async (id, data) => {
    return await prisma.persona.update({
        where: {id_persona: Number(id)}, data,
    });
};

//Delete
exports.deletePersona = async (id) => {
    return await prisma.persona.delete({
        where: {id_persona: Number(id)},
    });
};
