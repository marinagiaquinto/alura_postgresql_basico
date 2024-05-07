
-- Consultas com filtros

--Seleção específica de coluna
SELECT nome,
       idade
 FROM aluno;
 

--Colocar um outro nome de coluna para o usuário ver (com espaço ou sem)
SELECT nome AS "Nome do Aluno",
       idade,
	   matriculado_em AS quando_se_matriculou
  FROM aluno;


SELECT nome FROM aluno



--Inserindo dados para os testes

INSERT INTO aluno (nome) VALUES ('Vinícus Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO aluno (nome, idade, dinheiro, data_nascimento) VALUES('Marina', 36, 10000, '12-10-2023');
UPDATE aluno SET ativo = False WHERE id = 16


--Os filtros são baseados no WHERE

--Igual a / "="
SELECT * FROM aluno WHERE nome = 'Diogo';
SELECT *FROM aluno WHERE ativo = TRUE;
SELECT *FROM aluno WHERE idade = 35
SELECT * FROM aluno WHERE data_nascimento = '12-10-2023'
SELECT * FROM aluno WHERE ativo = false



-- "Semelhante a"/Like, podendo usar ainda o _ e o %
--Filtros usados com Char, Varchar e text, o operador não é reconhecido para os demais tipos de dados

-- com _ é possível ignorar um caracter específico. Ou seja, aquela casa pode ter qualquer valor contanto que as demais existam
SELECT * FROM aluno WHERE nome LIKE 'Di_go';  --igual a
SELECT * FROM  aluno WHERE nome NOT LIKE 'Di_go';  -- diferente de 

--com % pesquisa qualquer coisa até aquele ponto ou a partir daquele ponto
SELECT * FROM aluno WHERE nome LIKE '%s';
SELECT * FROM aluno WHERE nome LIKE 'D%';
SELECT * FROM aluno WHERE nome LIKE '% %'; -- tudo que tiver espaço
SELECT * FROM aluno WHERE nome LIKE '%i%a%'; --que tenha "i" e o "a"


-- Diferença entre = e Like
-- O operador "=" é usado para fazer uma correspondência exata entre valores.
-- Ele é sensível a maiúsculas e minúsculas, então 'Valor' não seria considerado igual a 'valor'.
-- O operador LIKE é usado para fazer comparações parciais em strings. Ele permite o uso de curingas, 
-- como % (para representar zero, um ou vários caracteres) e _ (para representar um único caractere).  




-- diferente de <>, != 
--(Traz valores preenchidos de fato na tabela, não considera null )
SELECT * FROM aluno WHERE nome <> 'Diogo'; 
SELECT * FROM aluno WHERE nome != 'Diogo';
SELECT * FROM aluno WHERE dinheiro != '100.50';
SELECT * FROM aluno WHERE idade <> 35;
SELECT * FROM aluno WHERE data_nascimento != '01-02-1052'



--Filtro com NUll (não preenchido)
SELECT * FROM aluno WHERE cpf IS NULL;  -- = a null não funciona porque não existe o "valor" null, como dado inserido
SELECT * FROM aluno WHERE nome IS null;
SELECT * FROM aluno WHERE data_nascimento IS NUll;

--Filtro de valores preenchido
SELECT * FROM aluno WHERE ativo IS NOT NULL;
SELECT * FROM aluno WHERE dinheiro IS NOT null;



-- Filtro >, <, >=, <= (pode ser utilizado com numérico e data)
SELECT * FROM aluno WHERE idade >= 35;
SELECT * FROM aluno WHERE data_nascimento >= '01-01-2000';


--Filtro com range (pode ser utilizado com numérico e data)
SELECT * FROM aluno WHERE idade BETWEEN 20 and 35;
SELECT * FROM aluno WHERE matriculado_em BETWEEN '2020-02-08 12:32:00' and '2020-02-08 12:32:45';


-- Filtro com "AND"
-- Ambas as condições precisam ser válidas e precisam se referir a mesma linha do dado.

SELECT * FROM aluno
	WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL; --traz todas as linhas de resposta que corresponderem as duas condições


SELECT * FROM aluno
	WHERE nome LIKE 'D%'
	AND observação = 'texto livre observação'  --responde vazio porque apenas uma condição é verdadeira, considerando que ambas devem estar na mesma linha


--Filtro com "OR"
--Quando apenas uma das condições precisam estar válidas para trazer a resposta.

SELECT * FROM aluno
	WHERE nome LIKE 'M%'
	OR nome LIKE 'V%'   -- se as duas condições forem verdadeiras, traz as duas respostas

SELECT * FROM aluno
	WHERE nome LIKE 'M%'
	OR nome = 'hahquhqkshkqjs' -- se apenas uma condição for verdadeira, traz apenas a linha da resposta correpondente







