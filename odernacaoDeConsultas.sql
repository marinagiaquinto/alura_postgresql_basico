-- ORDER BY

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Jéssica', 'Mascarenhas');


SELECT * 
    FROM funcionarios
    ORDER BY nome;


-- Para ordenar, podemos setar o nome da coluna ou a sua posição na tabela (começando a contagem com 0)
-- Para ordenar por ordem decrescente acrescentar DESC
-- A ordem ascendente não precisa ser especificada, mas se quiser deixar explícita, setar ASC

SELECT * 
	FROM funcionarios 
	ORDER BY nome, matricula DESC

SELECT *
	FROM funcionarios
	ORDER BY 4, 3, 2 ASC


-- Caso faça uma pesquisa com duas tabelas onde as duas possuam o mesmo nome, para não da erro de ambiguidade,
-- é necessário setar o nome da tabela antes do nome da coluna, especificando de qual tabela se refere a ordenação

CREATE TABLE funcionarios_DOIS(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios_DOIS (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios_DOIS (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios_DOIS (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios_DOIS (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');


SELECT *
	FROM funcionarios
	LEFT JOIN funcionarios_DOIS ON funcionarios.id = funcionarios_DOIS.id
	ORDER BY funcionarios.nome


