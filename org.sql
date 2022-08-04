use org;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');


select first_name as WORKER_NAME from worker;
#2
select upper(first_name) from worker;
#3
select distinct(department) from worker;
#4
select concat(first_name,' ',last_name) as 'complete' from worker;
#5
select * from worker
order by first_name;
#6
select * from worker
order by first_name asc, department desc;
#7
select * from worker where first_name in 
('vipul','satish');
#8
select * from worker where first_name not in 
('vipul','satish');

#9
Select * from Worker where DEPARTMENT like 'Admin%';

#10
Select * from Worker where FIRST_NAME like '%a%';
#11
Select * from Worker where FIRST_NAME like '%a';
#12
Select * from Worker where FIRST_NAME like '_____h';
#13
Select * from Worker where SALARY between 100000 and 500000;
#14
Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
#15
SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';
#16
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

#17



SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

#18
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

#19

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

#20
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;
#21
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;
#22

SELECT NOW();
#23
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10;
#24
SELECT Salary FROM Worker 
ORDER BY Salary DESC LIMIT 5;
#25
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
 
#26
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

#27
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);
#28
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' 
FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

#29
	SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;
    #30
    Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
    #31
    Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
    #32
    SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 #33
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;
#34
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
#35
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
    
  

