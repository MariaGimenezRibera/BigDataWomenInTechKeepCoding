create schema maria_gimenez_ribera authorization xxvwiruc

create table maria_gimenez_ribera.company(
	id_company varchar(10) not null,
	name_company varchar(100) not null,
	constraint company_pk primary key (id_company)
);

create table maria_gimenez_ribera.brand(
	id_brand varchar(10) not null,
	name_brand varchar(100) not null,
	id_company varchar(10) not null,
	constraint brand_pk primary key (id_brand),
	constraint brand_fk foreign key(id_company)
	references maria_gimenez_ribera.company (id_company)
);

create table maria_gimenez_ribera.model(
	id_model varchar(10) not null,
	name_model varchar(100) not null,
	id_brand varchar(10) not null,
	constraint model_pk primary key (id_model),
	constraint model_fk foreign key(id_brand)
	references maria_gimenez_ribera.brand (id_brand)
);

create table maria_gimenez_ribera.color(
	id_color varchar(10) not null,
	name_color varchar(100) not null,
	constraint color_pk primary key (id_color)
);

create table maria_gimenez_ribera.vehicle(
	id_vehicle varchar(10) not null,
	plate varchar(25) not null,
	id_model varchar(10) not null,
	id_color varchar(10) not null,
	total_km integer not null,
	date_purchase date not null,
	constraint vehicle_pk primary key (id_vehicle),
	constraint vehicle_model_fk foreign key (id_model)
	references maria_gimenez_ribera.model (id_model),
	constraint vehicle_color_fk foreign key (id_color)
	references maria_gimenez_ribera.color (id_color)
);

create table maria_gimenez_ribera.insurance_company(
	id_insurance_company varchar(10) not null,
	name_insurance_company varchar(100) not null,
	constraint insurance_company_pk primary key (id_insurance_company)
);

create table maria_gimenez_ribera.insurance_policy(
	num_insurance varchar(30) not null,
	id_vehicle varchar(10) not null,
	id_insurance_company varchar(10) not null,
	constraint insurance_policy_pk primary key (id_vehicle, num_insurance),
	constraint insurance_policy_vehicle_fk foreign key(id_vehicle)
	references maria_gimenez_ribera.vehicle (id_vehicle),
	constraint insurance_policy_company_fk foreign key(id_insurance_company)
	references maria_gimenez_ribera.insurance_company (id_insurance_company)
);

create table maria_gimenez_ribera.currency(
	id_currency varchar(10) not null,
	name_currency varchar(100) not null,
	constraint currency_pk primary key (id_currency)
);

create table maria_gimenez_ribera.inspection(
	num_inspection varchar(30) not null,
	id_vehicle varchar(10) not null,
	inspection_date date not null,
	km_vehicle integer not null,
	inspection_cost integer not null,
	id_currency varchar(10) not null,
	constraint inspection_pk primary key (id_vehicle, num_inspection),
	constraint inspection_vehicle_fk foreign key(id_vehicle)
	references maria_gimenez_ribera.vehicle (id_vehicle),
	constraint inspection_currency_fk foreign key(id_currency)
	references maria_gimenez_ribera.currency (id_currency)
);

insert into maria_gimenez_ribera.company 
(id_company, name_company)
values ('0001', 'Volkswagen');

insert into maria_gimenez_ribera.company 
(id_company, name_company)
values ('0002', 'Toyota');

insert into maria_gimenez_ribera.company 
(id_company, name_company)
values ('0003', 'PSA');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0001', 'Bugatti', '0001');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0002', 'Lamborghini', '0001');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0003', 'Porsche', '0001');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0004', 'Toyota', '0002');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0005', 'Lexus', '0002');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0006', 'Mazda', '0002');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0007', 'Peugeot', '0003');

insert into maria_gimenez_ribera.brand 
(id_brand, name_brand, id_company)
values ('0008', 'Opel', '0003');


insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0001', 'Chiron', '0001');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0002', 'Huracan', '0002');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0003', 'Taycan', '0003');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0004', 'Auris', '0004');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0005', 'CX-60', '0006');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0006', '208', '0007');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0007', '308', '0007');

insert into maria_gimenez_ribera.model 
(id_model, name_model, id_brand)
values ('0008', '408', '0007');

insert into maria_gimenez_ribera.color 
(id_color, name_color)
values ('0001', 'Red');

insert into maria_gimenez_ribera.color 
(id_color, name_color)
values ('0002', 'Black');

insert into maria_gimenez_ribera.color 
(id_color, name_color)
values ('0003', 'Silver');

insert into maria_gimenez_ribera.color 
(id_color, name_color)
values ('0004', 'White');

insert into maria_gimenez_ribera.color 
(id_color, name_color)
values ('0005', 'Beige');

insert into maria_gimenez_ribera.currency 
(id_currency, name_currency)
values ('0001', 'EUR');

insert into maria_gimenez_ribera.currency 
(id_currency, name_currency)
values ('0002', 'USD');

insert into maria_gimenez_ribera.currency 
(id_currency, name_currency)
values ('0003', 'UKP');

insert into maria_gimenez_ribera.currency 
(id_currency, name_currency)
values ('0004', 'YEN');

insert into maria_gimenez_ribera.insurance_company 
(id_insurance_company, name_insurance_company)
values ('0001', 'RACC');

insert into maria_gimenez_ribera.insurance_company 
(id_insurance_company, name_insurance_company)
values ('0002', 'MAPFRE');

insert into maria_gimenez_ribera.insurance_company 
(id_insurance_company, name_insurance_company)
values ('0003', 'AXA');

insert into maria_gimenez_ribera.insurance_company 
(id_insurance_company, name_insurance_company)
values ('0004', 'Regal');

insert into maria_gimenez_ribera.insurance_company 
(id_insurance_company, name_insurance_company)
values ('0005', 'Allianz');

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0001', '0001', '2022-11-01', '0001', 100, '7587K1J' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0002', '0002', '2022-11-02', '0002', 200, '5457FRE' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0003', '0003', '2022-11-03', '0003', 300, '9268ERT' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0004', '0004', '2022-11-04', '0004', 400, '3345DER' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0005', '0005', '2022-11-05', '0004', 500, '6238YHU' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0006', '0001', '2022-11-06', '0005', 600, '0123CVG' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0007', '0002', '2022-11-07', '0005', 700, '1458MKO' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0008', '0003', '2022-11-08', '0006', 800, '7789RFT' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0009', '0004', '2022-11-09', '0006', 900, '2548LIO' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0010', '0005', '2022-11-10', '0006', 1000, '3569YTR' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0011', '0001', '2022-11-11', '0006', 1100, '9999LOP' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0012', '0002', '2022-11-12', '0007', 1200, '4578JUH' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0013', '0003', '2022-11-13', '0007', 1300, '5643MNY' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0014', '0004', '2022-11-14', '0007', 1400, '4567HYJ' );

insert into maria_gimenez_ribera.vehicle 
(id_vehicle, id_color, date_purchase, id_model, total_km, plate)
values ('0015', '0005', '2022-11-15', '0008', 1500, '4599LOM' );


insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0001', '0001', '0001' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0002', '0002', '0002' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0003', '0003', '0003' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0004', '0004', '0004' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0005', '0005', '0005' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0006', '0006', '0001' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0007', '0007', '0002' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0008', '0008', '0003' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0009', '0009', '0004' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0010', '0010', '0005' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0011', '0011', '0001' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0012', '0012', '0002' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0013', '0013', '0003' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0014', '0014', '0004' );

insert into maria_gimenez_ribera.insurance_policy  
(num_insurance, id_vehicle, id_insurance_company)
values ('0015', '0015', '0005' );


insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0001', '0001', '2022-11-16', 50, 43, '0001' );

insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0002', '0002', '2022-11-17', 100, 57, '0002' );

insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0003', '0003', '2022-11-18', 150, 101, '0001' );

insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0004', '0004', '2022-11-19', 200, 473, '0001' );

insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0005', '0005', '2022-11-20', 250, 43, '0001' );

insert into maria_gimenez_ribera.inspection  
(num_inspection, id_vehicle, inspection_date, km_vehicle, inspection_cost, id_currency)
values ('0006', '0006', '2022-11-21', 350, 983, '0001' );







