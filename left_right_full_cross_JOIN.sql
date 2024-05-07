-- LEFT JOIN, RIGTH JOIN E FULL JOIN
-- São utilizados quando você deseja preservar dados na tabela que não estejam na interseção dos dados entre as tabelas.
-- Em todos eles, os dados que possuem mesmo id serão adicionados na mesma linha e os dados que não possuem correspondência de id, serão adicionados com valor null.

SELECT * FROM aluno
SELECT * FROM curso
SELECT * FROM aluno_curso


	
-- LEFT JOIN
-- Quando deseja preservar todos os dados da tabela 1 + da interseção entre as tabelas

SELECT *
	FROM aluno
	LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	LEFT JOIN curso       ON curso.id             = aluno_curso.curso_id 
-- (sem a seleção específica de colunas, pra ficar mas explícito o que acontece na formação da tabela)


SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	LEFT JOIN curso       ON curso.id             = aluno_curso.curso_id



	
-- RIGHT JOIN
-- Quando deseja preservar todos os dados da tabela 2 + da interseção entre as tabelas

SELECT *
	FROM aluno
	RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	RIGHT JOIN curso       ON curso.id             = aluno_curso.curso_id 
-- (sem a seleção específica de colunas, pra ficar mas explícito o que acontece na formação da tabela)

	
SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	RIGHT JOIN curso       ON curso.id             = aluno_curso.curso_id



	
-- FULL JOIN
-- Quando deseja unir as tabelas, preservando todos os dados da tabela 1 e 2 a partir da interseção entre elas.

	
SELECT *
	FROM aluno
	FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	FULL JOIN curso       ON curso.id             = aluno_curso.curso_id 
-- (sem a seleção específica de colunas, pra ficar mas explícito o que acontece na formação da tabela)

	
SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	FULL JOIN curso       ON curso.id             = aluno_curso.curso_id



-- CROSS JOIN
-- Cria o relacionamento de N:N. Todos os dados da tabela 1 com todos os dados da tabela 2
-- Por ser um relacionamento de todos com todos, não precisa da cláusula de igualdade (on)

SELECT *
	FROM aluno
	CROSS JOIN aluno_curso      
-- (sem a seleção específica de colunas, pra ficar mas explícito o que acontece na formação da tabela)
