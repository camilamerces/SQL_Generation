/*Atividade 1
Crie um banco de dados para um serviço de RH de uma empresa, o nome do banco deverá
ter o seguinte nome db_RH2, onde o sistema trabalhará com as informações dos
funcionários desta empresa.*/
CREATE DATABASE db_RH2;
USE db_RH2;

/*Crie uma tabela tb_cargo utilizando a habilidade de abstração e determine 3 atributos
relevantes do Cargos para se trabalhar com o serviço deste RH.*/
CREATE TABLE tb_cargo(
	id bigint(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cargo varchar(20) NOT NULL,
    ativo boolean
);

/*Crie uma tabela tb_funcionário e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço deste RH (não
esqueça de criar a foreign key de tb_cargo nesta tabela).*/
CREATE TABLE tb_funcionario(
	id bigint AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30) NOT NULL,
    setor varchar(15),
    cargo_id bigint NOT NULL,
    salario decimal,
    
    FOREIGN KEY(cargo_id) REFERENCES tb_cargo(id)
);

/*Popule esta tabela cargos com até 5 dados.*/
INSERT INTO tb_cargo(cargo, ativo) VALUES("Desenvolvedor Python", true);
INSERT INTO tb_cargo(cargo, ativo) VALUES("Cientista de dados", true);
INSERT INTO tb_cargo(cargo, ativo) VALUES("Analista de negócios", false);
INSERT INTO tb_cargo(cargo, ativo) VALUES("Designer", true);
INSERT INTO tb_cargo(cargo, ativo) VALUES("Marketing", true);

SELECT * FROM tb_cargo;

/*Popule esta tabela funcionarios com até 15 dados.*/
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Bruna Silva", "Tecnologia", 2, 5000);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Melissa Castro", "Marketing", 5, 2100);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Lucas Pereira", "Administração", 3, 4500);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Caroline Souza", "Tecnologia", 1, 7000);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Bianca Andrade", "Design", 4, 850);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Maria Lima", "Tecnologia", 2, 6400);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("João Pedro", "Tecnologia", 1, 5300);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Silvia Oliveira", "Administração", 3, 3500);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Carmem Miranda", "Tecnologia", 1, 10000);
INSERT INTO tb_funcionario(nome, setor, cargo_id, salario) VALUES("Celso Freitas", "Design", 4, 1200);

SELECT * FROM tb_funcionario;

/*Faça um select que retorne os funcionários com o salário maior do que 2000.*/
SELECT * FROM tb_funcionario WHERE salario > 2000;

/*Faça um select trazendo os funcionários com salário entre 1000 e 2000.*/
SELECT * FROM tb_funcionario WHERE salario > 1000 AND salario < 2000;

/*Faça um select utilizando LIKE buscando os Funcionários com a letra C.*/
SELECT * FROM tb_funcionario WHERE nome LIKE "C%";

/*Faça um um select com Inner join entre tabela cargos e funcionarios.*/
SELECT * FROM tb_funcionario
	INNER JOIN tb_cargo ON tb_cargo.id = tb_funcionario.cargo_id;

/*Faça um select onde traga todos os funcionários de um cargo específico (exemplo todos os
funcionários que são programador).*/
SELECT nome, setor, cargo, salario FROM tb_funcionario
	INNER JOIN tb_cargo ON tb_cargo.id = tb_funcionario.cargo_id
    WHERE tb_cargo.cargo = "Desenvolvedor Python" OR tb_cargo.cargo = "Cientista de dados"
    ORDER BY salario DESC;
