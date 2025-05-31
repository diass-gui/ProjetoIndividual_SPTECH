var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/dashboard/:id/:usuarios", function(req, res) {
    dashController.exibirDados(req, res);
});

module.exports = router;