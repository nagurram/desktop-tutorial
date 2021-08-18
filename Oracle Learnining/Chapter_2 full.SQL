Select * From Regions; --Projecting all columns from the region table.
Select Region_name From Regions;

Select Job_id, Department_id From Job_History; --Projecting specific colums from the job_histroy table.

Select Distinct Job_id From Job_history; --Selecting unique job_ids from the job_history table.

Select Distinct Department_id From Job_history; --Selecting unique Department_ids from the job_histroy table.

Select Distinct Job_id, Department_id From Job_history; --unique Job_id, Deparment_id combinations from job_histroy table.

Select City, Location_id, state_province, Country_id From Locations -- Terminating with the forward slash in the next line instead of semicolon
/
--Q1. How many unique departments have employees currently working in them?
Select Distinct Department_id From Employees;

--Q2. How many countries are there in the Europe Region?
Select * From Regions;
Select Region_id, Country_name From Countries; -- without where clause
Select * From Countries where Region_id=1; --with where clause

--Arithmetic expression on calculate number of hours worked
Select Employee_id, Job_id, Start_date, End_date, End_date-Start_date+1 As "Days Worked",
       ( End_date - Start_date +1) * 8 As "Correct hours Worked",
        End_date - Start_date +1 * 8 As "Incorrect hours worked"
From hr.job_history;

--Use of the concatenation and arithmetic operators-- Asia Region_id=3  get 64
Select 'The '||Region_name||' Region is on Planet Earth' "Planetary Location",
        Region_id * 100/5 + 20 / (10 -5) "Mentor Shower Probability %",
        Region_id "Region_Id"
From Regions;
-- 3*100/5 + 20/(10-5)
-- 3*100/5 + 20/5
-- 300/5 + 20/5
-- 60 + 20/5
-- 60 +4
-- 64

--Use of the concatenation and arithmetic operators-- Asia Region_id=3 get 57
Select 'The '||Region_name||' Region is on Planet Earth' "Planetary Location",
        Region_id * 100/5 + 20 / 10 -5 "Mentor Shower Probability %",
        Region_id "Region_Id"
From Regions;
-- 3*100/5 + 20/10-5
-- 300/5 + 20/10-5
-- 60 + 20/10-5
-- 60 + 2-5
-- 62-5
-- 57

-- Use of column and expression aliases "Error occured due to double qouts are missed for the "Days worked" before alias As"
Select Employee_id, Job_id, Start_date, End_date, End_date-Start_date+1 As Days Worked,
       ( End_date - Start_date +1) * 8 As "Correct hours Worked",
        End_date - Start_date +1 * 8 As "Incorrect hours worked"
From hr.job_history;
--ORA-00923: FROM keyword not found where expected
--00923. 00000 -  "FROM keyword not found where expected"
--*Cause:    
--*Action:
--Error at Line: 53 Column: 81

-- Use of the AS key word to specify  column aliases
Select employee_id As "Employee_Ids", Job_Id As "Occupation", Start_Date, End_Date, (End_Date - Start_Date)+1 "Days Worked" From Job_history; 
Select employee_id As "Employee Id" From Job_history;

Select 'Literal' ||'Processing using the regions table' From Regions; -- Literal using if you want the space after literal then leave a space like 'Literal '
Select 'Literal ' ||'Processing using the regions table' From Regions;

Select 365.25*24*60*60 "Seconds in year" From Dual; -- Using of Dual table

Select 'plural "s" have one quote too many' From Dual;
Select 'plural''s have one quote too many' From Dual;

--Use of two single quotes with literals with implicit quotes
Select 'Plural''s can be specified using two single quotes' As "2 Single Quotes" From Dual;
Select 'Using 2 quote''s with many plural''s with lot ''s of quotes'' can be tedious' As "Too Many Single Quotes!" From Dual;

-- Result Using 2 quote's with many plural's with lot 's of quotes' can be tedious as Too Many Single Quotes! table
Select 'Nikhil''s is cute boy' As "Nikhil", 'Dinesh is a good boy' As "Dinesh",'Dinesh is cute' AS "Dinesh" From Dual;

-- Alternative quote(q) operator 
Select q'<Posssessive plural's can also be specified using alternative quote operators>' "q<>" From Dual; -- Angle Bracket

Select q'[Even square brackets [] may delimit possessive plural's]' "q[]" From Dual;  -- Square Bracket

Select q'Xwhat about upper case X for possessive plural'sX' "qX" From dual;  -- Upper Case

-- Null Values in the commission_pct column
Desc employees;
Select First_Name||' '||Last_Name"Full_Name", Salary, Commission_pct, manager_id From employees;

--Null arithemetic always returns a null value 
Select First_Name||Null||Last_Name "Full Name", Commission_Pct, Salary,
       Commission_Pct + salary +10 "Null Arithmetic",
       10/Commission_Pct "Division by Null"
From Employees;
Select Commission_Pct From Employees;

--Experimenting with Experssions and the Dual Table
--Q1.It was demonstrated earlier how the number of day in which staff worked in a job could be calulated. For how many years did 
--   staff work while fulfilling these jobroles and what were their Employee_Id, Job_Id,Start_Date, End_Date Values? Alias the 
--   Expression Column in your qurey with the alias year worked. Assume that a year consists of 365.25 days.

Select Employee_id, Job_id, Start_date, End_date, ((End_date-Start_date) +1) /365.25 As "Year Worked" From Job_history; --we use the alias "As"
Select Employee_id, Job_id, Start_date, End_date, ((End_date-Start_date) +1) /365.25 "Year Worked" From Job_history; -- without indicating "As" 

--Q2.Query the Jobs table and return a single expression ofthe form: The JOb ID for the <job_title's>job is:<job_id>. Take note that the
--   job_title should have an apostrophe and an "s" appended to it to read more naturally. A sample of this output for the organization 
--   president is:"The Job ID for the president's job is: Ad_Pres." Alias this column exprssion as"Job Description" using the As keyword.

Select 'The Job Id for the '||Job_title||'''s job is '||Job_Id As "Job Description" From Jobs;


--Q3.Using the Dual table, calculate the area of a circle with radius 6,000 units, with pi being approximately 22/7. Use the 
--   formula: Area= Pi*Radius*Radius.Alias the result as a "Area".

Select (22/7) *(6000 * 6000) Area From Dual;



