USE master
DROP DATABASE aula2
CREATE DATABASE aula2
use aula2
go
create table tb_client (
	id_client int NOT NULL  PRIMARY KEY IDENTITY (1,1), 
	nome nvarchar(20), 
	enn nvarchar(20), 
	fone nvarchar(20), 
	email nvarchar(20),
	)

create table tb_hardware (
	id_hardware int NOT NULL PRIMARY KEY IDENTITY (1,1), 
	discrição nvarchar(20), 
	preço money, 
	qtd int, 
	qtdmin int
	)

create table tb_vendas (
	id_vendas int NOT NULL PRIMARY KEY IDENTITY (1,1), 
	id_client int, 
	data date, 
	vlrtotal money, 
	desconto float, 
	vlrpgo money
	)

create table tb_vendasitens (
	id_item int NOT NULL, 
	id_vendas int, 
	id_hardware int,
	qtd_item int, 
	total_item int
	)

alter table tb_vendas 
	add constraint fk_id_client
	foreign key (id_client)
	references tb_client (id_client)

alter table tb_vendasitens 
	add constraint fk_id_vendas 
	foreign key (id_vendas) 
	references tb_vendas (id_vendas)

alter table tb_vendasitens
	add constraint fk_id_hardware 
	foreign key (id_hardware) 
	references tb_hardware (id_hardware)

insert into tb_client(nome,enn,fone,email) values ('paloma','R. TAL','5644-4563','paolma@goo.com')
insert into tb_client(nome,enn,fone,email) values ('Sarah','R. AQUI','5645-5465','sarh@goo.com')
insert into tb_client(nome,enn,fone,email) values ('Eduardo','R. LÁ','5644-5124','edua@goo.com')
insert into tb_client(nome,enn,fone,email) values ('Julio','R. CÁ','5644-5451','jusa@goo.com')
insert into tb_client(nome,enn,fone,email) values ('Luis','R. VAI','5647-5452','laus@goo.com')

insert into tb_hardware (discrição,preço,qtd,qtdmin) values ('Placa-mãe',400,500,10)
insert into tb_hardware (discrição,preço,qtd,qtdmin) values ('Placa de video',1800,200,10)
insert into tb_hardware (discrição,preço,qtd,qtdmin) values ('Placa de rede',400,500,10)
insert into tb_hardware (discrição,preço,qtd,qtdmin) values ('Placa de som',400,500,10)
insert into tb_hardware (discrição,preço,qtd,qtdmin) values ('HARD DISK 500GB',300,100,10)

select * from tb_client /* comando para visualizar a tabela */
select * from tb_hardware