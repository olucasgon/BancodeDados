<h1>Banco de Dados - Trabalho Individual</h1>
<p>Pessoa - Carro</p>

<h2>Criei o banco de dados pensando em uma garagem de um condomínio, no qual os condôminos têm suas respectivas vagas e alguns não possuem carro.  </h2>

<h1 strong > DIAGRAMA </h1>

![TrabalhoIndividual drawio](https://github.com/LucasGonRo/BancodeDados/assets/128747383/41bbfb80-eb71-48d4-a73d-2b5467fd8dbe)


<h2>Script</h2>

<h3>create database trabalho ;

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
insert into car (car_tx_model , car_tx_color , car_tx_plate ) 
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
insert into pessoa(pes_tx_name , pes_int_cnh , fk_car_cd_id)
VALUES
    ('Silvana Silva' , 123456789, 1),
    ('Joesley Santos', 234567890, 2),
    ('Shirley Oliveira', 345678901, 3),
    ('Rafael Mendes' , 456789012, 4),
    ('Mathias Pereira' , 567890123, 5);
   

select*from car c ;
select*from pessoa p;
select*from garagem g ;

--3 inserts
insert into pessoa(pes_tx_name , pes_int_cnh )
VALUES
    ('Carla Rodrigues', 678901234),
    ('Fernando Almeida', 789012345),
    ('Lúcia Souza', 890123456);
    
--select com order by  
select pes_cd_id  , pes_int_cnh
FROM pessoa
ORDER BY pes_int_cnh , pes_cd_id  ASC;

---select com group by 
SELECT g.gar_cd_id , c.car_tx_model , count(*) as num_cars 
FROM garagem g
join car c on g.fk_car_cd_id = c.car_id
GROUP BY g.gar_cd_id , c.car_tx_model 
ORDER BY c.car_tx_model ;


---select com where
SELECT car_tx_model , car_tx_plate 
FROM car
where car_tx_color  = 'Azul' ;



</h3>


<h1 strong>Desenvolvido em :</h1>
<h3>PostgreSQL - Dbeaver 23.1.4</h3>


