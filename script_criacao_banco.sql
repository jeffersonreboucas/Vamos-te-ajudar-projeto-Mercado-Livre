

-- *****************************************************
-- Base de Dados...: mysql_quero_ajudar
-- *****************************************************

create database IF NOT EXISTS mysql_quero_ajudar;

GRANT usage ON *.* TO dba@localhost IDENTIFIED BY 'm4st3r0funiv3r53';

GRANT usage ON *.* TO dba@'%' IDENTIFIED BY 'm4st3r0funiv3r53';

GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON mysql_siteBanco.* TO dba@localhost;

GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON mysql_siteBanco.* TO dba@'%';

-- *****************************************************
-- Tabela..........: tabela_leads_capturados 
-- Funcao..........: Acumular os leads recebidos pelo 
--                   blog.
-- *****************************************************

CREATE TABLE IF NOT EXISTS tabela_leads_capturados (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nome CHAR(100) NOT NULL,
 email char(100) NOT NULL,
 hora_inclusao TIMESTAMP NOT NULL,
 ipv4_lead CHAR(15) NOT NULL
 ) 

-- *****************************************************
-- Tabela..........: tabela_posts 
-- Funcao..........: Armazenar os posts de conteudo do 
--                   blog.
-- *****************************************************
CREATE TABLE IF NOT EXISTS tabela_posts (
 id_post INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 texto_titulo CHAR(100) NOT NULL,
 texto_h2 CHAR(500) NOT NULL,
 texto_post CHAR(1000)NOT NULL,
)

-- *****************************************************
-- Tabela..........: tabela_imagens_posts
-- Funcao..........: Armazenar as imagens dos posts do 
--                   blog.
-- *****************************************************
CREATE TABLE IF NOT EXISTS tabela_imagens_posts (
 id_imagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 id_post INT NOT NULL REFERENCES tabela_posts (id_post) 
         MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
 descricao_imagem varchar(255) NOT NULL,
 nome_imagem varchar(25) NOT NULL,
 tamanho_imagem varchar(25) NOT NULL,
 tipo_imagem varchar(25) NOT NULL,
 imagem longblob NOT NULL
)
CREATE INDEX PRGRUPO ON tabela_imagens_posts (id_post);
