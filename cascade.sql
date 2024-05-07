-- CASCADE

-- Até agora, quando criamos nossas tabelas, não criamos nenhuma restrição nelas.
-- Por default, quando criamos uma tabela e depois criamos um dado relacionando ela a uma outra tabela, não é mais possível
-- apagar/editar o dado da tabela primária. 
-- Esse comportamento muda com o CASCADE. Com ele, definimos na nossa restrição que queremos que esses dados sejam excluídos/editados em ambas as tabelas. 
-- Ou seja, tanto na tabela principal quanto na tabela que possui relacionamento. 


-- EXCLUSÃO
-- Como criar a tabela permitindo o CASCADE
-- Na tabela de relacionamento, será setada a permissão

DROP TABLE aluno_curso

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),

	FOREIGN KEY (aluno_id) -- coluna que será a chave estrangeira (que será a referência de um dado de outra tabela)
	REFERENCES aluno (id) -- se correlaciona com qual tabela e com qual campo dentro dela,
	ON DELETE CASCADE, -- por default essa condição vem setada como RESTRICT

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);


SELECT * FROM aluno_curso

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);


SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id



DELETE FROM aluno WHERE id = 1


	

--EDIÇÃO
--O mesmo ocorre com a edição.

DROP TABLE aluno_curso_com_cascade

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),

	FOREIGN KEY (aluno_id) -- coluna que será a chave estrangeira (que será a referência de um dado de outra tabela)
	REFERENCES aluno (id) -- se correlaciona com qual tabela e com qual campo dentro dela,
	ON UPDATE CASCADE, -- por default essa condição vem setada como RESTRICT

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);


SELECT * FROM aluno_curso

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);


SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id

	
UPDATE aluno SET id = 10 WHERE id = 2
