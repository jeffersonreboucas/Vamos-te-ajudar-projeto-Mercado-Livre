-- *****************************************************
-- Tabela..........: tabela_leads_capturados 
-- Funcao..........: Acumular os leads recebidos pelo 
--                   blog.
-- *****************************************************

CREATE TABLE IF NOT EXISTS tabela_leads_capturados (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 email CHAR(100) NOT NULL,
 nome CHAR(100) NOT NULL,
 ipv4_lead CHAR(15) NOT NULL,
 tipo_lead CHAR(03) NOT NULL,
 hora_inclusao TIMESTAMP NOT NULL
 ); 

-- *****************************************************
-- Tabela..........: tabela_posts 
-- Funcao..........: Armazenar os posts de conteudo do 
--                   blog.
-- *****************************************************
CREATE TABLE IF NOT EXISTS tabela_posts (
 id_post INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 texto_titulo TEXT NOT NULL,
 texto_h2 TEXT NOT NULL,
 texto_post TEXT NOT NULL
);

-- *****************************************************
-- Tabela..........: tabela_imagens_posts
-- Funcao..........: Armazenar as imagens dos posts do 
--                   blog.
-- *****************************************************
CREATE TABLE IF NOT EXISTS tabela_imagens_posts (
 id_imagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 id_post INT NOT NULL REFERENCES tabela_posts (id_post) 
         MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
 descricao_imagem VARCHAR(255) NOT NULL,
 nome_imagem VARCHAR(25) NOT NULL,
 tamanho_imagem VARCHAR(25) NOT NULL,
 tipo_imagem VARCHAR(25) NOT NULL,
 imagem longblob NOT NULL
);
CREATE INDEX indice_post ON tabela_imagens_posts (id_post);

-- ************************ bottom of data ******************************
