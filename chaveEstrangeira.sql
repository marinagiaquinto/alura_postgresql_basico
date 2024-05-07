-- Chave estrangeira
-- É um valor também único e não nulo que em outra tabela serve como identificação da linha


-- A utilização de chave estrangeira serva para evitar inconsistências no banco de dados.
-- Imagine que temos uma tabela "aluno", outra "curso" e outra para criar o relacionamento entre aluno e curso.
-- Nesta, cada aluno só poderá estar matriculado uma vez em cada matéria. 
-- Ponto de atenção: para isso, tanto o aluno quando o curso utilizados na tabela de relacionamente devem existir antes nas tabelas correspondentes ao registro do dado. 

-- Problema:
-- Ao criar uma tabela de relacionamento sem chaves estrangeiras, não é averiguado na tabela de origem se o dado 
-- inserido na tabela de relacionamento realmente existe na tabela de aluno e/ou curso.
-- Isso possibilita a criação de inconsistências, criando vínculos entre cursos e alunos inexistentes nas tabelas de "origem".


-- 1º CRIAÇÃO TABELA 1

DROP TABLE aluno

CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	Aluno VARCHAR(255) NOT NULL
)

INSERT INTO aluno (Aluno) VALUES ('Diogo');
INSERT INTO aluno (Aluno) VALUES ('Vinícius');

SELECT * FROM aluno

-- 2º CRIAÇÃO TABELA 2

DROP TABLE curso

CREATE TABLE curso (
	id SERIAL PRIMARY KEY,
	Curso VARCHAR(255) NOT NULL
);

INSERT INTO curso (Curso) VALUES ('HTML');
INSERT INTO curso (Curso) VALUES ('Javascript')

SELECT * FROM curso

	
-- 3º CENÁRIO DE ERRO - Criando inconsistência no banco por falta de chave estrangeira

	
-- CRIAÇÃO DA TABELA DE RELACIONAMENTO

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id) -- Chave primária composta: ambos são, portanto, not null e os dois juntos formarem um campo único.
)


INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (5,1) -- permite a inserção do aluno de id 3 sendo que ele não existe na tabela aluno
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,7) -- permite a inserção do curso de id 7 sendo que ele não existe na tabela curso

SELECT *FROM aluno_curso


-- 4º Trabalhando a inconsistência com a criação de chave estrangeira

DROP TABLE aluno_curso

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),

	FOREIGN KEY (aluno_id) -- coluna que será a chave estrangeira (que será a referência de um dado de outra tabela)
	REFERENCES aluno (id), -- se correlaciona com qual tabela e com qual campo dentro dela,

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);


SELECT * FROM aluno_curso

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1) -- Erro: Key (aluno_id)=(3) is not present in table "aluno".
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,7) -- Erro: Key (curso_id)=(7) is not present in table "curso".

