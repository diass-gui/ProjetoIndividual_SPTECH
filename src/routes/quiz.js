var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

router.get("/perguntas/:id", function (req, res) {
    quizController.listarPerguntas(req, res);
});

router.get("/respostas/:id", function (req, res) {
    quizController.listarRespostas(req, res);
});

router.post("/dashboard/", function(req, res) {
    quizController.enviarPontuacao(req, res);
});

module.exports = router;
