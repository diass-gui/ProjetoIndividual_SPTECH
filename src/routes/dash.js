var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/dashboard/:idquiz/:idusuario", function(req, res) {
    dashController.exibirMedia(req, res);
});

router.get("/pontuacao/:idquiz/:idusuario", function(req, res) {
    dashController.exibirMaxPontuacao(req, res);
});

router.get("/tentativas/:idquiz/:idusuario", function(req, res) {
    dashController.exibirQtdTentativa(req, res);
});

router.get("/grafico/:idquiz/:idusuario", function(req, res) {
    dashController.exibirDados(req, res);
});

router.get("/elemento/:idquiz", function(req, res) {
    dashController.exibirElementoQuiz(req, res);
});

module.exports = router;