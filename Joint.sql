use company_employee;

-- JOIN Statement
desc employee;
desc works_on;

select * from employee, works_on where Ssn = Essn;

-- JOIN
select * from employee JOIN works_on;
    
-- JOIN ON -> INNER JOIN ON

show tables;
desc dept_locations; -- Dnumber 

select * from employee JOIN works_on on Ssn = Essn;
select * from employee JOIN departament on Ssn = Mgr_ssn;

Select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
    where Dname - 'Research';

select * from dept_locations; -- address e Dnumber 
select * from departament; 	  -- Dname, Dept_create_date

select Dname as Department, Dept_create_date as StartDate, Dlocation as Location
	from departament INNER JOIN dept_locations using(Dnumber)
    order by StartDate;

-- CROSS JOIN - produto cartesiano

select * from employee cross join dependent;

-- JOIN com mais de 3 tabelas:

-- project, works_on e employee
select concat(Fname,' ', Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName, 
Pno as ProjectNumber, Plocation as Location from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
    order by Pnumber;
    
-- departament, dept_location, employee
select Dnumber, Dname, concat(Fname, ' ',Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament
		inner join dept_locations using (Dnumber)
        inner join employee on Ssn = Mgr_ssn
        group by Dnumber
        having count(*)>1;
        
select Dnumber, Dname, concat(Fname, ' ',Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament
		inner join dept_locations using (Dnumber)
        inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
        group by Dnumber;
 
 -- departament, project e employee
 select concat(Fname , ' ', Lname) as Employee, Salary, Ssn, Dname as Department_Name, 
 Dnumber as Department_Number, Pname as Project_Name from employee e
	inner join departament d on e.Dno = d.Dnumber
    inner join project p on p.Dnum = e.Dno;
    
-- OUTER JOIN

select * from employee;
select * from dependent;

select * from employee inner join dependent on Ssn = Essn;
select * from employee left join dependent on Ssn = Essn;

select * from employee left outer join dependent on Ssn = Essn;


    