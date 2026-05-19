create database Employee;
use Employee;
create table Employees(employee_id int primary key auto_increment,employee_name varchar(255),department varchar(100),position varchar(100),hire_date date,base_salary decimal(10,2));
create table Attendance(attendance_id int primary key,employee_id int,attendance_date date,status enum('Present','Absent','Leave'),foreign key (employee_id) references Employees(employee_id));
create table Salaries(salary_id int primary key auto_increment,employee_id int,base_salary decimal(10,2),bonus decimal(10,2),deductions decimal(10,2),month varchar(20),year int,foreign key (employee_id) references Employees(employee_id));
create table Payroll(payroll_id int primary key auto_increment,employee_id int,total_salary decimal(10,2),payment_date date,foreign key (employee_id) references Employees(employee_id));
insert into Employees(employee_name,department,position,hire_date,base_salary) values ("Anu","IT","HOD",'2024-05-20',2500.25),("B","IT","Manager",'2024-07-30',4500.75),("C","Mechanical","Executive",'2025-03-04',3000.50);
alter table Attendance modify attendance_id int auto_increment;
insert into Attendance(attendance_date) values ('2025-03-15'),('2025-06-20'),('2025-08-25');
insert into Salaries(bonus,month,year) values (3500,"June",2024),(400,"August",2025),(2000,"September",2024),(300,"March",2024);
insert into Payroll(total_salary,payment_date) values (5000,'2024-07-25'),(10000,'2025-07-25'),(9000,'2025-03-12');
update Employees set position="HR",department="I",base_salary=4500 where employee_name="Anu";
update Attendance set status='Present',employee_id=2 where attendance_date='2025-03-15';
update Attendance set status='Absent',employee_id=1 where attendance_date='2025-06-20';
update Attendance set status='Present',employee_id=3 where attendance_date='2025-08-25';
select * from Attendance;
select * from Salaries;
update Salaries set employee_id=1,base_salary=2000,deductions=300 where month="June" and year=2024;
update Salaries set employee_id=2,base_salary=4000,deductions=500 where month="August"and year=2025;
update Salaries set employee_id=3,base_salary=3500,deductions=400 where month="September"and year=2024;
update Salaries set employee_id=2,base_salary=5000,deductions=300 where month="March"and year=2024;
select * from Salaries;
select e.employee_name,(e.base_salary+s.bonus-s.deductions) as total from Employees e join Salaries s on e.employee_id=s.employee_id;
update Salaries set deductions=3000,bonus=400 where month="September";
select * from Employees e join Attendance a on e.employee_id=a.employee_id join Salaries s on  e.employee_id=s.employee_id;
update payroll set employee_id=1 where total_salary=5000;
select * from Employees e join Attendance a on e.employee_id=a.employee_id join Salaries s on  e.employee_id=s.employee_id join Payroll p on e.employee_id=p.payroll_id;


