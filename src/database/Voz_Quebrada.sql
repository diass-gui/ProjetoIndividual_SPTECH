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

CREATE TABLE Alternativa (
    idAlternativa INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(150),
    correta BOOLEAN,
    fkPergunta INT,
    FOREIGN KEY (fkPergunta) REFERENCES Perguntas(idPergunta)
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

INSERT INTO Alternativa(texto, correta, fkPergunta) VALUES
("Sobrevivendo no Inferno", false, 1), 
("Hip Hop - Cultura de Rua", true, 1), 
("Pergunte A Quem Conhece", false, 1), 
("Escolha O Seu Caminho", false, 1), 
("Cores e Valores", false, 2), 
("Holocausto Urbano", false, 2), 
("Nada Como Um Dia Após O Outro Dia", false, 2), 
("Raio X do Brasil", true, 2), 
("Detentos do Rap", false, 3), 
("Sistema Negro", false, 3), 
("509-E", true, 3), 
("RZO", false, 3), 
("BK", true, 4), 
("Djonga", false, 4), 
("Froid", false, 4), 
("Don L", false, 4), 
("Convoque Seu Buda - Criolo", false, 5), 
("Mil Faces De Um Homem Leal - Racionais", false, 5), 
("Se Tu Lutas, Tu Conquistas - SNJ", false, 5), 
("Mun Rá - Sabotage", true, 5), 
("Criolo", true, 6), 
("Dexter", false, 6), 
("Eduardo Taddeo (Facção Central)", false, 6), 
("Marcelo D2", false, 6), 
("Edi Rock", false, 7), 
("GOG", true, 7), 
("Kaskão", false, 7), 
("MV Bill", false, 7),
("2000", false, 8), 
("1998", false, 8), 
("2006", false, 8), 
("2003", true, 8), 
("Carlos Marighella", true, 9), 
("Malcolm X", false, 9), 
("Tim Maia", false, 9), 
("Jorge Ben Jor", false, 9), 
("Álbum Sobrevivendo no Inferno, do grupo Racionais MC'S", true, 10), 
("Álbum Rap É Compromisso, do artista Sabotage", false, 10), 
("Álbum Provérbios 13, do grupo 509-E", false, 10), 
("Álbum Castelos & Ruínas, do artista BK", false, 10);


-- INSERT INTO Resposta VALUES 
-- (default, "Hip Hop - Cultura de Rua", 1), 
-- (default, "Raio X do Brasil", 2), 
-- (default, "509-E", 3), 
-- (default, "BK", 4), 
-- (default, "Mun Rá - do rapper Sabotage", 5), 
-- (default, "O rapper Criolo", 6), 
-- (default, "GOG", 7), 
-- (default, "2003", 8), 
-- (default, "Carlos Marighella", 9), 
-- (default, "Álbum Sobrevivendo no Inferno, do grupo Racionais MC'S", 10);

SELECT * FROM Alternativa;

SELECT quiz.elementoQuiz AS 'Elemento do quiz', 
	p.pergunta AS 'Pergunta', 
    a.texto AS 'Alternativa', 
    a.correta AS 'Resposta',
    (
    CASE
		WHEN a.correta = false THEN a.correta = "Resposta Incorreta"
        WHEN a.correta = true THEN a.correta = "Resposta Correta"
	END
    )
    FROM Alternativa AS a
    JOIN Perguntas AS p
    ON p.idPergunta = a.fkPergunta
    JOIN Quiz as quiz
    ON quiz.idQuiz = p.fkQuiz;

SELECT * FROM Usuario;

