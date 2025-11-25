-- ============================================
-- Intro: Criação e Inicialização do Schema
-- ============================================

-- Criação de schema
CREATE SCHEMA gerref;
USE gerref;

-- ============================================
-- Seção 1: Criação de tabelas
-- ============================================

-- Criação da tabela "Perfil"
CREATE TABLE perfil (
id_perfil INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
tipo_perfil VARCHAR(50) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela "Tema"
CREATE TABLE tema (
id_tema INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(50) NOT NULL,
descricao VARCHAR(50) NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela "Assunto"
CREATE TABLE assunto (
id_assunto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(50) NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_tema INT NOT NULL,
FOREIGN KEY (id_tema) references tema (id_tema)
);

-- Criação da tabela "Obra"
CREATE TABLE obra (
id_obra INT AUTO_INCREMENT PRIMARY KEY,
titulo_subtitulo VARCHAR(100) NOT NULL,
nome_autor VARCHAR(50) NOT NULL,
isbn VARCHAR(50) NOT NULL UNIQUE,
num_edicao INT NOT NULL,
editora VARCHAR(50) NOT NULL,
local_publicacao VARCHAR(60) NOT NULL,
num_pag INT NOT NULL,
id_tema INT NOT NULL,
id_assunto INT NOT NULL,
FOREIGN KEY (id_tema) references tema (id_tema),
FOREIGN KEY (id_assunto) references assunto (id_assunto)
);

-- ============================================================
-- Seção 2: Utilizando o comando INSERT para povoar as tabelas
-- ============================================================

-- Povoamento da tabela "Perfil"
INSERT INTO perfil (id_perfil, nome, tipo_perfil, email, data_criacao) VALUES
(1, 'Mariana Silva', 'estudante', 'mariana.silva@gmail.com', '2025-01-15'),
(2, 'João Pereira', 'pesquisador', 'joao.pereira@gmail.com', '2025-02-03'),
(3, 'Carla Mendes', 'colaborador', 'carla.mendes@outlook.com', '2025-03-10'),
(4, 'Rafael Torres', 'estudante', 'rafael.torres@gmail.com', '2025-04-22'),
(5, 'Luciana Albuquerque', 'pesquisador', 'luciana.albuquerque@hotmail.com', '2025-05-01');
	
-- Povoamento da tabela "Tema"
INSERT INTO tema (id_tema, titulo, descricao, data_criacao) VALUES
(1, 'História', 'Estudo de eventos e processos do passado.', '2025-01-10'),
(2, 'Geografia', 'Análise dos aspectos físicos e humanos da Terra.', '2025-01-12'),
(3, 'Ciência Política', 'Estudo das estruturas e processos políticos.', '2025-01-15'),
(4, 'Sociologia', 'Análise das relações e estruturas sociais.', '2025-01-20'),
(5, 'Tecnologia e Sociedade', 'Impactos sociais das inovações tecnológicas.', '2025-01-25');

-- Povoamento da tabela "Assunto"
INSERT INTO assunto (id_assunto, nome, descricao, data_criacao, id_tema) VALUES
(1, 'Revolução Francesa', 'Evento marcante da história moderna.', '2025-02-01', 1),
(2, 'Climas do Mundo', 'Estudo dos diferentes tipos de clima.', '2025-02-03', 2),
(3, 'Sistemas de Governo', 'Visão geral dos modelos de governo.', '2025-02-05', 3),
(4, 'Estratificação Social', 'Análise das camadas da sociedade.', '2025-02-07', 4),
(5, 'Impacto da IA', 'Efeitos da IA sobre a sociedade atual.', '2025-02-10', 5);

-- Povoamento da tabela "Obra"
INSERT INTO obra (
    id_obra, titulo_subtitulo, nome_autor, isbn, num_edicao,
    editora, local_publicacao, num_pag, id_tema, id_assunto
) VALUES
(1, 'A Revolução Francesa e seus Impactos', 'Luis Andrade',
 '9781234500011', 2, 'Editora Horizonte', 'São Paulo', 320, 1, 1),

(2, 'Climas do Mundo: Uma Introdução', 'Marina Duarte',
 '9781234500028', 1, 'Terra Editora', 'Rio de Janeiro', 210, 2, 2),

(3, 'Modelos de Governo Contemporâneos', 'Carlos Nogueira',
 '9781234500035', 3, 'Editora Política Viva', 'Brasília', 410, 3, 3),

(4, 'Estruturas da Sociedade Moderna', 'Ana Ribeiro',
 '9781234500042', 1, 'Socius Editora', 'Curitiba', 275, 4, 4),

(5, 'Inteligência Artificial e Sociedade', 'Paulo Esteves',
 '9781234500059', 2, 'Futuro Editorial', 'Porto Alegre', 198, 5, 5);

-- ============================================================
-- Seção 3: REALIZANDO CONSULTAS
-- ============================================================

SELECT nome, tipo_perfil, email FROM perfil;
SELECT * FROM perfil WHERE tipo_perfil = "estudante";

-- ============================================================
-- Seção 4: UTILIZAÇÃO DOS COMANDOS UPDATE E DELETE
-- ============================================================

UPDATE perfil SET tipo_perfil = 'pesquisador' WHERE id_perfil = 1;
UPDATE perfil SET email = 'mariana.silva@yahoo.com.br' WHERE id_perfil = 1;
UPDATE perfil SET email = 'joao.pereira@hotmail.com' WHERE id_perfil = 2;

DELETE FROM perfil WHERE id_perfil=1;
DELETE FROM perfil WHERE id_perfil=2;
DELETE FROM perfil WHERE id_perfil=3;
