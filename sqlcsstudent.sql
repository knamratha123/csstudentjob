Create database StudentJob;

create table CSSTUDENT(StudentID INT Primary key,
StudentName VARCHAR(25),Gender VARCHAR(25), Age INT,	GPA	float, Major VARCHAR(25),
InterestedDomain VARCHAR(50),	Projects VARCHAR(50),	FutureCareer VARCHAR(50), 	Python VARCHAR(25),	SQLProgramming VARCHAR(25),	Java VARCHAR(25))

Select * from CSSTUDENT
limit 10

-- Data cleaning
-- check for null values

Select * from CSStudent
where studentid is null or studentname is null or gender is null or age is null or gpa is null or major is null or interesteddomain is null or projects is null or futurecareer is null or python is null or sqlprogramming is null or java is null

-- Data exploration 
select Gender , count(*) as countgender 
from CSStudent 
Group by Gender; 

select 
   Min(age) as Minage,
   Max(age) as Maxage,
   Avg(age) as Avgage
from CSSTUDENT;

select interesteddomain, count(*) as countdomain
from CSSTUDENT
group by interesteddomain
order by countdomain Desc;


--What is the distribution of student ages, and does age correlate with GPA?
Select age, Round (Avg(GPA):: numeric,2) as avggpa 
from csstudent
group by age
Order by avggpa desc;


--Do students with certain interests tend to have stronger technical skills?
SELECT InterestedDomain, Python, COUNT(*) AS countpython, sqlprogramming, count(*) as sqlcount, java , count(*) as javacount
FROM csstudent
GROUP BY InterestedDomain, Python, sqlprogramming, Java
ORDER BY InterestedDomain;


SELECT
  InterestedDomain,
  ROUND(SUM(CASE WHEN Python = 'Strong' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS python_strong_percent,
  ROUND(SUM(CASE WHEN SQLProgramming = 'Strong' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS sql_strong_percent,
  ROUND(SUM(CASE WHEN Java = 'Strong' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS java_strong_percent,
  COUNT(*) AS total_students
FROM csstudent
GROUP BY InterestedDomain
ORDER BY InterestedDomain ASC;

--Which projects are associated with higher GPAs?
select projects, round(avg(gpa)::numeric,2) as avggpa
from csstudent
group by projects
order by avggpa desc;

-- Are certain domains of interest more popular with one gender?
select interesteddomain, gender,count(*) as countgender
from csstudent
group by interesteddomain,gender
order by interesteddomain desc ;

--Do students' current skill levels align with their desired future careers?
SELECT FutureCareer, Python, COUNT(*) AS countpython, sqlprogramming, count(*) as sqlcount, java, count(*) as javacount
FROM csstudent
GROUP BY FutureCareer, Python, sqlprogramming, java
ORDER BY FutureCareer;


-- Which skill is most commonly "Strong" among students?
SELECT 'Python' AS Skill, COUNT(*) AS count
FROM csstudent
WHERE Python = 'Strong'
UNION ALL
SELECT 'SQLProgramming', COUNT(*) FROM csstudent WHERE SQLProgramming = 'Strong'
UNION ALL
SELECT 'Java', COUNT(*) FROM csstudent WHERE Java = 'Strong';


--Which future careers are most commonly chosen by high-performing students (GPA > 3.7)?
SELECT FutureCareer, COUNT(*) AS count
FROM csstudent
WHERE GPA > 3.7
GROUP BY FutureCareer
ORDER BY count DESC;

