var database = require("../database/config");

function inserirPontuacao(idUsuario, idQuiz, pontuacao) {
    var instrucao = `INSERT INTO Dashboard VALUES
    (${idUsuario}, ${idQuiz}, default, ${pontuacao});`;

    return database.executar(instrucao);
}

function exibirTentativa(idUsuario, idQuiz) {
    var instrucao = `
    SELECT idTentativa, ${idUsuario}, ${idQuiz}, pontuacao FROM Dashboard AS d
    JOIN Usuario AS u
    ON u.idUsuario = d.fkUsuario
    JOIN Quiz AS q
    ON q.idQuiz = d.fkQuiz
    `;

    return database.executar(instrucao);
}

module.exports = {
    inserirPontuacao,
    exibirTentativa
}