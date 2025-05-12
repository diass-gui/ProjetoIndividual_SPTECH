CREATE DATABASE Voz_Quebrada;

USE Voz_Quebrada; 

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(60), 
    email VARCHAR(60), 
    dtNasc DATE,
    senha VARCHAR(30)
);

