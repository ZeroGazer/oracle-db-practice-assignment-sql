CREATE TABLE course (
    course_ID varchar2(8) PRIMARY KEY,
    course_name varchar2(80),
    credits number(3)
);
    
CREATE TABLE prof (
    staff_ID number(8) PRIMARY KEY,
    last_name varchar2(80),
    first_name varchar2(80)
);

CREATE TABLE prof_phone (
    staff_ID number(8) REFERENCES prof(staff_ID),
    phone_number number(8),
    PRIMARY KEY(staff_ID, phone_number)
);

CREATE TABLE prerequisite (
    main_course_ID varchar2(8) REFERENCES course(course_ID),
    prereq_course_ID varchar2(8) REFERENCES course(course_ID),
    PRIMARY KEY(main_course_ID, prereq_course_ID)
);

CREATE TABLE offering (
    course_ID varchar2(8) REFERENCES course(course_ID),
    offering_no number(8),
    YearSemester varchar2(10),
    classroom number(5),
    no_of_stds number(5),
    staff_ID number(8) NOT NULL REFERENCES prof(staff_ID),
    PRIMARY KEY(course_ID, offering_no)
);

CREATE TABLE prof_teach (
    staff_ID number(8) REFERENCES prof(staff_ID),
    course_ID varchar2(8),
    offering_no number(8),
    FOREIGN KEY(course_ID, offering_no) REFERENCES offering(course_ID, offering_no),
    PRIMARY KEY(staff_ID, course_ID, offering_no)
);

CREATE TABLE TA (
    student_ID number(8) PRIMARY KEY,
    last_name varchar2(80),
    first_name varchar2(80),
    phone number(8),
    course_ID varchar2(8) NOT NULL,
    offering_no number(8) NOT NULL,
    FOREIGN KEY(course_ID, offering_no) REFERENCES offering(course_ID, offering_no)
);

CREATE TABLE pref_TA (
    staff_ID number(8) REFERENCES prof(staff_ID),
    student_ID number(8) REFERENCES TA(student_ID),
    PRIMARY KEY(staff_ID, student_ID)
);

CREATE TABLE supervise (
    staff_ID number(8) REFERENCES prof(staff_ID),
    student_ID number(8) REFERENCES TA(student_ID),
    PRIMARY KEY(staff_ID, student_ID)
);

CREATE TABLE pref_offering (
    student_ID number(8) REFERENCES TA(student_ID),
    course_ID varchar2(8),
    offering_no number(8),
    FOREIGN KEY(course_ID, offering_no) REFERENCES offering(course_ID, offering_no),
    PRIMARY KEY(student_ID, course_ID, offering_no)
);
