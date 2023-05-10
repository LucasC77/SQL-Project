Create database Exum
go
Use Exum
go
Create Table Vendedor(
	cd_vendedor int not null,
	nm_vendedor varchar(40),
	ds_endereco varchar(40),
	cd_cpf varchar(15),
	nm_cidade varchar(40),
	nm_bairro varchar(40),
	sg_estado char(02),
	cd_telefone varchar(20),
	ds_email varchar(60))
go
Create Table Comprador(
	cd_comprador int not null,
	nm_comprador Varchar(40),
	ds_endereco varchar(40),
	cd_cpf varchar(20),
	nm_cidade varchar(40),
	nm_bairro varchar(40),
	sg_estado char(02),
	cd_telefone varchar(20),
	ds_email varchar(60))
go
Create Table Estado(
	sg_estado char(02) not null,
	nm_estado varchar(40))
go
Create Table Cidade(
	cd_cidade int not null,
	sg_estado char(02)not null,
	nm_cidade varchar(40))
go
Create Table Bairro(
	cd_bairro int not null,
	cd_cidade int not null,
	sg_estado char(02)not null,
	nm_bairro varchar(40))
go
Create Table Faixa_imovel(
	cd_faixa int not null,
	nm_faixa varchar(20),
	vl_maximo money,
	vl_minimo money)
go
Create Table Oferta(
	cd_comprador int not null,
	cd_imovel int not null,
	vl_oferta money,
	dt_oferta datetime,
	                                                                           --ex 15
	qt_parcelas int not null,
	CONSTRAINT CK_oferta CHECK (qt_parcelas > 1))
go
Create Table Imovel(
	cd_imovel int not null,
	cd_vendedor int not null,
	cd_bairro int not null,
	cd_cidade int not null,
	sg_estado char(02) not null,
	ds_endereco varchar(40),
	qt_areautil decimal(10,2),
	qt_areatotal decimal(10,2),
	ds_imovel varchar(300),
	vl_imovel money,
	qt_ofertas int,
	ic_vendido char(1),
	dt_lancto datetime,
	qt_imovelIndicado int not null

	 CONSTRAINT PK_Imovel CHECK (cd_imovel > 0))                                --ex 14
go

--Chaves Primarias

Alter Table Vendedor
	add primary key(cd_vendedor)
go
Alter Table Comprador
	add primary key (cd_comprador)
go
Alter Table Oferta
	add primary key(cd_comprador)
go
Alter Table Estado
	add primary key(sg_estado)
go
Alter Table Cidade
	add primary key (cd_cidade, sg_estado)
go
Alter Table Bairro
	add primary key (cd_bairro, cd_cidade, sg_estado)
go
Alter Table Faixa_Imovel
	add primary key (cd_faixa)
go
Alter Table IMovel
	add primary key (cd_imovel)
go

--Chaves Estrangeiras

Alter Table Oferta
	add foreign key (cd_comprador)
	References Comprador
go
alter Table Oferta
	add foreign key (cd_imovel)
	References Imovel
go
Alter Table Cidade
	add foreign key (sg_estado)
	References Estado
go
Alter Table Bairro
	add foreign key (sg_estado, cd_cidade)
		References Cidade
go
Alter Table Imovel
	add foreign key (cd_bairro, cd_cidade, sg_estado)
	References Bairro
go
Alter Table Imovel
	add foreign key (cd_vendedor, ds_endereco)
	References vendedor
go

--Criar INDEX

Create index indImovelOferta
	On oferta(cd_imovel)
go
Create index indValorOferta
	on oferta(vl_oferta Desc)
go

--Aula 02

--Inserindo dados
Insert Into Estado	
			VAlues('SP', 'SAO PAULO'),
					('RJ', 'RIO DE JANEIRO')
go
Insert Into Cidade
	(cd_Cidade, nm_Cidade, sg_Estado)
	Values
(1,   'SÃO PAULO',  'SP'), 
(2,   'SANTO ANDRÉ', 'SP'), 
(3,   'CAMPINAS',  'SP'), 
(1,  'RIO DE JANEIRO', 'RJ'), 
(2, 'NITEROI',  'RJ')
go
Insert Into Bairro
	(cd_Bairro, nm_bairro, cd_cidade, sg_estado)
	Values 
(1, 'JARDINS',   1,  'SP' ),
(2,  'MORUMBI',   1,  'SP' ),
(3, 'AEROPORTO',  1,  'SP'),
(1,   'AEROPORTO',  1,  'RJ'), 
(2,   'NITEROI',   1, 'RJ')
go
Insert Into Vendedor
	(cd_vendedor, nm_vendedor, ds_endereco, ds_email)
	Values
	(1,   'MARIA DA SILVA',  'RUA DO GRITO, 45', 'msilva@nova.com'),
	(2,   'MARCO ANDRADE', 'AV. DA SAUDADE,325', 'mandrade@nova.com'),
	(3,   'ANDRÉ CARDOSO',  'AV. BRASIL, 401',  'acardoso@nova.com'),
	(4,   'TATIANA SOUZA',  'RUA IMPERADOR, 778', 'tsouza@nova.com')
go
Insert Into Imovel
	(cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel)
	Values
(1, 1, 1, 1, 'SP', 'AL. TIETE, 3304/101', 250, 400, 180000),
(2, 1, 2, 1, 'SP', 'AV. MORUMBI, 2230', 150, 250, 135000),
(3, 2, 1, 1, 'RJ', 'R. GAL. OSORIO, 445/34', 250, 400, 185000),
(4, 2, 2, 1, 'RJ', 'R. D. PEDRO I, 882', 120, 200, 110000),
(5, 3, 3, 1, 'SP', 'AV. RUBENS BERTA, 2355', 110, 200,   95000),
(6, 4, 1, 1, 'RJ', 'R. GETULIO VARGAS, 552', 200,  300,   99000)
go
Insert Into Comprador
	(cd_Comprador, nm_Comprador, ds_Endereco, ds_Email) 
	Values 
	(1, 'EMMANUEL ANTUNES', 'R. SARAIVA, 452', 'eantunes@nova.com'),
	(2, 'JOANA PEREIRA', 'AV PROTUGAL, 52', 'jpereira@nova.com'),
	(3, 'RONALDO CAMPELO', 'R. ESTADOS UNIDOS', 'rcampelo@nova.com'),
	(4, 'MANFRED AUGUSTO', 'AV. BRASIL,351', 'maugusto@nova.com')
	go
Insert Into Oferta
	(cd_Comprador,  cd_Imovel,   vl_Oferta,  dt_Oferta) 
	Values
	(1,    1,   170000,  10/01/09),
	(1,    3,   180000,  10/01/09),
	(2,    2,   135000,  15/01/09),
	(2,    4,   100000,  15/02/09),
	(3,    1,   160000,  05/01/09),
	(3,    2,   140000,  20/02/09) 
go
Insert Into Faixa_imovel
	(cd_Faixa,  nm_faixa, vl_Minimo, vl_Maximo)
	Values
	(1,   'BAIXO', 0,  105000),
	(2,   'MÉDIO', 105001, 180000),
	(3,   'ALTO',  180001, 999999)
go
--Alterações
update Imovel 
	set vl_Imovel = vl_Imovel * 1.12 
go
update Imovel 
	set vl_Imovel = vl_Imovel * 0.95  
	where cd_Vendedor = 1
go
Update Comprador
	set ds_endereco  = 'R. ANANÁS, 45'
	where cd_comprador = 2
go
Update Comprador
	set sg_estado  = 'RJ'
	where cd_comprador = 2
go
Delete Oferta
	where vl_oferta = 160000
go

--ex 15
--Alter table Oferta
--add qt_parcelas int CHECK (qt_parcelas > 1)

--ex 16
Alter Table Oferta
	drop column qt_ofertas
go