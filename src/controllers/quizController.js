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

function enviarPontuacao(req, res) {

    const idQuiz = parseInt(req.body.idQuizServer);
    const idUsuario = req.body.idUsuarioServer;
    var qtdAcertos = req.body.pontuacaoServer;
    console.log(req.body);

    if (isNaN(idQuiz)) {
        return res.status(400).send("ID do quiz inválido.");
    }

    quizModel.enviarTentativa(idQuiz, idUsuario, qtdAcertos)
        .then(resultado => {
            res.json(resultado); 
        })
        .catch(erro => {
            console.error("Erro ao buscar perguntas e respostas: ", erro.sqlMessage);
            res.status(500).send("Erro ao buscar perguntas e respostas.");
        });

}

module.exports = {
    listarPerguntas, 
    listarRespostas, 
    enviarPontuacao
};
