-- Recolhendo Valor do INSS --*
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

-- Definir um Aumento de Salário para os gerentes quetrabalham no projeto associado ao Produto X --
desc works_on;

select *
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber);
    
select concat(Fname, ' ',Lname) as Complete_name, Salary, round(1.1*Salary,2) as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
    
-- definindo alias para a legibilidade da consulta
select concat(e.Fname, ' ', e.Lname) as Employee_name, e.Address from employee e, departament d
	where d.Dname = 'Research' and d.Dnumber = e.Dno;
    
    
-- Expressões e concatenação de strings

desc dept_locations;
select * from dept_locations;

-- recuperando informações dos departamentos presentes em Stafford
select Dname as Department_Name, Mgr_ssn as Manager, Address from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford';

-- recuperando todos os gerentes que trabalham em Stafford
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager, Address from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford' and Mgr_ssn = e.Ssn;
    
-- recuperando todos os gerentes, departamentos e seus nomes
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager, Dlocation from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford' and Mgr_ssn = e.Ssn;
    
desc project;
select Pnumber, Dnum, Lname, Address, Bdate, p.Plocation from departament d, project p, employee e
	where d.Dnumber = p.Dnum and p.Plocation='Stafford' and Mgr_ssn = e.Ssn;
    
-- like e between
select * from project;

select concat(Fname, ' ',Lname) as Complete_Name from employee, 
 departament where (Dno=Dnumber and Address like '%Houston%');
 
select Fname, lname, Salary from employee where (Salary > 30000 and Salary < 40000);
select Fname, Lname, Salary from employee where (Salary between 20000 and 40000);

-- Operadores Lógicos 

select Bdate, Address from employee where Fname= 'John' and Minit='B' and Lname='Smith';
 
select * from departament where Dname = 'Research' or Dname='Administration';

select Fname, Lname from employee, departament where Dname = 'Research' and Dnumber=Dno;
select concat(Fname, Lname) as Compleye_name from employee, departament where Dname = 'Research' and Dnumber=Dno;
