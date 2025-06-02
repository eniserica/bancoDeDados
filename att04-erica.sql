-- Att 04 

-- Fácil : Sistema de Controle de Tarefas Pessoais (To-Do List)

CREATE DATABASE toDoListErica ;
USE toDoListErica;

CREATE TABLE tb_usuarios(
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    senha VARCHAR(10) NOT NULL,
    tarefas_id INT NOT NULL, 
    FOREIGN KEY (tarefas_id) REFERENCES tb_tarefas(id), 
    
	PRIMARY KEY (id)
); 

CREATE TABLE tb_tarefas(
	id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL, 
    dt DATE NOT NULL,
    statuss ENUM ('Pendente', 'Concluída') DEFAULT 'Pendente',
	categorias ENUM ('Trabalho', 'Pessoal', 'Estudos') DEFAULT null ,
    prioridade ENUM ('Baixa', 'Média', 'Alta') DEFAULT null,
    PRIMARY KEY (id)
);

-- Médio: Sistema de Vendas para Loja de Roupas 

CREATE DATABASE lojaDaErica ;
USE lojaDaErica ; 

CREATE TABLE tb_clientes (
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL, 
    
    PRIMARY KEY(id)
);

CREATE TABLE tb_produtos(
	id INT NOT NULL AUTO_INCREMENT, 
    tamanho INT NOT NULL, 
    cor VARCHAR(255) NOT NULL, 
    categoria VARCHAR(255) NOT NULL, 
    preco INT NOT NULL, 
    estoque INT NOT NULL, 

    PRIMARY KEY(id)
);

CREATE TABLE tb_vendas(
	id INT NOT NULL AUTO_INCREMENT, 
    cliente_id INT NOT NULL, 
    forma_pagamento ENUM ('Debito', 'Credito', 'Pix', 'Boleto'),
    dt_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP, 
    produto_id INT NOT NULL, 
    quantidade INT NOT NULL, 
    precoUnitario INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES tb_produtos(id),
    FOREIGN KEY (cliente_id) REFERENCES tb_clientes(id),
	PRIMARY KEY(id)
);


-- Difícil: Plataforma de Ensino Online 
CREATE DATABASE ead_erica;
USE ead_erica;
CREATE TABLE tb_usuarios (
	id INT NOT NULL AUTO_INCREMENT, 
    categoria ENUM ('Professor', 'Aluno', 'Admin'), 
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, 
    senha VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(id)
);

CREATE TABLE tb_professor(
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    PRIMARY KEY(id)
);
CREATE TABLE tb_cursos(
	id INT NOT NULL AUTO_INCREMENT, 
    titulo_curso VARCHAR(255) NOT NULL,
    descricao MEDIUMTEXT NOT NULL, 
    
    PRIMARY KEY(id)
);