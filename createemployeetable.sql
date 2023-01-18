CREATE TABLE firstname(id bigserial primary key,first_name varchar (255));
CREATE TABLE lastname(id bigserial primary key,first_name varchar (255));
\COPY firstname(first_name) FROM 'C:\Users\SID\Downloads\first-names.txt'
\COPY lastname(last_name) FROM 'C:\Users\SID\Downloads\last-names.txt'
CREATE TABLE employees(id bigserial primary key,employee_name varchar (255));
INSERT INTO employees (employee_name) SELECT CONCAT(fn.first_name, ' ', ln.last_name) FROM firstname as fn CROSS JOIN lastname as ln;

SELECT 