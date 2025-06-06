var database = require("../database/config");

function exibirTentativas(idUsuario, idQuiz) {
    var instrucao = `
    SELECT idTentativa AS tentativa,
        fkUsuario as id_usuario, 
        fkQuiz as id_quiz,
        pontuacao as pontuacao
    FROM Dashboard 
    WHERE fkUsuario = ${idUsuario} AND 
    fkQuiz = ${idQuiz}
    ORDER BY idTentativa;
    `;

    return database.executar(instrucao);
}

function mediaPontuacao(idQuiz, idUsuario) {
    var instrucao = `
    SELECT AVG(pontuacao) AS media_pontuacao FROM Dashboard
    WHERE fkUsuario = ${idUsuario} AND fkQuiz = ${idQuiz};
    `;

    return database.executar(instrucao);
}

function maxPontuacao(idQuiz, idUsuario) {
    var instrucao = `
    SELECT max(pontuacao) AS max_pontuacao FROM Dashboard
    WHERE fkUsuario = ${idUsuario} AND fkQuiz = ${idQuiz};
    `;

    return database.executar(instrucao);
}

function qtdTentativa(idQuiz, idUsuario) {
    var instrucao = `
    SELECT COUNT(idTentativa) AS qtd_tentativas FROM Dashboard
    WHERE fkUsuario = ${idUsuario} AND fkQuiz = ${idQuiz};
    `;

    return database.executar(instrucao);
}

function elementoQuiz(idQuiz) {
    var instrucao = `
    SELECT elementoQuiz FROM Quiz
    WHERE idQuiz = ${idQuiz};
    ;`

    return database.executar(instrucao);
}

module.exports = {
    exibirTentativas, 
    mediaPontuacao,
    maxPontuacao,
    qtdTentativa, 
    elementoQuiz
}