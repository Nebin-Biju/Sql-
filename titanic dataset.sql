-- Step 1: Create and select the database
CREATE DATABASE IF NOT EXISTS Titanic;
USE Titanic;

-- Step 2: Create the Train table matching the CSV structure
CREATE TABLE Train (
    PassengerId INT,
    Survived BIT,
    Pclass INT,
    Name VARCHAR(255),
    Sex VARCHAR(50),
    Age FLOAT,
    SibSp INT,
    Parch INT,
    Ticket VARCHAR(50),
    Fare FLOAT,
    Cabin VARCHAR(50),
    Embarked VARCHAR(5)
);

-- Step 3: Enable local infile on the server side
SET GLOBAL local_infile = 1;

-- Step 4: Load the CSV file into the table
LOAD DATA LOCAL INFILE 'C:/Users/nebin/Desktop/knovista/sql/file/train.csv' 
INTO TABLE Train 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked);

USE Titanic;
select * from Train;

select name from Train;

select name,age,sex from Train;

select name from Train
where survived = 1;

select name from Train
where sex = 'female' and survived = 1;

select name from Train
where pclass= 1;

select name,age  from Train
where age < 18;

select name,age  from Train
order by age;

select name,age  from Train
order by age DESC; 

select name,pclass from Train
order by pclass;

select name,pclass,age from Train
order by pclass ASC , age DESC;

select * from Train
Limit  10;

select name,age from Train
order by  age DESC
Limit  5;

select name,age from Train
where survived = 1
order by  age 
Limit  5;