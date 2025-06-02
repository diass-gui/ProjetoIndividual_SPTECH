var visaoGeralModel = require("../models/visaoGeralModel");

function exibirMediaGeral(req, res) {

    console.log(req.params);
    const idUsuario = parseInt(req.params.idusuario);

    visaoGeralModel.MediaGeral(idUsuario) 
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar a média geral: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar a média geral.");
    });

}

function exibirQuizMaisAcessado(req, res) {

    console.log(req.params);
    const idUsuario = parseInt(req.params.idusuario);

    visaoGeralModel.quizMaisAcessado(idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar o quiz mais acessado: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar o quiz mais acessado.");
    });

}

function exibirTotalTentativas(req, res) {

    console.log(req.params);
    const idUsuario = parseInt(req.params.idusuario);

    visaoGeralModel.TotalTentativas(idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar o total de tentativas: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar o total de tentativas.");
    });

}

function exibirDadosQuizzes(req, res) {

    console.log(req.params);
    const idUsuario = parseInt(req.params.idusuario);

    visaoGeralModel.Quizzes(idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar os quizzes: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar os quizzes.");
    });
}

function exibirTentativasPorQuiz(req, res) {

    console.log(req.params);
    const idUsuario = parseInt(req.params.idusuario);

    visaoGeralModel.tentativasPorQuiz(idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar as tentativas por quiz: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar as tentativas por quiz.");
    });
}

module.exports = {
    exibirMediaGeral,
    exibirQuizMaisAcessado,
    exibirTotalTentativas,
    exibirDadosQuizzes,
    exibirTentativasPorQuiz
}