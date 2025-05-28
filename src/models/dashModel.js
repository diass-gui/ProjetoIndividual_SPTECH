var database = require("../database/config");

function inserirPontuacao(idUsuario, idQuiz, pontuacao) {
    var instrucao = `INSERT INTO Dashboard VALUES
    (${idUsuario}, ${idQuiz}, default, ${pontuacao});`;

    return database.executar(instrucao);
}

function exibirDadosTentativa(idUsuario, idQuiz)

module.exports {
    inserirPontuacao, 

}