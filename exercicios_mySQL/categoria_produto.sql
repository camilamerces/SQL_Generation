/*Atividade 2
Crie um banco de dados para um serviço de ecommerce de uma empresa, o nome do
banco deverá ter o seguinte nome db_ecommerce2, onde o sistema trabalhará com as
informações dos produtos desta empresa.*/
CREATE DATABASE db_ecommerce2;
USE db_ecommerce2;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.*/
CREATE TABLE tb_categoria(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria varchar(20) NOT NULL,
    disponivel boolean
);

/*Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste ecommerce (não
esqueça de criar a foreign key de tb_categoria nesta tabela).*/
CREATE TABLE tb_produto(
	id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(20) NOT NULL,
    preco decimal NOT NULL,
    marca varchar(20),
    categoria_id bigint NOT NULL,
    
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
INSERT INTO tb_categoria(categoria, disponivel) VALUES("Eletrônicos", true);
INSERT INTO tb_categoria(categoria, disponivel) VALUES("Casa", true);
INSERT INTO tb_categoria(categoria, disponivel) VALUES("Beleza", true);
INSERT INTO tb_categoria(categoria, disponivel) VALUES("Automóvel", true);
INSERT INTO tb_categoria(categoria, disponivel) VALUES("Alimentação", true);

SELECT * FROM tb_categoria;

/*Popule esta tabela Produto com até 15 dados.*/
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Celular", 1200, "Nokia", 1);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Sofá", 2500, "Loft", 2);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Rímel", 500, "Avon", 3);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Pneu", 250, "Michelin", 4);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Cesta básica", 150, "Adria", 5);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Celular", 1400, "Motorola", 1);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Mesa", 700, "Bahia", 2);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Sombra", 20, "Boticário", 3);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Oléo", 200, "GM", 4);
INSERT INTO tb_produto(nome, preco, marca, categoria_id) VALUES("Pão artesanal", 100, "Aurora", 5);

SELECT * FROM tb_produto; 

/*Faça um select que retorne os Produtos com o valor maior do que 2000.*/
SELECT nome, preco FROM tb_produto WHERE preco > 2000;

/*Faça um select trazendo os Produtos com valor entre 1000 e 2000.*/
SELECT nome, preco FROM tb_produto WHERE preco > 1000 AND preco < 2000;

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
SELECT nome, preco FROM tb_produto WHERE nome LIKE "C%";

/*Faça um um select com Inner join entre tabela cargo e funcionário.*/
SELECT * FROM tb_produto
	INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são eletrodomesticos).*/
SELECT nome, preco, marca, categoria FROM tb_produto
	INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id
    WHERE tb_categoria.categoria = "Eletrônicos";