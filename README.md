# Curso básico de postgresql da Alura  

## Instalação do Postgres


a. Instalação do postgress no ubuntu na versão 12:  https://www.postgresql.org/download/linux/ubuntu/  

b. Para ver a versão do postqgres: psql –version  

c. Comando para verificar se o postgres está ativo: 
sudo systemctl status postgresql   

d. Para entrar no banco através do terminal com o psql :   
sudo -u postgres psql   (sendo postgres o nome do usuário)  

e. Alterar a senha do postgres: ALTER USER postgres PASSWORD ' ';  

f. Para sair do postgres: \q  

g. Para entrar novamente: psql -h localhost -U postgres  (o -h especifica em que banco vai se conectar, aqui, local host e o – U o usuário que está se conectando ao banco)  

h. Para ver os banco de dados instalados: \l (por padrão o postgres já traz 3 bancos instalados)  

i. Para entrar no banco: \c “postgres” (sendo postgres um dos bancos listados em \l)  

j. Para verificar as tabelas dentro do banco: \dt  

Portanto, o psql é pra manipular o postgres através do terminal. Com o -h define a localização do servidor de banco de dados que pretende se conectar, o  \l te mostra os bancos que você tem e o \dt as tabelas dentro daquele banco  


## PgAdmin4  


a. Instalação o pgadmin https://www.dio.me/articles/instalando-o-pgadmin4-no-ubuntu-dicas-e-passos-simples  

b. Para criarum novo server: dashboard → add new server  
Preencher a aba “geral” com o nome do serve e a conexão com o host (aqui, localhost) e senha.  

c. Para conectar o server ao banco →   
abrir o server > database > postgres  
após clicar em postgres → tools → query tool  

![img](/midia/conectServer.png)

Para testar a conexão com o banco, inserir a query “SELECT NOW();” no query editor e clicar no play para executar a query. Se obtiver a resposta da data e hora atual, sua conexão está correta.

![img](/midia/testConnection.png)  


## Observações gerais do PSQL

- **Diferença entre o prompt "=#" e "-#"**  

a. No PostgreSQL (psql), a diferença entre o prompt "=#" e "-#" está relacionada ao nível de permissão do usuário conectado ao banco de dados.  
    =#: O prompt "=#" indica que você está conectado como superusuário ou como um usuário com permissões administrativas elevadas.   
    -#: O prompt "-#" indica que você está conectado como um usuário comum, sem privilégios administrativos elevados.

b. O prompt no psql muda de "=" para "-" quando você está em um bloco de código, como uma instrução SQL que se estende por várias linhas e ainda não foi concluída.
No seu exemplo, você iniciou a alteração da senha do usuário postgres, mas não concluiu a instrução com um ponto e vírgula (;)  



- **Diferença entre  “sudo -u postgres psql” e “psql -h localhost -U postgres”**  

Ao criar uma senha para o usuário PostgreSQL, você pode ter habilitado a autenticação baseada em senha para esse usuário no PostgreSQL, mas o sudo -u postgres psql pode tentar usar autenticação baseada no sistema operacional, que pode não funcionar corretamente se você estiver usando autenticação baseada em senha para o usuário "postgres" no PostgreSQL.  

## Criando um banco de dados

Pelo terminal:
CREATE DATABASE alura;

Para visualizar os bancos de dados pelo terminal: /l

Para trazer o banco para o pgadmin: com botão direito no database do server -> clicar em "refresh"

Pelo pgadmin:
Em database > create database (na aba SQL do modal mostra o comando SQL que faria o mesmo por comando no terminal)

## Deletando um banco de dados

Pelo terminal: 
DROP DATABASE alura;

## Tipos de dados

Existem diversos [tipos de dados](https://www.postgresql.org/docs/16/datatype.html) que podem ser armazenados no banco.

Vamos enumerar os principais:

Numérico

![img](/midia/tipo_numerico.png)  

**Intereger** - utilizado para números inteiros, considerando números negativos e positivos;  

**Serial** - só tem números positivos e possui incremento automático. Ou seja, cada vez que cria-se um dado nele, acrescenta-se +1 no valor anterior. Utilizado, por exemplo, na criação de id;  

**Real** - é limitada pela precisão de 6 dígitos e pelo formato de ponto flutuante. Portanto, valores muito pequenos podem ser arredondados para zero, e valores muito grandes podem resultar em overflow (ex:1.0e38). Pode armazenar números positivos, negativos ou zero e é adequado para muitas operações matemáticas simples, como adição, subtração, multiplicação e divisão. O separador precisa ser ponto.

**Numeric**/ **Decimal** (sinônimos) - utilizado armazenar números com precisão fixa ou variável, dependendo da declaração  
(ex: NUMERIC(10, 2) 10 representa o número total de dígitos e 2 representa o número de dígitos após o ponto decimal -> 14562359.62 ). Pode armazenar números positivos, negativos ou zero e o separador precisa ser ponto;  


![img](/midia/tipo_texto.png)  

**Varchar** - utilizado quando possui um campo de tipo texto com tamanho pré-determinado. Ex: de 0 a 200 caracteres.  

**Char** - campo de tipo texto quando possui um tamanho obrigatório determinado. Ex: CPF.  

**Text** - campo de tipo texto com quantidade indefinida de caracteres - não possui um limite estabelecido no banco.  

![img](/midia/tipo_boolean.png)  

**Bolleano** - quando o valor de um campo só deve ser true ou false  


![img](/midia/tipo_dataHora.png)  

**Date** - aceito com formato único AAAA-MM-DD

**Time** - aceito com formato único 00:00:00 (caso não preenchido, zera os demais campos)

**Timestamp** - para campos com data e hora (ex: AAAA-MM-DD HH:MI:SS.SSS)


## Para criar a estrutura da tabela

Para criar a estrutura da tabela é necessário definir as colunas e seus tipos, de acordo com o tipo de dado que irá popular a coluna. Caminho e execução:  

database > selecionar a tabela > tools > query tools

CREATE TABLE nome_da_tabela (

)

![img](/midia/createTable.png)  


Após escrever o script, é necessário selecionar a parte que deseja executar e clicar no play.

Para visualizar a tabela criada:

SELECT * FROM nome_da_tabela  

Ou, dar o refresh no banco

## Preencher a tabela  

Para preencher a tabela é necessário trazer o nome da tabela, os campos que pretende preencher e seus dados.  

**Criação de Dados**   
INSERT INTO nome_da_tabela (nome_campo_1, nome_campo_2, nome_campo_4)
VALUES ('valor_campo1', 'valor_campo2', 'valor_campo4');  

Obs: o campo de tipo "serial" não precisa ser inserido, isso será feito automaticamente.  

![img](/midia/criacaoDados.png)  

**Edição de Dados**  

UPDATE nome_da_tabela SET nome_campo = 'valor_campo' WEHERE campo_da_condicao = 'valor_da_condição'  

![img](/midia/edicaoDados.png)

**Deleção de Dados**  

DELETE FROM nome_da_tabela WHERE campo_da_condicao = 'valor_da_condição'  

![img](/midia/delecaoDados.png)

