USE GIU_Germany_Connect;
GO

CREATE FUNCTION ViewPersonInfo(
    @person_id int
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        P.person_id,
        P.full_name,
        P.email,
        P.phone,
        P.account_status,
        
        CASE
            WHEN S.person_id IS NOT NULL THEN 'Student'
            WHEN GA.person_id IS NOT NULL THEN 'GIU Academic'
            WHEN PP.person_id IS NOT NULL THEN 'Partner Professor'
            WHEN CR.person_id IS NOT NULL THEN 'Company Representative'
            WHEN I.person_id IS NOT NULL THEN 'Interviewer'
            WHEN TP.person_id IS NOT NULL THEN 'Topic Provider'
            ELSE 'Unknown'
        END AS person_role,

        S.student_no,
        S.current_semester,
        S.gpa,
        S.language_level,
        S.program_id,

        GA.academic_rank,
        GA.dept_id,

        PP.title,
        PP.pdept_id,

        CR.company_name,
        CR.sector,
        CR.position,
        CR.location,

        I.interviewer_id,
        I.role AS interviewer_role,

        TP.person_id AS topic_provider_id

    FROM Person P
    LEFT JOIN Student S
        ON P.person_id = S.person_id
    LEFT JOIN GIU_Academic GA
        ON P.person_id = GA.person_id
    LEFT JOIN Partner_Professor PP
        ON P.person_id = PP.person_id
    LEFT JOIN Company_Rep CR
        ON P.person_id = CR.person_id
    LEFT JOIN Interviewer I
        ON P.person_id = I.person_id
    LEFT JOIN Topic_Provider TP
        ON P.person_id = TP.person_id

    WHERE P.person_id = @person_id
);

GO

CREATE PROCEDURE AddStudent(@full_name varchar(150), @email varchar(150), @phone varchar(30), @student_no
varchar(20), @current_semester int, @gpa decimal(3,2), @language_level varchar(30), @cv
varchar(300), @program_id int)
AS
BEGIN
DECLARE @person_id int;
INSERT INTO PERSON(full_name, email, phone, account_status) VALUES (@full_name, @email, @phone, 'Active');
SET @person_id = (Select max(person_id) from Person);
INSERT INTO Student (person_id, student_no, current_semester, gpa, language_level, cv, program_id)
    VALUES (@person_id, @student_no, @current_semester, @gpa, @language_level, @cv, @program_id);
    PRINT 'Student Created';
    end;

GO

CREATE PROCEDURE AddGIUAcademic(@full_name varchar(150), @email varchar(150), @phone varchar(30), @academic_rank varchar(50), @dept_id int)
AS
BEGIN
DECLARE @person_id int;
INSERT INTO PERSON(full_name, email, phone, account_status) VALUES (@full_name,@email,@phone,'Active');
SET @person_id = (Select max(person_id) from Person);
INSERT INTO GIU_Academic(person_id,academic_rank, dept_id) VALUES(@person_id,@academic_rank,@dept_id);
PRINT 'GIU ACADEMIC Created';
end;
GO

CREATE PROCEDURE AddPartnerProfessor(@full_name varchar(150), @email varchar(150), @phone varchar(30), @title varchar(50), @pdept_id int)
AS
BEGIN
  DECLARE @person_id int;  
  INSERT INTO PERSON(full_name, email, phone, account_status) VALUES (@full_name,@email,@phone,'Active');
  INSERT INTO Partner_Professor(person_id, title, pdept_id) VALUES(@person_id,@title,@pdept_id);
  SET @person_id = (Select max(person_id) from Person);
  PRINT 'GIU Academic Created';
end;
GO

CREATE PROCEDURE AddCompanyRep(@full_name varchar(150),
@email varchar(150), @phone varchar(30), @company_name varchar(150), 
@sector varchar(100), @position varchar(100), @location varchar(100))
AS
BEGIN
 DECLARE @person_id int;  
  INSERT INTO PERSON(full_name, email, phone, account_status) VALUES (@full_name,@email,@phone,'Active');
  INSERT INTO Company_Rep(person_id, company_name, sector, position, location)
  VALUES(@person_id,@company_name,@sector,@position,@location);
  SET @person_id = (Select max(person_id) from Person);
  PRINT 'Company Rep. Created';
end;
GO


CREATE PROCEDURE UpdatePersonContact(@person_id int, @email varchar(150)
, @phone varchar(30)) 
AS
BEGIN
UPDATE Person
    SET email = @email, phone = @phone
    WHERE person_id = @person_id;
 PRINT 'Contact details updated successfully.'  
end;
GO

CREATE PROCEDURE UpdateAccountStatus(@person_id int, @account_status varchar(20))
AS
BEGIN
UPDATE Person SET account_status = @account_status where person_id = @person_id;
PRINT 'Account is '+@account_status;
end;
GO

CREATE PROCEDURE RegisterTopicProvider(@person_id int)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Topic_Provider WHERE person_id = @person_id)
    BEGIN
        INSERT INTO Topic_Provider(person_id) VALUES (@person_id);
        PRINT 'User Registered';
    END
    ELSE
    BEGIN
        SELECT 'User Already Registered';
    END
end;
GO
CREATE PROCEDURE RegisterInterviewer(@person_id int, @role varchar(100))
AS
BEGIN
DECLARE @interviewer_id int;

IF NOT EXISTS(SELECT 1 FROM Interviewer WHERE person_id = @person_id)
BEGIN
    INSERT INTO Interviewer(person_id,role) VALUES(@person_id,@role);
     PRINT 'Interviewer registered successfully';
END
ELSE
    BEGIN
        PRINT 'User is already registered as an interviewer';
    END
end;
GO
CREATE PROCEDURE AddFaculty(@name varchar(150), @description varchar(500))
AS
BEGIN
    Insert INTO Faculty(name,description) VALUES (@name,@description);
    PRINT 'Faculty Added';
END;
GO
CREATE PROCEDURE AddDepartment(@name varchar(150), @description varchar(500),
@faculty_id int)
AS
BEGIN
    DECLARE @dept_id int;
    INSERT INTO Department (name, description, faculty_id)
    VALUES (@name, @description, @faculty_id);
    PRINT 'Department Created';
end;
GO
CREATE PROCEDURE AddProgram
    @name varchar(150),
    @degree_level varchar(30),
    @total_credit_hours int,
    @description varchar(500),
    @dept_id int
AS
BEGIN
   
    INSERT INTO Program (name, degree_level, total_credit_hours, description, dept_id)
    VALUES (@name, @degree_level, @total_credit_hours, @description, @dept_id);
    PRINT 'Program Created';
END;
GO
CREATE PROCEDURE ClassifyProgram( @program_id int,@field_id int)
AS
BEGIN
    INSERT INTO Program_Field (program_id, field_id)
    VALUES (@program_id, @field_id);
    
    PRINT 'Program classified successfully.' ;
END;
GO

CREATE PROCEDURE AddCourse(@code varchar(20),
    @title varchar(150),
    @credit_hours int,
    @level int,
    @program_id int)
AS
BEGIN
    
    INSERT INTO Course (code, title, credit_hours, level, program_id)
    VALUES (@code, @title, @credit_hours, @level, @program_id);
    
   
    PRINT'Course added successfully.';
END;
GO

CREATE PROCEDURE AddPrerequisite(@course_id int,
    @prereq_course_id int)
AS
BEGIN
    INSERT INTO Prerequisite (course_id, prereq_course_id)
    VALUES (@course_id, @prereq_course_id);
    
    PRINT 'Prerequisite added successfully.';
END;
GO


CREATE PROCEDURE AddField(@name varchar(100),
    @description varchar(500))
AS
BEGIN
    
    INSERT INTO Field (name, description)
    VALUES (@name, @description);
    
   
    PRINT 'Field added successfully.';
END;
GO

CREATE PROCEDURE AddResearchArea (@name varchar(150),@description varchar(500),@field_id int)
AS
BEGIN
    
    INSERT INTO Research_Area (name, description, field_id)
    VALUES (@name, @description, @field_id);
    PRINT 'Research Area added successfully.';
END;
GO

CREATE PROCEDURE AddSkill(@name varchar(100),@category varchar(50),@description varchar(500))
AS
BEGIN
    
    INSERT INTO Skill (name, category, description)
    VALUES (@name, @category, @description);
    PRINT 'Skill added successfully.';
END;
GO


CREATE PROCEDURE AddPartnerUniversity
    (@name varchar(150),
    @country varchar(60),
    @city varchar(60),
    @description varchar(500),
    @partnership_status varchar(30),
    @contact_info varchar(300))
AS
BEGIN
    DECLARE @uni_id int;
    
    INSERT INTO University (name, country, city, description)
    VALUES (@name, @country, @city, @description);
    
    SET @uni_id = (select max(uni_id) from University);
    
    INSERT INTO Partner_University (uni_id, partnership_status, contact_info)
    VALUES (@uni_id, @partnership_status, @contact_info);
    
    PRINT 'Partner University added successfully.';
END;
GO

CREATE PROCEDURE AddPartnerDepartment
    (@name varchar(150),
    @description varchar(500),
    @partner_uni_id int)
AS
BEGIN
   
    INSERT INTO Partner_Department (name, description, partner_uni_id)
    VALUES (@name, @description, @partner_uni_id);
    
   PRINT 'Partner Department added successfully.' ;
END;
GO

CREATE PROCEDURE AddPartnerProgram
   ( @name varchar(150),
    @degree_level varchar(30),
    @description varchar(500),
    @pdept_id int,
    @field_id int)
AS
BEGIN
    DECLARE @pprog_id int;
    
    INSERT INTO Partner_Program (name, degree_level, description, pdept_id)
    VALUES (@name, @degree_level, @description, @pdept_id);
    
    SET @pprog_id = (SELECT max(pprog_id) from Partner_Program);
    
    INSERT INTO Partner_Program_Field (pprog_id, field_id)
    VALUES (@pprog_id, @field_id);
    
   PRINT 'Partner Program added and classified successfully.';
END;
GO

CREATE FUNCTION GetUserStatsByRole()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        RoleName AS Role, 
        COUNT(person_id) AS NumberOfPersons,
        SUM(CASE WHEN account_status = 'Active' THEN 1 
        ELSE 0 
        END) AS ActiveAccounts
    FROM (
        SELECT 'Student' AS RoleName, P.person_id, P.account_status FROM Person P INNER JOIN Student S ON P.person_id = S.person_id
        UNION ALL

        SELECT 'GIU Academic', P.person_id , P.account_status FROM Person P INNER JOIN GIU_Academic G ON P.person_id = G.person_id
        UNION ALL
        SELECT 'Partner Professor', P.person_id, P.account_status FROM Person P INNER JOIN Partner_Professor PP ON P.person_id = PP.person_id
        UNION ALL
        SELECT 'Company Representative' , P.person_id, P.account_status FROM Person P INNER JOIN Company_Rep CR ON P.person_id = CR.person_id
        UNION ALL
        SELECT 'Interviewer', P.person_id , P.account_status FROM Person P INNER JOIN Interviewer I ON P.person_id = I.person_id
        UNION ALL
        SELECT 'Topic Provider'  , P.person_id, P.account_status FROM Person P INNER JOIN Topic_Provider TP ON P.person_id = TP.person_id
    ) AS UserRoles
    GROUP BY RoleName
);
GO

CREATE PROCEDURE SendNotification
    (@recipient_id int,
    @message varchar(500),
    @category varchar(30),
    @urgency varchar(20))
AS
BEGIN
    
    INSERT INTO Notification (message, timestamp, category, urgency, read_status, recipient_id)
    VALUES (@message, GETDATE(), @category, @urgency, 0, @recipient_id);
    
    PRINT 'Notification sent successfully.' ;
END;
GO

-- // 2. (GIU ACADEMIC)

CREATE PROCEDURE CreateMobilityAgreement (@title varchar(200), @scope varchar(500), @start_date date, @end_date date,
    @partner_uni_id int, @coordinator_id int, @exchange_terms varchar(500),
    @double_degree_terms varchar(500), @seat_quota int, @tuition_arrangement varchar(300))
AS
BEGIN
    DECLARE @agreement_id int;
    INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id)
    VALUES (@title, @scope, @start_date, @end_date, 'Active', @partner_uni_id, @coordinator_id);
    
    SET @agreement_id = (SELECT max(agreement_id) from Cooperation_Agreement);
    
    INSERT INTO Mobility_Agreement (agreement_id, exchange_terms, double_degree_terms, seat_quota, tuition_arrangement)
    VALUES (@agreement_id, @exchange_terms, @double_degree_terms, @seat_quota, @tuition_arrangement);
    
   PRINT 'Mobility Agreement created successfully.';
END;
GO

CREATE PROCEDURE CreateResearchAgreement(@title varchar(200), @scope varchar(500), @start_date date, @end_date date,
    @partner_uni_id int, @coordinator_id int, @ip_terms varchar(500), @funding_framework varchar(300))
AS
BEGIN
    DECLARE @agreement_id int;
    INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id)
    VALUES (@title, @scope, @start_date, @end_date, 'Active', @partner_uni_id, @coordinator_id);
    
    SET @agreement_id = (SELECT max(agreement_id) from Cooperation_Agreement);
    
    INSERT INTO Research_Agreement (agreement_id, ip_terms, funding_framework)
    VALUES (@agreement_id, @ip_terms, @funding_framework);
    
    PRINT 'Research Agreement created successfully.';
END;
GO
CREATE PROCEDURE CreateGeneralMoU(@title varchar(200), @scope varchar(500), @start_date date, @end_date date,
    @partner_uni_id int, @coordinator_id int, @intent varchar(500), @collab_scope varchar(500), @renewal_terms varchar(300))
AS
BEGIN
    DECLARE @agreement_id int;
    INSERT INTO Cooperation_Agreement (title, scope, start_date, end_date, status, partner_uni_id, coordinator_id)
    VALUES (@title, @scope, @start_date, @end_date, 'Active', @partner_uni_id, @coordinator_id);
 
    SET @agreement_id = (SELECT max(agreement_id) from Cooperation_Agreement);
    INSERT INTO General_MoU (agreement_id, intent, collab_scope, renewal_terms)
    VALUES (@agreement_id, @intent, @collab_scope, @renewal_terms);
    
    PRINT 'General MoU created successfully.';
END;
GO

CREATE PROCEDURE AddAgreementProgram(@agreement_id int, @program_id int)
AS
BEGIN
    INSERT INTO Mob_Agr_Program (agreement_id, program_id)
     VALUES (@agreement_id, @program_id);
    PRINT 'Program added to agreement successfully.';
END;
GO

CREATE PROCEDURE AddAgreementSemester (@agreement_id int, @semester varchar(30))
AS
BEGIN
    INSERT INTO Mob_Agr_Semester (agreement_id, semester)
    VALUES (@agreement_id, @semester);
    PRINT 'Semester added to agreement successfully.';
END;
GO

CREATE PROCEDURE AddAgreementResearchArea(@agreement_id int,@area_id int)
AS
BEGIN
    INSERT INTO Res_Agr_Area (agreement_id, area_id)
    VALUES (@agreement_id, @area_id);
    PRINT 'Research area added to agreement successfully.';
END;
GO


CREATE PROCEDURE UpdateAgreementStatus(@agreement_id int,@status varchar(30))
AS
BEGIN
    UPDATE Cooperation_Agreement SET status = @status
    WHERE agreement_id = @agreement_id;
    PRINT 'Agreement status updated successfully.';
END;
GO

-- Check Before Submission
CREATE FUNCTION GetExpiringAgreements(@days_ahead int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        CA.title AS Agreement,
        U.name AS PartnerUniversity,
        CASE 
            WHEN MA.agreement_id IS NOT NULL THEN 'Mobility'
            WHEN RA.agreement_id IS NOT NULL THEN 'Research'
            WHEN GM.agreement_id IS NOT NULL THEN 'General MoU'
        END AS Type,
        CA.end_date AS EndDate,
        CA.end_date - GETDATE() AS DaysRemaining
    FROM Cooperation_Agreement CA
    JOIN University U ON CA.partner_uni_id = U.uni_id
    LEFT JOIN Mobility_Agreement MA ON CA.agreement_id = MA.agreement_id
    LEFT JOIN Research_Agreement RA ON CA.agreement_id = RA.agreement_id
    LEFT JOIN General_MoU GM ON CA.agreement_id = GM.agreement_id
    WHERE  CA.end_date-GETDATE() BETWEEN 0 AND @days_ahead
);
GO

-- 9) View the complete cooperation history with a partner university
CREATE FUNCTION ViewPartnerHistory(@partner_uni_id int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        'Agreement' AS Type, CA.title AS Title, CA.start_date AS StartDate, CA.end_date AS EndDate, CA.status AS Status
    FROM Cooperation_Agreement CA WHERE CA.partner_uni_id = @partner_uni_id
    UNION ALL
    SELECT 
        'Opportunity', O.title, O.app_open_date, O.app_close_date, O.status
    FROM Opportunity O INNER JOIN Cooperation_Agreement CA ON O.agreement_id = CA.agreement_id
    WHERE CA.partner_uni_id = @partner_uni_id
    UNION ALL
    SELECT 
        'Professor Visit', V.purpose, V.start_date, V.end_date, V.status
    FROM Professor_Visit V 
    INNER JOIN Partner_Professor PP ON V.partner_prof_id = PP.person_id
    INNER JOIN Partner_Department PD ON PP.pdept_id = PD.pdept_id
    WHERE PD.partner_uni_id = @partner_uni_id
    UNION ALL
    SELECT 
        'Research Project', RP.title, RP.start_date, RP.end_date, RP.status
    FROM Research_Project RP 
    INNER JOIN Research_Agreement RA ON RP.res_agreement_id = RA.agreement_id
    INNER JOIN Cooperation_Agreement CA ON RA.agreement_id = CA.agreement_id
    WHERE CA.partner_uni_id = @partner_uni_id
);
GO

CREATE FUNCTION GetAgreementSeatUsage(@agreement_id int)
RETURNS decimal(5,2)
AS
BEGIN
    DECLARE @quota int;
    DECLARE @used int;
    DECLARE @usage decimal(5,2);

    SELECT @quota = seat_quota 
    FROM Mobility_Agreement 
    WHERE agreement_id = @agreement_id;

    IF @quota IS NULL OR @quota = 0
        RETURN 0.00;

    SELECT @used = COUNT(A.app_id)
    FROM Opportunity O
    JOIN Application A ON O.opp_id = A.opp_id
    WHERE O.agreement_id = @agreement_id AND A.status = 'Accepted';

    SET @usage = (@used*100.00) / @quota;
    
    RETURN @usage;
END;
GO

CREATE PROCEDURE ScheduleProfessorVisit(@partner_prof_id int, @host_faculty_id int, @coordinator_id int, 
    @agreement_id int, @start_date date, @end_date date, 
    @purpose varchar(300), @travel_arr varchar(300), @accommodation_arr varchar(300))
AS
BEGIN
    INSERT INTO Professor_Visit (start_date, end_date, purpose, travel_arr, accommodation_arr, status, partner_prof_id, host_faculty_id, coordinator_id, agreement_id)
    VALUES (@start_date, @end_date, @purpose, @travel_arr, @accommodation_arr, 'Scheduled', @partner_prof_id, @host_faculty_id, @coordinator_id, @agreement_id);
    
    PRINT 'Visit scheduled successfully.';
END;
GO

CREATE PROCEDURE AddAgendaItem(@visit_id int, @activity_type varchar(30), @title varchar(200),
    @date_time datetime, @location varchar(100), @audience varchar(100))
AS
BEGIN
    DECLARE @seq_no int;
    SELECT @seq_no = ISNULL(MAX(seq_no), 0) + 1 FROM Agenda_Item WHERE visit_id = @visit_id;
    
    INSERT INTO Agenda_Item (visit_id, seq_no, activity_type, title, date_time, location, audience)
    VALUES (@visit_id, @seq_no, @activity_type, @title, @date_time, @location, @audience);
    
    PRINT 'Agenda item added successfully.';
END;
GO

CREATE PROCEDURE NotifyVisitAgenda(@visit_id int)
AS
BEGIN
    DECLARE @partner_prof_id int, @coordinator_id int;
    SELECT @partner_prof_id = partner_prof_id, @coordinator_id = coordinator_id
    FROM Professor_Visit
    WHERE visit_id = @visit_id;
    
    INSERT INTO Notification (message, timestamp, category, urgency, read_status, recipient_id)
    VALUES ('Your visit agenda has been updated.', GETDATE(), 'Visit Agenda', 'Normal', 0, @partner_prof_id);
    
    INSERT INTO Notification (message, timestamp, category, urgency, read_status, recipient_id)
    VALUES ('The visit agenda you are coordinating has been updated.', GETDATE(), 'Visit Agenda', 'Normal', 0, @coordinator_id);
    
    PRINT 'Notifications sent successfully.';
END;
GO

CREATE PROCEDURE UpdateVisitStatus(@visit_id int,
    @status varchar(30))
AS
BEGIN
    UPDATE Professor_Visit
    SET status = @status
    WHERE visit_id = @visit_id;
    PRINT 'Visit status updated successfully.';
END;
GO

CREATE PROCEDURE CompleteProfessorVisit
    @visit_id int,
    @follow_up_report varchar(1000)
AS
BEGIN
    UPDATE Professor_Visit
    SET status = 'Completed', follow_up_report = @follow_up_report
    WHERE visit_id = @visit_id;
    PRINT 'Visit completed successfully.';
END;
GO

CREATE PROCEDURE AddVisitOutcome(@visit_id int,@outcome varchar(200))
AS
BEGIN
    INSERT INTO Visit_Outcome (visit_id, outcome)
    VALUES (@visit_id, @outcome);
    PRINT 'Visit outcome added successfully.';
END;
GO

CREATE FUNCTION ViewVisitsInPeriod(@start_date date, @end_date date)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        P.full_name AS Professor,
        U.name AS University,
        F.name AS HostFaculty,
        V.start_date,
        V.end_date,
        V.status,
        (SELECT COUNT(*) FROM Agenda_Item AI WHERE AI.visit_id = V.visit_id) AS NumberOfAgendaItems
    FROM Professor_Visit V
    INNER JOIN Person P ON V.partner_prof_id = P.person_id
    INNER JOIN Partner_Professor PP ON V.partner_prof_id = PP.person_id
    INNER JOIN Partner_Department PD ON PP.pdept_id = PD.pdept_id
    INNER JOIN University U ON PD.partner_uni_id = U.uni_id
    INNER JOIN Faculty F ON V.host_faculty_id = F.faculty_id
    WHERE V.start_date >= @start_date AND V.end_date <= @end_date
);
GO


CREATE FUNCTION GetFacultyDashboard(@faculty_id int)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        (SELECT COUNT(S.person_id) FROM Student S INNER JOIN Program P ON S.program_id = P.program_id INNER JOIN Department D ON P.dept_id = D.dept_id WHERE D.faculty_id = @faculty_id) AS NumberOfStudents,
        
        (SELECT COUNT(A.app_id) FROM Application A INNER JOIN Student S ON A.student_id = S.person_id INNER JOIN Program P ON S.program_id = P.program_id INNER JOIN Department D ON P.dept_id = D.dept_id WHERE D.faculty_id = @faculty_id) AS NumberOfApplications,
        
        (SELECT COUNT(A.app_id) FROM Application A INNER JOIN Student S ON A.student_id = S.person_id INNER JOIN Program P ON S.program_id = P.program_id INNER JOIN Department D ON P.dept_id = D.dept_id WHERE D.faculty_id = @faculty_id AND A.status = 'Accepted') AS AcceptedApplications,
        
        (SELECT COUNT(Part.part_id) FROM Participation Part INNER JOIN Application A ON Part.app_id = A.app_id INNER JOIN Student S ON A.student_id = S.person_id INNER JOIN Program P ON S.program_id = P.program_id INNER JOIN Department D ON P.dept_id = D.dept_id WHERE D.faculty_id = @faculty_id AND Part.status = 'Active') AS ActiveParticipations,
        
        (SELECT COUNT(V.visit_id) FROM Professor_Visit V WHERE V.host_faculty_id = @faculty_id) AS ProfessorVisits,
        
        (SELECT COUNT(DISTINCT RP.project_id) FROM Research_Project RP INNER JOIN GIU_Participates GP ON RP.project_id = GP.project_id INNER JOIN GIU_Academic GA ON GP.academic_id = GA.person_id INNER JOIN Department D ON GA.dept_id = D.dept_id WHERE D.faculty_id = @faculty_id) AS ResearchProjects
);
GO

CREATE FUNCTION GetPartner_Dashboard()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        U.name AS PartnerUniversity,
        (SELECT COUNT(*) FROM Cooperation_Agreement CA WHERE CA.partner_uni_id = PU.uni_id AND CA.status = 'Active') AS ActiveAgreements,
        
        (SELECT COUNT(*) FROM Opportunity O INNER JOIN Cooperation_Agreement CA ON O.agreement_id = CA.agreement_id WHERE CA.partner_uni_id = PU.uni_id) AS Opportunities,
        
        (SELECT COUNT(A.app_id) FROM Application A INNER JOIN Opportunity O ON A.opp_id = O.opp_id INNER JOIN Cooperation_Agreement CA ON O.agreement_id = CA.agreement_id WHERE CA.partner_uni_id = PU.uni_id AND A.status = 'Accepted') AS AcceptedStudents,
        
        (SELECT COUNT(*) FROM Professor_Visit V INNER JOIN Partner_Professor PP ON V.partner_prof_id = PP.person_id INNER JOIN Partner_Department PD ON PP.pdept_id = PD.pdept_id WHERE PD.partner_uni_id = PU.uni_id) AS Visits,
        
        (SELECT COUNT(*) FROM Research_Project RP INNER JOIN Research_Agreement RA ON RP.res_agreement_id = RA.agreement_id INNER JOIN Cooperation_Agreement CA ON RA.agreement_id = CA.agreement_id WHERE CA.partner_uni_id = PU.uni_id) AS ResearchProjects
    FROM Partner_University PU
   INNER JOIN University U ON PU.uni_id = U.uni_id
);
GO

CREATE FUNCTION GetTopPartners(@top_n int)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@top_n)
        U.name AS PartnerUniversity,
        COUNT(A.app_id) AS AcceptedStudents
    FROM Partner_University PU
    INNER JOIN University U ON PU.uni_id = U.uni_id
    INNER JOIN Cooperation_Agreement CA ON PU.uni_id = CA.partner_uni_id
    INNER JOIN Opportunity O ON CA.agreement_id = O.agreement_id
    INNER JOIN Application A ON O.opp_id = A.opp_id
    WHERE A.status = 'Accepted'
    GROUP BY U.name
    ORDER BY AcceptedStudents DESC
);
GO
-- UNKNOWN FUNCTIONS USED
CREATE FUNCTION RankPartners_By_Activity()
RETURNS TABLE
AS
RETURN
(
    WITH PartnerActivities AS (
        SELECT 
            U.name AS PartnerUniversity,
            (
                (SELECT COUNT(*) FROM Cooperation_Agreement CA WHERE CA.partner_uni_id = PU.uni_id) +
                (SELECT COUNT(*) FROM Opportunity O INNER JOIN Cooperation_Agreement CA ON O.agreement_id = CA.agreement_id WHERE CA.partner_uni_id = PU.uni_id) +
                (SELECT COUNT(*) FROM Professor_Visit V INNER JOIN Partner_Professor PP ON V.partner_prof_id = PP.person_id INNER JOIN Partner_Department PD ON PP.pdept_id = PD.pdept_id WHERE PD.partner_uni_id = PU.uni_id) +
                (SELECT COUNT(*) FROM Research_Project RP INNER JOIN Research_Agreement RA ON RP.res_agreement_id = RA.agreement_id INNER JOIN Cooperation_Agreement CA ON RA.agreement_id = CA.agreement_id WHERE CA.partner_uni_id = PU.uni_id)
            ) AS TotalActivities
        FROM Partner_University PU
       INNER JOIN University U ON PU.uni_id = U.uni_id
    )
    SELECT 
        PartnerUniversity,
        TotalActivities,
        RANK() OVER (ORDER BY TotalActivities DESC) AS ActivityRank
    FROM PartnerActivities
);
GO

CREATE FUNCTION GetMobility_Trend()
RETURNS TABLE
AS
RETURN
(
    WITH YearlyMobility AS (
        SELECT 
            YEAR(P.start_date) AS MobilityYear, 
            COUNT(M.part_id) AS MobilitiesCount
        FROM Participation P
        INNER JOIN Mobility M ON P.part_id = M.part_id
        GROUP BY YEAR(P.start_date)
    )
    SELECT 
        Y1.MobilityYear AS Year,
        Y1.MobilitiesCount AS NumberOfMobilities,
        ISNULL(Y1.MobilitiesCount - Y2.MobilitiesCount, Y1.MobilitiesCount) AS ChangeFromPreviousYear
    FROM YearlyMobility Y1
    LEFT JOIN YearlyMobility Y2 ON Y1.MobilityYear = Y2.MobilityYear + 1
);
GO
