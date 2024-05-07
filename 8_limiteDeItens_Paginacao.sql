-- LIMITAÇÃO DE ITENS

--Para limitar a quantidade de itens que deseja trazer na consulta, é necesssário usar o LIMIT

SELECT * 
	FROM funcionarios
	LIMIT 3

-- Se desejar ordenar junto com o limite de itens, a ordenação deve ser passada antes do LIMIT

SELECT *
	FROM funcionarios
	ORDER BY nome
	LIMIT 5



-- PAGINAÇÃO

-- Ao uitlizar o OFFSET, escolhe-se quantas linhas deseja pular/descartar da tabela, partindo para a sequência a partir do novo início setado na lista

SELECT * 
	FROM funcionarios
	LIMIT 4
	OFFSET 2 -- quantidade de linhas iniciais a serem descartadas


-- OFFSET com ordenação para pegar os 3 últimos da lista

SELECT *
	FROM funcionarios
	ORDER BY nome DESC
	LIMIT 3;