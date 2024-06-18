CREATE DATABASE DB_CPR_1S3_N;

USE DB_CPR_1S3_N;

CREATE TABLE TB_COMISSAO (
SG_COMISSAO CHAR(1) NOT NULL,
DS_DESCRICAO VARCHAR(30),
CONSTRAINT PK_COMISSAO
	PRIMARY KEY(SG_COMISSAO));
    
CREATE TABLE TB_CLIENTE (
CD_CLIENTE INT NOT NULL,
NM_CLIENTE VARCHAR(80),
NM_ENDERECO VARCHAR(80),
CD_CEP CHAR(8),
CD_CPF CHAR(11),
CONSTRAINT PK_CLIENTE
	PRIMARY KEY(CD_CLIENTE));
    
CREATE TABLE TB_UNIDADE(
SG_UNIDADE VARCHAR(3) NOT NULL,
NM_UNIDADE VARCHAR(15),
CONSTRAINT PK_UNIDADE
	PRIMARY KEY(SG_UNIDADE));
    
CREATE TABLE TB_REVENDEDOR(
CD_REVENDEDOR INT NOT NULL,
NM_REVENDEDOR VARCHAR(80),
SG_COMISSAO CHAR(1),
CONSTRAINT PK_REVENDEDOR
	PRIMARY KEY(CD_REVENDEDOR),
CONSTRAINT FK_REVENDEDOR_COMISSAO
	FOREIGN KEY(SG_COMISSAO)
		REFERENCES TB_COMISSAO(SG_COMISSAO));
        
CREATE TABLE TB_PRODUTO(
CD_PRODUTO INT NOT NULL,
NM_PRODUTO VARCHAR(50),
SG_UNIDADE VARCHAR(3),
VL_PRODUTO DECIMAL(7,2),
CONSTRAINT PK_PRODUTO
	PRIMARY KEY(CD_PRODUTO),
CONSTRAINT FK_PRODUTO_UNIDADE
	FOREIGN KEY(SG_UNIDADE)
		REFERENCES TB_UNIDADE(SG_UNIDADE));
        
CREATE TABLE TB_PEDIDO(
CD_PEDIDO INT NOT NULL,
DT_PEDIDO DATE,
CD_CLIENTE INT,
CD_REVENDEDOR INT,
CONSTRAINT PK_PEDIDO
	PRIMARY KEY(CD_PEDIDO),
CONSTRAINT FK_PEDIDO_CLIENTE
	FOREIGN KEY(CD_CLIENTE)
		REFERENCES TB_CLIENTE(CD_CLIENTE),
CONSTRAINT FK_PEDIDO_REVENDEDOR
	FOREIGN KEY(CD_REVENDEDOR)
		REFERENCES TB_REVENDEDOR(CD_REVENDEDOR));
        


CREATE TABLE ITEM_PEDIDO(
CD_PEDIDO INT,
CD_PRODUTO INT,
QT_PRODUTO INT,
CONSTRAINT C_ITEM_PEDIDO
	PRIMARY KEY(CD_PEDIDO,CD_PRODUTO),
CONSTRAINT FK_ITEM_PEDIDO
	FOREIGN KEY(CD_PEDIDO)
		REFERENCES TB_PEDIDO(CD_PEDIDO),
CONSTRAINT FK_ITEM_PRODUTO
	FOREIGN KEY(CD_PRODUTO)
		REFERENCES TB_PRODUTO(CD_PRODUTO));
        

        
SHOW TABLES;

insert into tb_cliente values 
(720,'Ana','Rua 17 n. 19','24358310','12113231000'),
(870,'Flávio','Av. Pres. Vargas, 10','22763931','2253412693'),
(110,'Jorge','Rua Caiapo,13','30078500','1451226498'),
(222,'Lucia','Rua Itabira 123 lj 9','22124391','2812525393'),
(830,'Mauricio','Av. Paulista 1236 sl/ 2345','30126083','3281698574'),
(130,'Edmar','Rua da Praia sn/',null,'234632842'),
(410,'Rodolfo','Largo da Lapa 27 Sobrado','30078900','1273657123'),
(201,'Beth','Av. Climério n.45','25679300','3284822303'),
(157,'Paulo','Tv. Morais c/3',null,'12736557123'),
(180,'Livio','Av Beira Mar n.1256','30077500','2176357102'),
(260,'Susana','Rua Lopes Mendes, 12','30046500','1578985223'),
(290,'Renato','Rua Meireles n. 123 bl2 sl 345','30225900','7887414700'),
(390,'Sebastiao','Rua da Igreja n.10','30438700','0212587401'),
(234,'Jose','Quadra 3 bl. 3 sl. 1003','22841650','4887441212');

insert into tb_comissao VALUES
('A','Uma Estrela'),
('B','Duas Estrelas'),
('C','Tres Estrelas'),
('D','Quatro Estrelas'),
('E','Cinco Estrelas');

insert into tb_revendedor values 
(011,'João','C'),
(240,'Antonio','C'),
(720,'Felipe','A'),
(213,'Jonas','A'),
(101,'Paulo','C'),
(310,'Josias','B'),
(250,'Maurício','B');

insert into tb_unidade VALUES
('KG','Kilograma'),
('M','Metro'),
('L','Litro'),
('UN','Unidade'),
('G','Grama');

insert into tb_produto values
(25,'Queijo','Kg',0.97),
(31,'Chocolate','UN',0.87),
(78,'Vinho','L',2.00),
(22,'Linho','M',0.11),
(30,'Açucar','KG',0.30),
(53,'Linha','M',1.80),
(13,'Ouro','G',6.18),
(45,'Madeira','M',0.25),
(87,'Cano','M',1.97),
(77,'Papel','M',1.05);

insert into tb_pedido values
(121,'2012-02-01',410,310),
(97,'2012-02-01',720,101),
(101,'2012-03-07',720,101),
(137,'2012-06-06',720,720),
(148,'2012-06-06',720,101),
(189,'2012-06-06',870,213),
(104,'2012-07-09',110,101),
(203,'2012-07-09',830,250),
(98,'2011-12-12',410,310),
(143,'2011-12-13',201,101),
(105,'2011-12-13',180,240),
(111,'2012-02-01',260,240),
(103,'2012-02-01',260,11),
(91,'2012-03-07',260,11),
(138,'2012-06-06',260,11),
(108,'2012-06-06',290,310),
(119,'2012-03-07',390,250),
(172,'2012-03-07',410,11);

 insert into item_pedido values
(121,25,10),
(121,31,35),
(97,77,20),
(101,31,9),
(101,78,18),
(101,13,5),
(98,77,5),
(148,45,8),
(148,31,7),
(148,77,3),
(148,25,10),
(148,78,30),
(104,53,32),
(203,31,6),
(189,78,45),
(143,31,20),
(143,78,10),
(105,78,10),
(111,25,10),
(111,78,70),
(103,53,37),
(91,77,40),
(138,22,10),
(138,77,35),
(138,53,18),
(108,13,17),
(119,77,40),
(119,13,6),
(119,22,10),
(119,53,43),
(137,13,8);

select * from tb_pedido;

select * from tb_cliente;

select * from tb_comissao;

select * from tb_produto;

select * from tb_revendedor;

select * from tb_unidade;
        
create table tb_uf(
sg_uf char(2) not null,
nm_uf varchar(30),
constraint pk_uf
    primary key(sg_uf));
    
create table tb_cidade(
cd_cidade int not null,
nm_cidade varchar(40),
sg_uf char(2),
constraint pk_cidade
    primary key(cd_cidade),
constraint fk_cidade_uf
    foreign key(sg_uf)
        references tb_uf(sg_uf));
        
/* 
alter table nome da tabela
    add atributo tipo do atributo tamanho

 

alter table nome da tabela
    change nome do atributo novo atributo tipo e tamanho

 

alter table nome da tabela
    drop nome do atributo
*/
desc tb_cliente;
select * from tb_cliente;

alter table tb_cliente add cd_cidade int;
alter table tb_cliente add
    constraint fk_cliente_cidade
        foreign key(cd_cidade)
            references tb_cidade(cd_cidade);
            
Insert Into tb_uf Values
 ('AC','Acre'),  
 ('AL','Alagoas'),
 ('AM','Amazonas'),
 ('AP','Amapá'),
 ('BA','Bahia'),
 ('CE','Ceará'),
 ('DF','Distrito Federal'),
 ('ES','Espírito Santo'),
 ('GO','Goiás'),
 ('MA','Maranhão'),
 ('MG','Minas Gerais'),
 ('MS','Mato Grosso do Sul'),
 ('MT','Mato Grosso'),
 ('PA','Pará'),
 ('PB','Paraíba'),
 ('PE','Pernambuco'),
 ('PI','Piauí'),
 ('PR','Paraná'),
 ('RJ','Rio de Janeiro'),
 ('RN','Rio Grande do Norte'),
 ('RO','Rondônia'),
 ('RR','Roraima'),
 ('RS','Rio Grande do Sul'),
 ('SC','Santa Catarina'),
 ('SE','Sergipe'),
 ('SP','São Paulo'),
 ('TO','Tocantins');

 insert into tb_cidade VALUES
(101,'São Paulo','SP'),
(102,'Belo Horizonte','MG'),
(103,'Florianopolis','SC'),
(104,'Londrina','PR'),
(105,'Rio de Janeiro','RJ'),
(106,'Niteroi','RJ'),
(107,'Curitiba','PR'),
(108,'Salvador','BA'),
(109,'Uberaba','MG'),
(110,'Brasilia','DF');

 /* UPDATE table_references
    SET Lista de Tarefas
    [WHERE condição] */
    
    update tb_cliente
        set cd_cidade = 106
            where cd_cliente = 720;
            
select * from tb_cliente;

update tb_cliente set cd_cidade = 101 where  cd_cliente = 870;
update tb_cliente set cd_cidade = 107 where  cd_cliente = 110;
update tb_cliente set cd_cidade = 102 where  cd_cliente = 222;
update tb_cliente set cd_cidade = 101 where  cd_cliente = 830;
update tb_cliente set cd_cidade = 105 where  cd_cliente = 103;
update tb_cliente set cd_cidade = 105 where  cd_cliente = 410;
update tb_cliente set cd_cidade = 101 where  cd_cliente = 201;
update tb_cliente set cd_cidade = 104 where  cd_cliente = 157;
update tb_cliente set cd_cidade = 103 where  cd_cliente = 180;
update tb_cliente set cd_cidade = 106 where  cd_cliente = 260;
update tb_cliente set cd_cidade = 101 where  cd_cliente = 290;
update tb_cliente set cd_cidade = 109 where  cd_cliente = 390;
update tb_cliente set cd_cidade = 110 where  cd_cliente = 234;
update tb_cliente set cd_cidade = 108 where  cd_cliente = 130;

alter table tb_revendedor add cd_cpf char(11);

alter table tb_revendedor add vl_salario decimal(9,2);

desc tb_revendedor;
select * from tb_revendedor;

 update tb_revendedor set cd_cpf = '12345678989' , 
    vl_salario = 4556.89 where cd_revendedor = 011; 
update tb_revendedor set cd_cpf = '98765432134' , 
    vl_salario = 5674.34 where cd_revendedor = 240;
update tb_revendedor set cd_cpf = '98543213476' , 
    vl_salario = 1675.14 where cd_revendedor = 720;
update tb_revendedor set cd_cpf = '34987654321' , 
    vl_salario = 1124.34 where cd_revendedor = 213;
update tb_revendedor set cd_cpf = '87634932154' , 
    vl_salario = 4324.19 where cd_revendedor = 101;
update tb_revendedor set cd_cpf = '15487634932' , 
    vl_salario = 2724.20 where cd_revendedor = 310;
update tb_revendedor set cd_cpf = '63415932487' , 
    vl_salario = 3241.25 where cd_revendedor = 250;
    
    -- insert - update - Select

select * from tb_cliente;

select nm_cliente as 'Nome do cliente', cd_cep as CEP, cd_cpf as CPF
    from tb_cliente;

select nm_cliente 'Nome do cliente', cd_cep CEP, cd_cpf CPF
    from tb_cliente;
    
-- Operadores de comparação

 /* 
= -> Igual
> -> Maior
< -> Menor
>= -> Maior e Igual
<= -> Menor e Igual
<> -> Diferente
*/

-- clausula where

select nm_produto as 'Nome do produto', vl_produto as 'Valor unitário', sg_unidade as UN
    from tb_produto
        where vl_produto < 1;
        
select nm_produto as 'Nome do produto', vl_produto as 'Valor unitário', sg_unidade as UN
    from tb_produto
        where sg_unidade  = 'm';
        
select nm_cliente, nm_endereco
    from tb_cliente
        where nm_cliente = 'Jose';
        
select *
    from tb_revendedor
        where nm_revendedor = 'Joao';
        
-- operadores logicos --> and - && / or - || / not

select nm_produto, sg_unidade, vl_produto
    from tb_produto
        where vl_produto <= 3
            and vl_produto >= 0.90;
            
select nm_produto, sg_unidade, vl_produto
    from tb_produto
        where vl_produto <= 3
            and vl_produto >= 0.90
                or sg_unidade = 'g';
                
select nm_cliente, cd_cpf, cd_cep
    from tb_cliente
        where cd_cep >= '30000000'
            and cd_cep <= '39999999';
            
show tables;

-- between - só retorna valores numéricos e do mesmo tributo

select nm_produto, sg_unidade, vl_produto
	from tb_produto
		where vl_produto between 1 and 2; -- buscar entre os parametros

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where nm_revendedor like '%n%'; --  busca todos os nomes que possue a letra n

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where nm_revendedor not like '%n%';
        
select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where nm_revendedor like 'a%';

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where nm_revendedor like '_n%'; -- busca por nome
            
select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where sg_comissao in ('a', 'b'); -- busca todos as letras a e b na tabela revendedor que na coluna comissao tem a e b.
        
select nm_produto, sg_unidade, vl_produto
	from tb_produto
		where sg_unidade in ('m', 'kg') -- busca ao mesmo tempo os parametros que estao dentro dos parenteses.
			and vl_produto > '1';

select nm_produto, sg_unidade, vl_produto
	from tb_produto
		where sg_unidade not in ('m', 'kg');      -- busca ao mesmo tempo os parametros que estao dentro dos parenteses.
		
-- clausula - ordenaçao

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		order by nm_revendedor asc; -- selecionar em ordem ascendente
        
select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		order by sg_comissao asc; -- selecionar em ordem ascendente

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where vl_salario > 2000
			order by sg_comissao desc; -- selecionar em ordem descendente
		
select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		where vl_salario > 2000
			order by vl_salario desc; -- selecionar em ordem descendente

select nm_revendedor, sg_comissao, vl_salario
	from tb_revendedor
		order by sg_comissao , nm_revendedor desc; -- na coluna de comissao foi ascendente, na coluna de revendedor ficou descendente
        
/*Aula dia 22/03/23*/ 
 
select acos(0.5);
select asin(0.5);
select degrees(asin(0.5));
select mod(5,2);
select pi() + 0.0000000000000000000000;
select round(1.6);
select round(1.4);
select ceil(1.3);
select sqrt(1024);
select bin(192168010); /* transformar em numero binário*/
select hex(192168010); /* transformar em numero hexadecimal*/

select 8*(45+(78/3-(456*2))/3); /* o BD é uma calculadora*/

select * from tb_produto;

select nm_produto as Nome, concat('R$ ',vl_produto) as 'Valor Atual', vl_produto * 1.25 as 'Valor reajustado', ((vl_produto * 1.25) - vl_produto) as Lucro
    from tb_produto
        where sg_unidade in ('m','g');
        
select dt_pedido, datediff(curdate(),dt_pedido) as Dias, datediff(curdate(),dt_pedido) / 365 as Anos, datediff(curdate(),dt_pedido) / 30 as Meses, dayname(dt_pedido), monthname(dt_pedido), day(dt_pedido), month(dt_pedido), year(dt_pedido),dayofweek(dt_pedido)
    from tb_pedido;

select dayname(curdate());

select dt_pedido, dt_pedido + interval  '9' day
    from tb_pedido;

select dt_pedido, dt_pedido + interval  '4' month
    from tb_pedido;    

/*  aula 29/03 */

select avg(vl_salario);

select count(*) from tb_revendedor;

select count(*) from tb_cliente;

select count(cd_cep) from tb_cliente;

select cd_pedido, count(*)
	from item_pedido
		group by cd_pedido; /* contagem de quantidade de pedido da tabela*/
        
select cd_pedido, count(*)
	from item_pedido
		group by cd_pedido
			having count(*) > 2; /* contagem com um operador*/
            
select sg_comissao, avg(vl_salario), sum(vl_salario), min(vl_salario), max(vl_salario)/* formula da média*/
	from tb_revendedor
		group by sg_comissao;
        
select nm_cliente, 
	position('a' in nm_cliente)
		from tb_cliente;
            
select nm_cliente, 
	position('a' in nm_cliente), /* posição da letra na tabela*/
    instr(nm_cliente, 'a')
		from tb_cliente;
        

select nm_cliente, 
	position('a' in nm_cliente),
		instr(nm_cliente, 'a'),
			length(nm_cliente)
				from tb_cliente;
        
select nm_cliente, 
	position('a' in nm_cliente),
		instr(nm_cliente, 'a'),
			length(nm_cliente),
				substring(nm_cliente from 2 for 3)
					from tb_cliente;


select nm_cliente, 
	position('a' in nm_cliente),
		instr(nm_cliente, 'a'),
			length(nm_cliente),
				substring(nm_cliente from 2 for 3),
					replace(nm_cliente, 'a', '@')
						from tb_cliente;
      
      
                        
/*select <campos>
	from <tabela esq.> join <tabela dir>
		on <campo PK. esq.> = <campo FK. dir>*/
                        
							
select * from tb_cliente;
select * from tb_comissao;
select * from tb_pedido; 
select * from tb_produto;
select * from item_pedido;
select * from tb_cidade;
select * from tb_revendedor;

show tables;

select * from tb_cliente , tb_pedido where tb_cliente.cd_cliente = tb_pedido.cd_cliente;

select * from tb_cliente join tb_pedido on tb_cliente.cd_cliente = tb_pedido.cd_cliente;

select  nm_cliente , cd_cpf , dt_pedido, cd_revendedor
	from tb_cliente join tb_pedido
		on tb_cliente.cd_cliente = tb_pedido.cd_cliente;
        
select  nm_produto , vl_produto , dt_pedido, cd_revendedor
	from item_pedido join tb_pedido
		on item_pedido.cd_pedido = tb_pedido.cd_pedido;      
   
select cd_produto, dt_pedido, cd_revendedor  
	from item_pedido join tb_pedido
		on item_pedido.cd_pedido = tb_pedido.cd_pedido;    
        
select * from item_pedido join tb_pedido on item_pedido.cd_pedido = tb_pedido.cd_pedido;

select * from item_pedido join tb_produto on item_pedido.cd_produto = tb_produto.cd_produto;
        
select cd_pedido , nm_produto, vl_produto 
	from item_pedido join tb_produto 
		on item_pedido.cd_produto = tb_produto.cd_produto;
        

-- aula 19/04/23

show tables;

select *
	from tb_pedido, tb_cliente
		where tb_cliente . cd_cliente = tb_pedido . cd_cliente;
        
        select tb_cliente.cd_cliente, tb_cliente.nm_cliente, tb_pedido.dt_pedido
			from tb_cliente join tb_pedido
				on tb_cliente . cd_cliente = tb_pedido . cd_cliente;
                
        select c.cd_cliente, c.nm_cliente, p.dt_pedido
			from tb_cliente as c join tb_pedido as p
				on c.cd_cliente = p.cd_cliente;
                
        select c.cd_cliente, c.nm_cliente, p.dt_pedido, ci.nm_cidade, ci.sg_uf
			from tb_cliente as c join tb_pedido as p
				on c.cd_cliente = p.cd_cliente        
					join tb_cidade as ci
						on ci.cd_cidade = c.cd_cidade
							where sg_uf in ("mg", "pr");
                            
                            
		select c.cd_cliente, c.nm_cliente, p.dt_pedido, ci.nm_cidade, ci.sg_uf
			from tb_cliente as c, tb_pedido as p, tb_cidade as ci
				where c.cd_cliente = p.cd_cliente
					and ci.cd_cidade = c.cd_cidade
						and sg_uf in ('mg','pr');
                        
         select *from tb_produto;               
		 select *from tb_pedido; 
         select *from item_pedido; 
         select *from tb_revendedor; 
         select * from tb_cidade;
         select * from tb_comissao;
         select * from tb_uf;
         select * from tb_unidade;
         show tables;
         
        
		select c.nm_cliente, cd.sg_uf, pr.nm_produto, i.qt_produto
			from tb_cliente as c, tb_pedido as p, tb_cidade as cd,
				item_pedido as i, tb_produto as pr
				where c.cd_cliente = p.cd_cliente
					and c.cd_cidade = cd.cd_cidade
						and p.cd_pedido = i.cd_pedido
							and i.cd_produto = pr.cd_produto
								and pr.nm_produto = 'Queijo'
									and cd.sg_uf = 'rj'
										order by c.nm_cliente;
                    
			select c.nm_cliente, cd.sg_uf, pr.nm_produto, i.qt_produto
				from tb_cliente as c join tb_pedido as p
					on c.cd_cliente = p.cd_cliente
						join tb_cidade as cd
							on c.cd_cidade = cd.cd_cidade
								join item_pedido as i
									on p.cd_pedido = i.cd_pedido
										join tb_produto as pr
											on i.cd_produto = pr.cd_produto
												where pr.nm_produto = 'Queijo'
													and cd.sg_uf = 'rj'
														order by c.nm_cliente;	      
					
		
		select c.nm_cliente, r.nm_revendedor, pr.nm_produto, i.qt_produto -- o que quero apresentar na tela
			from tb_cliente as c, tb_revendedor as r, tb_produto as pr, item_pedido as i, tb_pedido as p -- as abreviações das tabelas
					where c.cd_cliente = p.cd_cliente -- os caminhos entre as tabelas
						and p.cd_revendedor = r.cd_revendedor -- os caminhos entre as tabelas
							and p.cd_pedido = i.cd_pedido -- os caminhos entre as tabelas
								and i.cd_produto = pr.cd_produto -- os caminhos entre as tabelas
									and pr.nm_produto = 'Ouro' -- a condicional
										and r.nm_revendedor = 'Mauricio' -- a condicional
											order by c.nm_cliente; -- a condicional
                    
		select c.nm_cliente, r.nm_revendedor, pr.nm_produto, i.qt_produto -- o que quero apresentar na tela
				from tb_cliente as c join tb_pedido as p -- a abreviação da tabela
					on c.cd_cliente = p.cd_cliente -- o caminho entre as duas tabelas
						join tb_revendedor as r -- a abreviação da tabela
							on p.cd_revendedor = r.cd_revendedor -- o caminho entre as duas tabelas
								join item_pedido as i -- a abreviação da tabela
									on p.cd_pedido = i.cd_pedido -- o caminho entre as duas tabelas
										join tb_produto as pr -- a abreviação da tabela
											on i.cd_produto = pr.cd_produto -- o caminho entre as duas tabelas
												where pr.nm_produto = 'Ouro' -- a condicional
												and r.nm_revendedor = 'Mauricio' -- a condicional
													order by c.nm_cliente;	  -- a condicional
                                                    
select c.nm_cliente, pr.nm_produto, i.qt_produto, r.nm_revendedor, cd.nm_cidade
			from tb_cliente as c join tb_pedido as p
				on c.cd_cliente = p.cd_cliente
					join tb_cidade as cd
						on c.cd_cidade = cd.cd_cidade
							join item_pedido as i
								on p.cd_pedido = i.cd_pedido
									join tb_produto as pr
										on i.cd_produto = pr.cd_produto
											join tb_revendedor as r
												on p.cd_revendedor = r.cd_revendedor
													where pr.nm_produto = 'Papel'
														and cd.sg_uf = 'mg'
															order by c.nm_cliente;	 
                                                    
select c.nm_cliente, pr.nm_produto, i.qt_produto, r.nm_revendedor, cd.nm_cidade -- o que quero apresentar na tela
			from tb_cliente as c, tb_revendedor as r, tb_produto as pr, item_pedido as i, tb_pedido as p, tb_cidade as cd -- as abreviações das tabelas
					where c.cd_cliente = p.cd_cliente -- os caminhos entre as tabelas
						and p.cd_revendedor = r.cd_revendedor -- os caminhos entre as tabelas
							and p.cd_pedido = i.cd_pedido -- os caminhos entre as tabelas
								and i.cd_produto = pr.cd_produto -- os caminhos entre as tabelas
									and cd.cd_cidade = c.cd_cidade
										and pr.nm_produto = 'Papel' -- a condicional
											and cd.sg_uf = 'mg' -- a condicional
												order by c.nm_cliente; -- a condicional   
                                            
                                            
-- Aula 26/04/23
           
 select *
    from tb_cliente as c left join tb_pedido as p
        on c.cd_cliente = p.cd_cliente
            where p.cd_pedido is null;
           
select *
    from tb_cliente as c right join tb_pedido as p
        on c.cd_cliente = p.cd_cliente;
       
select c.nm_cliente, count(p.cd_pedido) as Pedidos
    from tb_cliente as c join tb_pedido as p
        on c.cd_cliente = p.cd_cliente
            join item_pedido as i
                on p.cd_pedido = i.cd_pedido
                    group by nm_cliente
                        order by Pedidos desc;
                       
select c.nm_cliente,  p.cd_pedido, p.dt_pedido, sum(i.qt_produto) 'Total de Produtos',
        sum(pr.vl_produto * i.qt_produto) as Total
    from tb_cliente as c join tb_pedido as p
        on c.cd_cliente = p.cd_cliente
            join item_pedido as i
                on p.cd_pedido = i.cd_pedido
                    join tb_produto as pr
                        on i.cd_produto = pr.cd_produto
                            group by p.cd_pedido;                                           
                                            
                                            