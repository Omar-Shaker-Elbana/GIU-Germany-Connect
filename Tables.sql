CREATE DATABASE GIU_Germany_Connect

USE GIU_Germany_Connect

CREATE TABLE Person(
    person_id INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(15),
    account_status VARCHAR(20) DEFAULT 'Active' CHECK (account_status IN ('Active','Inactive','Suspended'))
)

CREATE TABLE Faculty(
    faculty_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    [description] VARCHAR(200)
)

CREATE TABLE Department(
    dept_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    [description] VARCHAR(200),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
)

CREATE TABLE Program(
    program_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    degree_level VARCHAR(50),
    total_credit_hours INT,
    [description] VARCHAR(200),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
)

CREATE TABLE University(
    uni_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    [description] VARCHAR(200)
)

CREATE TABLE Partner_University(
    uni_id INT PRIMARY KEY,
    partnership_status VARCHAR(50),
    contact_info VARCHAR(200),
    FOREIGN KEY (uni_id) REFERENCES University(uni_id)
)

CREATE TABLE Partner_Department(
    pdept_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    [description] VARCHAR(200),
    partner_uni_id INT,
    FOREIGN KEY (partner_uni_id) REFERENCES Partner_University(uni_id)
)

CREATE TABLE Student(
    person_id INT PRIMARY KEY,
    student_no INT UNIQUE,
    current_semester INT CHECK (current_semester >= 1),
    gpa DECIMAL(3,2) CHECK (gpa BETWEEN 0 AND 5),
    language_level VARCHAR(20),
    cv VARCHAR(300),
    program_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    CONSTRAINT FK_Student_program_id FOREIGN KEY (program_id) REFERENCES Program(program_id)
)

CREATE TABLE Student_Interest(
    person_id INT,
    interest VARCHAR(50),
    PRIMARY KEY (person_id, interest),
    FOREIGN KEY (person_id) REFERENCES Student(person_id) ON DELETE CASCADE
)

CREATE TABLE GIU_Academic(
    person_id INT PRIMARY KEY,
    academic_rank VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    CONSTRAINT FK_GIU_Academic_dept_id FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
)

CREATE TABLE Partner_Professor(
    person_id INT PRIMARY KEY,
    title VARCHAR(50),
    pdept_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    CONSTRAINT FK_Partner_Professor_pdept_id FOREIGN KEY (pdept_id) REFERENCES Partner_Department(pdept_id)
)

CREATE TABLE Company_Rep(
    person_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    sector VARCHAR(50),
    position VARCHAR(50),
    [location] VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
)

CREATE TABLE Interviewer(
    interviewer_id INT PRIMARY KEY,
    role VARCHAR(50),
    person_id INT UNIQUE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
)

CREATE TABLE Topic_Provider(
    person_id INT PRIMARY KEY,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
)

CREATE TABLE [Notification](
    notif_id INT PRIMARY KEY,
    [message] VARCHAR(200),
    [timestamp] DATETIME DEFAULT GETDATE(),
    category VARCHAR(50),
    urgency VARCHAR(20) CHECK (urgency IN ('Low','Medium','High')),
    read_status VARCHAR(10) DEFAULT 'Unread' CHECK (read_status IN ('Read','Unread')),
    recipient_id INT,
    FOREIGN KEY (recipient_id) REFERENCES Person(person_id)
)

-- Academic Structure

 

CREATE TABLE Course(
    course_id INT PRIMARY KEY,
    code VARCHAR(20) UNIQUE,
    title VARCHAR(100),
    credit_hours INT CHECK (credit_hours > 0),
    [level] VARCHAR(50),
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
)

CREATE TABLE Prerequisite(
    course_id INT,
    prereq_course_id INT,
    PRIMARY KEY (course_id, prereq_course_id),
    CHECK (course_id <> prereq_course_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (prereq_course_id) REFERENCES Course(course_id)
)

CREATE TABLE Field(
    field_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    [description] VARCHAR(200)
)

CREATE TABLE Research_Area(
    area_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    [description] VARCHAR(200),
    field_id INT,
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
)

CREATE TABLE Skill(
    skill_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    category VARCHAR(50),
    [description] VARCHAR(200)
)

CREATE TABLE Program_Field(
    program_id INT,
    field_id INT,
    PRIMARY KEY (program_id, field_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
)

CREATE TABLE Completed_Course(
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(person_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
)

CREATE TABLE Student_Skill(
    student_id INT,
    skill_id INT,
    PRIMARY KEY (student_id, skill_id),
    FOREIGN KEY (student_id) REFERENCES Student(person_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
)

CREATE TABLE GIU_Interest(
    academic_id INT,
    area_id INT,
    PRIMARY KEY (academic_id, area_id),
    FOREIGN KEY (academic_id) REFERENCES GIU_Academic(person_id),
    FOREIGN KEY (area_id) REFERENCES Research_Area(area_id)
)

CREATE TABLE PP_Interest(
    partner_prof_id INT,
    area_id INT,
    PRIMARY KEY (partner_prof_id, area_id),
    FOREIGN KEY (partner_prof_id) REFERENCES Partner_Professor(person_id),
    FOREIGN KEY (area_id) REFERENCES Research_Area(area_id)
)

-- Universities and Partners

 

CREATE TABLE GIU(
    uni_id INT PRIMARY KEY,
    FOREIGN KEY (uni_id) REFERENCES University(uni_id)
)

 

CREATE TABLE Partner_Program(
    pprog_id INT PRIMARY KEY,
    [name] VARCHAR(50),
    degree_level VARCHAR(50),
    [description] VARCHAR(200),
    pdept_id INT,
    FOREIGN KEY (pdept_id) REFERENCES Partner_Department(pdept_id)
)

CREATE TABLE Partner_Program_Field(
    pprog_id INT,
    field_id INT,
    PRIMARY KEY (pprog_id, field_id),
    FOREIGN KEY (pprog_id) REFERENCES Partner_Program(pprog_id),
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
)

-- Cooperation Agreements

CREATE TABLE Cooperation_Agreement(
    agreement_id INT PRIMARY KEY,
    title VARCHAR(100),
    scope VARCHAR(200),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    [status] VARCHAR(20),
    partner_uni_id INT NOT NULL,
    coordinator_id INT,
    CHECK (end_date >= start_date),
    FOREIGN KEY (partner_uni_id) REFERENCES Partner_University(uni_id),
    FOREIGN KEY (coordinator_id) REFERENCES GIU_Academic(person_id)
)

CREATE TABLE Mobility_Agreement(
    agreement_id INT PRIMARY KEY,
    exchange_terms VARCHAR(200),
    double_degree_terms VARCHAR(200),
    seat_quota INT CHECK (seat_quota >= 0),
    tuition_arrangement VARCHAR(200),
    FOREIGN KEY (agreement_id) REFERENCES Cooperation_Agreement(agreement_id)
)

CREATE TABLE Mob_Agr_Semester(
    agreement_id INT,
    semester VARCHAR(20),
    PRIMARY KEY (agreement_id, semester),
    FOREIGN KEY (agreement_id) REFERENCES Mobility_Agreement(agreement_id) ON DELETE CASCADE
)

CREATE TABLE Mob_Agr_Program(
    agreement_id INT,
    program_id INT,
    PRIMARY KEY (agreement_id, program_id),
    FOREIGN KEY (agreement_id) REFERENCES Mobility_Agreement(agreement_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
)

CREATE TABLE Research_Agreement(
    agreement_id INT PRIMARY KEY,
    ip_terms VARCHAR(200),
    funding_framework VARCHAR(200),
    FOREIGN KEY (agreement_id) REFERENCES Cooperation_Agreement(agreement_id)
)

CREATE TABLE Res_Agr_Area(
    agreement_id INT,
    area_id INT,
    PRIMARY KEY (agreement_id, area_id),
    FOREIGN KEY (agreement_id) REFERENCES Research_Agreement(agreement_id),
    FOREIGN KEY (area_id) REFERENCES Research_Area(area_id)
)

CREATE TABLE General_MoU(
    agreement_id INT PRIMARY KEY,
    intent VARCHAR(200),
    collab_scope VARCHAR(200),
    renewal_terms VARCHAR(200),
    FOREIGN KEY (agreement_id) REFERENCES Cooperation_Agreement(agreement_id)
)

-- Opportunities

CREATE TABLE Opportunity(
    opp_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    [description] VARCHAR(200),
    [type] VARCHAR(50),
    [status] VARCHAR(20) NOT NULL,
    app_open_date DATE NOT NULL,
    app_close_date DATE NOT NULL,
    capacity INT CHECK (capacity > 0),
    location_mode VARCHAR(100),
    agreement_id INT,
    offered_by_rep_id INT,
    CHECK (app_close_date >= app_open_date),
    FOREIGN KEY (agreement_id) REFERENCES Cooperation_Agreement(agreement_id),
    FOREIGN KEY (offered_by_rep_id) REFERENCES Company_Rep(person_id)
)

CREATE TABLE Opp_Language_Req(
    opp_id INT,
    language_req VARCHAR(50),
    PRIMARY KEY (opp_id, language_req),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id) ON DELETE CASCADE
)

CREATE TABLE Opp_Relevant_Date(
    opp_id INT,
    relevant_date DATE,
    PRIMARY KEY (opp_id, relevant_date),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id) ON DELETE CASCADE
)

CREATE TABLE Opp_Field(
    opp_id INT,
    field_id INT,
    PRIMARY KEY (opp_id, field_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
)

CREATE TABLE Opp_Eligible_Program(
    opp_id INT,
    program_id INT,
    PRIMARY KEY (opp_id, program_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
)

CREATE TABLE Opp_Prereq_Course(
    opp_id INT,
    course_id INT,
    PRIMARY KEY (opp_id, course_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
)

CREATE TABLE Opp_Skill(
    opp_id INT,
    skill_id INT,
    PRIMARY KEY (opp_id, skill_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
)

CREATE TABLE Thesis_Topic(
    opp_id INT PRIMARY KEY,
    expected_outcomes VARCHAR(200),
    funding_info VARCHAR(200),
    travel_info VARCHAR(200),
    accommodation_info VARCHAR(200),
    provider_id INT,
    supervisor_id INT,
    co_supervisor_id INT,
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (provider_id) REFERENCES Topic_Provider(person_id),
    FOREIGN KEY (supervisor_id) REFERENCES GIU_Academic(person_id),
    FOREIGN KEY (co_supervisor_id) REFERENCES Partner_Professor(person_id)
)

CREATE TABLE Thesis_Area(
    opp_id INT,
    area_id INT,
    PRIMARY KEY (opp_id, area_id),
    FOREIGN KEY (opp_id) REFERENCES Thesis_Topic(opp_id),
    FOREIGN KEY (area_id) REFERENCES Research_Area(area_id)
)

CREATE TABLE Short_Program(
    opp_id INT PRIMARY KEY,
    duration INT CHECK (duration > 0),
    [location] VARCHAR(100),
    hosting_arrangements VARCHAR(200),
    host_uni_id INT,
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (host_uni_id) REFERENCES University(uni_id)
)

CREATE TABLE Mobility_Program(
    opp_id INT PRIMARY KEY,
    mobility_type VARCHAR(50),
    duration INT CHECK (duration > 0),
    sending_uni_id INT,
    host_uni_id INT,
    CHECK (sending_uni_id <> host_uni_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id),
    FOREIGN KEY (sending_uni_id) REFERENCES University(uni_id),
    FOREIGN KEY (host_uni_id) REFERENCES University(uni_id)
)

-- Applications and Interviews

CREATE TABLE Application(
    app_id INT PRIMARY KEY,
    app_date DATE DEFAULT GETDATE(),
    [status] VARCHAR(50),
    decision_date DATE,
    info VARCHAR(255),
    student_id INT NOT NULL,
    opp_id INT NOT NULL,
    UNIQUE (student_id, opp_id),
    CHECK (decision_date >= app_date),
    FOREIGN KEY (student_id) REFERENCES Student(person_id),
    FOREIGN KEY (opp_id) REFERENCES Opportunity(opp_id)
)

CREATE TABLE Application_Document(
    app_id INT,
    doc_type VARCHAR(50),
    file_ref VARCHAR(255),
    upload_date DATE,
    PRIMARY KEY (app_id, doc_type),
    FOREIGN KEY (app_id) REFERENCES Application(app_id) ON DELETE CASCADE
)

CREATE TABLE Interview(
    interview_id INT PRIMARY KEY,
    [date] DATE,
    [time] TIME,
    location_mode VARCHAR(50),
    outcome VARCHAR(255),
    notes VARCHAR(255),
    app_id INT NOT NULL,
    FOREIGN KEY (app_id) REFERENCES Application(app_id)
)

CREATE TABLE Conducts_Interview(
    interviewer_id INT,
    interview_id INT,
    PRIMARY KEY (interviewer_id, interview_id),
    FOREIGN KEY (interviewer_id) REFERENCES Interviewer(interviewer_id),
    FOREIGN KEY (interview_id) REFERENCES Interview(interview_id)
)

-- Participation and Mobility

CREATE TABLE Participation(
    part_id INT PRIMARY KEY,
    [status] VARCHAR(50),
    start_date DATE,
    end_date DATE,
    app_id INT NOT NULL UNIQUE,
    CHECK (end_date >= start_date),
    FOREIGN KEY (app_id) REFERENCES Application(app_id)
)

CREATE TABLE Mobility(
    part_id INT PRIMARY KEY,
    pre_travel_status VARCHAR(50),
    during_status VARCHAR(50),
    post_status VARCHAR(50),
    final_outcome VARCHAR(255),
    host_uni_id INT,
    FOREIGN KEY (part_id) REFERENCES Participation(part_id),
    FOREIGN KEY (host_uni_id) REFERENCES University(uni_id)
)

CREATE TABLE Program_Participation(
    part_id INT PRIMARY KEY,
    payment_status VARCHAR(50),
    visa_status VARCHAR(50),
    travel_status VARCHAR(50),
    FOREIGN KEY (part_id) REFERENCES Participation(part_id)
)

CREATE TABLE Course_Equivalency(
    part_id INT,
    host_course_title VARCHAR(100),
    host_credits INT,
    transferred_credits INT,
    approval_status VARCHAR(50),
    giu_course_id INT,
    PRIMARY KEY (part_id, host_course_title),
    FOREIGN KEY (part_id) REFERENCES Mobility(part_id),
    FOREIGN KEY (giu_course_id) REFERENCES Course(course_id)
)

-- Visits, Research and Funding

CREATE TABLE Professor_Visit(
    visit_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    purpose VARCHAR(255),
    travel_arr VARCHAR(255),
    accommodation_arr VARCHAR(255),
    [status] VARCHAR(50),
    follow_up_report VARCHAR(255),
    partner_prof_id INT,
    host_faculty_id INT,
    coordinator_id INT,
    agreement_id INT,
    CHECK (end_date >= start_date),
    FOREIGN KEY (partner_prof_id) REFERENCES Partner_Professor(person_id),
    FOREIGN KEY (host_faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (coordinator_id) REFERENCES GIU_Academic(person_id),
    FOREIGN KEY (agreement_id) REFERENCES Cooperation_Agreement(agreement_id)
)

CREATE TABLE Visit_Outcome(
    visit_id INT,
    outcome VARCHAR(255),
    PRIMARY KEY (visit_id, outcome),
    FOREIGN KEY (visit_id) REFERENCES Professor_Visit(visit_id) ON DELETE CASCADE
)

CREATE TABLE Agenda_Item(
    visit_id INT,
    seq_no INT,
    activity_type VARCHAR(50),
    title VARCHAR(50),
    date_time DATETIME,
    [location] VARCHAR(100),
    audience VARCHAR(100),
    PRIMARY KEY (visit_id, seq_no),
    FOREIGN KEY (visit_id) REFERENCES Professor_Visit(visit_id) ON DELETE CASCADE
)

CREATE TABLE Research_Project(
    project_id INT PRIMARY KEY,
    title VARCHAR(100),
    [description] VARCHAR(200),
    [status] VARCHAR(20),
    start_date DATE,
    end_date DATE,
    res_agreement_id INT,
    CHECK (end_date >= start_date),
    FOREIGN KEY (res_agreement_id) REFERENCES Research_Agreement(agreement_id)
)

CREATE TABLE Project_Deadline(
    project_id INT,
    deadline DATE,
    PRIMARY KEY (project_id, deadline),
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id) ON DELETE CASCADE
)

CREATE TABLE Project_Area(
    project_id INT,
    area_id INT,
    PRIMARY KEY (project_id, area_id),
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id),
    FOREIGN KEY (area_id) REFERENCES Research_Area(area_id)
)

CREATE TABLE GIU_Participates(
    academic_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (academic_id, project_id),
    FOREIGN KEY (academic_id) REFERENCES GIU_Academic(person_id),
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id)
)

CREATE TABLE PP_Participates(
    partner_prof_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (partner_prof_id, project_id),
    FOREIGN KEY (partner_prof_id) REFERENCES Partner_Professor(person_id),
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id)
)

CREATE TABLE Research_Output(
    output_id INT PRIMARY KEY,
    [type] VARCHAR(50),
    title VARCHAR(100),
    [date] DATE,
    reference VARCHAR(255),
    [status] VARCHAR(50),
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id)
)

CREATE TABLE Funding_Opportunity(
    fund_id INT PRIMARY KEY,
    [name] VARCHAR(100),
    agency VARCHAR(100),
    [type] VARCHAR(50),
    amount DECIMAL(15,2) CHECK (amount >= 0),
    deadline DATE,
    eligibility_conditions VARCHAR(255),
    [status] VARCHAR(50)
)

CREATE TABLE Project_Targets_Fund(
    project_id INT,
    fund_id INT,
    PRIMARY KEY (project_id, fund_id),
    FOREIGN KEY (project_id) REFERENCES Research_Project(project_id),
    FOREIGN KEY (fund_id) REFERENCES Funding_Opportunity(fund_id)
)

CREATE TABLE Fund_Supports_Mobility(
    fund_id INT,
    part_id INT,
    PRIMARY KEY (fund_id, part_id),
    FOREIGN KEY (fund_id) REFERENCES Funding_Opportunity(fund_id),
    FOREIGN KEY (part_id) REFERENCES Mobility(part_id)
)