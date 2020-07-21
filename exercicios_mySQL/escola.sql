create database db_escola;
use db_escola;

create table tb_alunos(
	id bigint(5) auto_increment primary key not null,
    nome varchar(20) not null,
    matricula int(5),
    nota float(2) not null,
    aprovado boolean
);

insert into tb_alunos(nome, matricula, nota, aprovado) values ("Henrique", 234, 5.2, false);
insert into tb_alunos(nome, matricula, nota, aprovado) values ("Bruno", 269, 8.1, true);
insert into tb_alunos(nome, matricula, nota, aprovado) values ("Marcela", 357, 7.3, true);
insert into tb_alunos(nome, matricula, nota, aprovado) values ("Caique", 426, 6.5, true);
insert into tb_alunos(nome, matricula, nota, aprovado) values ("Giovana", 522, 4.9, false);
insert into tb_alunos(nome, matricula, nota, aprovado) values ("Melissa", 232, 3, false);
insert into tb_alunos(nome, matricula, nota) values ("Alexandra", 456, 9.5);

select nome, nota , aprovado from tb_alunos where nota > 7;
 
select nome, nota , aprovado from tb_alunos where nota < 7;

update tb_alunos set aprovado = false where id = 4;
update tb_alunos set aprovado = true where id = 7;

select * from tb_alunos;