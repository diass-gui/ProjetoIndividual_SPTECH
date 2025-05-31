var dashModel = require("../models/dashModel");

function exibirDados(req, res) {
    
    const idQuiz = parseInt(req.params.id);
    const idUsuario = sessionStorage.ID_USUARIO;

    dashModel.exibirTentativa(idUsuario, idQuiz)
            .then(resultado => {
                res.json(resultado); // envia os dados como JSON
            })
            .catch(erro => {
                console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
                res.status(500).send("Erro ao buscar perguntas e respostas.");
            });

}

module.exports = {
    exibirDados
}