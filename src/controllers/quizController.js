var quizModel = require("../models/quizModel");

function listarPerguntasComRespostas(req, res) {

    const idQuiz = parseInt(req.params.id);

    if (isNaN(idQuiz)) {
        return res.status(400).send("ID do quiz inválido.");
    }

    quizModel.buscarPerguntasComRespostas(Number(idQuiz))
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
