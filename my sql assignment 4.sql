show databases;
use studentmanagement1;
show tables;
create table studentst4(
StudentID int auto_increment primary key,
Name varchar(100) not null,
math_score int check(math_score between 0 and 100),
total_score int
);

insert into studentst4 (Name, math_score, total_score)
values
('Viswa',99,99),
('Raghu',69,69),
('Atlee',72,72),
('Amir',78,78),
('Vijay',82,82),
('Surya',87,87),
('Marry',81,81),
('Dhruv',76,76),
('Vikram',80,80),
('Kamal',65,65);


SELECT 
    StudentID, 
    Name, 
    math_score, 
    total_score, 
    RANK() OVER (ORDER BY total_score DESC) AS student_rank
FROM studentst4;

Select 
	StudentID,
    Name,
    math_score,
    SUM(math_score) over (order by StudentID) as running_total
FROM studentst4;

