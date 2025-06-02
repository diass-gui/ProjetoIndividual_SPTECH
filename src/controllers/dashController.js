var dashModel = require("../models/dashModel");

function exibirDados(req, res) {

    console.log(req.params);
    const idQuiz = parseInt(req.params.idquiz);
    const idUsuario = parseInt(req.params.idusuario);

    dashModel.exibirTentativas(idUsuario, idQuiz)
            .then(resultado => {
                res.json(resultado); // envia os dados como JSON
            })
            .catch(erro => {
                console.error("Erro ao buscar os dados das tentativas: ", erro.sqlMessage);
                res.status(500).send("Erro ao buscar os dados das tentativas.");
            });
}

function exibirMedia(req, res) {

    console.log(req.params);
    const idQuiz = parseInt(req.params.idquiz);
    const idUsuario = parseInt(req.params.idusuario);

    dashModel.mediaPontuacao(idQuiz, idUsuario) 
        .then(resultado => {
                res.json(resultado); // envia os dados como JSON
            })
            .catch(erro => {
                console.error("Erro ao buscar média: ", erro.sqlMessage);
                res.status(500).send("Erro ao buscar a média.");
            });
    }
    
function exibirMaxPontuacao(req, res) {

    console.log(req.params);
    const idQuiz = parseInt(req.params.idquiz);
    const idUsuario = parseInt(req.params.idusuario);

    dashModel.maxPontuacao(idQuiz, idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar a pontuação máxima: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar a pontuação máxima.");
    });

}

function exibirQtdTentativa(req, res) {

    console.log(req.params);
    const idQuiz = parseInt(req.params.idquiz);
    const idUsuario = parseInt(req.params.idusuario); 

    dashModel.qtdTentativa(idQuiz, idUsuario)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar a quantidade de tentativas: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar a quantidade de tentativas.");
    });

}

function exibirElementoQuiz(req, res) {
    
    console.log(req.params);
    const idQuiz = parseInt(req.params.idquiz);

    dashModel.elementoQuiz(idQuiz)
    .then(resultado => {
        res.json(resultado);
    })
    .catch(erro => {
        console.error("Erro ao buscar elemento do quiz: ", erro.sqlMessage);
        res.status(500).send("Erro ao buscar o elemento do quiz.");
    });

}

module.exports = {
    exibirDados, 
    exibirMedia,
    exibirMaxPontuacao,
    exibirQtdTentativa, 
    exibirElementoQuiz
}