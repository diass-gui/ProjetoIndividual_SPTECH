var database = require("../database/config");

function MediaGeral(idUsuario) {
    var instrucao = `
    SELECT ROUND(AVG(pontuacao),1) AS media_geral FROM Dashboard
	WHERE fkUsuario = ${idUsuario};
    `;

    return database.executar(instrucao);
}

function quizMaisAcessado(idUsuario) {
    var instrucao = `
    SELECT COUNT(idTentativa) AS qtdTentativa, 
    elementoQuiz AS quiz
    FROM Dashboard
    JOIN Quiz
    ON fkQuiz = idQuiz
    WHERE fkUsuario = ${idUsuario}
    GROUP BY idQuiz
    ORDER BY qtdTentativa DESC
    LIMIT 1;
    `;

    return database.executar(instrucao);
}

function TotalTentativas(idUsuario) {
    var instrucao = `
    SELECT COUNT(idTentativa) AS qtdTentativa 
    FROM Dashboard 
    WHERE fkUsuario = ${idUsuario};
    `;

    return database.executar(instrucao);
}

function Quizzes(idUsuario) {
    var instrucao = `
    SELECT ROUND(AVG(pontuacao),1) AS pontuacao_media,
    elementoQuiz AS quiz
    FROM Dashboard
    JOIN Quiz 
    ON fkQuiz = idQuiz
    WHERE fkUsuario = ${idUsuario}
    GROUP BY idQuiz;
    `;

    return database.executar(instrucao);
}

function tentativasPorQuiz(idUsuario) {
    var instrucao = `
    SELECT COUNT(idTentativa) AS qtdTentativa, 
    elementoQuiz AS quiz
    FROM Dashboard
    JOIN Quiz
    ON fkQuiz = idQuiz
    WHERE fkUsuario = ${idUsuario}
    GROUP BY idQuiz;
    `;

    return database.executar(instrucao);
}

module.exports = {
    MediaGeral, 
    quizMaisAcessado,
    TotalTentativas,
    Quizzes,
    tentativasPorQuiz
}