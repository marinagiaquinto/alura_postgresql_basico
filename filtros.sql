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


SELECT * FROM aluno
SELECT nome FROM aluno

--Char, Varchar e text funcionam da mesma forma, portanto, pode utilizar o mesmo método em todos eles
INSERT INTO aluno (nome) VALUES ('Vinícus Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

--Os filtros são baseados no WHERE

--igual a
SELECT * FROM aluno WHERE nome = 'Diogo';   

-- diferente de
SELECT * FROM aluno WHERE nome <> 'Diogo'; 
SELECT * FROM aluno WHERE nome != 'Diogo';


--Como/"semelhante a", podendo usar ainda o _ (Ignorar caracter específico) e o %

-- com _ é possível ignorar um caracter específico. 
-- Ou seja, aquela casa pode ter qualquer valor contanto que as demais existam

SELECT * FROM aluno WHERE nome LIKE 'Di_go';  --igual a
SELECT * FROM  aluno WHERE nome NOT LIKE 'Di_go';  -- diferente de 

--com % pesquisa qualquer coisa até aquele ponto ou a partir daquele ponto
SELECT * FROM aluno WHERE nome LIKE '%s';
SELECT * FROM aluno WHERE nome LIKE 'D%';
SELECT * FROM aluno WHERE nome LIKE '% %'; -- tudo que tiver espaço
SELECT * FROM aluno WHERE nome LIKE '%i%a%'; --que tenha "i" e o "a"