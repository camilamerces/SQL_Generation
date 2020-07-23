/*Atividade 2
Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco deverá ter o seguinte 
nome db_pizzaria_legal, onde o sistema trabalhará com as informações dos produtos desta empresa.*/

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do 
tb_categoria para se trabalhar com o serviço dessa pizzaria.*/
CREATE TABLE tb_categoria(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria varchar(20) NOT NULL,
    ativo boolean
);

/*Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos relevantes dos
 tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de criar a foreign key de tb_categoria
 nesta tabela).*/
 CREATE TABLE tb_produto(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sabor varchar(30) NOT NULL,
    preco decimal NOT NULL,
    tamanho int,
    categoria_id bigint NOT NULL,
    
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
 );

/*Popule esta tabela Categoria com até 5 dados.*/
INSERT INTO tb_categoria(categoria, ativo) VALUES("Salgada", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Doce", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Vegetariana", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Vegana", true);
INSERT INTO tb_categoria(categoria, ativo) VALUES("Fit", true);

SELECT * FROM tb_categoria;

/*Modificando o tipo da columa tamanho de int para varchar*/
ALTER TABLE tb_produto MODIFY COLUMN tamanho varchar(10);

/*Popule esta tabela pizza com até 8 dados.*/
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Marguerita", 35.00, "Grande", 1);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Prestígio", 65.00, "Grande", 2);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Abobrinha com mussarela", 30.00, "Pequena", 3);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Abobrinha", 42.00, "Média", 4);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Ratatouille", 55.00, "Grande", 5);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Calabresa", 39.00, "Grande", 1);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Chocolate", 34.00, "Média", 2);
INSERT INTO tb_produto(sabor, preco, tamanho, categoria_id) VALUES("Marguerita", 25.00, "Pequena", 1);

SELECT * FROM tb_produto;

/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.*/
SELECT sabor, preco, tamanho FROM tb_produto WHERE preco > 45;

/*Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.*/
SELECT sabor, preco, tamanho FROM tb_produto WHERE preco BETWEEN 29 AND 60;

/*Faça um select  utilizando LIKE buscando os Produtos com a letra C.*/
SELECT sabor, preco, tamanho FROM tb_produto WHERE sabor LIKE "C%";

/*Faça um um select com Inner join entre  tabela categoria e pizza.*/
SELECT * FROM tb_produto
	INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos 
que são pizza doce).*/
SELECT sabor, preco, tamanho, categoria FROM tb_produto
	INNER JOIN tb_categoria ON tb_produto.categoria_id = tb_categoria.id
    WHERE categoria = "Salgada"
    ORDER BY preco DESC;