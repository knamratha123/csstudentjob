# Student Job Data Analysis

This project focuses on analyzing a student dataset to uncover insights about student skills, career interests, and academic performance. The dataset contains information on various attributes of students including their skills in programming languages (Python, SQL, Java), gender, GPA, major, projects, and future career interests.

This repository includes SQL queries used for data cleaning and data exploration to answer important questions about the dataset.

### Database Setup
To begin with the analysis, the CSSTUDENT table is created and populated with data for analysis.

### Database Creation and Table Setup
```--sql

CREATE DATABASE StudentJob;

CREATE TABLE CSSTUDENT (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(25),
    Gender VARCHAR(25),
    Age INT,
    GPA FLOAT,
    Major VARCHAR(25),
    InterestedDomain VARCHAR(50),
    Projects VARCHAR(50),
    FutureCareer VARCHAR(50),
    Python VARCHAR(25),
    SQLProgramming VARCHAR(25),
    Java VARCHAR(25)
); ```

### Sample Data Extraction
You can view the first 10 rows of the dataset:

```-- sql
SELECT * FROM CSSTUDENT
LIMIT 10;
```

### Data Cleaning
To ensure the integrity of the data, we check for null values in the dataset and perform necessary data cleaning.

### Null Value Check
```-- sql

SELECT * FROM CSSTUDENT
WHERE StudentID IS NULL OR 
      StudentName IS NULL OR 
      Gender IS NULL OR 
      Age IS NULL OR 
      GPA IS NULL OR 
      Major IS NULL OR 
      InterestedDomain IS NULL OR 
      Projects IS NULL OR 
      FutureCareer IS NULL OR 
      Python IS NULL OR 
      SQLProgramming IS NULL OR 
      Java IS NULL;
```

### Data Exploration
In this section, we perform several exploratory queries to uncover trends and patterns within the dataset.

### Gender Distribution
To analyze the gender distribution of students:

``` --sql
SELECT Gender, COUNT(*) AS countgender
FROM CSSTUDENT
GROUP BY Gender;
Age Distribution
To get the minimum, maximum, and average age of students:
```

``` --sql

SELECT 
    MIN(Age) AS MinAge,
    MAX(Age) AS MaxAge,
    AVG(Age) AS AvgAge
FROM CSSTUDENT;
```

### Domain Popularity
To find out which interested domain is the most popular:

``` --sql
SELECT InterestedDomain, COUNT(*) AS countdomain
FROM CSSTUDENT
GROUP BY InterestedDomain
ORDER BY countdomain DESC;
```

### Age and GPA Correlation
To check the correlation between student age and GPA:

```-- sql
SELECT Age, ROUND(AVG(GPA)::numeric, 2) AS AvgGPA
FROM CSSTUDENT
GROUP BY Age
ORDER BY AvgGPA DESC;
``` 
### Skill Strength by Domain of Interest
To understand whether students with certain interests tend to have stronger technical skills:

```-- sql
SELECT InterestedDomain, 
       Python, COUNT(*) AS countPython, 
       SQLProgramming, COUNT(*) AS countSQL, 
       Java, COUNT(*) AS countJava
FROM CSSTUDENT
GROUP BY InterestedDomain, Python, SQLProgramming, Java
ORDER BY InterestedDomain;
```

### Projects and GPA
To find out which projects are associated with higher GPAs:

```--sql
SELECT Projects, ROUND(AVG(GPA)::numeric, 2) AS AvgGPA
FROM CSSTUDENT
GROUP BY Projects
ORDER BY AvgGPA DESC;
```

### Gender and Domain Popularity
To check if certain domains of interest are more popular with one gender:

```-- sql
SELECT InterestedDomain, Gender, COUNT(*) AS countGender
FROM CSSTUDENT
GROUP BY InterestedDomain, Gender
ORDER BY InterestedDomain DESC;
```

### Skill Alignment with Future Career
To check if students' current technical skills align with their desired future careers:

```-- sql
SELECT FutureCareer, 
       Python, COUNT(*) AS countPython, 
       SQLProgramming, COUNT(*) AS countSQL, 
       Java, COUNT(*) AS countJava
FROM CSSTUDENT
GROUP BY FutureCareer, Python, SQLProgramming, Java
ORDER BY FutureCareer;
```

### Most Common "Strong" Skills
To find out which technical skill (Python, SQL, Java) is most commonly "Strong" among students:

```--sql
SELECT 'Python' AS Skill, COUNT(*) AS count
FROM CSSTUDENT
WHERE Python = 'Strong'
UNION ALL
SELECT 'SQLProgramming', COUNT(*) FROM CSSTUDENT WHERE SQLProgramming = 'Strong'
UNION ALL
SELECT 'Java', COUNT(*) FROM CSSTUDENT WHERE Java = 'Strong';
```

### Career Choices of High-Performing Students

To analyze which future careers are most commonly chosen by students with GPA > 3.7:

```--sql
SELECT FutureCareer, COUNT(*) AS count
FROM CSSTUDENT
WHERE GPA > 3.7
GROUP BY FutureCareer
ORDER BY count DESC;
```

### Conclusion
This project provides a thorough exploration of the StudentJob dataset using SQL. By analyzing various aspects of the dataset such as gender distribution, technical skill strength, and career goals, we can gain valuable insights into the characteristics of students and their career aspirations.

