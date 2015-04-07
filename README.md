COMP3311 Assignment 3
=====================

HKUST COMP3311 Database Management Systems (2015 Spring) Assignment 3

=====================
Part 1. Creating tables using the SQL Data Definition Language:

Create the following 10 tables with the given constraints. Use exactly the same
table names (i.e. “course”, “prof”,…etc) and attribute names (i.e. “course_ID”,
“course_name”,… etc) as listed below, otherwise marks will be deducted. The
table order below is not necessarily the correct order for creating the tables;
it is merely describing the column types and the different constraints of the
tables.

```
- course table
1. course_ID: varchar2(8), primary key.
2. course_name: varchar2(80).
3. credits: number(3).
```

```
- prof table
1. staff_ID: number(8), primary key.
2. last_name: varchar2(80).
3. first_name: varchar2(80). 
```

```
- prof_phone table
1. staff_ID: number(8).
2. phone_number: number(8).
staff_ID foreign key referencing the prof() table, primary key
(staff_ID, phone_number).
```

```
- prerequisite table
1. main_course_ID: varchar2(8).
2. prereq_course_ID: varchar2(8).
main_course_ID foreign key referencing the course_ID column of the course()
table, prereq_course_ID foreign key referencing the course_ID column of the
course() table, primary key (main_course_ID, prereq_course_ID).
```

```
- prof_teach table
1. staff_ID: number(8).
2. course_ID: varchar2(8).
3. offering_no: number(8).
staff_ID foreign key referencing the prof() table,
(course_ID,offering_no) foreign key referencing the offering() table, primary
key (staff_ID, course_ID,offering_no).
```

```
- pref_TA table
1. staff_ID: number(8).
2. student_ID: number(8).
staff_ID foreign key referencing the prof() table, student_ID foreign key
referencing the TA() table, primary key (staff_ID, student_ID).
```

```
- supervise table
1. staff_ID: number(8).
2. student_ID: number(8).
staff_ID foreign key referencing the prof() table, student_ID foreign key
referencing the TA() table, primary key (staff_ID, student_ID).
```

```
- pref_offering table
1. student_ID: number(8).
2. course_ID: varchar2(8).
3. offering_no: number(8).
student_ID foreign key referencing the TA() table,
(course_ID,offering_no) foreign key referencing the offering() table,
primary key (student_ID, course_ID, offering_no). 
```

```
- TA table
1. student_ID: number(8) , primary key.
2. last_name: varchar2(80).
3. first_name: varchar2(80).
4. phone: number(8).
5. course_ID: varchar2(8), NOT NULL.
6. offering_no: number(8), NOT NULL.
(course_ID,offering_no) foreign key referencing the offering table.
```

```
- offering table
1. course_ID: varchar2(8).
2. offering_no: number(8).
3. YearSemester: varchar2(10).
4. classroom: number(5).
5. no_of_stds: number(5).
6. staff_ID: number(8), NOT NULL.
course_ID foreign key referencing the course() table, staff_ID foreign key
referencing the prof() table, primary key (course_ID, offering_no).
```

=====================

Part 2. Write the following SQL queries:

1. Find the course_ID for courses with the highest number of credit.

2. Find the staff_ID, last_name, first_name of all the professors who have
taught 'Comp3311' but not 'Comp4311'.

3. Find the student_ID, last_name, first_name of the TAs who were preferred by
the most number of professors.

4. Find the staff_ID, last_name, first_name of all the professors who have NOT
taught all the prerequisites of 'Comp3311'.

5. Find the staff_ID, last_name, first_name of each professor who has taught
*all* the offerings of 'Comp3311'
