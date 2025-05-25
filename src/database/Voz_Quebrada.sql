CREATE DATABASE Voz_Quebrada;

USE Voz_Quebrada; 

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(60), 
email VARCHAR(60), 
dtNasc DATE,
senha VARCHAR(30)
);

CREATE TABLE Quiz (
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
elementoQuiz VARCHAR(20)
);

CREATE TABLE Perguntas (
idPergunta INT AUTO_INCREMENT,
pergunta VARCHAR(500), 
fkQuiz INT, 
CONSTRAINT fkQuiz FOREIGN KEY(fkQuiz) 
	REFERENCES Quiz(idQuiz), 
CONSTRAINT pkComposta PRIMARY KEY (idPergunta, fkQuiz)
);

CREATE TABLE Resposta (
idResposta INT AUTO_INCREMENT,
resposta VARCHAR(150), 
fkPergunta INT, 
CONSTRAINT fkPergunta FOREIGN KEY (fkPergunta)
	REFERENCES Perguntas(idPergunta), 
CONSTRAINT pkCompostaResp PRIMARY KEY(idResposta, fkPergunta)
);

CREATE TABLE Dashboard (
fkUsuario INT,
fkQuiz INT,
idTentativa INT, 
CONSTRAINT fkDashUser FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(idUsuario), 
CONSTRAINT fkDashQuiz FOREIGN KEY (fkQuiz)
	REFERENCES Quiz(idQuiz), 
CONSTRAINT pkCompostaDash PRIMARY KEY(fkUsuario, fkQuiz, idTentativa), 
pontuacao INT
);

INSERT INTO Quiz VALUES 
(default, "Rap/MC"), 
(default, "DJ"), 
(default, "Breakdance"), 
(default, "Graffiti"), 
(default, "Especial");

SELECT * FROM Quiz;

INSERT INTO Perguntas VALUES 
(default, "Qual o nome do primeiro disco/álbum de rap lançado no Brasil?", 1), 
(default, "Qual o nome do primeiro álbum do grupo de rap Racionais MC'S?", 1), 
(default, "Qual grupo ficou conhecido por gravar um álbum, cumprindo pena no presídio do Carandiru, localizado em São Paulo?", 1), 
(default, "O álbum Castelos & Ruínas, lançado em 2016, pertence a qual artista?", 1), 
(default, "Identifique a música pelo trecho: 'Um branco e um preto unidos, resposta que cala o ridículo...", 1), 
(default, "Quem escreveu a música 'Não Existe Amor em SP'?", 1), 
(default, "Quem é o rapper apelidado como o 'Poeta do Rap Nacional'?", 1), 
(default, "Em qual ano foi lançado a música 'O Menino do Morro', do grupo de rap Facção Central?", 1), 
(default, "Qual personalidade é citada na música 'Mil Faces De Um Homem Leal', do grupo de rap Racionais MC'S?", 1), 
(default, "Qual obra do rap nacional é reconhecida como a 'Bíblia do Rap Nacional'?", 1);

SELECT * FROM Perguntas;

SELECT quiz.elementoQuiz AS 'Elemento do Quiz', 
	p.pergunta AS 'Pergunta'
    FROM Perguntas AS p
    JOIN Quiz AS quiz
    ON quiz.idQuiz = p.fkQuiz
    WHERE idQuiz = 1;

INSERT INTO Resposta VALUES 
(default, "Hip Hop - Cultura de Rua", 1), 
(default, "Raio X do Brasil", 2), 
(default, "509-E", 3), 
(default, "BK", 4), 
(default, "Mun Rá - do rapper Sabotage", 5), 
(default, "O rapper Criolo", 6), 
(default, "GOG", 7), 
(default, "2003", 8), 
(default, "Carlos Marighella", 9), 
(default, "Álbum Sobrevivendo no Inferno, do grupo Racionais MC'S", 10);

SELECT * FROM Alternativa;

SELECT quiz.elementoQuiz AS 'Elemento do quiz', 
	p.pergunta AS 'Pergunta', 
    r.resposta AS 'Resposta'
    FROM Resposta AS r
    JOIN Perguntas AS p
    ON p.idPergunta = r.fkPergunta
    JOIN Quiz as quiz
    ON quiz.idQuiz = p.fkQuiz;

SELECT * FROM Usuario;

SELECT 
	r.idResposta, 
	r.resposta
	FROM Resposta AS r
	JOIN Pergunta AS p
	ON p.idPergunta = r.fkPergunta
	WHERE fkQuiz = 1
ORDER BY r.idResposta;

SELECT 
	p.idPergunta,
	p.pergunta
	FROM Perguntas AS p
	JOIN Quiz AS q
	ON q.idQuiz = p.fkQuiz
	WHERE p.fkQuiz = 1;
