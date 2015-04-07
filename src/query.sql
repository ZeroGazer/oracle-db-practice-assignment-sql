/* Q1 */
SELECT course_ID
FROM course
WHERE credits = (SELECT MAX(credits)
                 FROM course);

/* Q2 */
(SELECT prof.staff_ID, prof.last_name, prof.first_name
FROM prof, prof_teach
WHERE prof.staff_ID = prof_teach.staff_ID AND prof_teach.course_ID = 'Comp3311')
MINUS
(SELECT prof.staff_ID, prof.last_name, prof.first_name
FROM prof, prof_teach
WHERE prof.staff_ID = prof_teach.staff_ID AND prof_teach.course_ID = 'Comp4311');

/* Q3 */
SELECT TA.student_ID, TA.last_name, TA.first_name
FROM TA, pref_TA prefTA1
WHERE TA.student_ID = prefTA1.student_ID
GROUP BY TA.student_ID, TA.last_name, TA.first_name
HAVING COUNT(DISTINCT prefTA1.staff_ID) >= ALL (SELECT COUNT(*)
                                                FROM pref_TA prefTA2
                                                GROUP BY prefTA2.student_ID);

/* Q4 */
SELECT prof.staff_ID, prof.last_name, prof.first_name
FROM prof
WHERE EXISTS ((SELECT DISTINCT prerequisite.prereq_course_ID
               FROM prerequisite
               WHERE prerequisite.main_course_ID = 'Comp3311')
               MINUS
              (SELECT DISTINCT prof_teach.course_ID
               FROM prof_teach
               WHERE prof.staff_ID = prof_teach.staff_ID));

/* Q5 */
SELECT prof.staff_ID, prof.last_name, prof.first_name
FROM prof
WHERE NOT EXISTS ((SELECT offering.course_ID, offering.offering_no
                   FROM offering
                   WHERE offering.course_ID = 'Comp3311')
                  MINUS
                  (SELECT prof_teach.course_ID, prof_teach.offering_no
                   FROM prof_teach
                   WHERE prof.staff_ID = prof_teach.staff_ID));
