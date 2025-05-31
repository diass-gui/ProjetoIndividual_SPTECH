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

module.exports = {
    exibirDados, 
    exibirMedia,
    exibirMaxPontuacao,
    exibirQtdTentativa
}