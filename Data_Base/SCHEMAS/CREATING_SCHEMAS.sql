USE Data_Base_2
go
--CREATE SCHEMA departament
--go
--CREATE SCHEMA customers
--go
--CREATE TABLE departament.person(id int, name varchar)
--CREATE TABLE clients.person(id int, name varchar)

ALTER SCHEMA customers
	TRANSFER departament.person