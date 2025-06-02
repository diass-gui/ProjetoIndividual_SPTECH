var express = require("express");
var router = express.Router();

var visaoGeralController = require("../controllers/visaoGeralController");

router.get("/mediaGeral/:idusuario", function(req, res) {
    visaoGeralController.exibirMediaGeral(req, res);
});

router.get("/quizMaisAcesso/:idusuario", function(req, res) {
    visaoGeralController.exibirQuizMaisAcessado(req, res);
});

router.get("/totalTentativa/:idusuario", function(req, res) {
    visaoGeralController.exibirTotalTentativas(req, res);
});

router.get("/Quizzes/:idusuario", function(req, res) {
    visaoGeralController.exibirDadosQuizzes(req, res);
});

router.get("/tentativasQuizzes/:idusuario", function(req, res) {
    visaoGeralController.exibirTentativasPorQuiz(req, res);
});

module.exports = router;