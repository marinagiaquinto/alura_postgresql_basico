-- Chave Primária
-- É usada para identificar a linha da tabela e o grupo de colunas a elas correspondentes.
-- São características da chave primária: ser ÚNICA e NÃO ser NULA.
-- Assim, "NOT NULL UNIQUE" e "PRIMARY KEY" se tornam equivalentes validação do campo. A diferença existe apenas na hora da criação do dado, pois como INTEGER

DROP TABLE curso
	
CREATE TABLE curso(
	id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL 
)

--Igual a

CREATE TABLE curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL 
)



INSERT INTO curso (nome) VALUES ('HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript') -- ERROR: Key (id)=(1) already exists.
INSERT INTO curso (id, nome) VALUES (2, NULL) -- ERROR:  null value in column "nome" of relation "curso" violates not-null constraint


	

-- OBS: DIFERENÇA entre INTEGER PRIMARY KEY e SERIAL PRIMARY KEY
-- Apesar do "Primary key" requerer obrigatoriedade de preenchimento do campo id, não é necessário passar o valor para o banco, 
-- visto que esse valor será automaticamente inserido através do incremento feito a partir do último valor existente no banco.
-- Assim, sua ausência no INSERT INTO ou UPDATED não causará erro por violação da condição "NOT NULL"

	
CREATE TABLE curso(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL 
)

INSERT INTO curso (nome) VALUES ('Criação do dado sem inserção direta do valor do id')

