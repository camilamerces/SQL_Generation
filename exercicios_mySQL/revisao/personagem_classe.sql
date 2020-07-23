/*Atividade 1
Crie um banco de dados para um serviço de um game Online, o nome do banco deverá ter o seguinte nome 
db_generation_game_online, onde, o sistema trabalhará com as informações dos personagens desse game.*/
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

/*Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes do 
Cargos para se trabalhar com o serviço desse  game Online.*/
CREATE TABLE tb_classe(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    classe varchar(20) NOT NULL,
    ativo boolean
);

/*Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine 5 atributos relevantes dos 
personagens para se trabalhar com o serviço desse game Online (não esqueça de criar a foreign key de tb_classe 
nesta tabela).*/
CREATE TABLE tb_personagem(
	id bigint AUTO_INCREMENT PRIMARY KEY,
    nome varchar(20) NOT NULL,
    ataque bigint(5),
    defesa bigint(5),
    classe_id bigint NOT NULL,
    
    FOREIGN KEY(classe_id) REFERENCES tb_classe(id)
);

/*Popule esta tabela classe com até 5 dados.*/
INSERT INTO tb_classe(classe, ativo) VALUES("Arqueiros", true);
INSERT INTO tb_classe(classe, ativo) VALUES("Super Força", true);
INSERT INTO tb_classe(classe, ativo) VALUES("Choque", true);
INSERT INTO tb_classe(classe, ativo) VALUES("Visão Noturna", true);
INSERT INTO tb_classe(classe, ativo) VALUES("Rápido", true);

SELECT * FROM tb_classe;

/*Popule esta tabela personagem com até 8 dados.*/
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Bruna Silva", 2500, 1500, 2);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Melissa Castro", 1000, 1900, 1);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Caroline Souza", 1700, 8500, 3);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Bianca Andrade", 100, 2300, 5);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Maria Lima", 2400, 3200, 4);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("João Pedro", 3500, 1900, 2);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Silvia Oliveira", 500, 2500, 1);
INSERT INTO tb_personagem(nome, ataque, defesa, classe_id) VALUES("Carmem Miranda", 2800, 1200, 4);

SELECT * FROM tb_personagem;

/*Faça um select que retorne os personagens com o poder de ataque maior do que 2000.*/
SELECT nome, ataque FROM tb_personagem WHERE ataque > 2000;

/*Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.*/
SELECT nome, defesa FROM tb_personagem WHERE defesa > 1000 AND defesa < 2000;

/*Faça um select  utilizando LIKE buscando os personagens com a letra C.*/
SELECT * FROM tb_personagem WHERE nome LIKE "C%";

/*Faça um um select com Inner join entre  tabela classe e personagem.*/
SELECT nome, ataque, defesa, classe FROM tb_personagem
	INNER JOIN tb_classe ON tb_classe.id = tb_personagem.classe_id;

/*Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que 
são arqueiros).*/
SELECT nome, ataque, defesa, classe FROM tb_personagem
	INNER JOIN tb_classe ON tb_classe.id = tb_personagem.classe_id
    WHERE tb_classe.classe = "Arqueiros"
    ORDER BY ataque DESC;