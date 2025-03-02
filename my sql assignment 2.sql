use studentmanagement1;
select * from students;
create table Courses(
course_id INT auto_increment primary key,
course_name varchar(100) not null
);

create table enrolments(
enrolment_id INT auto_increment primary key,
student_id int,
course_id int,
enrolment_date date not null,
foreign key (student_id) references students(StudentID) on delete cascade,
foreign key (course_id) references Courses(course_id) on delete cascade
);

insert into Courses (course_name)
values
('Science'),
('History'),
('Tamil');

insert into enrolments (student_id, course_id, enrolment_date)
values
(11,4,'2025-04-08'),
(12,5,'2025-04-09'),
(13,6,'2025-04-10');

select * from Courses;
select * from enrolments;

select students.StudentID, students.Name, Courses.course_name, enrolments.enrolment_date
from students 
inner join enrolments on students.StudentID = enrolments.student_id
inner join Courses on enrolments.course_id = Courses.course_id;

select Courses.course_id, Courses.course_name, COUNT(enrolments.student_id) as total_students
from Courses
left join enrolments on courses.course_id = enrolments.course_id
group by Courses.course_id, Courses.course_name;

select student_id, COUNT(course_id) as total_courses
from enrolments
group by student_id
having count(course_id) > 1;

select students.StudentID, students.Name
from students
left join enrolments on students.StudentID = enrolments.student_id
where enrolments.enrolment_id is NULL;

 





