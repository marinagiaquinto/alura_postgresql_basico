-- JOIN
-- Quando quero pesquisar os dados da tabela A junto com os dados da tabela B 
-- e eles precisam necessariamente existir nas duas tabelas

SELECT * FROM aluno
SELECT * FROM curso
SELECT * FROM aluno_curso

-- estrutura do JOIN:
SELECT * FROM tabela_1
		 JOIN tabela_5 ON tabela_5.id = tabela_1.id

	

-- Intersecção de valores com mesmo IDs.
-- Quando realizamos o JOIN, será criada uma nova tabela a partir da correspondência feita entre os valores dos ids das tabelas.
-- Só permanecerão os dados das colunas que possuem ids correspondentes. Os ids que não possuem correspondência na outra tabela serão descartados.
SELECT * FROM aluno
		 JOIN curso ON aluno.id = curso.id

-- Relação 1:N
-- Quando realizamos o JOIN, ele é feito unitariamente, elemento a elemento procurando seu valor equilente na outra tabela.
-- A correspondência do JOIN não é de 1:1, mas sim de 1:N. Ou seja, podem existir diversos itens na tabela B que se identificam com apenas um dos valores da tabela A.
-- e o JOIN vai ser feito da mesma forma e o valor que foi várias vezes correlacionado, irá se repetir na tabela, mesmo existindo apenas um dado dele na tabela A, 
-- pois a tabela formada do JOIN é uma tabela de relacionamento.
-- Ex: na tabela aluno_curso existe um dado repetido que existe unitariamente na tabela aluno
SELECT * FROM aluno
		 JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id

--Múltiplos JOINS ao mesmo tempo
SELECT *
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id


-- Selecionar colunas específicas da coluna e apresentá-las com nomenclatura específica na apresentação pro usuário
SELECT aluno AS "Nome do Aluno",
	   curso AS "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id

