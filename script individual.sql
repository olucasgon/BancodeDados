create database trabalho ;
--tabela garagem
create table garagem (
	gar_cd_id serial,
	fk_car_cd_id integer,
	primary key (gar_cd_id),
	foreign key (fk_car_cd_id) references car (car_id)
	);
--tabela carro
create table car (
	car_id serial,
	car_tx_model varchar(25),
	car_tx_color varchar(20),
	car_tx_plate varchar(10),
	primary key (car_id)
	);
--tabela pessoa
create table pessoa (
	pes_cd_id serial,
	pes_tx_name varchar(25),
	pes_int_cnh integer,
	fk_car_cd_id integer,
	primary key (pes_cd_id),
	foreign key (fk_car_cd_id) references car (car_id)
	);
--5 inserts
insert
	into
	car (car_tx_model ,
	car_tx_color ,
	car_tx_plate )
values 
	('VeloMax ZR' ,
	'Prata',
	'ABC-1234'),
	('EcoDrive GX' ,
	'Verde',
	'DEF-5678'),
	('TurboCharge S' ,
	'Azul',
	'GHI-9012'),
	('LuxoCruise LXE' ,
	'Preto',
	'JKL-3456'),
	('SunRider Sport' ,
	'Amarelo',
	'MNO-7890');
--5 inserts
insert
	into
	pessoa(pes_tx_name ,
	pes_int_cnh ,
	fk_car_cd_id)
values
    ('Silvana Silva' ,
123456789,
1),
    ('Joesley Santos',
234567890,
2),
    ('Shirley Oliveira',
345678901,
3),
    ('Rafael Mendes' ,
456789012,
4),
    ('Mathias Pereira' ,
567890123,
5);

select
	*
	from car c ;

select
	*
	from pessoa p;

select
	*
	from garagem g ;
--3 inserts
insert
	into
	pessoa(pes_tx_name ,
	pes_int_cnh )
values
    ('Carla Rodrigues',
678901234),
    ('Fernando Almeida',
789012345),
    ('Lúcia Souza',
890123456);
--select com order by  
select
	pes_cd_id ,
	pes_int_cnh
from
	pessoa
order by
	pes_int_cnh ,
	pes_cd_id asc;
---select com group by 
select
	g.gar_cd_id ,
	c.car_tx_model ,
	count(*) as num_cars
from
	garagem g
join car c on
	g.fk_car_cd_id = c.car_id
group by
	g.gar_cd_id ,
	c.car_tx_model
order by
	c.car_tx_model ;
---select com where
select
	car_tx_model ,
	car_tx_plate
from
	car
where
	car_tx_color = 'Azul' ;


