CREATE DATABASE atividades_erica; 
USE atividades_erica; 

-- Tabelas básicas Exercicio 1.1
CREATE TABLE livros (
id INT AUTO_INCREMENT NOT NULL, 
titulo VARCHAR(255) NOT NULL, 
dt_aquisicao DATE, 
PRIMARY KEY (id)
);
INSERT INTO livros (titulo, dt_aquisicao) VALUES
('Dom Casmurro', '2023-01-15'),
('O Senhor dos Anéis', '2022-06-30'),
('1984', '2024-03-10');
SELECT * FROM livros; 

CREATE TABLE emprestimos (
id INT AUTO_INCREMENT NOT NULL, 
livro_id INT NOT NULL, 
dt_emprestimo DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (livro_id) REFERENCES livros(id)
); 

INSERT INTO emprestimos (livro_id, dt_emprestimo) VALUES
(1, '2024-05-10'),
(2, '2024-05-15'),
(3, '2024-05-20');
SELECT * FROM emprestimos; 

-- Questão 1.1: Quais são as limitações dessa estrutura inicial para um sistema de biblioteca funcional? O sistema não tem cadastro de usuario, então não tem como saber pra quem foi feito o empréstimo. 

-- Parte 2: 
-- Exercicio 2.1 
ALTER TABLE livros ADD COLUMN autor VARCHAR(255) NOT NULL ; 
ALTER TABLE livros ADD COLUMN editora VARCHAR(255) NOT NULL; 
ALTER TABLE livros ADD COLUMN dt_publicacao YEAR NOT NULL ; 

-- Questão 2.1: Por que seria melhor ter uma tabela separada para autores em vez de apenas um campo na tabela de livros? Pra não sobrecarregar muito o sistema de livros já que um autor pode estar associado a mais de um livro; 

-- Exercicio 2.2 
ALTER TABLE livros ADD COLUMN ISBN VARCHAR(18) ; 
ALTER TABLE livros ADD COLUMN loc_fisica VARCHAR(255); 

-- Questão 2.2 : 
ALTER TABLE livros ADD COLUMN numeros_paginas INT NOT NULL; 

-- Parte 3: 

-- Exercício 3.1: Alterando Propriedades das Colunas -> 
ALTER TABLE livros MODIFY COLUMN titulo VARCHAR(655); 
ALTER TABLE livros MODIFY COLUMN ISBN CHAR(13); 

-- Exercício 3.2: Renomeando Colunas -> 
ALTER TABLE livros CHANGE COLUMN loc_fisica localizacao_livro DECIMAL(9,6); 

-- Questão 3.2: Qual a diferença entre os comandos MODIFY COLUMN e CHANGE COLUMN? Em quais situações você utilizaria cada um? o modify não permite alterar o nome da coluna, apenas a propriedade, enquanto o change pode alterar os dois juntos 

-- Parte 4: 
-- Exercício 4.1: Criando Tabela de Categorias-> 
CREATE TABLE categorias (
id INT AUTO_INCREMENT NOT NULL, 
nome_categoria VARCHAR(255) NOT NULL, 
descricao MEDIUMTEXT, 
PRIMARY KEY (id)
);

-- Exercício 4.2: Estabelecendo Relacionamentos com Chaves Estrangeiras: 
ALTER TABLE livros ADD COLUMN categoria_id INT NOT NULL ; 
ALTER TABLE livros ALTER COLUMN categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id); 




