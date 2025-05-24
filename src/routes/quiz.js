var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

router.get("/perguntas/:id", function (req, res) {
    quizController.listarPerguntasComRespostas(req, res);
});

module.exports = router;
