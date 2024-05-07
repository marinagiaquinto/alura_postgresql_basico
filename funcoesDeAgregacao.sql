-- Funções de Agregação


-- COUNT - Retorna a quantidade de registros existentes na tabela

SELECT COUNT (sobrenome) -- setando uma coluna em específico, retorna a quantidade de linhas daquela coluna
	FROM funcionarios;

SELECT COUNT (*)  -- o * representa todas as colunas da tabela, retornando o total de linhas da tabela
	FROM funcionarios;    



-- SUM - Retorna a soma dos registros da tabela

SELECT SUM (id)
	FROM funcionarios


	
-- MAX - Retorna o maior valor dos registors

	
SELECT MAX (id)
	FROM funcionarios

	
SELECT MAX (nome)
	FROM funcionarios -- Máx pensando em um varchar, é o de última posição em uma ordem alfabética ascendente


	
-- MIN - Retorna o menor valor dos registros

	
SELECT MIN (id)
	FROM funcionarios

	
SELECT MIN (nome)
	FROM funcionarios  -- Min pensando em um varchar, é o de primeira posição em uma ordem alfabética ascendente


	
-- AVG - Retorna a média dos registros

SELECT AVG (id)
	FROM funcionarios

SELECT ROUND(AVG(id),2) -- para controlar o número de casas deciomais apresentadas. No caso, 2. Se fosse zero substituiria o dois por 0.
	FROM funcionarios


--Ao realizar as consultas juntas, o resultado será uma tabela contendo os dados transformados

SELECT
	MIN(nome),
	MAX(nome),
	SUM (id),
	COUNT(*)
	FROM funcionarios;
