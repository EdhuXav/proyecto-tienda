const prisma = require('../../prisma/client');

exports.login = async (usuario, password) => {

    // Buscar usuario
    const user = await prisma.usuario.findFirst({
        where: {
            username: usuario,
            activo: true
        }
    });

    if (!user) {
        return {
            success: false,
            message: "Usuario no existe"
        };
    }

    // Comparar contraseña directamente
    if (password !== user.password_hash) {
        return {
            success: false,
            message: "Contraseña incorrecta"
        };
    }

    return {
        success: true,
        message: "Login exitoso",
        user: user
    };
};