-- Filtro em agrupamento

-- Não é possível usar o WHERE junto com as funções de agrupamento. Para isso, usamos o HAVING.
--DEve-se sempre agrupar primeiro para depois realizar o filtro

SELECT nome,
	COUNT (id)
	FROM funcionarios
	GROUP BY nome         -- Primeiro agrupando os nomes, evitando que tenha nomes duplicados
	HAVING COUNT(id) > 1  -- Segundo fazendo um filtro para saber qual deles possui nomes duplicados e quantas duplicações são

