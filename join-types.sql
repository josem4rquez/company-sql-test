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
	from departament JOIN dept_locations using(Dnumber)
    order by StartDate;

-- CROSS JOIN