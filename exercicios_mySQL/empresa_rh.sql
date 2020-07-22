create database db_empresa_rh;
use db_empresa_rh;

create table tb_funcionarios(
	id bigint(5) auto_increment primary key not null,
    nome varchar(20) not null,
    setor varchar(20) not null,
    cargo varchar(20),
    salario bigint(6) not null
);

insert into tb_funcionarios (nome, setor, cargo, salario) values ("Camila", "Diretoria", "Diretora", 10000);
insert into tb_funcionarios (nome, setor, cargo, salario) values ("José", "Tecnologia", "Cientista de dados", 5000);
insert into tb_funcionarios (nome, setor, cargo, salario) values ("Maria", "Marketing", "Analista II", 4500);
insert into tb_funcionarios (nome, setor, cargo, salario) values ("Rafael", "Tecnologia", "Estagiário", 1000);
insert into tb_funcionarios (nome, setor, salario) values ("Joana", "Recursos Humanos", 1900);
insert into tb_funcionarios (nome, setor, cargo, salario) values ("Caroline", "Design", "Diretora de Arte", 3500);
insert into tb_funcionarios (nome, setor, cargo, salario) values ("Mateus", "Negócios", "Analista I", 5100);

select nome, setor, cargo from tb_funcionarios where salario > 2000;

select nome, setor, cargo from tb_funcionarios where salario < 2000;

update tb_funcionarios set cargo = "Gerente" where id = 5;

select * from tb_funcionarios;





