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
idTentativa INT AUTO_INCREMENT,
fkUsuario INT,
fkQuiz INT, 
CONSTRAINT fkDashUser FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(idUsuario), 
CONSTRAINT fkDashQuiz FOREIGN KEY (fkQuiz)
	REFERENCES Quiz(idQuiz), 
PRIMARY KEY(idTentativa, fkUsuario, fkQuiz), 
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
(default, "Mun Rá - Sabotage", 5), 
(default, "Criolo", 6), 
(default, "GOG", 7), 
(default, "2003", 8), 
(default, "Carlos Marighella", 9), 
(default, "Álbum Sobrevivendo no Inferno, do grupo Racionais MC'S", 10);

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
	JOIN Perguntas AS p
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

-- inserts do quiz de graffiti
INSERT INTO Perguntas(pergunta, fkQuiz) VALUES
("Qual cidade é considerada o berço do Graffiti no Brasil?", 4),
("Qual o nome real da dupla de artistas 'Os Gêmeos'?", 4), 
("Qual característica diferencia o Graffiti da pixação?", 4),
("O que é uma Crew?", 4), 
("Que função social o graffiti passou a cumprir nas comunidades brasileiras?", 4), 
("O Graffiti nacional tem forte ligação com qual movimento cultural?", 4), 
("Em qual década houve um grande crescimento dos Crews no país?", 4), 
("Além dos 'Gêmeos', Qual o outro famoso graffiteiro brasileiro, com fama internacional?", 4), 
("Qual desses artistas iniciou sua carreira pintando trens e metrôs em São Paulo?", 4), 
("Qual é uma das formas que o graffiti contribui com a educação nas comunidades?", 4);

SELECT * FROM Perguntas WHERE fkQuiz = 4;

INSERT INTO Resposta(resposta, fkPergunta) VALUES
("São Paulo", 11), 
("Otávio e Gustavo Pandolfo", 12), 
("O graffiti é considerado arte, e a pichação, protesto visual", 13), 
("Grupo de grafiteiros que atuam juntos", 14), 
("Forma de expressão e resistência cultural", 15), 
("Hip Hop", 16), 
("Anos 80", 17), 
("Eduardo 'Kobra'", 18), 
("Tinho", 19), 
("Oferecendo oficinas de arte urbana e cidadania", 20);

SELECT * FROM Resposta;

SELECT p.pergunta,
        r.idResposta, 
        r.resposta
        FROM Resposta AS r
        JOIN Perguntas AS p
        ON p.idPergunta = r.fkPergunta
        WHERE p.fkQuiz = 4;

INSERT INTO Perguntas(pergunta, fkQuiz) VALUES 
("Como se chamam os praticantes do Breakdance?", 3), 
("Quem é considerado um dos pioneiros do breakdance no Brasil, com atuação desde os anos 1980?", 3), 
("Qual desses grupos ajudou a expandir o cenário do Breakdance no Brasil?", 3), 
("Qual importante evento internacional de Breakdance já contou com brasileiros como finalistas ou campeões?", 3), 
("O breakdance se tornou oficialmente uma modalidade olímpica em qual edição dos Jogos Olímpicos?", 3), 
("Como o breakdance tem impactado positivamente jovens de periferia no país?", 3), 
("Qual desses artistas é conhecido por incentivar o break nas periferias através de projetos sociais?", 3), 
("Qual das opções representa um elemento tradicional das batalhas de Breakdance?", 3), 
("O que significa a sigla 'B-Boy'?", 3), 
("Qual é a principal música usada nas batalhas de breakdance?", 3);

SELECT * FROM Perguntas WHERE fkQuiz = 3;

INSERT INTO Resposta(resposta, fkPergunta) VALUES
("B-Boys e B-Girls", 21), 
("Marcelinho Back Spin", 22), 
("Street Warriors", 23), 
("Red Bull BC One", 24), 
("Jogos Olímpicos de Paris - 2024", 25), 
("Promovendo inclusão, disciplina e expressão artística", 26), 
("Nelson Triunfo", 27), 
("Cypher(roda de dança)", 28), 
("Break-Boy", 29), 
("Breakbeat e Funk americano dos anos 70/80", 30);


INSERT INTO Perguntas(pergunta, fkQuiz) VALUES
("O que é o Scratch?", 2), 
("Como era as unidades de mídia, que continham as músicas, que os DJs utilizavam no ínicio?", 2), 
("Considerado um pioneiro entre os DJs do Brasil, tendo iniciado sua carreira desde a década de 80. Qual o seu nome?", 2), 
("Qual equipamento é fundamental para a técnica de 'Scratching'?", 2), 
("O termo 'discotecagem' se refere a: ", 2), 
("Qual o famoso DJ, que compõe o grupo de rap Racionais MC'S?", 2), 
("Qual o papel tradicional do DJ?", 2), 
("O DJ é considerado qual dos quatro elementos do Hip Hop?", 2), 
("Qual gênero de música foi mais sampleada pelos DJs de Hip Hop no Brasil nas décadas de 80 e 90?", 2), 
("Na década de 1990, qual meio de comunicação foi essencial para a difusão da cultura DJ e do rap nacional?", 2);

SELECT * FROM Perguntas WHERE fkQuiz = 2;

INSERT INTO Resposta(resposta, fkPergunta) VALUES
("Movimento de mexer no disco/vinil durante a reprodução da música, gerando um novo som", 31), 
("Disco/Vinil", 32), 
("DJ Hum", 33), 
("Toca-discos", 34), 
("Mixar músicas ao vivo com vinis ou digitais", 35),
("DJ KL Jay", 36), 
("Criar batidas, mixar músicas e animar festas", 37), 
("O primeiro elemento", 38), 
("Funk e Soul", 39), 
("Rádios comunitárias", 40);

SELECT * FROM Resposta;

INSERT INTO Perguntas(pergunta, fkQuiz) VALUES 
("Qual o artista reconhecido como fundador e precursor do Hip Hop?", 5), 
("O que é o SLAM?", 5), 
("Qual é considerado o berço do Hip Hop, localizado nos Estados Unidos?", 5), 
("Em qual década o Hip Hop surgiu nos Estados Unidos?", 5), 
("Qual a importância do filme 'Wild Style(1983)' para o Hip Hop?", 5), 
("Qual o nome de uma famosa estação de rádio brasileira focada em Hip Hop?", 5), 
("Qual foi a importância do programa 'Yo! MTV Raps', lançado em 1988?", 5), 
("Qual desses estilos musicais influenciou diretamente o nascimento do Hip Hop?", 5),
("Qual rapper americano se destacou nos anos 90 com o disco 'Illmatic'?", 5), 
("Qual foi o impacto cultural do hip hop nas periferias do Brasil e como ele transformou a expressão da juventude?", 5);

SELECT * FROM Perguntas WHERE fkQuiz = 5;

INSERT INTO Resposta(resposta, fkPergunta) VALUES
("DJ Kool Herc", 41), 
("Competição de poesia falada onde poetas recitam versos autorais em frente a um público", 42), 
("Bronx, Nova York", 43), 
("Anos 70", 44),
("Primeira obra cinematográfica a retratar todos os quatro elementos do Hip Hop", 45),
("Espaço Rap - 105 FM", 46), 
("Primeira obra cinematográfica a retratar todos os quatro elementos do Hip Hop", 47), 
("Disco e Funk", 48), 
("Nas", 49), 
("Fortaleceu a identidade cultural, promoveu inclusão social e deu voz às comunidades marginalizadas", 50);

SELECT p.pergunta,
        r.idResposta, 
        r.resposta
        FROM Resposta AS r
        JOIN Perguntas AS p
        ON p.idPergunta = r.fkPergunta
        WHERE p.fkQuiz = 5;
        
SELECT * FROM Dashboard;

SELECT idTentativa AS tentativa,
        fkUsuario as id_usuario, 
        fkQuiz as id_quiz,
        pontuacao as pontuacao
    FROM Dashboard 
    WHERE fkUsuario = 1 AND 
    fkQuiz = 1
    ORDER BY idTentativa;

SELECT COUNT(idTentativa), elementoQuiz FROM Dashboard -- TENTATIVAS POR ELEMENTO
	JOIN Quiz
    ON fkQuiz = idQuiz
    WHERE fkUsuario = 1
    GROUP BY idQuiz;
    
SELECT ROUND(AVG(pontuacao),1) FROM Dashboard
	WHERE fkUsuario = 1; -- PONTUAÇÃO MÉDIA GERAL

SELECT COUNT(idTentativa) FROM Dashboard
	WHERE fkUsuario = 1; -- total de tentativas (todos os quizzes)

SELECT COUNT(MAX(idTentativa)) AS qtdTentativa, 
    elementoQuiz AS quiz
    FROM Dashboard
    JOIN Quiz
    ON fkQuiz = idQuiz
    WHERE fkUsuario = 2
    GROUP BY idQuiz;

SELECT elementoQuiz AS Quiz FROM Quiz
	ORDER BY idQuiz;
    
SELECT ROUND(AVG(pontuacao),1) AS pontuacao_media, 
		elementoQuiz AS quiz 
        FROM Dashboard
        JOIN Quiz 
        ON fkQuiz = idQuiz
        WHERE fkUsuario = 1
		GROUP BY fkQuiz;
        
SELECT * FROM Dashboard 
	WHERE fkUsuario = 4;
    
SELECT elementoQuiz AS quiz,
	COUNT(idTentativa) AS qtdTentativa
    FROM Dashboard
    JOIN Quiz
    ON fkQuiz = idQuiz
    WHERE fkUsuario = 4
    GROUP BY idQuiz;
    HAVING COUNT(idTentativa) > (SELECT COUNT(idTentativa), elementoQuiz
									FROM Dashboard
                                    JOIN Quiz
                                    ON fkQuiz = idQuiz
									WHERE fkUsuario = 4);