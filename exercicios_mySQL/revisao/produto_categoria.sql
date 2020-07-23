/*Atividade 6
Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá ter o 
seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as informações dos produtos desta empresa. */
CREATE DATABASE db_cursoDaMinhaVida;
USE db_cursoDaMinhaVida;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do 
tb_categoria para se trabalhar com o serviço deste site de cursos onlines.*/
CREATE TABLE tb_categoria(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria varchar(20) NOT NULL,
    ativo boolean
);

/*Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos 
tb_produto para se trabalhar com o serviço de um site de cursos onlines(não esqueça de criar a foreign key de 
tb_categoria nesta tabela)*/
CREATE TABLE tb_produto(
	id bigint AUTO_INCREMENT PRIMARY KEY,
    nome varchar(20) NOT NULL,
    preco decimal,
    idioma varchar(10),
    categoria_id bigint NOT NULL,
    
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
INSERT INTO tb_categoria(categoria, ativo) VALUES("Java", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Python", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Matemática", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Design", false);
INSERT INTO tb_categoria(categoria, ativo) VALUES("CSS", true);

SELECT * FROM tb_categoria;

/*Popule esta tabela Produto com até 8 dados.*/
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("POO", 100, "Português", 2);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("POO", 20, "Português", 1);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("Algoritmos", 5, "Inglês", 3);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("UI/UX", 26, "Espanhol", 4);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("Bibliotecas", 70, "Português", 5);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("Numpy e Pandas", 150, "Inglês", 2);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("Eclipse", 15, "Português", 1);
INSERT INTO tb_produto(nome, preco, idioma, categoria_id) VALUES("Vetores e matrizes", 65, "Espanhol", 3);

SELECT * FROM tb_produto;

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
SELECT nome, preco, idioma FROM tb_produto WHERE preco > 50;

/*Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.*/
SELECT nome, preco, idioma FROM tb_produto WHERE preco > 3 AND preco < 60;

/*Faça um select  utilizando LIKE buscando os Produtos com a letra P.*/
SELECT * FROM tb_produto WHERE nome LIKE "P%";

/*Faça um um select com Inner join entre  tabela categoria e produto.*/
SELECT nome, preco, idioma, categoria FROM tb_produto
	INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id;
    
/*Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são da categoria Java).*/
SELECT nome, preco, idioma, categoria FROM tb_produto
	INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id
    WHERE tb_categoria.categoria = "Python"
    ORDER BY preco DESC;