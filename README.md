# Curso básico de postgresql da Alura  

##Instalação do Postgres e PgAdmin4  


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


##PgAdmin4  


a. Instalação o pgadmin https://www.dio.me/articles/instalando-o-pgadmin4-no-ubuntu-dicas-e-passos-simples  

b. Para criarum novo server: dashboard → add new server  
Preencher a aba “geral” com o nome do serve e a conexão com o host (aqui, localhost) e senha.  

c. Para conectar o server ao banco →   
abrir o server > database > postgres  
após clicar em postgres → tools → query tool  

![img](/midia/conectServer.png)

Para testar a conexão com o banco, inserir a query “SELECT NOW();” no query editor e clicar no play para executar a query. Se obtiver a resposta da data e hora atual, sua conexão está correta.

![img](/midia/testConnection.png)  


##Observações gerais do PSQL

- **Diferença entre o prompt "=#" e "-#"**  

a. No PostgreSQL (psql), a diferença entre o prompt "=#" e "-#" está relacionada ao nível de permissão do usuário conectado ao banco de dados.  
    =#: O prompt "=#" indica que você está conectado como superusuário ou como um usuário com permissões administrativas elevadas.   
    -#: O prompt "-#" indica que você está conectado como um usuário comum, sem privilégios administrativos elevados.

b. O prompt no psql muda de "=" para "-" quando você está em um bloco de código, como uma instrução SQL que se estende por várias linhas e ainda não foi concluída.
No seu exemplo, você iniciou a alteração da senha do usuário postgres, mas não concluiu a instrução com um ponto e vírgula (;)  



- **Diferença entre  “sudo -u postgres psql” e “psql -h localhost -U postgres”**  

Ao criar uma senha para o usuário PostgreSQL, você pode ter habilitado a autenticação baseada em senha para esse usuário no PostgreSQL, mas o sudo -u postgres psql pode tentar usar autenticação baseada no sistema operacional, que pode não funcionar corretamente se você estiver usando autenticação baseada em senha para o usuário "postgres" no PostgreSQL.  



