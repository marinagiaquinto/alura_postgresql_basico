
--Criação da tabela com os principais tipos de dados utilizados
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	CPF CHAR(11),
	Observação TEXT,
	idade INTEGER,
	dinheiro NUMERIC (10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	marticulado_em TIMESTAMP
)


SELECT * FROM aluno;


--Preenchimento dos dados
INSERT INTO aluno (
	nome,
	CPF,
	Observação,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	marticulado_em
)
VALUES (
	'Diogo',
	'12345678901',
	'Sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite 
	de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto sem limite de texto ',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
)

--Criar sempre um select antes pra ter certeza que é esse o dado que deseja alterar
SELECT *
    FROM aluno
WHERE id = 1


--Edição dos dados da tabela
UPDATE aluno
	SET
	nome = 'Nico',
	CPF = '98562144756',
	Observação = 'Edição de campo texto',
	idade = '18',
	dinheiro = '785.52',
	altura = '1.60',
	ativo = FALSE,
	data_nascimento = '1900-08-01',
	hora_aula = '10:30:20',
	marticulado_em = '2001-02-21'
	WHERE id = 1

	
--Criar sempre um select antes pra ter certeza que é esse o dado que deseja deletar	
SELECT *
	FROM aluno
	WHERE nome = 'Nico'
	

--NÃO ESQUECER O WHERE PRA NÃO APAGAR A TABELA TODA
DELETE
	FROM aluno
	WHERE nome = 'Nico'

--EDITAR NOME DA COLUNA NA TABELA
ALTER TABLE aluno RENAME COLUMN marticulado_em TO matriculado_em
