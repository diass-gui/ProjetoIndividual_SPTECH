var database = require("../database/config");

function buscarPerguntas(idQuiz) {
    var instrucao = `
        SELECT 
            p.idPergunta,
            p.pergunta
        FROM Perguntas p
        JOIN Quiz AS q
        ON q.idQuiz = p.fkQuiz
        WHERE p.fkQuiz = ${idQuiz};
    `;

    return database.executar(instrucao);
}

function buscarRespostas(idQuiz) {
    var instrucao = `
    SELECT 
        r.idResposta, 
        r.resposta
        FROM Resposta AS r
        JOIN Perguntas AS p
        ON p.idPergunta = r.fkPergunta
        WHERE p.fkQuiz = ${idQuiz};
    `;

    return database.executar(instrucao);
}

function enviarTentativa(idQuiz, idUsuario, pontuacao) {
    var instrucao = `
    INSERT INTO Dashboard(fkUsuario, fkQuiz, pontuacao) VALUES 
    ('${idUsuario}', '${idQuiz}', '${pontuacao}');
    `;

    return database.executar(instrucao);
}

module.exports = {
    buscarPerguntas, 
    buscarRespostas, 
    enviarTentativa
};
