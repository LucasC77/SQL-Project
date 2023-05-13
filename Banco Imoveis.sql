--***********************
-- Criar Banco de Dados
--***********************
CREATE DATABASE IMOVEIS
go

USE IMOVEIS
go

--**************************
-- Criar as Tabelas do Banco
--**************************
CREATE TABLE Bairro (
       cd_Bairro            int NOT NULL,
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Bairro            varchar(20)
)
go
CREATE TABLE Cidade (
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Cidade            varchar(20)
)
go
CREATE TABLE Comprador (
       cd_Comprador         int NOT NULL,
       nm_Comprador         varchar(20),
       ds_Endereco          varchar(20),
       cd_CPF               int,
       nm_Cidade            varchar(20),
       nm_Bairro            varchar(20),
       sg_Estado            varchar(20),
       cd_Telefone          varchar(20),
       ds_Email             varchar(20)
)
go
CREATE TABLE Estado (
       sg_Estado            char(2) NOT NULL,
       nm_Estado            varchar(20)
)
go
CREATE TABLE Faixa_Imovel (
       cd_Faixa             int NOT NULL,
       nm_Faixa             varchar(30),
       vl_Minimo            money,
       vl_Maximo            money
)
go
CREATE TABLE Imovel (
       cd_Imovel            int NOT NULL,
       cd_Vendedor          int,
       cd_Bairro            int,
       cd_Cidade            int,
       sg_Estado            char(2),
       ds_Endereco          varchar(40),
       qt_AreaUtil          decimal(10,2),
       qt_AreaTotal         decimal(10,2),
       ds_Imovel            varchar(300),
       vl_Imovel            money,
       qt_Ofertas           int,
       ic_Vendido           char(1),
       dt_Lancto            datetime,
       qt_ImovelIndicado    int
)
go
CREATE TABLE Oferta (
       cd_Comprador         int NOT NULL,
       cd_Imovel            int NOT NULL,
       vl_Oferta            money,
       dt_Oferta            datetime
)
go
CREATE TABLE Vendedor (
       cd_Vendedor          int NOT NULL,
       nm_Vendedor          varchar(40),
       ds_Endereco          varchar(40),
       cd_CPF               decimal(11),
       nm_Cidade            varchar(20),
       nm_Bairro            varchar(20),
       sg_Estado            char(2),
       cd_Telefone          varchar(20),
       ds_Email             varchar(80)
)
go
--**************************
-- Criar as Chaves Primárias
--**************************
ALTER TABLE Bairro
       ADD PRIMARY KEY (cd_Bairro, cd_Cidade, sg_Estado)
go
ALTER TABLE Cidade
       ADD PRIMARY KEY (cd_Cidade, sg_Estado)
go
ALTER TABLE Estado
       ADD PRIMARY KEY (sg_Estado)
go
ALTER TABLE Comprador
       ADD PRIMARY KEY (cd_Comprador)
go
ALTER TABLE Faixa_Imovel
       ADD PRIMARY KEY (cd_Faixa)
go
ALTER TABLE Imovel
       ADD PRIMARY KEY (cd_Imovel)
go
ALTER TABLE Oferta
       ADD PRIMARY KEY (cd_Comprador, cd_Imovel)
go
ALTER TABLE Vendedor
       ADD PRIMARY KEY (cd_Vendedor)
go
--******************************
-- Criar as Chaves Estrangeiras
--******************************
ALTER TABLE Bairro
       ADD FOREIGN KEY (cd_Cidade, sg_Estado)
                             REFERENCES Cidade
go
ALTER TABLE Cidade
       ADD FOREIGN KEY (sg_Estado)
                             REFERENCES Estado
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Vendedor)
                             REFERENCES Vendedor
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Bairro, cd_Cidade, sg_Estado)
                             REFERENCES Bairro
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Comprador)
                             REFERENCES Comprador
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Imovel)
                             REFERENCES Imovel
go

-- Registros
insert into Estado
	values( 'SP','SÃO PAULO')
go
insert into Estado
	values( 'RJ','RIO DE JANEIRO')
go


insert into Cidade
	values( 1,'SP','SÃO PAULO')
go
insert into Cidade
	values(2,'SP','SANTO ANDRÉ')
go
insert into Cidade
	values(3,'SP','CAMPINAS')
go
insert into Cidade
	values(1,'RJ','RIO DE JANEIRO')
go
insert into Cidade
	values(2,'RJ','NITEROI')
go


insert into Bairro
	values(1,1,'SP','JARDINS')
go
insert into Bairro
	values(2,1,'SP','MORUMBI')
go
insert into Bairro
	values(3,1,'SP','AEROPORTO')
go
insert into Bairro
	values(1,1,'RJ','AEROPORTO')
go
insert into Bairro
	values(2,1,'RJ','NITEROI')
go


insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(1,'MARIA DA SILVA','RUA DO GRITO, 45','msilva@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(2,'MARCO ANDRADE','AV. DA SAUDADE,325','mandrade@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(3,'ANDRÉ CARDOSO','AV. BRASIL, 401','acardoso@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(4,'TATIANA SOUZA','RUA DO IMPERADOR, 778','tsouza@nova.com')
go


insert into Imovel 
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(1,1,1,1,'SP','AL. TIETE, 3304/101',250,400,180000)
go
insert into Imovel
		(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(2,1,2,1,'SP','AV. MORUMBI, 2230',150,250,135000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(3,2,1,1,'RJ','R. GAL. OSORIO, 445/34',250,400,185000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(4,2,2,1,'RJ','R. D. PEDRO I, 882',120,200,110000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(5,3,3,1,'SP','AV. RUBENS BERTA, 2355',110,200,95000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(6,4,1,1,'RJ','R. GETULIO VARGAS, 552',200,300,99000)
go


insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(1,'EMMANUEL ANTUNES','R. SARAIVA, 452','eantunes@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(2,'JOANA PEREIRA','AV PROTUGAL, 52','jpereira@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(3,'RONALDO CAMPELO','R. ESTADOS UNIDOS','rcampelo@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(4,'MANFRED AUGUSTO','AV. BRASIL,351','maugusto@nova.com')
go


insert into Oferta
	values(1,1,170000,'10-01-2009')
go
insert into Oferta
	values(1,3,180000,'10-01-2009')
go
insert into Oferta
	values(2,2,135000,'15-01-2009')
go
insert into Oferta
	values(2,4,100000,'15-02-2009')
go
insert into Oferta
	values(3,1,160000,'15-01-2009')
go
insert into Oferta
	values(3,2,140000,'20-02-2009')
go


 Select sum (vl_Imovel)
	from imovel
	where sg_estado in ('sp', 'rj', 'mg')



