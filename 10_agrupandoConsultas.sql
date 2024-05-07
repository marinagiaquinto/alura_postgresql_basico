-- Agrupando Consultas (GROUP BY)

-- A cláusula GROUP BY agrupa linhas baseado em semelhanças entre elas. 
-- Ela é usada quando se deseja realizar consultas mas sem repetir algum dado e/ou conjunto de dados. 


-- Ex1: quais alunos estão matriculados nos cursos, visto que existem alunos matriculados em mais de um curso.

SELECT aluno, curso_id -- para visualizar a lista de alunos por curso, repetindo os alunos para cursos diferentes
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	ORDER BY aluno
	

SELECT aluno -- para usar o ORDER BY, é necessário que o mesmo conjunto de colunas no select esteja no ORDER BY. Se + de uma, o agrupamento será pelos valores em conjunto
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	GROUP BY aluno
	ORDER BY aluno

SELECT aluno, curso_id -- Aqui, só deixaria de trazer algum valor da lista se nela tivesse duplicado o registro do mesmo aluno para o mesmo curso.
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	GROUP BY aluno, curso_id
	ORDER BY aluno


	
-- EX2: Utilizando as FUNÇÕES DE AGREGAÇÃO


SELECT aluno, MAX(curso_id) -- Seleção dos valores de aluno sem repetir + o valor máximo do curso_id entre os dados da Roberta e entre os dados do Vinícius. 
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	GROUP BY aluno
	ORDER BY aluno




-- DISTINCT - garante que os dados não se repitam.Porém, não é possível usar funções de agregação com ele. Serve apenas para agrupar.
-- Com o distint, assim como com o GROUP BY, é necessário sempre setar a coluna que deseja realizar a "distinção" dos elementos, não podendo usar o * para toda a tabela.
-- Sendo assim, seu resultado será um conjunto específico de colunas, sempre as mesmas que a cláusula foi aplicada.

SELECT
	DISTINCT nome
	FROM funcionarios
	ORDER BY nome


SELECT
	DISTINCT sobrenome
	FROM funcionarios
	ORDER BY sobrenome



INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M010', 'DIOGO', 'MASCARENHAS');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M011', '  Diogo', '  Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M012','Diogo  ', 'Mascarenhas  ');
	
SELECT 
	DISTINCT nome, sobrenome   --Garante que não exista duas vezes o mesmo nome COM o mesmo sobrenome (casesensitive, diferencia espaços)
	FROM funcionarios
	ORDER BY nome, sobrenome;

