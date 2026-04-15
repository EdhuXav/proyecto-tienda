const authService = require("./login.service");

exports.login = async (req, res) => {
    try {
        const { usuario, password } = req.body;

        const result = await authService.login(usuario, password);

        if (result.success) {
            res.json(result);
        } else {
            res.status(401).json(result);
        }

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};