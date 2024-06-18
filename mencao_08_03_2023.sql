/*
***************************************************
Banco de dados - Controls de cnae
Feito por: Robson Rosa, Bruno Oliveira, Marcus Vinícius, Yan Gustavo
Data de Criacao: 29/03/2023 - 19:00
Alterado por:
Data de Alteracao:
OBS:
***************************************************
*/

create database bd_cnae;

use bd_cnae;

/* Criação das Tabelas*/

create table tb_grau_de_risco(
grau_de_risco_id int not null,
grau_de_risco_codigo varchar(20),
grau_de_risco_descricao varchar (300),
constraint pk_grau_de_risco primary key (grau_de_risco_id),
	constraint unique (grau_de_risco_codigo),
		constraint unique (grau_de_risco_id));

create table tb_agrupamento(
agrupamento_id int not null,
agrupamento_codigo varchar(20),
agrupamento_descricao VARCHAR(200),
constraint pk_agrupamento primary key (agrupamento_id),
	constraint unique (agrupamento_codigo),
		constraint unique (agrupamento_id));

create table tb_documentacao(
documentacao_id int not null,
documentacao_codigo VARCHAR(20),
documentacao_descricao varchar(200),
constraint pk_documentacao primary key (documentacao_id),
	constraint unique (documentacao_codigo),
		constraint unique (documentacao_id));
        
create table tb_cnae_e_grau_de_risco(
cnae_e_grau_de_risco_id int not null,
fk_cnae_id int,
fk_grau_de_risco_id int,
constraint pk_cnae_e_grau_de_risco
	primary key (cnae_e_grau_de_risco_id),
        constraint unique (cnae_e_grau_de_risco_id),
			foreign key (cnae_e_grau_de_risco_id)
				references tb_cnae (cnae_id),
					constraint fk_cnae_e_grau_de_risco_grau_de_risco1_id
						foreign key (fk_grau_de_risco_id)
							references tb_grau_de_risco (grau_de_risco_id));
                
desc tb_cnae_e_grau_de_risco;
                
create table tb_cnae(
cnae_id int not null,
cnae_codigo varchar (20),
cnae_descricao varchar(300),
fk_agrupamento_id int,
constraint pk_cnae_id
	primary key (cnae_id),
    constraint unique (cnae_id),
		constraint unique (cnae_codigo),
	constraint fk_cnae_agrupamento_id
		foreign key (fk_agrupamento_id)
			references tb_agrupamento (agrupamento_id));

create table tb_cnae_e_documentacao(
cnae_e_documentacao_id int not null,
fk_cnae_id int,
previa_fk_documentacao_id int,
fk_documentacao_id int,
constraint pk_cnae_e_documentacao_id
	primary key (cnae_e_documentacao_id),
		constraint unique (cnae_e_documentacao_id),
			constraint fk_cnae_e_documentacao_cnae1_idx
				foreign key (fk_cnae_id)
					references tb_cnae (cnae_id),
		constraint fk_cnae_e_documentacao_documentacao1_idx
			foreign key (previa_fk_documentacao_id)
				references tb_documentacao (documentacao_id),
		constraint fk_cnae_e_documentacao_documentacao2_idx
			foreign key (fk_documentacao_id)
				references tb_documentacao (documentacao_id));

/*alter table tb_cnae_e_documentacao
add fk_documentacao_id int;*/

drop table tb_cnae_e_documentacao;

desc tb_cnae_e_documentacao;
desc tb_cnae_e_grau_de_risco;

/* Visualização das tabelas*/

show tables;

desc tb_cnae_e_documentacao;

select * from  tb_grau_de_risco;        
select * from tb_agrupamento;
select * from tb_documentacao;
select * from tb_cnae_e_grau_de_risco;
select * from tb_cnae;
select * from tb_cnae_e_documentacao;

/* inserindo dados nas tabelas*/
               
insert into tb_grau_de_risco values
(1, 'Muito Baixo', 'Enquadra-se empresas com risco muito baixo, ou seja, àquelas cujo ramo de atividade'),
(2, 'Baixo', 'Enquadra-se empresas de baixo risco, ou seja, àquelas cujo ramo de atividade submete os'),
(3, 'Medio', 'Enquadra-se empresas com risco médio, ou seja, àquelas com ramo de atividade que expoe '),
(4, 'Alto', 'Enquadra-se empresas com risco alto, ou seja, àquelas cujo ramo de atividade expõe os');     

insert into tb_agrupamento values
(21, 'Secao', 'Codigo alfabetico de 1 digito'),
(87, 'Divisao',	'Codigo numerico de 2 digitos'),
(285, 'Grupo', 'Codigo numerico de 3 digitos'),
(673, 'Classe', 'Codigo numerico de 4 digitos + DV'),
(1301, 'Subclasse', 'Codigo numerico de 7 digitos (incluindo o DV)');

/* inseri dados errados na tabela_cnae*/

insert into tb_cnae values
(01, 3250706, "Serviços de prótese dentária",1301),
(03, 3250709, "Serviço de laboratório óptico",1301),
(05, 4399101,"Administração de obras",1301),
(06, 4512901,"Representantes comerciais e agentes do comércio de veículos automotores", 1301),
(07, 4530702,"Comércio por atacado de pneumáticos e câmaras-de-ar", 1301),
(08, 4530703,"Comércio a varejo de peças e acessórios novos para veículos automotores", 1301),
(09, 4530704,"Comércio a varejo de peças e acessórios usados para veículos automotores", 1301),
(10, 4530705,"Comércio a varejo de pneumáticos e câmaras-de-ar", 1301),
(11, 4530706,"Representantes comerciais e agentes do comércio de peças e acessórios novos e usados para veículos automotores", 1301),
(12, 4541202,"Comércio por atacado de peças e acessórios para motocicletas e motonetas", 1301),
(13, 4541206,"Comércio a varejo de peças e acessórios novos para motocicletas e motonetas", 1301),
(14, 4541207,"Comércio a varejo de peças e acessórios usados para motocicletas e motonetas", 1301),
(15, 4542101,"Representantes comerciais e agentes do comércio de motocicletas e motonetas, peças e acessórios", 1301),
(16, 4611700,"Representantes comerciais e agentes do comércio de matérias-primas agrícolas e animais vivos", 1301),
(17, 4612500,"Representantes comerciais e agentes do comércio de combustíveis, minerais, produtos siderúrgicos e químicos", 1301),
(18, 4613300,"Representantes comerciais e agentes do comércio de madeira, material de construção e ferragens", 1301),
(19, 4614100,"Representantes comerciais e agentes do comércio de máquinas, equipamentos, embarcações e aeronaves", 1301),
(20, 4615000,"Representantes comerciais e agentes do comércio de eletrodomésticos, móveis e artigos de uso doméstico", 1301),
(21, 4616800,"Representantes comerciais e agentes do comércio de têxteis, vestuário, calçados e artigos de viagem", 1301),
(22, 4617600,"Representantes comerciais e agentes do comércio de produtos alimentícios, bebidas e fumo", 1301),
(23, 4618401,"Representantes comerciais e agentes do comércio de medicamentos, cosméticos e produtos de perfumaria", 1301),
(24, 4618402,"Representantes comerciais e agentes do comércio de instrumentos e materiais odonto-médico-hospitalares", 1301),
(25, 4618403,"Representantes comerciais e agentes do comércio de jornais, revistas e outras publicações", 1301),
(26, 4618499,"Outros representantes comerciais e agentes do comércio especializado em produtos não especificados anteriormente", 1301),
(27, 4619200,"Representantes comerciais e agentes do comércio de mercadorias em geral não especializado", 1301),
(28, 4635401,"Comércio atacadista de água mineral", 1301),
(29, 4635402,"Comércio atacadista de cerveja, chope e refrigerante", 1301),
(30, 4637104,"Comércio atacadista de pães, bolos, biscoitos e similares", 1301),
(31, 4637105,"Comércio atacadista de massas alimentícias", 1301),
(32, 4637106,"Comércio atacadista de sorvetes", 1301),
(33, 4637107,"Comércio atacadista de chocolates, confeitos, balas, bombons e semelhantes", 1301),
(34, 4637199,"Comércio atacadista especializado em outros produtos alimentícios não especificados anteriormente", 1301),
(35, 4639701,"Comércio atacadista de produtos alimentícios em geral", 1301),
(36, 4641901,"Comércio atacadista de tecidos", 1301),
(37, 4641902,"Comércio atacadista de artigos de cama, mesa e banho", 1301),
(38, 4641903,"Comércio atacadista de artigos de armarinho", 1301),
(39, 4642701,"Comércio atacadista de artigos do vestuário e acessórios, exceto profissionais e de segurança", 1301),
(40, 4642702,"Comércio atacadista de roupas e acessórios para uso profissional e de segurança do trabalho", 1301),
(41, 4643501,"Comércio atacadista de calçados", 1301),
(42, 4643502,"Comércio atacadista de bolsas, malas e artigos de viagem", 1301),
(43, 4646001,"Comércio atacadista de cosméticos e produtos de perfumaria", 1301),
(44, 4646002,"Comércio atacadista de produtos de higiene pessoal", 1301),
(45, 4647801,"Comércio atacadista de artigos de escritório e de papelaria", 1301),
(46, 4647802,"Comércio atacadista de livros, jornais e outras publicações", 1301),
(47, 4649401,"Comércio atacadista de equipamentos elétricos de uso pessoal e doméstico", 1301),
(48, 4649402,"Comércio atacadista de aparelhos eletrônicos de uso pessoal e doméstico", 1301),
(49, 4649403,"Comércio atacadista de bicicletas, triciclos e outros veículos recreativos", 1301),
(50, 4649404,"Comércio atacadista de móveis e artigos de colchoaria", 1301);

/* corrigindo os dados da tabela_cnae*/

update tb_cnae set cnae_codigo = 152101 where cnae_id =1;
update tb_cnae set cnae_codigo = 152102 where cnae_id =2;
update tb_cnae set cnae_codigo = 152103 where cnae_id =3;
update tb_cnae set cnae_codigo =153901 where cnae_id = 4;
update tb_cnae set cnae_codigo =153902 where cnae_id = 5;
update tb_cnae set cnae_codigo =154700 where cnae_id = 6;
update tb_cnae set cnae_codigo =155501 where cnae_id = 7;
update tb_cnae set cnae_codigo =155502 where cnae_id = 8;
update tb_cnae set cnae_codigo =155503 where cnae_id = 9;
update tb_cnae set cnae_codigo =155504  where cnae_id =10;
update tb_cnae set cnae_codigo =155505 where cnae_id = 11;
update tb_cnae set cnae_codigo =159801  where cnae_id =12;
update tb_cnae set cnae_codigo =159802  where cnae_id =13;
update tb_cnae set cnae_codigo =159803  where cnae_id =14;
update tb_cnae set cnae_codigo =159804  where cnae_id =15;
update tb_cnae set cnae_codigo =159899  where cnae_id =16;
update tb_cnae set cnae_codigo =161001  where cnae_id =17;
update tb_cnae set cnae_codigo =161002  where cnae_id =18;
update tb_cnae set cnae_codigo =161003  where cnae_id =19;
update tb_cnae set cnae_codigo =161099  where cnae_id =20;
update tb_cnae set cnae_codigo =162801  where cnae_id =21;
update tb_cnae set cnae_codigo =162802  where cnae_id =22;
update tb_cnae set cnae_codigo =162803  where cnae_id =23;
update tb_cnae set cnae_codigo =162899  where cnae_id =24;
update tb_cnae set cnae_codigo =220901  where cnae_id =25;
update tb_cnae set cnae_codigo =220902  where cnae_id =26;
update tb_cnae set cnae_codigo =220903  where cnae_id =27;
update tb_cnae set cnae_codigo =220904  where cnae_id =28;
update tb_cnae set cnae_codigo =220905  where cnae_id =29;
update tb_cnae set cnae_codigo =220906  where cnae_id =30;
update tb_cnae set cnae_codigo =220999  where cnae_id =31;
update tb_cnae set cnae_codigo =1411801  where cnae_id =32;
update tb_cnae set cnae_codigo =1411802  where cnae_id =33;
update tb_cnae set cnae_codigo =1412601  where cnae_id =34;
update tb_cnae set cnae_codigo =1412602  where cnae_id =35;
update tb_cnae set cnae_codigo =1412603  where cnae_id =36;
update tb_cnae set cnae_codigo =1413401  where cnae_id =37;
update tb_cnae set cnae_codigo =1413402  where cnae_id =38;
update tb_cnae set cnae_codigo =1413403  where cnae_id =39;
update tb_cnae set cnae_codigo =1414200  where cnae_id =40;
update tb_cnae set cnae_codigo =1421500  where cnae_id =41;
update tb_cnae set cnae_codigo =1422300  where cnae_id =42;
update tb_cnae set cnae_codigo =4110700  where cnae_id =43;
update tb_cnae set cnae_codigo =4751202  where cnae_id =44;
update tb_cnae set cnae_codigo =4752100  where cnae_id =45;
update tb_cnae set cnae_codigo =4753900  where cnae_id =46;
update tb_cnae set cnae_codigo =4754701  where cnae_id =47;
update tb_cnae set cnae_codigo =4754702  where cnae_id =48;
update tb_cnae set cnae_codigo =4754703  where cnae_id =49;
update tb_cnae set cnae_codigo =4755501  where cnae_id =50;
update tb_cnae set cnae_codigo =4755502  where cnae_id =51;
update tb_cnae set cnae_codigo =4755503  where cnae_id =52;
update tb_cnae set cnae_codigo =4756300  where cnae_id =53;
update tb_cnae set cnae_codigo =4757100  where cnae_id =54;
update tb_cnae set cnae_codigo =4759801  where cnae_id =55;

    
update tb_cnae set cnae_descricao = "Criação de bufalinos BUFALINOCULTURA;BUFALINOS; CRIAÇÃO DE,BÚFALOS; CRIAÇÃO DE,LEITE DE BÚFALA; PRODUÇÃO DE,RESFRIAMENTO DE LEITE DE BÚFALA REALIZADO NA" where cnae_id =1;
update tb_cnae set cnae_descricao = "Criação de eqüinos CAVALOS; CRIAÇÃO DE,EQÜINOCULTURA,EQÜINOS; CRIAÇÃO DE,HOSPEDAGEM DE CAVALOS; SERVIÇOS DE,SÊMEN DE EQÜINO; PRODUÇÃO DE,TREINAMENTO DE"where cnae_id =2;
update tb_cnae set cnae_descricao = "Criação de asininos e muares ASININOS; CRIAÇÃO DE,BURROS; CRIAÇÃO DE,JUMENTOS; CRIAÇÃO DE,MUARES; CRIAÇÃO DE,MULAS; CRIAÇÃO DE,SÊMEN DE ASININOS; PRODUÇÃO"where cnae_id =3;
update tb_cnae set cnae_descricao = "Criação de caprinos BODES; CRIAÇÃO DE,CABRAS; CRIAÇÃO DE,CAPRINOCULTURA,CAPRINOS; CRIAÇÃO DE,LEITE DE CABRA; PRODUÇÃO DE,RESFRIAMENTO DE LEITE DE CABRA"where cnae_id =4;
update tb_cnae set cnae_descricao = "Criação de ovinos, inclusive para produção de lã CARNEIROS; CRIAÇÃO DE,LEITE DE OVELHA; PRODUÇÃO DE,LÃ DE OVELHA NA UNIDADE DE CRIAÇÃO; PRODUÇÃO DE,LÃ"where cnae_id =5;
update tb_cnae set cnae_descricao = "Criação de suínos ESTERCO DE SUÍNOS; PRODUÇÃO DE,PORCOS; CRIAÇÃO DE,SUÍNOCULTURA,SUÍNOS; CRIAÇÃO DE,SÊMEN DE SUÍNO; PRODUÇÃO DE;"where cnae_id =6;
update tb_cnae set cnae_descricao = "Criação de frangos para corte AVICULTURA DE CORTE.ESTERCO DE FRANGO; PRODUÇÃO DE.FRANGOS, FRANGAS, GALOS, GALINHAS, GALINÁCEOS PARA CORTE; CRIAÇÃO DE;"where cnae_id =7;
update tb_cnae set cnae_descricao = "Produção de pintos de um diaINCUBATÓRIO DE OVOS,PINTOS - INCUBAÇÃO; PRODUÇÃO DE,PINTOS DE 1 DIA; PRODUÇÃO DE;"where cnae_id =8;
update tb_cnae set cnae_descricao = "Criação de outros galináceos, exceto para corte ESTERCO DE OUTROS GALINÁCEOS; PRODUÇÃO DE,FRANGOS, FRANGAS, GALOS, GALINHAS (PARA POSTURA, PARA CRUZA OU"where cnae_id =9;
update tb_cnae set cnae_descricao = "Criação de aves, exceto galináceos	AVESTRUZ - ESTRUTIOCULTURA; CRIAÇÃO DE,AVESTRUZ; CRIAÇÃO DE,CODORNAS; CRIAÇÃO DE,EMAS; CRIAÇÃO DE,ESTERCO DE AVES;"where cnae_id =10;
update tb_cnae set cnae_descricao = "Produção de ovos AVICULTURA DE POSTURA,ESTERCO DE GALINHAS DE POSTURA ; PRODUÇÃO DE,OVOS DE CODORNAS; PRODUÇÃO DE,OVOS DE GALINHA; PRODUÇÃO DE,OVOS DE"where cnae_id =11;
update tb_cnae set cnae_descricao = "Apicultura ABELHAS DE ESPÉCIES NATIVAS; CRIAÇÃO DE,ABELHAS NATIVAS SEM FERRÃO; CRIAÇÃO DE,APICULTURA; CRIAÇÃO DE ABELHAS,CERA DE ABELHA MELIPONAS;"where cnae_id =12;
update tb_cnae set cnae_descricao = "Criação de animais de estimação ANIMAIS DOMÉSTICOS; CRIAÇÃO DE,CANIL; CRIAÇÃO DE CÃES,GATOS; CRIAÇÃO DE,HAMSTERS; CRIAÇÃO DE,PORQUINHOS DA ÍNDIA;"where cnae_id =13;
update tb_cnae set cnae_descricao = "Criação de escargô ESCARGÔ - HELICICULTURA; CRIAÇÃO DE,ESCARGÔ; CRIAÇÃO DE;"where cnae_id =14;
update tb_cnae set cnae_descricao = "Criação de bicho-da-seda BICHO DA SEDA; PRODUÇÃO DE,LARVAS DE BICHO DA SEDA; PRODUÇÃO DE,SERICULTURA;"where cnae_id =15;
update tb_cnae set cnae_descricao = "Criação de outros animais não especificados anteriormente ANIMAIS PARA PESQUISA; CRIAÇÃO DE,BIOTÉRIO; CRIAÇÃO DE ANIMAIS PARA PESQUISA,BORBOLETAS; CRIAÇÃO"where cnae_id =16;
update tb_cnae set cnae_descricao = "Serviço de pulverização e controle de pragas agrícolas APLICAÇÃO DE DEFENSIVOS AGRÍCOLAS; ATIVIDADES DE,CONTROLE BIOLÓGICO DE PRAGAS AGRÍCOLAS, SERVIÇO DE"where cnae_id =17;
update tb_cnae set cnae_descricao = "Serviço de poda de árvores para lavouras PODA DE ARVORES PARA LAVOURA; SERVIÇO DE,PODA DE ÁRVORES FRUTÍFERAS; SERVIÇOS DE,PODA DE ÁRVORES VIDEIRAS (PARREIRA"where cnae_id =18;
update tb_cnae set cnae_descricao = "Serviço de preparação de terreno, cultivo e colheita COLHEITA DE PRODUTOS AGRÍCOLAS; SERVIÇO DE,COLHEITA; SERVIÇOS DE,CORTE DE CANA; SERVIÇOS DE,CORTE,"where cnae_id =19;
update tb_cnae set cnae_descricao = "Atividades de apoio à agricultura não especificadas anteriormente ADUBADORAS COM OPERADOR; ALUGUEL DE,ARADOS COM OPERADOR,CONTRATANTES DE MÃO-DE-OBRA"where cnae_id =20;
update tb_cnae set cnae_descricao = "Serviço de inseminação artificial em animais FERTILIZAÇÃO ANIMAL IN VITRO (FIV); SERVIÇOS DE,INSEMINAÇÃO ARTIFICIAL EM ANIMAIS; SERVIÇOS DE;"where cnae_id =21;
update tb_cnae set cnae_descricao = "Serviço de tosquiamento de ovinos TOSQUIA DE OVINOS REALIZADA POR TERCEIROS; SERVIÇO DE,TOSQUIA DE OVINOS; SERVIÇO DE,TOSQUIAMENTO DE OVINOS; SERVIÇO DE;"where cnae_id =22;
update tb_cnae set cnae_descricao = "Serviço de manejo de animais MANEJO DE ANIMAIS (CONDUÇÃO, PASTOREIO); SERVIÇOS DE"where cnae_id =23;
update tb_cnae set cnae_descricao = "Atividades de apoio à pecuária não especificadas anteriormente ALOJAMENTO DO GADO DE CURTA DURAÇÃO; SERVIÇO DE,APANHA DE FRANGOS; SERVIÇO DE,CASQUEAMENTO"where cnae_id =24;
update tb_cnae set cnae_descricao = "Extração de madeira em florestas nativas ABATE, DERRUBADA DE ARVORES NATIVAS; EXTRAÇÃO DE,ARVORES NATIVAS CORTE; DERRUBADA DE,ESTACAS (FLORESTAS NATIVAS)"where cnae_id =25;
update tb_cnae set cnae_descricao = "Produção de carvão vegetal - florestas nativas CARVÃO VEGETAL (FLORESTAS NATIVAS); PRODUÇÃO DE,CARVÃO VEGETAL - ÁRVORES NATIVAS; PRODUÇÃO DE,EXTRATO"where cnae_id =26;
update tb_cnae set cnae_descricao = "Coleta de castanha-do-pará em florestas nativas CASTANHA-DO-PARÁ; COLETA DE;"where cnae_id =27;
update tb_cnae set cnae_descricao = "Coleta de látex em florestas nativas LÁTEX NO LOCAL DE COLETA; BENEFICIAMENTO DE,LÁTEX; EXTRAÇÃO DE SERINGUEIRAS NATIVAS; COLETA DE;"where cnae_id =28;
update tb_cnae set cnae_descricao = "Coleta de palmito em florestas nativas PALMITO; COLETA DE"where cnae_id =29;
update tb_cnae set cnae_descricao = "Conservação de florestas nativas FLORESTAS NATIVAS; CONSERVAÇÃO DE,REFLORESTAMENTO DE FLORESTAS NATIVAS; SERVIÇOS DE;"where cnae_id =30;
update tb_cnae set cnae_descricao = "Coleta de produtos não-madeireiros não especificados anteriormente em florestas nativas ABATE, DERRUBADA DE ARVORES NATIVAS; EXTRAÇÃO DE,ABIU; COLETA"where cnae_id =31;
update tb_cnae set cnae_descricao = "Confecção de roupas íntimas ANÁGUAS E COMBINAÇÕES; CONFECÇÃO DE,CALCINHAS FEMININAS; CONFECÇÃO DE,CALCINHAS PARA CRIANÇAS; CONFECÇÃO DE,CAMISOLAS E"where cnae_id =32;
update tb_cnae set cnae_descricao = "Facção de roupas íntimas FACÇÃO DE ESPARTILHOS, SUSPENSÓRIOS, LIGAS, ARTEFATOS SEMELHANTES E SUAS PARTES, INCLUSIVE DE MALHA; SERVIÇOS DE; FABRICAÇÃO"where cnae_id =33;
update tb_cnae set cnae_descricao = "Confecção de peças de vestuário, exceto roupas íntimas e as confeccionadas sob medida AGASALHOS DE COURO E PELE, PARA HOMENS; CONFECÇÃO DE,AGASALHOS"where cnae_id =34;
update tb_cnae set cnae_descricao = "Confecção, sob medida, de peças do vestuário, exceto roupas íntimas ALFAIATE,BLUSAS E CAMISAS PARA CRIANÇAS; CONFECÇÃO SOB MEDIDA DE,BLUSAS FEMININAS;"where cnae_id =35;
update tb_cnae set cnae_descricao = "Facção de peças do vestuário, exceto roupas íntimas FACÇÃO DE MACACÕES, AGASALHOS E CONJUNTOS PARA ESPORTE, EXCETO DE MALHA; SERVIÇOS DE; FABRICAÇÃO DE"where cnae_id =36;
update tb_cnae set cnae_descricao = "Confecção de roupas profissionais, exceto sob medida CAPAS DE BORRACHA PARA USO PROFISSIONAL; CONFECÇÃO DE,FARDAMENTOS MILITARES; CONFECÇÃO DE,MACACÕES"where cnae_id =37;
update tb_cnae set cnae_descricao = "Confecção, sob medida, de roupas profissionais FARDAMENTOS MILITARES; CONFECÇÃO SOB MEDIDA DE,ROUPAS PROFISSIONAIS; CONFECÇÃO SOB MEDIDA DE,UNIFORMES"where cnae_id =38;
update tb_cnae set cnae_descricao = "Facção de roupas profissionais FACÇÃO DE ROUPAS PROFISSIONAIS; SERVIÇO DE"where cnae_id =39;
update tb_cnae set cnae_descricao = "Fabricação de acessórios do vestuário, exceto para segurança e proteção ACESSÓRIOS DO VESTUÁRIO DESCARTÁVEIS CONFECCIONADOS COM TECIDOS; FABRICAÇÃO DE"where cnae_id =40;
update tb_cnae set cnae_descricao = "Fabricação de meias MEIAS PARA FINS ESPORTIVOS; FABRICAÇÃO DE,MEIAS PARA QUALQUER USO; FABRICAÇÃO DE,MEIAS-CALÇAS, INCLUSIVE ELÁSTICAS; FABRICAÇÃO DE;"where cnae_id =41;
update tb_cnae set cnae_descricao = "Fabricação de artigos do vestuário, produzidos em malharias e tricotagens, exceto meias ARTIGOS DO VESTUÁRIO PRODUZIDOS A PARTIR DE LINHA OU LÃ (TRICO"where cnae_id =42;
update tb_cnae set cnae_descricao = "Incorporação de empreendimentos imobiliários EMPREENDIMENTOS IMOBILIÁRIOS, RESIDENCIAIS OU NÃO, PROVENDO RECURSOS FINANCEIROS, TÉCNICOS E MATERIAIS PARA"where cnae_id =43;
update tb_cnae set cnae_descricao = "Recarga de cartuchos para equipamentos de informática RECARGA DE CARTUCHOS PARA COMPUTADORES; COMÉRCIO VAREJISTA,RECARGA DE CARTUCHOS PARA EQUIPAMENTOS"where cnae_id =44;
update tb_cnae set cnae_descricao = "Comércio varejista especializado de equipamentos de telefonia e comunicação APARELHOS TELEFÔNICOS, INCLUSIVE CELULAR; COMÉRCIO VAREJISTA,EQUIPAMENTOS DE"where cnae_id =45;
update tb_cnae set cnae_descricao = "Comércio varejista especializado de eletrodomésticos e equipamentos de áudio e vídeo AMPLIFICADORES DE SOM; COMÉRCIO VAREJISTA,APARELHO DE AR CONDICIONADO"where cnae_id =46;
update tb_cnae set cnae_descricao = "Comércio varejista de móveis CADEIRAS; COMÉRCIO VAREJISTA,CAMAS; COMÉRCIO VAREJISTA DE,ESTOFADOS (EXCETO PARA AUTOMÓVEIS), SOFÁS E POLTRONAS; COMÉRCIO"where cnae_id =47;
update tb_cnae set cnae_descricao = "Comércio varejista de artigos de colchoaria ARTIGOS DE COLCHOARIA; COMÉRCIO VAREJISTA,COLCHÕES, TRAVESSEIROS; COMÉRCIO VAREJISTA;"where cnae_id =48;
update tb_cnae set cnae_descricao = "Comércio varejista de artigos de iluminação ABAJURES; COMÉRCIO VAREJISTA,ARTIGOS DE ILUMINAÇÃO; COMÉRCIO VAREJISTA,LUMINÁRIAS; COMÉRCIO VAREJISTA,LUSTRES"where cnae_id =49;
update tb_cnae set cnae_descricao = "Comércio varejista de tecidos FAZENDAS, TECIDOS; COMÉRCIO VAREJISTA,LOJA DE TECIDOS; COMÉRCIO VAREJISTA,TECIDOS DE MALHA PARA CONFECÇÃO; COMÉRCIO VAREJISTA"where cnae_id =50;
update tb_cnae set cnae_descricao = "Comercio varejista de artigos de armarinho ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE PASSAMANARIA, FILÓS, ELÁSTICOS"where cnae_id =51;
update tb_cnae set cnae_descricao = "Comercio varejista de artigos de cama, mesa e banho ARTIGOS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA,ROUPAS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA"where cnae_id =52;
update tb_cnae set cnae_descricao = "Comércio varejista especializado de instrumentos musicais e acessórios	ACESSÓRIOS PARA INSTRUMENTOS MUSICAIS; COMÉRCIO VAREJISTA,INSTRUMENTOS MUSICAIS;" where cnae_id =53;
update tb_cnae set cnae_descricao = "Comércio varejista especializado de peças e acessórios para aparelhos eletroeletrônicos ANTENAS PARABÓLICAS; COMÉRCIO VAREJISTA,ANTENAS; COMÉRCIO VAREJISTA"where cnae_id =54;
update tb_cnae set cnae_descricao = "Comércio varejista de artigos de tapeçaria, cortinas e persianas Artigos de tapeçaria; comércio varejista,Carpetes; comércio varejista,Cortinas; comércio" where cnae_id =55;

/* faltou esses dados na tabela_cnae*/

insert into tb_cnae values
(02, "152102", "Criação de eqüinos CAVALOS; CRIAÇÃO DE,EQÜINOCULTURA,EQÜINOS; CRIAÇÃO DE,HOSPEDAGEM DE CAVALOS;", 1301),
(04, "153901", "Criação de caprinos BODES; CRIAÇÃO DE,CABRAS; CRIAÇÃO DE,CAPRINOCULTURA,CAPRINOS; CRIAÇÃO DE,LEITE DE CABRA;", 1301),
(51, "4755502","Comercio varejista de artigos de armarinho ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE PASSAMANARIA, FILÓS, ELÁSTICOS", 1301),
(52, "4755503","Comercio varejista de artigos de cama, mesa e banho ARTIGOS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA,ROUPAS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA", 1301),
(53, "4756300","Comércio varejista especializado de instrumentos musicais e acessórios	ACESSÓRIOS PARA INSTRUMENTOS MUSICAIS; COMÉRCIO VAREJISTA,INSTRUMENTOS MUSICAIS;", 1301),
(54, "4757100","Comércio varejista especializado de peças e acessórios para aparelhos eletroeletrônicos ANTENAS PARABÓLICAS; COMÉRCIO VAREJISTA,ANTENAS; COMÉRCIO VAREJISTA", 1301),
(55, "4759801","Comércio varejista de artigos de tapeçaria, cortinas e persianas Artigos de tapeçaria; comércio varejista,Carpetes; comércio varejista,Cortinas; comércio", 1301);
    
insert into tb_documentacao values
(01,"0152101", "Criação de bufalinos BUFALINOCULTURA;BUFALINOS; CRIAÇÃO DE,BÚFALOS; CRIAÇÃO DE,LEITE DE BÚFALA; PRODUÇÃO DE,RESFRIAMENTO DE LEITE DE BÚFALA REALIZADO NA"),
(02,"152102", "Criação de eqüinos CAVALOS; CRIAÇÃO DE,EQÜINOCULTURA,EQÜINOS; CRIAÇÃO DE,HOSPEDAGEM DE CAVALOS; SERVIÇOS DE,SÊMEN DE EQÜINO; PRODUÇÃO DE,TREINAMENTO DE"),
(03,"152103", "Criação de asininos e muares ASININOS; CRIAÇÃO DE,BURROS; CRIAÇÃO DE,JUMENTOS; CRIAÇÃO DE,MUARES; CRIAÇÃO DE,MULAS; CRIAÇÃO DE,SÊMEN DE ASININOS; PRODUÇÃO"),
(04,"153901", "Criação de caprinos BODES; CRIAÇÃO DE,CABRAS; CRIAÇÃO DE,CAPRINOCULTURA,CAPRINOS; CRIAÇÃO DE,LEITE DE CABRA; PRODUÇÃO DE,RESFRIAMENTO DE LEITE DE CABRA"),
(05,"153902", "Criação de ovinos, inclusive para produção de lã CARNEIROS; CRIAÇÃO DE,LEITE DE OVELHA; PRODUÇÃO DE,LÃ DE OVELHA NA UNIDADE DE CRIAÇÃO; PRODUÇÃO DE,LÃ"),
(06,"154700", "Criação de suínos ESTERCO DE SUÍNOS; PRODUÇÃO DE,PORCOS; CRIAÇÃO DE,SUÍNOCULTURA,SUÍNOS; CRIAÇÃO DE,SÊMEN DE SUÍNO; PRODUÇÃO DE;"),
(07,"155501", "Criação de frangos para corte AVICULTURA DE CORTE.ESTERCO DE FRANGO; PRODUÇÃO DE.FRANGOS, FRANGAS, GALOS, GALINHAS, GALINÁCEOS PARA CORTE; CRIAÇÃO DE;"),
(08,"155502", "Produção de pintos de um diaINCUBATÓRIO DE OVOS,PINTOS - INCUBAÇÃO; PRODUÇÃO DE,PINTOS DE 1 DIA; PRODUÇÃO DE;"),
(09,"155503", "Criação de outros galináceos, exceto para corte ESTERCO DE OUTROS GALINÁCEOS; PRODUÇÃO DE,FRANGOS, FRANGAS, GALOS, GALINHAS (PARA POSTURA, PARA CRUZA OU"),
(10,"155504", "Criação de aves, exceto galináceos	AVESTRUZ - ESTRUTIOCULTURA; CRIAÇÃO DE,AVESTRUZ; CRIAÇÃO DE,CODORNAS; CRIAÇÃO DE,EMAS; CRIAÇÃO DE,ESTERCO DE AVES;"),
(11,"155505", "Produção de ovos AVICULTURA DE POSTURA,ESTERCO DE GALINHAS DE POSTURA ; PRODUÇÃO DE,OVOS DE CODORNAS; PRODUÇÃO DE,OVOS DE GALINHA; PRODUÇÃO DE,OVOS DE"),
(12,"159801", "Apicultura ABELHAS DE ESPÉCIES NATIVAS; CRIAÇÃO DE,ABELHAS NATIVAS SEM FERRÃO; CRIAÇÃO DE,APICULTURA; CRIAÇÃO DE ABELHAS,CERA DE ABELHA MELIPONAS;"),
(13,"159802", "Criação de animais de estimação ANIMAIS DOMÉSTICOS; CRIAÇÃO DE,CANIL; CRIAÇÃO DE CÃES,GATOS; CRIAÇÃO DE,HAMSTERS; CRIAÇÃO DE,PORQUINHOS DA ÍNDIA;"),
(14,"159803", "Criação de escargô ESCARGÔ - HELICICULTURA; CRIAÇÃO DE,ESCARGÔ; CRIAÇÃO DE;"),
(15,"159804", "Criação de bicho-da-seda BICHO DA SEDA; PRODUÇÃO DE,LARVAS DE BICHO DA SEDA; PRODUÇÃO DE,SERICULTURA;"),
(16,"159899", "Criação de outros animais não especificados anteriormente ANIMAIS PARA PESQUISA; CRIAÇÃO DE,BIOTÉRIO; CRIAÇÃO DE ANIMAIS PARA PESQUISA,BORBOLETAS; CRIAÇÃO"),
(17,"161001", "Serviço de pulverização e controle de pragas agrícolas APLICAÇÃO DE DEFENSIVOS AGRÍCOLAS; ATIVIDADES DE,CONTROLE BIOLÓGICO DE PRAGAS AGRÍCOLAS, SERVIÇO DE"),
(18,"161002", "Serviço de poda de árvores para lavouras PODA DE ARVORES PARA LAVOURA; SERVIÇO DE,PODA DE ÁRVORES FRUTÍFERAS; SERVIÇOS DE,PODA DE ÁRVORES VIDEIRAS (PARREIRA"),
(19,"161003", "Serviço de preparação de terreno, cultivo e colheita COLHEITA DE PRODUTOS AGRÍCOLAS; SERVIÇO DE,COLHEITA; SERVIÇOS DE,CORTE DE CANA; SERVIÇOS DE,CORTE,"),
(20,"161099", "Atividades de apoio à agricultura não especificadas anteriormente ADUBADORAS COM OPERADOR; ALUGUEL DE,ARADOS COM OPERADOR,CONTRATANTES DE MÃO-DE-OBRA"),
(21,"162801", "Serviço de inseminação artificial em animais FERTILIZAÇÃO ANIMAL IN VITRO (FIV); SERVIÇOS DE,INSEMINAÇÃO ARTIFICIAL EM ANIMAIS; SERVIÇOS DE;"),
(22,"162802", "Serviço de tosquiamento de ovinos TOSQUIA DE OVINOS REALIZADA POR TERCEIROS; SERVIÇO DE,TOSQUIA DE OVINOS; SERVIÇO DE,TOSQUIAMENTO DE OVINOS; SERVIÇO DE;"),
(23,"162803", "Serviço de manejo de animais MANEJO DE ANIMAIS (CONDUÇÃO, PASTOREIO); SERVIÇOS DE"),
(24,"162899", "Atividades de apoio à pecuária não especificadas anteriormente ALOJAMENTO DO GADO DE CURTA DURAÇÃO; SERVIÇO DE,APANHA DE FRANGOS; SERVIÇO DE,CASQUEAMENTO"),
(25,"220901", "Extração de madeira em florestas nativas ABATE, DERRUBADA DE ARVORES NATIVAS; EXTRAÇÃO DE,ARVORES NATIVAS CORTE; DERRUBADA DE,ESTACAS (FLORESTAS NATIVAS)"),
(26,"220902", "Produção de carvão vegetal - florestas nativas CARVÃO VEGETAL (FLORESTAS NATIVAS); PRODUÇÃO DE,CARVÃO VEGETAL - ÁRVORES NATIVAS; PRODUÇÃO DE,EXTRATO"),
(27,"220903", "Coleta de castanha-do-pará em florestas nativas CASTANHA-DO-PARÁ; COLETA DE;"),
(28,"220904", "Coleta de látex em florestas nativas LÁTEX NO LOCAL DE COLETA; BENEFICIAMENTO DE,LÁTEX; EXTRAÇÃO DE SERINGUEIRAS NATIVAS; COLETA DE;"),
(29,"220905", "Coleta de palmito em florestas nativas PALMITO; COLETA DE"),
(30,"220906", "Conservação de florestas nativas FLORESTAS NATIVAS; CONSERVAÇÃO DE,REFLORESTAMENTO DE FLORESTAS NATIVAS; SERVIÇOS DE;"),
(31,"220999", "Coleta de produtos não-madeireiros não especificados anteriormente em florestas nativas ABATE, DERRUBADA DE ARVORES NATIVAS; EXTRAÇÃO DE,ABIU; COLETA"),
(32,"1411801", "Confecção de roupas íntimas ANÁGUAS E COMBINAÇÕES; CONFECÇÃO DE,CALCINHAS FEMININAS; CONFECÇÃO DE,CALCINHAS PARA CRIANÇAS; CONFECÇÃO DE,CAMISOLAS E"),
(33,"1411802", "Facção de roupas íntimas FACÇÃO DE ESPARTILHOS, SUSPENSÓRIOS, LIGAS, ARTEFATOS SEMELHANTES E SUAS PARTES, INCLUSIVE DE MALHA; SERVIÇOS DE; FABRICAÇÃO"),
(34,"1412601", "Confecção de peças de vestuário, exceto roupas íntimas e as confeccionadas sob medida AGASALHOS DE COURO E PELE, PARA HOMENS; CONFECÇÃO DE,AGASALHOS"),
(35,"1412602", "Confecção, sob medida, de peças do vestuário, exceto roupas íntimas ALFAIATE,BLUSAS E CAMISAS PARA CRIANÇAS; CONFECÇÃO SOB MEDIDA DE,BLUSAS FEMININAS;"),
(36,"1412603", "Facção de peças do vestuário, exceto roupas íntimas FACÇÃO DE MACACÕES, AGASALHOS E CONJUNTOS PARA ESPORTE, EXCETO DE MALHA; SERVIÇOS DE; FABRICAÇÃO DE"),
(37,"1413401", "Confecção de roupas profissionais, exceto sob medida CAPAS DE BORRACHA PARA USO PROFISSIONAL; CONFECÇÃO DE,FARDAMENTOS MILITARES; CONFECÇÃO DE,MACACÕES"),
(38,"1413402", "Confecção, sob medida, de roupas profissionais FARDAMENTOS MILITARES; CONFECÇÃO SOB MEDIDA DE,ROUPAS PROFISSIONAIS; CONFECÇÃO SOB MEDIDA DE,UNIFORMES"),
(39,"1413403", "Facção de roupas profissionais FACÇÃO DE ROUPAS PROFISSIONAIS; SERVIÇO DE"),
(40,"1414200", "Fabricação de acessórios do vestuário, exceto para segurança e proteção ACESSÓRIOS DO VESTUÁRIO DESCARTÁVEIS CONFECCIONADOS COM TECIDOS; FABRICAÇÃO DE"),
(41,"1421500", "Fabricação de meias MEIAS PARA FINS ESPORTIVOS; FABRICAÇÃO DE,MEIAS PARA QUALQUER USO; FABRICAÇÃO DE,MEIAS-CALÇAS, INCLUSIVE ELÁSTICAS; FABRICAÇÃO DE;"),
(42,"1422300", "Fabricação de artigos do vestuário, produzidos em malharias e tricotagens, exceto meias ARTIGOS DO VESTUÁRIO PRODUZIDOS A PARTIR DE LINHA OU LÃ (TRICO"),
(43,"4110700", "Incorporação de empreendimentos imobiliários EMPREENDIMENTOS IMOBILIÁRIOS, RESIDENCIAIS OU NÃO, PROVENDO RECURSOS FINANCEIROS, TÉCNICOS E MATERIAIS PARA"),
(44,"4751202", "Recarga de cartuchos para equipamentos de informática RECARGA DE CARTUCHOS PARA COMPUTADORES; COMÉRCIO VAREJISTA,RECARGA DE CARTUCHOS PARA EQUIPAMENTOS"),
(45,"4752100", "Comércio varejista especializado de equipamentos de telefonia e comunicação APARELHOS TELEFÔNICOS, INCLUSIVE CELULAR; COMÉRCIO VAREJISTA,EQUIPAMENTOS DE"),
(46,"4753900", "Comércio varejista especializado de eletrodomésticos e equipamentos de áudio e vídeo AMPLIFICADORES DE SOM; COMÉRCIO VAREJISTA,APARELHO DE AR CONDICIONADO"),
(47,"4754701", "Comércio varejista de móveis CADEIRAS; COMÉRCIO VAREJISTA,CAMAS; COMÉRCIO VAREJISTA DE,ESTOFADOS (EXCETO PARA AUTOMÓVEIS), SOFÁS E POLTRONAS; COMÉRCIO"),
(48,"4754702", "Comércio varejista de artigos de colchoaria ARTIGOS DE COLCHOARIA; COMÉRCIO VAREJISTA,COLCHÕES, TRAVESSEIROS; COMÉRCIO VAREJISTA;"),
(49,"4754703", "Comércio varejista de artigos de iluminação ABAJURES; COMÉRCIO VAREJISTA,ARTIGOS DE ILUMINAÇÃO; COMÉRCIO VAREJISTA,LUMINÁRIAS; COMÉRCIO VAREJISTA,LUSTRES"),
(50,"4755501", "Comércio varejista de tecidos FAZENDAS, TECIDOS; COMÉRCIO VAREJISTA,LOJA DE TECIDOS; COMÉRCIO VAREJISTA,TECIDOS DE MALHA PARA CONFECÇÃO; COMÉRCIO VAREJISTA"),
(51,"4755502", "Comercio varejista de artigos de armarinho ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE ARMARINHO; COMÉRCIO VAREJISTA,ARTIGOS DE PASSAMANARIA, FILÓS, ELÁSTICOS"),
(52,"4755503", "Comercio varejista de artigos de cama, mesa e banho ARTIGOS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA,ROUPAS DE CAMA, MESA E BANHO; COMÉRCIO VAREJISTA"),
(53,"4756300", "Comércio varejista especializado de instrumentos musicais e acessórios	ACESSÓRIOS PARA INSTRUMENTOS MUSICAIS; COMÉRCIO VAREJISTA,INSTRUMENTOS MUSICAIS;"),
(54,"4757100", "Comércio varejista especializado de peças e acessórios para aparelhos eletroeletrônicos ANTENAS PARABÓLICAS; COMÉRCIO VAREJISTA,ANTENAS; COMÉRCIO VAREJISTA"),
(55,"4759801", "Comércio varejista de artigos de tapeçaria, cortinas e persianas Artigos de tapeçaria; comércio varejista,Carpetes; comércio varejista,Cortinas; comércio");


insert into tb_cnae_e_grau_de_risco values    
(01,	'01',	3),
(02,	'02',	3),
(03,	'03',	3),
(04,	'04',	3),
(05,	'05',	3),
(06,	'06',	3),
(07,	'07',	3),
(08,	'08',	3),
(09,	'09',	3),
(10,	'10',	3),
(11,	'11',	3),
(12,	'12',	3),
(13,	'13',	3),
(14,	'14',	3),
(15,	'15',	3),
(16,	'16',	3),
(17,	'17',	3),
(18,	'18',	3),
(19,	'19',	3),
(20,	'20',	3),
(21,	'21',	3),
(22,	'22',	3),
(23,	'23',	3),
(24,	'24',	3),
(25,	'25',	4),
(26,	'26',	4),
(27,	'27',	4),
(28,	'28',	4),
(29,	'29',	4),
(30,	'30',	4),
(31,	'31',	4),
(32,	'32',	2),
(33,	'33',	2),
(34,	'34',	2),
(35,	'35',	2),
(36,	'36',	2),
(37,	'37',	2),
(38,	'38',	2),
(39,	'39',	2),
(40,	'40',	2),
(41,	'41',	2),
(42,	'42',	2),
(43,	'43',	1),
(44,	'44',	1),
(45,	'45',	1),
(46,	'46',	1),
(47,	'47',	1),
(48,	'48',	1),
(49,	'49',	1),
(50,	'50',	1),
(51,	'51',	1),
(52,	'52',	1),
(53,	'53',	1),
(54,	'54',	1),
(55,	'55',	1);

select * from tb_cnae_e_documentacao;

insert into tb_cnae_e_documentacao values
(01,	'01',	'01', '1');

insert into tb_cnae_e_documentacao values
(02,	'02',	'02', '02'),
(03,	'03',   '03', '03'),
(04,	'04',	'04', '04'),
(05,	'05',	'05', '05'),
(06,	'06',	'06', '06'),
(07,	'07',	'07', '07'),
(08,	'08',	'08', '08'),
(09,	'09',	'09', '09'),
(10,	'10',	'10', '10'),
(11,	'11',	'11', '11'),
(12,	'12',	'12', '12'),
(13,	'13',	'13', '13'),
(14,	'14',	'14', '14'),
(15,	'15',	'15', '15'),
(16,	'16',	'16', '16'),
(17,	'17',	'17', '17'),
(18,	'18',	'18', '18'),
(19,	'19',	'19', '19'),
(20,	'20',	'20', '20'),
(21,	'21',	'21', '21'),
(22,	'22',	'22', '22'),
(23,	'23',	'23', '23'),
(24,	'24',	'24', '24'),
(25,	'25',	'25', '25'),
(26,	'26',	'26', '26'),
(27,	'27',	'27', '27'),
(28,	'28',	'28', '28'),
(29,	'29',	'29', '29'),
(30,	'30',	'30', '30'),
(31,	'31',	'31', '31'),
(32,	'32',	'32', '32'),
(33,	'33',	'33', '33'),
(34,	'34',	'34', '34'),
(35,	'35',	'35', '35'),
(36,	'36',	'36', '36'),
(37,	'37',	'37', '37'),
(38,	'38',	'38', '38'),
(39,	'39',	'39', '39'),
(40,	'40',	'40', '40'),
(41,	'41',	'41', '41'),
(42,	'42',	'42', '42'),
(43,	'43',	'43', '43'),
(44,	'44',	'44', '44'),
(45,	'45',	'45', '45'),
(46,	'46',	'46', '46'),
(47,	'47',	'47', '47'),
(48,	'48',	'48', '48'),
(49,	'49',	'49', '49'),
(50,	'50',	'50', '50'),
(51,	'51',	'51',' 51'),
(52,	'52',	'52', '52'),
(53,	'53',	'53', '53'),
(54,	'54',	'54', '54'),
(55,	'55',	'55', '55');

update tb_cnae_e_documentacao set fk_documentacao_id = 1 where  cnae_e_documentacao_id=1;
update tb_cnae_e_documentacao set fk_documentacao_id = 2 where  cnae_e_documentacao_id=2;
update tb_cnae_e_documentacao set fk_documentacao_id = 3 where  cnae_e_documentacao_id=3;
update tb_cnae_e_documentacao set fk_documentacao_id = 4 where  cnae_e_documentacao_id=4;
update tb_cnae_e_documentacao set fk_documentacao_id = 5 where  cnae_e_documentacao_id=5;
update tb_cnae_e_documentacao set fk_documentacao_id = 6 where  cnae_e_documentacao_id=6;
update tb_cnae_e_documentacao set fk_documentacao_id = 7 where  cnae_e_documentacao_id=7;
update tb_cnae_e_documentacao set fk_documentacao_id = 8 where  cnae_e_documentacao_id=8;
update tb_cnae_e_documentacao set fk_documentacao_id = 9 where  cnae_e_documentacao_id=9;
update tb_cnae_e_documentacao set fk_documentacao_id = 10 where  cnae_e_documentacao_id=10;
update tb_cnae_e_documentacao set fk_documentacao_id = 11 where  cnae_e_documentacao_id=11;
update tb_cnae_e_documentacao set fk_documentacao_id = 12 where  cnae_e_documentacao_id=12;
update tb_cnae_e_documentacao set fk_documentacao_id = 13 where  cnae_e_documentacao_id=13;
update tb_cnae_e_documentacao set fk_documentacao_id = 14 where  cnae_e_documentacao_id=14;
update tb_cnae_e_documentacao set fk_documentacao_id = 15 where  cnae_e_documentacao_id=15;
update tb_cnae_e_documentacao set fk_documentacao_id = 16 where  cnae_e_documentacao_id=16;
update tb_cnae_e_documentacao set fk_documentacao_id = 17 where  cnae_e_documentacao_id=17;
update tb_cnae_e_documentacao set fk_documentacao_id = 18 where  cnae_e_documentacao_id=18;
update tb_cnae_e_documentacao set fk_documentacao_id = 19 where  cnae_e_documentacao_id=19;
update tb_cnae_e_documentacao set fk_documentacao_id = 20 where  cnae_e_documentacao_id=20;
update tb_cnae_e_documentacao set fk_documentacao_id = 21 where  cnae_e_documentacao_id=21;
update tb_cnae_e_documentacao set fk_documentacao_id = 22 where  cnae_e_documentacao_id=22;
update tb_cnae_e_documentacao set fk_documentacao_id = 23 where  cnae_e_documentacao_id=23;
update tb_cnae_e_documentacao set fk_documentacao_id = 24 where  cnae_e_documentacao_id=24;
update tb_cnae_e_documentacao set fk_documentacao_id = 25 where  cnae_e_documentacao_id=25;
update tb_cnae_e_documentacao set fk_documentacao_id = 26 where  cnae_e_documentacao_id=26;
update tb_cnae_e_documentacao set fk_documentacao_id = 27 where  cnae_e_documentacao_id=27;
update tb_cnae_e_documentacao set fk_documentacao_id = 28 where  cnae_e_documentacao_id=28;
update tb_cnae_e_documentacao set fk_documentacao_id = 29 where  cnae_e_documentacao_id=29;
update tb_cnae_e_documentacao set fk_documentacao_id = 30 where  cnae_e_documentacao_id=30;
update tb_cnae_e_documentacao set fk_documentacao_id = 31 where  cnae_e_documentacao_id=31;
update tb_cnae_e_documentacao set fk_documentacao_id = 32 where  cnae_e_documentacao_id=32;
update tb_cnae_e_documentacao set fk_documentacao_id = 33 where  cnae_e_documentacao_id=33;
update tb_cnae_e_documentacao set fk_documentacao_id = 34 where  cnae_e_documentacao_id=34;
update tb_cnae_e_documentacao set fk_documentacao_id = 35 where  cnae_e_documentacao_id=35;
update tb_cnae_e_documentacao set fk_documentacao_id = 36 where  cnae_e_documentacao_id=36;
update tb_cnae_e_documentacao set fk_documentacao_id = 37 where  cnae_e_documentacao_id=37;
update tb_cnae_e_documentacao set fk_documentacao_id = 38 where  cnae_e_documentacao_id=38;
update tb_cnae_e_documentacao set fk_documentacao_id = 39 where  cnae_e_documentacao_id=39;
update tb_cnae_e_documentacao set fk_documentacao_id = 40 where  cnae_e_documentacao_id=40;
update tb_cnae_e_documentacao set fk_documentacao_id = 41 where  cnae_e_documentacao_id=41;
update tb_cnae_e_documentacao set fk_documentacao_id = 42 where  cnae_e_documentacao_id=42;
update tb_cnae_e_documentacao set fk_documentacao_id = 43 where  cnae_e_documentacao_id=43;
update tb_cnae_e_documentacao set fk_documentacao_id = 44 where  cnae_e_documentacao_id=44;
update tb_cnae_e_documentacao set fk_documentacao_id = 45 where  cnae_e_documentacao_id=45;
update tb_cnae_e_documentacao set fk_documentacao_id = 46 where  cnae_e_documentacao_id=46;
update tb_cnae_e_documentacao set fk_documentacao_id = 47 where  cnae_e_documentacao_id=47;
update tb_cnae_e_documentacao set fk_documentacao_id = 48 where  cnae_e_documentacao_id=48;
update tb_cnae_e_documentacao set fk_documentacao_id = 49 where  cnae_e_documentacao_id=49;
update tb_cnae_e_documentacao set fk_documentacao_id = 50 where  cnae_e_documentacao_id=50;
update tb_cnae_e_documentacao set fk_documentacao_id = 51 where  cnae_e_documentacao_id=51;
update tb_cnae_e_documentacao set fk_documentacao_id = 52 where  cnae_e_documentacao_id=52;
update tb_cnae_e_documentacao set fk_documentacao_id = 53 where  cnae_e_documentacao_id=53;
update tb_cnae_e_documentacao set fk_documentacao_id = 54 where  cnae_e_documentacao_id=54;
update tb_cnae_e_documentacao set fk_documentacao_id = 55 where  cnae_e_documentacao_id=55;
/*consulta para teste*/

select* from tb_cnae_e_documentacao;

select agrupamento_codigo, agrupamento_descricao
    from tb_agrupamento
        where agrupamento_id = '285';  
        
select cnae_codigo, cnae_descricao
    from tb_cnae
        where cnae_id = '55';

select fk_cnae_id, previa_fk_documentacao_id
    from tb_cnae_e_documentacao
        where cnae_e_documentacao_id = '17';  


select grau_de_risco_codigo, grau_de_risco_descricao
    from tb_grau_de_risco
        where grau_de_risco_id = '4';
        
select documentacao_codigo, documentacao_descricao
    from tb_documentacao
        where documentacao_id = '19';  
      
select grau_de_risco_codigo, grau_de_risco_descricao
    from tb_grau_de_risco
        where grau_de_risco_id = '3';  
        
show tables;

desc tb_agrupamento;
desc tb_cnae;
desc tb_cnae_e_documentacao;
desc tb_cnae_e_grau_de_risco;
desc tb_documentacao;
desc tb_grau_de_risco;

/*min(cnae_id),max(cnae_id)*/

select count(*)
	from tb_grau_de_risco;
    
select cnae_codigo, 
	position('1' in cnae_codigo)
		from tb_cnae;

select documentacao_codigo, 
		replace(documentacao_codigo, '1', '5')
			from tb_documentacao;
            

select avg(agrupamento_id) from tb_agrupamento;

select cnae_id, avg(cnae_id),sum(cnae_id)
	from tb_cnae
		group by cnae_id;
        
select grau_de_risco_id, avg(grau_de_risco_id)
	from tb_grau_de_risco
		group by grau_de_risco_id;
        
select count(agrupamento_codigo) from tb_agrupamento;

select agrupamento_descricao,
	position('a' in agrupamento_descricao),
		instr(agrupamento_descricao, 'a'),
			length(agrupamento_descricao),
				substring(agrupamento_descricao from 5 for 5 ),
					substr(agrupamento_descricao, 4,6),
						replace(agrupamento_descricao, 'a','!@#$%¨&*')
							from tb_agrupamento;
                            
-- trabalho do dia 26/04

select * from tb_agrupamento; 
select * from tb_cnae;
select * from tb_cnae_e_documentacao;
select * from tb_cnae_e_grau_de_risco;
select * from tb_documentacao;
select * from tb_grau_de_risco;


-- 1ª
	select ag.agrupamento_codigo, ag.agrupamento_descricao, c.cnae_codigo
			from tb_agrupamento as ag, tb_cnae as c
				where ag.agrupamento_id = c.fk_agrupamento_id
					and c.cnae_codigo = '4613300'
						order by c.cnae_codigo = 'codigo';
                        
 -- 2ª                       
	select c.cnae_codigo, c.cnae_descricao, gr.grau_de_risco_codigo
		from tb_cnae as c, tb_grau_de_risco as gr, tb_cnae_e_grau_de_risco as cgr
				where c.cnae_id = cgr.fk_cnae_id
					and gr.grau_de_risco_id = cgr.fk_grau_de_risco_id
						and c.cnae_codigo = '4530702'
							order by c.cnae_codigo = 'codigo';








-- 1ª - procure qual o grau de risco do cnae 155501 para dimensionar o SESMT.
select c.cnae_codigo, gr.grau_de_risco_codigo
			from tb_cnae as c, tb_grau_de_risco as gr,
				tb_cnae_e_grau_de_risco as cgr
				where c.cnae_id = cgr.fk_cnae_id
					and gr.grau_de_risco_id = cgr.fk_grau_de_risco_id
						and c.cnae_codigo = '4757100'
								order by c.cnae_codigo = 'codigo';
                                
-- 2ª - procure a descrição do cnae 4751202?
select c.cnae_codigo, c.cnae_descricao ,gr.grau_de_risco_codigo 
			from tb_cnae as c, tb_grau_de_risco as gr,
				tb_cnae_e_grau_de_risco as cgr
				where c.cnae_id = cgr.fk_cnae_id
					and gr.grau_de_risco_id = cgr.fk_grau_de_risco_id
						and c.cnae_codigo = '4757100'
								order by c.cnae_codigo = 'codigo';
                                
-- 3ª --                                 
select c.cnae_id, d.documentacao_descricao
	from tb_cnae as c, tb_cnae_e_documentacao as cd, 
		tb_documentacao as d
			where c.cnae_id = cd.fk_cnae_id
				and cd.fk_cnae_id = d.documentacao_id
					and c.cnae_codigo = '3250706'
						order by c.cnae_codigo = 'codigo';

   select * from tb_grau_de_risco;
   select * from tb_cnae;
   select * from tb_cnae_e_grau_de_risco;
   
   
   -- 11ª --
	select gr.grau_de_risco_codigo, gr.grau_de_risco_descricao, c.cnae_descricao
		from tb_grau_de_risco as gr join tb_cnae_e_grau_de_risco as cgr
			on gr.grau_de_risco_id = cgr.fk_grau_de_risco_id
				join tb_cnae as c 
					on cgr.fk_cnae_id = c.cnae_id
							where gr.grau_de_risco_codigo = 'Alto'
								order by gr.grau_de_risco_codigo;
											
-- 12ª -- 

select d.documentacao_codigo, c.cnae_descricao
	from tb_documentacao as d join tb_cnae_e_documentacao as cd
		on d.documentacao_id = cd.previa_fk_documentacao_id
			join tb_cnae as c
				on cd.cnae_e_documentacao_id = c.cnae_id
					where c.cnae_codigo >'4530702'
						and c.cnae_codigo < '4615000'
							order by d.documentacao_codigo;
                            


