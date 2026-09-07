-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE tomatix;

USE tomatix;

-- CRIAÇÃO DA TABELA USUÁRIO 
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL,
    telefone CHAR(12),
    dtCadastro DATETIME DEFAULT NOW(),
    nomeEmpresa VARCHAR(100),
    nivel VARCHAR(12) CHECK(nivel IN('adm', 'funcionario'))
);

-- CRIAÇÃO DA TABELA EMPRESA
CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    dtCadastro  DATETIME DEFAULT NOW()
);

-- CRIAÇÃO DA TABELA ESTUFA
CREATE TABLE estufa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(100), 
    nome VARCHAR(50) NOT NULL, 
	area DECIMAL(10,2) NOT NULL,
    dtInicio DATE,
    statusEstufa VARCHAR(10),
    CONSTRAINT chStatusEstufa CHECK(statusEstufa IN('ativa','desativada'))
);

-- CRIAÇÃO DA TABELA SENSOR
CREATE TABLE sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstufa VARCHAR(50), 
    dtAtivacao DATE,
    statusSensor VARCHAR(10),
    CONSTRAINT chStatusSensor CHECK(statusSensor IN('ativado','desativado'))
);


-- CRIAÇÃO DA TABELA REGISTRO
CREATE TABLE registroLuminosidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idSensor INT, 
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    valorLeitura DECIMAL(8,2) NOT NULL -- Recebe valor em LUX 
);


