var quizModel = require("../models/quizModel");

function listarPerguntas(req, res) {

    const idQuiz = parseInt(req.params.id);

    if (isNaN(idQuiz)) {
        return res.status(400).send("ID do quiz inválido.");
    }

    quizModel.buscarPerguntas(idQuiz)
        .then(resultado => {
            res.json(resultado); // envia os dados como JSON
        })
        .catch(erro => {
            console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
            res.status(500).send("Erro ao buscar perguntas e respostas.");
        });

}

function listarRespostas(req, res) {

    const idQuiz = parseInt(req.params.id);

    if (isNaN(idQuiz)) {
        return res.status(400).send("ID do quiz inválido.");
    }

    quizModel.buscarRespostas(idQuiz)
        .then(resultado => {
            res.json(resultado); // envia os dados como JSON
        })
        .catch(erro => {
            console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
            res.status(500).send("Erro ao buscar perguntas e respostas.");
        });

}

function enviarResposta(req, res) {

    const idQuiz = parseInt(req.params.id);
    const idUsuario = sessionStorage.ID_USUARIO;
    var qtdAcertos = req.params.pontuacao;

    if (isNaN(idQuiz)) {
        return res.status(400).send("ID do quiz inválido.");
    }

    quizModel.enviarRespostas(idQuiz, idUsuario, qtdAcertos)
        .then(resultado => {
            res.json(resultado); // envia os dados como JSON
        })
        .catch(erro => {
            console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
            res.status(500).send("Erro ao buscar perguntas e respostas.");
        });

}

module.exports = {
    listarPerguntas, 
    listarRespostas, 
    enviarResposta
};
