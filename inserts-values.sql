-- inserção de dados no bd company

use company_constraints;
show tables;

insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09'
, '731-Fondren-Houston-TX', 'M', 30000, NULL, 5);

insert into employee values ('Miguel', 'T', 'Angelo', 333444555, '2000-02-20'
, '139-Eldorado-TX', 'M', 10000, 123456789, 4),
('Gustavo', 'E', 'Campos', 787989100, '1978-07-08'
, '270-Emboagaçu-TX', 'M', 14000, NULL, 9),
							('Dalton', 'C', 'Mendes', 777888999, '1999-05-27'
, '169-Jardim-Iguaçu-TX', 'M', 12000, 787989100, 7);

insert into dependent values (777888999, 'Luke', 'M', '2007-08-05', 'Son'),
							 (787989100, 'Elisa', 'F', '1980-04-05', 'Spouse'),
                             (333444555, 'Emily', 'F', '2002-12-20', 'Spouse');
                             
insert into departament values ('Research', 5, 333444555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 787989100, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 777888999, '1981-06-19','1980-06-19'); 
                               
insert into dept_locations values (1, 'Houston'),
								  (4, 'Stafford'),
                                  (5, 'Bellaire');
                                  
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 4, 'Sugarland', 5),
                           ('ProductZ', 5,'Houston', 5);
                           
insert into works_on values (123456789, 1, 32.5),
							(123456789, 4, 7.5),
                            (787989100, 4, 40.5);
                            
select * from employee;

-- gerente e seu departamento
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

select Ssn, Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

--
select Bdate, Address from employee
	where Fname = 'John' and Minit='B' and Lname='Smith';
    
-- recuperando departamento específico
select * from departament where Dname = 'Research';

select Fname, Lname, Address from employee, departament
	where Dname='Research' and Dnumber=Dno;
    
desc works_on;
select * from project;

select Pname, Essn, Fname, Hours from project, works_on, 
employee where Pnumber = Pno and Essn = Ssn;
								