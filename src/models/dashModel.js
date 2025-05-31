var database = require("../database/config");

// function exibirTentativa(idUsuario, idQuiz) {
//     var instrucao = `
//     SELECT idTentativa, ${idUsuario}, ${idQuiz}, pontuacao FROM Dashboard AS d
//     JOIN Usuario AS u
//     ON u.idUsuario = d.${idUsuario}
//     JOIN Quiz AS q
//     ON q.idQuiz = d.${idQuiz};
//     `;

//     return database.executar(instrucao);
// }

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

module.exports = {
    // exibirTentativa, 
    mediaPontuacao,
    maxPontuacao,
    qtdTentativa
}