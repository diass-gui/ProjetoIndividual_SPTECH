var database = require("../database/config");

function buscarPerguntasComRespostas(idQuiz) {
    var instrucao = `
        SELECT 
            p.idPergunta,
            p.pergunta,
            r.resposta
        FROM Perguntas p
        JOIN Resposta r ON r.fkPergunta = p.idPergunta
        WHERE p.fkQuiz = ${idQuiz}
        ORDER BY p.idPergunta;
    `;

    return database.executar(instrucao);
}

module.exports = {
    buscarPerguntasComRespostas
};
