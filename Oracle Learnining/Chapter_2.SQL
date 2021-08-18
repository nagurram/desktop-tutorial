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




Select employee_id, job_id, start_date, end_date, ((end_date-start_date) +1) /365.25 "year worked" From job_history;

Desc employees;



