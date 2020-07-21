create database db_ecommerce;
use db_ecommerce;

create table tb_produtos(
	id bigint(5) auto_increment primary key not null,
    produto varchar(20) not null,
    valor bigint(5) not null,
    estoque boolean,
    parcelamento boolean
);

insert into tb_produtos(produto, valor, estoque, parcelamento) values ("forno elétrico", 490, true, false);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("geladeira", 900, false, true);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("sofá", 1200, true, true);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("cama", 420, true, false);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("celular", 2100, true, true);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("televisão", 1400, true, true);
insert into tb_produtos(produto, valor, estoque, parcelamento) values ("panela", 100, false, false);

select produto from tb_produtos where valor > 500;

select produto from tb_produtos where valor < 500;

update tb_produtos set estoque = true where id = 7;

select * from tb_produtos;