use master;
drop database db3;
create database db3;
use db3;
create table analise(
id int identity(1,1),
nome nvarchar(100) not null,
pco decimal(3,2),
primary key (id)
);
create table prod_vend(
id int identity(1,1),
id_vda int,
id_prod int,
qtd int ,
nome nvarchar(100) not null,
primary key (id)
);
create table venda(
id int identity(1,1),
data date,
id_l int,
vlr decimal(3,2),
none nvarchar(100) not null,
primary key (id)
);
create table cliente(
id int identity(1,1),
nome nvarchar(100) not null,
primary key (id)
);

go

alter table venda
add constraint fk_venda_cliente
foreign key (id_l) references cliente(id)

alter table prod_vend
add constraint fk_prodvend_analise
foreign key (id_prod) references analise(id)

alter table prod_vend
add constraint fk_venda_venda
foreign key (id_vda) references venda(id)

go

INSERT INTO analise (nome, preco) VALUES ('CPU', 700.00);
INSERT INTO analise (nome, preco) VALUES ('Mouse', 50.00);
INSERT INTO analise (nome, preco) VALUES ('Monitor', 400.00);
INSERT INTO cliente (nome) VALUES ('Maria');
INSERT INTO venda (data, id_l, vlr) VALUES('2020-02-28',1,550.00);
INSERT INTO prod_vend (id_prod, id_vda, qtd) VALUES (1,1,3);