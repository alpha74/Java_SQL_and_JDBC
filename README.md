# SQL Commands in Java

- Mimic the `INSERT` and `SELECT` clauses.
- Data is inserted/fetched from Java application commandline.
- Read the full **Problem Statement** below.


### Requirements:
- MySQL database
- JDBC connection
- JDK package

---

### Problem Statement:

- Write a java program which takes any of the following commands as command line argument (not as input), and executes them using JDBC:  
  
  1. `insert into relationname value1 value2 value3 ...`
    - Inserts a tuple into the specified relation with the specified values; make sure you use a prepared statement.
    - Test it with input containing single quotes.
    - You can assume that all values are strings for simplicity  
  
  
  2. `select from relationname`  
    - Prints all tuples from the specified relation. 
    - You should assume that relationname is one of "instructor", "student" or "takes", and not use database metadata features to print the tuples.  
  
  
  3. `select from relationname where "condition"`  
  - Executes a query with the specified condition. 
  - Note the use of double quotes so that the condition comes as a single command line parameter. 
  - Again assume relationname is one of those from the previous feature. So this is really a small addition to the code for the previous feature, do NOT make a separate copy of the code.  
  
  
  4. `select from relationname1 relationname2`  
  - Displays result of natural join of the two relations. 
  - This time, use the resultset metadata feature to display all values from the query result.
  - Display column names.
 
