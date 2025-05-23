var database = require("../database/config");

function buscarPerguntasComRespostas() {
    var instrucao = `
        SELECT 
            p.idPergunta,
            p.pergunta,
            r.resposta
        FROM Perguntas p
        JOIN Resposta r ON r.fkPergunta = p.idPergunta
        WHERE p.fkQuiz = 1
        ORDER BY p.idPergunta;
    `;

    return database.executar(instrucao);
}

module.exports = {
    buscarPerguntasComRespostas
};
