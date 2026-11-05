
USE GIU_Germany_Connect;



INSERT INTO Faculty (name, description) VALUES ('Faculty of Informatics and Computer Science', 'Computing, software and data programs');
INSERT INTO Faculty (name, description) VALUES ('Faculty of Engineering', 'Mechatronics and electrical engineering programs');
INSERT INTO Faculty (name, description) VALUES ('Faculty of Business and Economics', 'Business administration and management programs');

INSERT INTO Department (name, description, faculty_id) VALUES ('Computer Science', 'Core computing and software engineering', 1);
INSERT INTO Department (name, description, faculty_id) VALUES ('Data Science and AI', 'Data analytics and artificial intelligence', 1);
INSERT INTO Department (name, description, faculty_id) VALUES ('Mechatronics Engineering', 'Robotics and control systems', 2);
INSERT INTO Department (name, description, faculty_id) VALUES ('Electrical Engineering', 'Circuits and electronics', 2);
INSERT INTO Department (name, description, faculty_id) VALUES ('Business Administration', 'Management and business studies', 3);

INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('BSc Computer Science', 'Bachelor', 144, 'Undergraduate computer science program', 1);
INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('BSc Data Science', 'Bachelor', 140, 'Undergraduate data science program', 2);
INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('BSc Mechatronics Engineering', 'Bachelor', 160, 'Undergraduate mechatronics program', 3);
INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('MSc Computer Science', 'Master', 90, 'Graduate computer science program', 1);
INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('BSc Electrical Engineering', 'Bachelor', 160, 'Undergraduate electrical engineering program', 4);
INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id) VALUES ('BSc Business Administration', 'Bachelor', 140, 'Undergraduate business program', 5);

INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN101', 'Introduction to Programming', 6, 1, 1);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN201', 'Data Structures', 6, 2, 1);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN301', 'Database Systems', 6, 3, 1);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN401', 'Machine Learning', 6, 4, 1);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('DSEN201', 'Statistics for Data Science', 5, 2, 2);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('DSEN301', 'Data Mining', 6, 3, 2);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('MCTR101', 'Introduction to Mechatronics', 5, 1, 3);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('MCTR301', 'Control Systems', 6, 3, 3);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN501', 'Advanced Algorithms', 6, 5, 4);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('ELEN201', 'Electric Circuits', 6, 2, 5);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('BUSN101', 'Principles of Management', 5, 1, 6);
INSERT INTO Course (code, title, credit_hours, level, program_id) VALUES ('CSEN305', 'Operating Systems', 6, 3, 1);

INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (2, 1);
INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (3, 2);
INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (4, 2);
INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (6, 5);
INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (12, 2);
INSERT INTO Prerequisite (course_id, prereq_course_id) VALUES (8, 7);

INSERT INTO Field (name, description) VALUES ('Computer Science', 'Software, systems and computing theory');
INSERT INTO Field (name, description) VALUES ('Artificial Intelligence', 'Machine learning and intelligent systems');
INSERT INTO Field (name, description) VALUES ('Data Science', 'Data analysis and big data');
INSERT INTO Field (name, description) VALUES ('Robotics and Automation', 'Robots, control and automation');
INSERT INTO Field (name, description) VALUES ('Business Management', 'Management, logistics and business');

INSERT INTO Research_Area (name, description, field_id) VALUES ('Machine Learning', 'Learning algorithms and models', 2);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Natural Language Processing', 'Language understanding and generation', 2);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Database Systems', 'Data storage and query processing', 1);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Software Engineering Methods', 'Software design and testing', 1);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Big Data Analytics', 'Large scale data processing', 3);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Computer Vision', 'Image and video understanding', 2);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Autonomous Systems', 'Self-driving and mobile robots', 4);
INSERT INTO Research_Area (name, description, field_id) VALUES ('Supply Chain Analytics', 'Optimization of logistics', 5);

INSERT INTO Skill (name, category, description) VALUES ('Python Programming', 'Technical', 'Writing programs in Python');
INSERT INTO Skill (name, category, description) VALUES ('SQL', 'Technical', 'Querying relational databases');
INSERT INTO Skill (name, category, description) VALUES ('Java Programming', 'Technical', 'Writing programs in Java');
INSERT INTO Skill (name, category, description) VALUES ('Data Analysis', 'Technical', 'Analysing and visualising data');
INSERT INTO Skill (name, category, description) VALUES ('Machine Learning Basics', 'Technical', 'Training simple ML models');
INSERT INTO Skill (name, category, description) VALUES ('Project Management', 'Soft', 'Planning and tracking projects');
INSERT INTO Skill (name, category, description) VALUES ('Public Speaking', 'Soft', 'Presenting ideas to an audience');
INSERT INTO Skill (name, category, description) VALUES ('Technical Writing', 'Soft', 'Writing clear technical documents');

INSERT INTO Program_Field (program_id, field_id) VALUES (1, 1);
INSERT INTO Program_Field (program_id, field_id) VALUES (1, 2);
INSERT INTO Program_Field (program_id, field_id) VALUES (2, 2);
INSERT INTO Program_Field (program_id, field_id) VALUES (2, 3);
INSERT INTO Program_Field (program_id, field_id) VALUES (3, 4);
INSERT INTO Program_Field (program_id, field_id) VALUES (4, 1);
INSERT INTO Program_Field (program_id, field_id) VALUES (4, 2);
INSERT INTO Program_Field (program_id, field_id) VALUES (5, 4);
INSERT INTO Program_Field (program_id, field_id) VALUES (6, 5);


INSERT INTO University (name, country, city, description) VALUES ('German International University', 'Egypt', 'New Administrative Capital', 'GIU main campus');
INSERT INTO University (name, country, city, description) VALUES ('Technical University of Berlin', 'Germany', 'Berlin', 'Public research university');
INSERT INTO University (name, country, city, description) VALUES ('University of Stuttgart', 'Germany', 'Stuttgart', 'Public research university');
INSERT INTO University (name, country, city, description) VALUES ('Technical University of Munich', 'Germany', 'Munich', 'Public research university');
INSERT INTO University (name, country, city, description) VALUES ('University of Valencia', 'Spain', 'Valencia', 'Public university');
INSERT INTO University (name, country, city, description) VALUES ('Politecnico di Milano', 'Italy', 'Milan', 'Technical university');

INSERT INTO GIU (uni_id) VALUES (1);

INSERT INTO Partner_University (uni_id, partnership_status, contact_info) VALUES (2, 'Active', 'international@tu-berlin.example');
INSERT INTO Partner_University (uni_id, partnership_status, contact_info) VALUES (3, 'Active', 'exchange@uni-stuttgart.example');
INSERT INTO Partner_University (uni_id, partnership_status, contact_info) VALUES (4, 'Active', 'global@tum.example');
INSERT INTO Partner_University (uni_id, partnership_status, contact_info) VALUES (5, 'Pending', 'relations@uv.example');
INSERT INTO Partner_University (uni_id, partnership_status, contact_info) VALUES (6, 'Active', 'incoming@polimi.example');

INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('Computer Engineering and Microelectronics', 'Computing and hardware', 2);
INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('Institute of Software Engineering', 'Software engineering research', 3);
INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('School of Computation and Information', 'Computing and information', 4);
INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('Department of Informatics', 'Informatics and AI', 5);
INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('Department of Electronics and Bioengineering', 'Electronics research', 6);
INSERT INTO Partner_Department (name, description, partner_uni_id) VALUES ('Robotics and Mechatronics Institute', 'Robotics research', 2);

INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Informatics', 'Master', 'Graduate informatics program', 1);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Software Engineering', 'Master', 'Graduate software engineering program', 2);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Data Engineering and Analytics', 'Master', 'Graduate data program', 3);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Artificial Intelligence', 'Master', 'Graduate AI program', 4);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Computer Science and Engineering', 'Master', 'Graduate computing program', 5);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('MSc Robotics', 'Master', 'Graduate robotics program', 6);
INSERT INTO Partner_Program (name, degree_level, description, pdept_id) VALUES ('BSc Informatics', 'Bachelor', 'Undergraduate informatics program', 3);

INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (1, 1);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (2, 1);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (3, 3);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (3, 2);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (4, 2);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (5, 1);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (6, 4);
INSERT INTO Partner_Program_Field (pprog_id, field_id) VALUES (7, 1);


INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Ahmed Hassan', 'ahmed.hassan@student.giu.example', '+20 100 000 0001', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Sara Mostafa', 'sara.mostafa@student.giu.example', '+20 100 000 0002', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Omar Khaled', 'omar.khaled@student.giu.example', '+20 100 000 0003', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Mariam Adel', 'mariam.adel@student.giu.example', '+20 100 000 0004', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Youssef Nabil', 'youssef.nabil@student.giu.example', '+20 100 000 0005', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Nour Ibrahim', 'nour.ibrahim@student.giu.example', '+20 100 000 0006', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Karim Samir', 'karim.samir@student.giu.example', '+20 100 000 0007', 'Suspended');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Laila Farouk', 'laila.farouk@student.giu.example', '+20 100 000 0008', 'Inactive');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Dr. Hoda Mansour', 'hoda.mansour@giu.example', '+20 111 000 0009', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Dr. Tarek Zaki', 'tarek.zaki@giu.example', '+20 111 000 0010', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Dr. Rania Fathy', 'rania.fathy@giu.example', '+20 111 000 0011', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Dr. Walid Anwar', 'walid.anwar@giu.example', '+20 111 000 0012', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Prof. Klaus Weber', 'klaus.weber@tu-berlin.example', '+49 30 000 0013', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Prof. Anna Rossi', 'anna.rossi@polimi.example', '+39 02 000 0014', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Prof. Elena Garcia', 'elena.garcia@uv.example', '+34 96 000 0015', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Prof. Markus Schneider', 'markus.schneider@tum.example', '+49 89 000 0016', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Hana Youssef', 'hana.youssef@technova.example', '+20 122 000 0017', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Daniel Becker', 'daniel.becker@autodrive.example', '+49 89 000 0018', 'Active');
INSERT INTO Person (full_name, email, phone, account_status) VALUES ('Sherif Gamal', 'sherif.gamal@giu.example', '+20 111 000 0019', 'Active');

INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (1, '25-1001', 5, 3.60, 'B2', 'cv/ahmed_hassan.pdf', 1);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (2, '25-1002', 6, 3.85, 'C1', 'cv/sara_mostafa.pdf', 1);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (3, '25-1003', 4, 3.20, 'B1', 'cv/omar_khaled.pdf', 2);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (4, '25-1004', 7, 3.75, 'B2', 'cv/mariam_adel.pdf', 3);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (5, '25-1005', 3, 2.90, 'A2', 'cv/youssef_nabil.pdf', 1);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (6, '25-1006', 8, 3.40, 'C1', 'cv/nour_ibrahim.pdf', 4);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (7, '25-1007', 5, 3.10, 'B1', 'cv/karim_samir.pdf', 5);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id) VALUES (8, '25-1008', 2, 3.00, 'A2', 'cv/laila_farouk.pdf', 6);

INSERT INTO Student_Interest (person_id, interest) VALUES (1, 'Robotics');
INSERT INTO Student_Interest (person_id, interest) VALUES (1, 'Chess');
INSERT INTO Student_Interest (person_id, interest) VALUES (2, 'Artificial Intelligence');
INSERT INTO Student_Interest (person_id, interest) VALUES (2, 'Hiking');
INSERT INTO Student_Interest (person_id, interest) VALUES (3, 'Data Visualization');
INSERT INTO Student_Interest (person_id, interest) VALUES (4, 'Drones');
INSERT INTO Student_Interest (person_id, interest) VALUES (5, 'Game Development');
INSERT INTO Student_Interest (person_id, interest) VALUES (6, 'Cybersecurity');

INSERT INTO GIU_Academic (person_id, academic_rank, dept_id) VALUES (9, 'Professor', 1);
INSERT INTO GIU_Academic (person_id, academic_rank, dept_id) VALUES (10, 'Associate Professor', 1);
INSERT INTO GIU_Academic (person_id, academic_rank, dept_id) VALUES (11, 'Assistant Professor', 2);
INSERT INTO GIU_Academic (person_id, academic_rank, dept_id) VALUES (12, 'Associate Professor', 3);

INSERT INTO Partner_Professor (person_id, title, pdept_id) VALUES (13, 'Professor', 1);
INSERT INTO Partner_Professor (person_id, title, pdept_id) VALUES (14, 'Professor', 5);
INSERT INTO Partner_Professor (person_id, title, pdept_id) VALUES (15, 'Associate Professor', 4);
INSERT INTO Partner_Professor (person_id, title, pdept_id) VALUES (16, 'Professor', 3);

INSERT INTO Company_Rep (person_id, company_name, sector, position, location) VALUES (17, 'TechNova Solutions', 'Software', 'HR Manager', 'Cairo');
INSERT INTO Company_Rep (person_id, company_name, sector, position, location) VALUES (18, 'AutoDrive GmbH', 'Automotive', 'Innovation Lead', 'Munich');

INSERT INTO Interviewer (role, person_id) VALUES ('Interview Panel Chair', 9);
INSERT INTO Interviewer (role, person_id) VALUES ('Technical Interviewer', 10);
INSERT INTO Interviewer (role, person_id) VALUES ('Industry Interviewer', 17);
INSERT INTO Interviewer (role, person_id) VALUES ('Academic Interviewer', 13);

INSERT INTO Topic_Provider (person_id) VALUES (9);
INSERT INTO Topic_Provider (person_id) VALUES (10);
INSERT INTO Topic_Provider (person_id) VALUES (11);
INSERT INTO Topic_Provider (person_id) VALUES (13);
INSERT INTO Topic_Provider (person_id) VALUES (17);
INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('Your application to the Deep Learning thesis has been accepted', '2026-10-15T09:30:00', 'Application', 'High', 0, 2);

INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('Welcome to GIU Germany Connect', '2026-09-01T08:00:00', 'General', 'Low', 1, 1);

INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('Your interview is scheduled for 12 November', '2026-11-01T10:00:00', 'Interview', 'Normal', 0, 1);
INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('New application received for your thesis topic', '2026-10-08T12:00:00', 'Application', 'Normal', 0, 9);


INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('Agreement expiring soon', '2026-11-01T09:00:00', 'Agreement', 'High', 0, 9);
INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('A visit request awaits your review', '2026-10-28T14:00:00', 'Visit', 'High', 0, 13);

INSERT INTO Notification (message, [timestamp], category, urgency, read_status, recipient_id) VALUES ('Your placement has new applicants', '2026-10-29T16:00:00', 'Placement', 'Normal', 1, 17);

INSERT INTO Completed_Course (student_id, course_id) VALUES (1, 1);
INSERT INTO Completed_Course (student_id, course_id) VALUES (1, 2);
INSERT INTO Completed_Course (student_id, course_id) VALUES (2, 1);
INSERT INTO Completed_Course (student_id, course_id) VALUES (2, 2);



INSERT INTO Completed_Course (student_id, course_id) VALUES (2, 3);
INSERT INTO Completed_Course (student_id, course_id) VALUES (2, 4);

INSERT INTO Completed_Course (student_id, course_id) VALUES (3, 5);
INSERT INTO Completed_Course (student_id, course_id) VALUES (4, 7);
INSERT INTO Completed_Course (student_id, course_id) VALUES (5, 1);


INSERT INTO Completed_Course (student_id, course_id) VALUES (6, 1);


INSERT INTO Completed_Course (student_id, course_id) VALUES (6, 9);
INSERT INTO Completed_Course (student_id, course_id) VALUES (8, 11);

INSERT INTO Student_Skill (student_id, skill_id) VALUES (1, 1);


INSERT INTO Student_Skill (student_id, skill_id) VALUES (1, 2);

INSERT INTO Student_Skill (student_id, skill_id) VALUES (2, 1);



INSERT INTO Student_Skill (student_id, skill_id) VALUES (2, 2);
INSERT INTO Student_Skill (student_id, skill_id) VALUES (2, 5);


INSERT INTO Student_Skill (student_id, skill_id) VALUES (3, 1);
INSERT INTO Student_Skill (student_id, skill_id) VALUES (3, 4);



INSERT INTO Student_Skill (student_id, skill_id) VALUES (4, 3);
INSERT INTO Student_Skill (student_id, skill_id) VALUES (5, 1);

INSERT INTO Student_Skill (student_id, skill_id) VALUES (5, 3);

INSERT INTO Student_Skill (student_id, skill_id) VALUES (6, 1);

INSERT INTO Student_Skill (student_id, skill_id) VALUES (6, 5);
INSERT INTO Student_Skill (student_id, skill_id) VALUES (8, 4);

INSERT INTO GIU_Interest (academic_id, area_id) VALUES (9, 1);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (9, 2);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (10, 3);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (10, 5);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (11, 1);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (11, 6);
INSERT INTO GIU_Interest (academic_id, area_id) VALUES (12, 7);

INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (13, 1);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (13, 3);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (14, 6);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (14, 7);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (15, 1);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (15, 2);
INSERT INTO PP_Interest (partner_prof_id, area_id) VALUES (16, 5);

INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - TU Berlin Student Exchange', 'Semester exchange for computing students', '2025-09-01', '2028-08-31', 'Active', 2, 9);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - University of Stuttgart Double Degree', 'Double degree in computer science', '2025-10-01', '2029-09-30', 'Active', 3, 10);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - Politecnico di Milano Exchange', 'Semester exchange for engineering students', '2024-01-01', '2026-12-15', 'Active', 6, 9);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - TUM AI Research Collaboration', 'Joint research in artificial intelligence', '2025-03-01', '2027-02-28', 'Active', 4, 11);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - Valencia Data Science Research', 'Joint research in data science', '2026-01-01', '2026-11-30', 'Active', 5, 10);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - TU Berlin General MoU', 'General academic cooperation', '2023-01-01', '2026-10-15', 'Expired', 2, 9);
INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id) VALUES ('GIU - TUM General MoU', 'General institutional cooperation', '2026-06-01', '2031-05-31', 'Active', 4, 12);

INSERT INTO Mobility_Agreement (agreement_id, exchange_terms, double_degree_terms, seat_quota, tuition_arrangement) VALUES (1, 'One semester exchange with full credit transfer', NULL, 8, 'Students pay GIU tuition only');
INSERT INTO Mobility_Agreement (agreement_id, exchange_terms, double_degree_terms, seat_quota, tuition_arrangement) VALUES (2, 'One semester exchange option', 'Two year double degree with 60 transferred credits', 4, 'Reduced tuition at the partner university');
INSERT INTO Mobility_Agreement (agreement_id, exchange_terms, double_degree_terms, seat_quota, tuition_arrangement) VALUES (3, 'One semester exchange with credit transfer', NULL, 6, 'Students pay GIU tuition only');

INSERT INTO Mob_Agr_Semester (agreement_id, semester) VALUES (1, 'Fall 2026');
INSERT INTO Mob_Agr_Semester (agreement_id, semester) VALUES (1, 'Spring 2027');
INSERT INTO Mob_Agr_Semester (agreement_id, semester) VALUES (2, 'Fall 2026');
INSERT INTO Mob_Agr_Semester (agreement_id, semester) VALUES (3, 'Spring 2026');
INSERT INTO Mob_Agr_Semester (agreement_id, semester) VALUES (3, 'Spring 2027');

INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (1, 1);
INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (1, 2);
INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (2, 1);
INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (2, 4);
INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (3, 3);
INSERT INTO Mob_Agr_Program (agreement_id, program_id) VALUES (3, 5);

INSERT INTO Research_Agreement (agreement_id, ip_terms, funding_framework) VALUES (4, 'Joint ownership of generated intellectual property', 'EUR 500000 joint funding');
INSERT INTO Research_Agreement (agreement_id, ip_terms, funding_framework) VALUES (5, 'Shared data access and co-owned publications', 'EUR 120000 funded by both sides');

INSERT INTO Res_Agr_Area (agreement_id, area_id) VALUES (4, 1);
INSERT INTO Res_Agr_Area (agreement_id, area_id) VALUES (4, 2);
INSERT INTO Res_Agr_Area (agreement_id, area_id) VALUES (4, 6);
INSERT INTO Res_Agr_Area (agreement_id, area_id) VALUES (5, 3);
INSERT INTO Res_Agr_Area (agreement_id, area_id) VALUES (5, 5);

INSERT INTO General_MoU (agreement_id, intent, collab_scope, renewal_terms) VALUES (6, 'Promote academic cooperation', 'Student and staff exchange', 'Renewable every three years');
INSERT INTO General_MoU (agreement_id, intent, collab_scope, renewal_terms) VALUES (7, 'Strengthen institutional ties', 'Joint events and research', 'Automatic renewal after five years');

INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Deep Learning for Medical Image Segmentation', 'Thesis on segmentation of CT scans', 'Thesis', 'Open', '2026-10-01', '2026-12-31', 2, 'Hybrid', 4, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Scalable Graph Databases for Big Data', 'Thesis on graph storage engines', 'Thesis', 'Open', '2026-10-15', '2026-11-10', 1, 'Online', 5, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('NLP Chatbot for Customer Support', 'Industry thesis on a support chatbot', 'Thesis', 'Open', '2026-10-01', '2026-12-15', 2, 'On-site', NULL, 17);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Autonomous Navigation for Mobile Robots', 'Thesis on robot path planning', 'Thesis', 'Closed', '2026-05-01', '2026-09-30', 1, 'On-site', NULL, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Berlin Summer School on AI', 'Two week summer school in Berlin', 'Short Program', 'Open', '2026-10-01', '2026-11-15', 20, 'On-site', 7, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Online Winter School on Data Science', 'Four week online winter school', 'Short Program', 'Open', '2026-10-10', '2027-01-10', 30, 'Online', 5, 18);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Fall 2026 Exchange at TU Berlin', 'One semester exchange in Berlin', 'Mobility Program', 'Closed', '2026-03-01', '2026-05-31', 4, 'On-site', 1, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Double Degree in Computer Science at Stuttgart', 'Two year double degree', 'Mobility Program', 'Open', '2026-10-01', '2026-11-25', 2, 'On-site', 2, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Spring 2027 Exchange at Politecnico di Milano', 'One semester exchange in Milan', 'Mobility Program', 'Open', '2026-10-15', '2027-01-15', 3, 'On-site', 3, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Spring 2026 Exchange at TU Berlin', 'One semester exchange in Berlin', 'Mobility Program', 'Closed', '2025-03-01', '2025-05-31', 3, 'On-site', 1, NULL);
INSERT INTO Opportunity (title, description, [type], status, app_open_date, app_close_date, capacity, location_mode, agreement_id, offered_by_rep_id) VALUES ('Quantum-Inspired Optimization for Supply Chains', 'Thesis on logistics optimization', 'Thesis', 'Open', '2026-10-25', '2027-01-31', 1, 'Hybrid', NULL, NULL);

INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (1, 'English');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (2, 'English');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (3, 'English');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (5, 'English');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (7, 'German');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (8, 'German');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (8, 'English');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (9, 'Italian');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (10, 'German');
INSERT INTO Opp_Language_Req (opp_id, language_req) VALUES (11, 'English');

INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (1, '2027-01-15');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (5, '2027-07-05');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (6, '2027-01-20');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (7, '2026-09-15');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (8, '2027-03-01');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (9, '2027-02-15');
INSERT INTO Opp_Relevant_Date (opp_id, relevant_date) VALUES (10, '2025-09-15');

INSERT INTO Opp_Field (opp_id, field_id) VALUES (1, 2);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (1, 1);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (2, 3);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (3, 2);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (4, 4);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (5, 2);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (6, 3);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (7, 1);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (8, 1);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (9, 4);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (10, 1);
INSERT INTO Opp_Field (opp_id, field_id) VALUES (11, 5);

INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (1, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (1, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (1, 4);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (2, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (2, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (3, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (3, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (3, 4);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (4, 3);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (5, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (5, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (5, 3);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (6, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (6, 4);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (7, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (7, 2);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (8, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (8, 4);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (9, 3);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (9, 5);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (10, 1);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (10, 3);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (10, 4);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (11, 6);
INSERT INTO Opp_Eligible_Program (opp_id, program_id) VALUES (11, 1);

INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (1, 2);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (2, 3);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (3, 1);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (7, 1);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (8, 2);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (8, 3);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (9, 7);
INSERT INTO Opp_Prereq_Course (opp_id, course_id) VALUES (11, 11);

INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (1, 1);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (1, 5);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (2, 2);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (3, 1);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (5, 1);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (6, 4);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (8, 3);
INSERT INTO Opp_Skill (opp_id, skill_id) VALUES (11, 4);

INSERT INTO Thesis_Topic (opp_id, expected_outcomes, funding_info, travel_info, accommodation_info, provider_id, supervisor_id, co_supervisor_id) VALUES (1, 'A trained segmentation model and a written thesis', 'Funded by a joint research grant', 'Optional visit to the partner lab', 'Student residence available', 9, 9, 13);
INSERT INTO Thesis_Topic (opp_id, expected_outcomes, funding_info, travel_info, accommodation_info, provider_id, supervisor_id, co_supervisor_id) VALUES (2, 'A prototype graph database and a thesis', 'No funding', 'No travel required', 'Not applicable', 10, 10, 16);
INSERT INTO Thesis_Topic (opp_id, expected_outcomes, funding_info, travel_info, accommodation_info, provider_id, supervisor_id, co_supervisor_id) VALUES (3, 'A working chatbot prototype for the company', 'Monthly stipend from the company', 'Travel to company office in Cairo', 'Not provided', 17, 11, NULL);
INSERT INTO Thesis_Topic (opp_id, expected_outcomes, funding_info, travel_info, accommodation_info, provider_id, supervisor_id, co_supervisor_id) VALUES (4, 'A navigation algorithm tested in simulation', 'Lab equipment provided', 'Not required', 'Not applicable', 11, 11, 14);
INSERT INTO Thesis_Topic (opp_id, expected_outcomes, funding_info, travel_info, accommodation_info, provider_id, supervisor_id, co_supervisor_id) VALUES (11, 'An optimization model and a thesis', 'Partial funding', 'Remote meetings', 'Not applicable', 13, 12, NULL);

INSERT INTO Thesis_Area (opp_id, area_id) VALUES (1, 1);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (1, 6);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (2, 3);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (2, 5);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (3, 2);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (3, 1);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (4, 7);
INSERT INTO Thesis_Area (opp_id, area_id) VALUES (11, 8);

INSERT INTO Short_Program (opp_id, duration, location, hosting_arrangements, host_uni_id) VALUES (5, '2 weeks', 'Berlin', 'Accommodation in a student residence', 2);
INSERT INTO Short_Program (opp_id, duration, location, hosting_arrangements, host_uni_id) VALUES (6, '4 weeks', 'Online', 'Virtual classroom access', 5);

INSERT INTO Mobility_Program (opp_id, mobility_type, duration, sending_uni_id, host_uni_id) VALUES (7, 'Exchange', '1 semester', 1, 2);
INSERT INTO Mobility_Program (opp_id, mobility_type, duration, sending_uni_id, host_uni_id) VALUES (8, 'Double Degree', '2 years', 1, 3);
INSERT INTO Mobility_Program (opp_id, mobility_type, duration, sending_uni_id, host_uni_id) VALUES (9, 'Exchange', '1 semester', 1, 6);
INSERT INTO Mobility_Program (opp_id, mobility_type, duration, sending_uni_id, host_uni_id) VALUES (10, 'Exchange', '1 semester', 1, 2);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-05', 'Accepted', '2026-10-15', 'Interested in medical imaging', 2, 1);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-08', 'Pending', NULL, 'Experience with Python', 1, 1);



INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-20', 'Accepted', '2026-10-25', 'Interested in data analysis', 3, 2);


INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-22', 'Pending', NULL, 'Interested in NLP', 6, 3);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-06-01', 'Accepted', '2026-06-20', 'Robotics enthusiast', 4, 4);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-05', 'Accepted', '2026-10-12', 'Want to learn about AI', 5, 5);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-12', 'Accepted', '2026-10-18', 'Data science focus', 3, 6);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-20', 'Pending', NULL, 'Wants to improve data skills', 6, 6);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-04-02', 'Accepted', '2026-04-20', 'Wants to study abroad', 1, 7);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-04-03', 'Accepted', '2026-04-20', 'Excited for Berlin', 2, 7);



INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-04-04', 'Accepted', '2026-04-22', 'Cultural exchange', 5, 7);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-04-05', 'Rejected', '2026-04-25', 'Missing prerequisite', 3, 7);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-10', 'Pending', NULL, 'Interested in double degree', 2, 8);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-12', 'Withdrawn', NULL, 'Changed plans', 6, 8);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-20', 'Pending', NULL, 'Mechatronics exchange', 4, 9);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2025-04-10', 'Accepted', '2025-04-25', 'Exchange semester', 4, 10);

INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2025-04-12', 'Accepted', '2025-04-25', 'Exchange semester', 6, 10);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-28', 'Pending', NULL, 'Interested in logistics', 8, 11);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-10', 'Rejected', '2026-10-20', 'Missing course', 3, 1);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-25', 'Pending', NULL, 'Database interest', 1, 2);
INSERT INTO Application (app_date, status, decision_date, info, student_id, opp_id) VALUES ('2026-10-29', 'Pending', NULL, 'Optimization interest', 2, 11);

INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (1, 'CV', 'docs/app1_cv.pdf', '2026-10-05');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (1, 'Transcript', 'docs/app1_transcript.pdf', '2026-10-05');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (2, 'CV', 'docs/app2_cv.pdf', '2026-10-08');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (3, 'CV', 'docs/app3_cv.pdf', '2026-10-20');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (3, 'Motivation Letter', 'docs/app3_letter.pdf', '2026-10-20');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (4, 'CV', 'docs/app4_cv.pdf', '2026-10-22');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (9, 'CV', 'docs/app9_cv.pdf', '2026-04-02');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (9, 'Transcript', 'docs/app9_transcript.pdf', '2026-04-02');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (10, 'CV', 'docs/app10_cv.pdf', '2026-04-03');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (13, 'CV', 'docs/app13_cv.pdf', '2026-10-10');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (13, 'Motivation Letter', 'docs/app13_letter.pdf', '2026-10-10');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (15, 'Transcript', 'docs/app15_transcript.pdf', '2026-10-20');
INSERT INTO Application_Document (app_id, doc_type, file_ref, upload_date) VALUES (18, 'CV', 'docs/app18_cv.pdf', '2026-10-28');

INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-10-12', '10:00:00', 'Online', 'Passed', 'Strong imaging background', 1);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-11-12', '14:00:00', 'On-site', NULL, NULL, 2);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-10-22', '11:30:00', 'Online', 'Passed', 'Good fit for the topic', 3);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-04-10', '09:30:00', 'Online', 'Passed', 'Motivated candidate', 9);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-04-11', '13:00:00', 'Online', 'Passed', 'Strong candidate', 10);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-11-15', '10:00:00', 'Hybrid', NULL, NULL, 4);
INSERT INTO Interview ([date], [time], location_mode, outcome, notes, app_id) VALUES ('2026-10-18', '15:00:00', 'Online', 'Failed', 'Lacks prerequisite knowledge', 19);

INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (1, 1);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (4, 1);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (2, 2);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (1, 3);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (1, 4);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (2, 5);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (3, 6);
INSERT INTO Conducts_Interview (interviewer_id, interview_id) VALUES (2, 7);


INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Active', '2026-09-15', '2027-02-15', 9);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Active', '2026-09-15', '2027-02-15', 10);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Active', '2026-09-15', '2027-02-15', 11);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Completed', '2025-09-15', '2026-01-31', 16);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Completed', '2025-09-15', '2026-01-31', 17);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Planned', '2027-07-05', '2027-07-19', 6);
INSERT INTO Participation (status, start_date, end_date, app_id) VALUES ('Planned', '2027-01-20', '2027-02-17', 7);

INSERT INTO Mobility (part_id, pre_travel_status, during_status, post_status, final_outcome, host_uni_id) VALUES (1, 'Visa approved', 'Currently studying', 'Not started', NULL, 2);
INSERT INTO Mobility (part_id, pre_travel_status, during_status, post_status, final_outcome, host_uni_id) VALUES (2, 'Flights booked', 'Currently studying', 'Not started', NULL, 2);
INSERT INTO Mobility (part_id, pre_travel_status, during_status, post_status, final_outcome, host_uni_id) VALUES (3, 'Visa approved', 'Currently studying', 'Not started', NULL, 2);
INSERT INTO Mobility (part_id, pre_travel_status, during_status, post_status, final_outcome, host_uni_id) VALUES (4, 'Completed', 'Completed', 'Completed', 'Successfully completed the exchange semester', 2);
INSERT INTO Mobility (part_id, pre_travel_status, during_status, post_status, final_outcome, host_uni_id) VALUES (5, 'Completed', 'Completed', 'Completed', 'Completed with transferred credits', 2);

INSERT INTO Program_Participation (part_id, payment_status, visa_status, travel_status) VALUES (6, 'Paid', 'Pending', 'Not booked');
INSERT INTO Program_Participation (part_id, payment_status, visa_status, travel_status) VALUES (7, 'Pending', 'Not required', 'Not booked');

INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (1, 'Database Implementation', 6.0, 6.0, 'Pending', 3);
INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (4, 'Advanced Machine Learning', 6.0, 6.0, 'Approved', 4);
INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (4, 'Distributed Systems', 5.0, 5.0, 'Approved', 12);
INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (4, 'Software Engineering Lab', 6.0, 6.0, 'Pending', 3);
INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (5, 'Algorithms and Data Structures II', 6.0, 6.0, 'Approved', 9);
INSERT INTO Course_Equivalency (part_id, host_course_title, host_credits, transferred_credits, approval_status, giu_course_id) VALUES (5, 'Research Methods', 4.0, 3.0, 'Pending', 9);

INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, follow_up_report, partner_prof_id, host_faculty_id, coordinator_id, agreement_id) VALUES ('2026-09-20', '2026-09-24', 'Guest lectures on machine learning', 'Flight booked', 'Hotel near campus', 'Completed', 'Visit completed and a joint workshop was held', 13, 1, 9, 1);
INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, follow_up_report, partner_prof_id, host_faculty_id, coordinator_id, agreement_id) VALUES ('2026-11-16', '2026-11-20', 'Research collaboration workshop', 'Flight to be booked', 'University guesthouse', 'Planned', NULL, 14, 2, 9, 3);
INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, follow_up_report, partner_prof_id, host_faculty_id, coordinator_id, agreement_id) VALUES ('2026-12-07', '2026-12-11', 'Joint supervision meetings', 'Flight booked', 'Hotel booked', 'Confirmed', NULL, 16, 1, 11, 4);
INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, follow_up_report, partner_prof_id, host_faculty_id, coordinator_id, agreement_id) VALUES ('2026-11-30', '2026-12-02', 'Data science seminar', 'Train', 'University guesthouse', 'Requested', NULL, 15, 1, 10, 5);
INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, follow_up_report, partner_prof_id, host_faculty_id, coordinator_id, agreement_id) VALUES ('2026-05-10', '2026-05-13', 'Curriculum alignment visit', 'Flight booked', 'Hotel booked', 'Cancelled', NULL, 13, 2, 9, 1);

INSERT INTO Visit_Outcome (visit_id, outcome) VALUES (1, 'Joint workshop organised');
INSERT INTO Visit_Outcome (visit_id, outcome) VALUES (1, 'Agreed on two thesis co-supervisions');
INSERT INTO Visit_Outcome (visit_id, outcome) VALUES (1, 'Draft proposal for a research project');

INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (1, 1, 'Lecture', 'Introduction to Deep Learning', '2026-09-21T10:00:00', 'Building A Hall 1', 'Students');
INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (1, 2, 'Meeting', 'Meeting with Department Heads', '2026-09-22T11:00:00', 'Meeting Room 3', 'Faculty');
INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (1, 3, 'Workshop', 'Joint Research Workshop', '2026-09-23T14:00:00', 'Lab 2', 'Researchers');
INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (2, 1, 'Seminar', 'Computer Vision Seminar', '2026-11-17T10:00:00', 'Hall B', 'Students');
INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (2, 2, 'Meeting', 'Research Planning Meeting', '2026-11-18T13:00:00', 'Meeting Room 1', 'Researchers');
INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience) VALUES (3, 1, 'Meeting', 'Thesis Supervision Meeting', '2026-12-08T09:00:00', 'Office 204', 'Supervisors');

INSERT INTO Research_Project (title, description, status, start_date, end_date, res_agreement_id) VALUES ('AI for Medical Imaging', 'Joint research on deep learning for medical images', 'Active', '2025-06-01', '2027-02-28', 4);
INSERT INTO Research_Project (title, description, status, start_date, end_date, res_agreement_id) VALUES ('Big Data Analytics for Smart Cities', 'Analysis of urban data streams', 'Active', '2026-02-01', '2026-11-30', 5);
INSERT INTO Research_Project (title, description, status, start_date, end_date, res_agreement_id) VALUES ('Federated Learning for Privacy', 'Privacy preserving model training', 'Planned', '2026-12-01', '2027-02-28', 4);

INSERT INTO Project_Deadline (project_id, deadline) VALUES (1, '2026-11-20');
INSERT INTO Project_Deadline (project_id, deadline) VALUES (1, '2026-12-15');
INSERT INTO Project_Deadline (project_id, deadline) VALUES (2, '2026-11-10');
INSERT INTO Project_Deadline (project_id, deadline) VALUES (2, '2026-11-25');
INSERT INTO Project_Deadline (project_id, deadline) VALUES (3, '2027-01-15');

INSERT INTO Project_Area (project_id, area_id) VALUES (1, 1);
INSERT INTO Project_Area (project_id, area_id) VALUES (1, 6);
INSERT INTO Project_Area (project_id, area_id) VALUES (2, 3);
INSERT INTO Project_Area (project_id, area_id) VALUES (2, 5);
INSERT INTO Project_Area (project_id, area_id) VALUES (3, 1);
INSERT INTO Project_Area (project_id, area_id) VALUES (3, 2);

INSERT INTO GIU_Participates (academic_id, project_id, role) VALUES (9, 1, 'Principal Investigator');
INSERT INTO GIU_Participates (academic_id, project_id, role) VALUES (11, 1, 'Researcher');
INSERT INTO GIU_Participates (academic_id, project_id, role) VALUES (10, 2, 'Principal Investigator');
INSERT INTO GIU_Participates (academic_id, project_id, role) VALUES (9, 2, 'Co-Investigator');
INSERT INTO GIU_Participates (academic_id, project_id, role) VALUES (11, 3, 'Principal Investigator');

INSERT INTO PP_Participates (partner_prof_id, project_id, role) VALUES (13, 1, 'Co-Investigator');
INSERT INTO PP_Participates (partner_prof_id, project_id, role) VALUES (14, 1, 'Researcher');
INSERT INTO PP_Participates (partner_prof_id, project_id, role) VALUES (15, 2, 'Co-Investigator');
INSERT INTO PP_Participates (partner_prof_id, project_id, role) VALUES (16, 3, 'Researcher');

INSERT INTO Research_Output ([type], title, [date], [reference], status, project_id) VALUES ('Publication', 'Segmentation of Liver CT with Transformers', '2026-03-15', 'DOI:10.0000/giu.2026.001', 'Published', 1);
INSERT INTO Research_Output ([type], title, [date], [reference], status, project_id) VALUES ('Dataset', 'Annotated CT Scan Dataset v1', '2026-05-20', 'repo/datasets/ct_v1', 'Released', 1);
INSERT INTO Research_Output ([type], title, [date], [reference], status, project_id) VALUES ('Report', 'Annual Progress Report 2025', '2026-01-10', 'reports/progress_2025.pdf', 'Submitted', 1);
INSERT INTO Research_Output ([type], title, [date], [reference], status, project_id) VALUES ('Deliverable', 'Smart City Data Pipeline', '2026-08-30', 'repo/pipeline_v1', 'Completed', 2);
INSERT INTO Research_Output ([type], title, [date], [reference], status, project_id) VALUES ('Publication', 'Urban Traffic Analytics Using Spark', '2026-10-01', 'DOI:10.0000/giu.2026.002', 'Under Review', 2);

INSERT INTO Funding_Opportunity (name, agency, [type], amount, deadline, eligibility_conditions, status) VALUES ('DAAD Exchange Scholarship', 'DAAD', 'Scholarship', 10000.00, '2026-12-15', 'Open to students with GPA above 3.0', 'Open');
INSERT INTO Funding_Opportunity (name, agency, [type], amount, deadline, eligibility_conditions, status) VALUES ('Erasmus Mobility Grant', 'European Commission', 'Grant', 8000.00, '2027-01-31', 'Students of partner universities', 'Open');
INSERT INTO Funding_Opportunity (name, agency, [type], amount, deadline, eligibility_conditions, status) VALUES ('Horizon Research Grant', 'European Research Council', 'Research Grant', 500000.00, '2027-03-01', 'Joint research with an EU partner', 'Open');
INSERT INTO Funding_Opportunity (name, agency, [type], amount, deadline, eligibility_conditions, status) VALUES ('GIU Travel Fund', 'GIU', 'Scholarship', 2000.00, '2026-09-01', 'Currently enrolled GIU students', 'Closed');

INSERT INTO Project_Targets_Fund (project_id, fund_id) VALUES (1, 3);
INSERT INTO Project_Targets_Fund (project_id, fund_id) VALUES (2, 3);
INSERT INTO Project_Targets_Fund (project_id, fund_id) VALUES (3, 3);

INSERT INTO Fund_Supports_Mobility (fund_id, part_id) VALUES (1, 1);
INSERT INTO Fund_Supports_Mobility (fund_id, part_id) VALUES (1, 2);
INSERT INTO Fund_Supports_Mobility (fund_id, part_id) VALUES (2, 3);
INSERT INTO Fund_Supports_Mobility (fund_id, part_id) VALUES (4, 4);
INSERT INTO Fund_Supports_Mobility (fund_id, part_id) VALUES (4, 5);
