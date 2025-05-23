var quizModel = require("../models/quizModel");

function listarPerguntasComRespostas(req, res) {
    quizModel.buscarPerguntasComRespostas()
        .then(resultado => {
            res.json(resultado); // envia os dados como JSON
        })
        .catch(erro => {
            console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
            res.status(500).send("Erro ao buscar perguntas e respostas.");
        });
}

module.exports = {
    listarPerguntasComRespostas
};
