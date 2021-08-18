Select Country_Name From Countries Where Region_id=3;
Select Last_Name, First_Name From Employees Where Job_Id = 'SA_REP';

-- Result is same in the both the queries
--Two ways to select numeric values in a Where clause
Select Last_Name, Salary From Employees Where Salary = 10000;
Select Last_Name, Salary From Employees Where Salary = '10000';

Select Last_Name, Salary, department_Id From Employees Where Salary =Department_Id;
Select * From Employees;

--The terms on the either side of the comparison operator are expression
Select Last_Name, Salary From Employees Where Salary/10 = Department_id*10;

--Using the Where clause with Numeric Expressions
Select Last_Name, Salary, Department_Id From Employees Where Salary = Department_id; -- No rows Selected
Select Last_Name, Salary, Department_Id From Employees Where Salary = Department_id * 100;

--Using the Where clause with character data
Select Last_Name From Employees Where Job_Id= 'SA_REP';

Select Last_Name From Employees Where Job_Id=SA_REP; --we get error, due to missing of single qoutes
--ORA-00904: "SA_REP": invalid identifier
---00904. 00000 -  "%s: invalid identifier"
--*Cause:    
--*Action:
--Error at Line: 22 Column: 46

Select Last_Name From Employees Where Job_Id='Sa_Rep'; --No Rows Selected
Select Last_Name From Employees Where Job_Id='sa_rep'; -- No Rows Selected

--Character based Conditions are not limited to comparing column values with literal
--Character column-based where Clause
Select Employee_Id, JOb_Id, Last_Name, First_Name From employees Where Last_Name=First_Name; -- No Rows Selected
Select * From employees;

--Equivalence of Conditional Expressions
Select Employee_Id, JOb_Id, Last_Name, First_Name From employees Where 'A ' ||Last_Name||First_Name = 'A King' -- No Rows Selected
Select Employee_Id, JOb_Id, Last_Name, First_Name From employees Where First_Name||' '||Last_Name = Last_Name||' '||First_Name; -- No Rows Selected

Select Employee_Id, JOb_Id, Last_Name, First_Name From employees Where 'SA_REP' ||'King' = JOb_Id ||Last_Name;
---156	SA_REP	King	Janette ----Result

Select Employee_Id, JOb_Id, Last_Name, First_Name From employees Where Job_Id ||Last_Name = 'SA_REP'||'King';
---156	SA_REP	King	Janette ----Result

Select Employee_Id From Job_History Where Start_Date = End_Date; -- No Rows Selected
Select Employee_Id From Job_History Where Start_Date = '01-Jan-2001';-- No Rows Selected
Select Employee_Id From Job_History Where Start_Date = '01-Jan-01';-- No Rows Selected
Select Employee_Id From Job_History Where Start_Date = '01-Jan-99';-- No Rows Selected

--Using the Where Clause with Numeric expressions
Select Start_date, Employee_id From Job_History Where Start_Date + 1 = '25-Mar=06';
--24/MAR/06	114
--24/MAR/06	176

--Conditions based on the equality operator
Select Last_Name, Salary From Employees Where Job_Id = 'SA_REP';

--Inequality Operators 
Select Last_Name, Salary From Employees Where Salary > 5000;
Select Last_Name, Salary From Employees Where Salary < 3000;

--Composite inequality operators 
Select Last_Name, Salary From Employees Where Salary <= 3000;
Select Last_Name, Salary From Employees Where Salary >= 5000;
Select Last_Name, Salary From Employees Where Salary <> Department_Id;
Select Last_Name, Salary From Employees Where Salary != 4000+Department_ID;
Select * From Employees;

Select Last_Name From Employees Where Last_Name < 'king';

--Conditions based on the inequality operators Using Between Operator
Select Last_Name, Hire_Date From Employees where Hire_Date < '01-Jan-2003';

Select Last_Name, Salary From Employees Where Salary Between 3400 And 4000;

Select Last_Name From Employees Where Salary >=3400 And Salary <= 4000;

Select First_Name, Hire_Date From Employees Where Hire_Date Between '13-Jan-2001' And '17-Jun-2003' Order By Hire_Date;
Select * From Employees;

Select First_Name, Hire_Date From Employees Where '13-Jan-2001' Between Hire_Date+30 And '07-Jun-2003'; --later

-- In Operator
Select Last_Name, Salary From Employees Where Salary IN (3000,  4000, 6000);
Select Last_Name, Salary From Employees Where Salary =3000 OR Salary=4000 OR Salary =6000;

-- Character Data
Select Last_Name From Employees Where Last_Name In ('King', 'Gee', 'Lee');

Select Last_Name From Employees Where Hire_Date In ('13-JAN-2001', '07-JUN-2003'); -- Later

--Like Operator
Select First_Name From Employees Where First_Name Like 'A%';
Select First_Name From Employees Where First_Name Like '%'; --- we gets all the first name in the employee table

Select Last_Name From Employees Where Last_Name Like 'King'; 
Select Last_Name From Employees Where Last_Name = 'King';

Select Last_Name From Employees Where Last_Name Like 'K_ng';
Select Last_Name From Employees Where Last_Name Like 'Ki_g';
Select Last_Name From Employees Where Last_Name Like 'Kin_';

Select Last_Name From Employees Where Last_Name ='Kang'; --- we cannot get the data without using the like operator
Select Last_Name From Employees Where Last_Name Like 'Kang'; -- No rows are selected due miss spell of king

-- The Wildcard symbols of the Like Operator
Select * From Countries Where Country_name like 'I%a%';
Select * From Countries Where Country_Name Like '____i%';

--Character
Select * From Jobs Where Job_Id Like 'SA_%';

---Using the $ Dollar Symbol Instead of escape
Select * From Jobs Where Job_Id Like 'SA\_%' Escape '\';
Select * From Jobs Where Job_Id Like 'SA$_%' Escape '$';

Select Job_Id From Jobs Where Job_Id Like 'SA%MAN';
Select Job_Id From Jobs Where Job_Id Like 'SA\_%MAN' Escape '\';

Select Department_Name From Departments Where Department_Name Like '%ing';

-- Using the Null Operator
Select Last_Name, Commission_Pct From Employees Where Commission_Pct = Null; --- No Rows Selected
Select Last_Name, Commission_Pct From Employees Where Commission_Pct Is Null;

--Using the And Operator
Select First_Name, Last_Name, Commission_Pct, Hire_Date From Employees Where First_Name Like 'J%' And Commission_Pct > 0.1;
Select First_Name, Last_Name, Commission_Pct, Hire_Date From Employees Where First_Name Like 'J%' And Commission_Pct > 0.1 And Hire_Date > '13-JAN-2001' And Last_Name Like '%o%'; 

--Using the Or Operator
Select First_Name, Last_Name, Commission_Pct, Hire_Date From Employees Where First_Name Like 'B%' Or Commission_Pct > 0.35;
Select First_Name, Last_Name, Commission_Pct, Hire_Date From Employees Where First_Name Like 'B%' Or Commission_Pct > 0.35 Or Hire_Date > '01-Mar-2006' Or Last_Name like 'B%';

--Using the Not Operator
Select Last_Name From Employees Where Last_Name ='King';
Select Last_Name From Employees Where Not (Last_Name = 'King');

Select First_Name From Employees Where First_Name Like 'R%';
Select First_Name From Employees Where First_Name Not Like 'R%';

Select Department_Id From Employees Where Department_Id In (10,20, 30);
Select Department_Id From Employees Where Department_Id Not In (10, 20, 30);

Select Distinct(Salary) From Employees Where Salary Between 1 and 3000;   -- 26
Select Salary From Employees Where salary Not Between 1 And 3000;

Select Commission_Pct From Employees Where Commission_Pct Is Null;
Select Commission_Pct From Employees Where Commission_Pct Is Not Null;

Select First_Name, Last_Name, Commission_Pct, Hire_Date From Employees Where First_Name Not Like 'B%' Or Not (Commission_Pct > 0.35);

---Precedence Rules Operator Precedence In the where clause
Select Last_Name, Salary, Department_Id, Job_Id, Commission_Pct From Employees Where Last_Name Like '%a%' 
And Salary > Department_Id * 200 Or Job_id In ('Mk_REP', 'MK_MAN') And Commission_Pct Is Not Null;
--Raphaely	 11000	30	PU_MAN	
--Whalen	 4400	10	AD_ASST	
--Hartstein	 13000	20	MK_MAN	
--Fay	     6000	20	MK_REP	

Select Last_Name, Salary, Department_Id, Job_Id, Commission_Pct From Employees Where Last_Name Like '%a%' And Salary > Department_Id * 200;
--Raphaely	11000	30	PU_MAN	
--Whalen	4400	10	AD_ASST	
--Hartstein	13000	20	MK_MAN	
--Fay	    6000	20	MK_REP	
Select Last_Name, Salary, Department_Id, Job_Id, Commission_Pct From Employees Where Job_id In ('Mk_REP', 'MK_MAN') And Commission_Pct Is Not Null; -- No Rows Selected

---Effect Condition clause ordering due to precedence rules
Select  Last_Name, Salary, Department_Id, Job_Id, Commission_Pct From Employees Where Last_Name like '%a%' And Salary > Department_Id * 100 And Commission_Pct Is Not Null 
        Or Job_Id = 'MK_MAN';
--Partners	13500	80	SA_MAN	0.3
--Errazuriz	12000	80	SA_MAN	0.3
--Cambrault	11000	80	SA_MAN	0.3
--Hall	    9000	80	SA_REP	0.25
--Taylor	8600	80	SA_REP	0.2
--Hartstein	13000	20	MK_MAN	
        
Select Last_Name, Salary, Department_Id, Job_ID, Commission_Pct From Employees Where Last_Name Like '%a%' And Salary > Department_Id * 100 And Commission_Pct Is Not Null; 
--Partners	13500	80	SA_MAN	0.3
--Errazuriz	12000	80	SA_MAN	0.3
--Cambrault	11000	80	SA_MAN	0.3
--Hall	    9000	80	SA_REP	0.25
--Taylor	8600	80	SA_REP	0.2

Select Last_Name, Salary, Department_Id, Job_Id, Commission_Pct From Employees Where Job_Id = 'MK_MAN';
--Hartstein	13000	20	MK_MAN	

--Ordre By Clause (Ascending  and Descending Sorting)
Select Last_Name, Salary, Commission_Pct From Employees Where Job_Id In ('SA_MAN', 'MK_MAN') Order By Last_Name;

Select Last_Name, Salary, Hire_Date, Hire_Date-(Salary/10) Emp_Value,Job_Id From Employees where Job_Id In ('SA_REP', 'MK_MAN') Order By Emp_Value;
Select * From Employees;

Select Last_Name, Salary, Commission_Pct From Employees Where Job_Id In ('SA_MAN','MK_MAN') Order By Commission_Pct;
Select Last_Name, Salary, Commission_Pct, JOb_Id From Employees Where Job_Id In ('SA_MAN','MK_MAN') Order By Job_Id;

Select Last_Name, Salary, Commission_Pct From Employees Where Job_Id In ('SA_MAN', 'MK_MAN') Order By Commission_Pct Desc;
Select Last_Name, Salary, Commission_Pct From Employees Where Job_Id In ('SA_MAN', 'MK_MAN') Order By Commission_Pct Desc Nulls Last;

--Positional Sorting
Select Last_Name, Hire_Date, Salary From Employees Where Job_Id In ('SA_REP', 'MK_MAN') Order By 2;
Select Last_Name, Hire_Date, Salary, Job_ID From Employees Where Job_Id In ('SA_REP', 'MK_MAN') Order By 2;

--Composite Sorting 
Select Job_Id, Last_Name, Salary, Hire_Date From Employees Where Job_Id In ('SA_REP', 'MK_MAN') Order By Job_Id Desc, Last_Name, 4 Desc;
Select Job_Id, Last_Name, Salary, Hire_Date From Employees Where Job_Id In ('SA_REP', 'MK_MAN') Order By 4 Desc;
Select Job_Id, Last_Name, Salary, Hire_Date From Employees Where Job_Id In ('SA_REP') And Last_Name Like 'A%' Order By Job_Id Desc, Last_Name, 4 Desc;
Select Job_Id, Last_Name, Salary, Hire_Date From Employees Where Job_Id In ('SA_REP') And Last_Name Like 'A%' Order By  4 Desc;

---Variance Expression
Select Job_Title, Min_Salary, Max_Salary, (Max_Salary - Min_Salary) Variance From Jobs Where Job_Title Like '%President%' Or Job_Title Like '%Manager%'
Order By Variance Desc, Job_Title Desc;

---Single Ampersand Substitution
Select Employee_Id, Last_Name, Phone_Number From Employees Where Last_Name = &LASTNAME Or Employee_Id =&EMPNO;
--                                                               'King'                    0
---Double Ampersand Substitution
Select First_Name, Last_Name From Employees Where Last_Name Like '%&SEARCH%' And First_Name Like '%&SEARCH%';
---                                                            K                   S

Select First_Name, Last_Name From Employees Where Last_Name Like '%&&SEARCH%' And First_Name Like '%&SEARCH%';
----                                                           G

--Substituting Column Names 
Select First_Name, Last_Name From Employees Where Job_Id In ('MK_MAN', 'SA_MAN') Order By &Col;
--                                     Salary      
 
Select First_Name, Job_Id, &&Col From Employees Where Job_Id IN ('MK_Man','SA_MAN') Order By &Col;
---                                       Salary

---Substitution Expressions and Text
Select &Rest_of_Statement;
Select department_Name From Departments;

Select &Select_Clause From &From_Clause Where &Where_Clause Order By &Order_By_Clause;
-----      '*'          'Regions'            'Region_Id=2'          'Region_Name'

Select &Select_Clause From &From_Clause Where &Where_Clause Order By &Order_By_Clause;
-----     *               Countries          Region_Id=2              'Country_Name'

-- Undefine Command
Select Last_Name, &&COLNAME From Employees Where department_Id=10 Order By &ColName;
------------------------Salary
Select Last_Name, &&COLNAME From Employees Where department_Id=30 Order By &ColName;

Select Last_Name, &&COL1NAME From Employees Where department_Id=10 Order By &Col1Name;

--Define Command 

Define EmpName =King;

