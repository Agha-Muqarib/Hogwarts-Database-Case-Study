Create table Schools
(SchoolID Number Not Null,
SchoolName Varchar2(30) Not Null,
CurrentHead Varchar2(30) Not Null,
DeputyHead Varchar2(30) Not Null,
Region Varchar2(30) Not Null,

Constraint PKSchool Primary Key (SchoolID)
)
/

Create table Books
(BookID Number Not Null,
BookName Varchar2(30) Not Null,
Author Varchar2(30) Not Null,
PublishedBy Varchar2(50) Not Null,
PublishDate Date,

Constraint PKBook Primary Key (BookID)
)
/

Create table Characters
(CharacterID Number Not Null,
CharacterName Varchar2(30) Not Null,
Role Varchar2(30) Not Null,

Constraint PKCharacter Primary Key (CharacterID)
)
/

Create table Appearance
(CharacterID Number,
BookID Number,

Constraint FAKCharacter Foreign Key (CharacterID) References Characters(CharacterID),
Constraint FBKBook Foreign Key (BookID) References Books(BookID)
)
/

Create table Students
(StudentID Number Not Null,
Studentame Varchar2(30) Not Null,
SchoolID Number Not Null,
CharacterID Number Not Null,
Year Number,

Constraint PKStudent Primary Key (StudentID),
Constraint FSKCharacter Foreign Key (CharacterID) References Characters(CharacterID),
Constraint FKSchool Foreign Key (SchoolID) References Schools(SchoolID),
Constraint YearAuth Check ((Year Between 1 And 5))
)
/

Create table Courses
(CourseID Number Not Null,
CourseName Varchar2(30) Not Null,
CreditHours Number Not Null,
Nature Varchar(30) Not Null,
Constraint NatureAuth Check ((Nature In('Theory','Practical','Theory&Practical') )),
Constraint PKCourse Primary Key (CourseID)
)
/

Create table Grades
(StudentID Number Not Null,
CourseID Number Not Null,
Grade Varchar2(10) Not Null,
Years Number(4),

Constraint FGKStudent Foreign Key (StudentID) References Students(StudentID),
Constraint FGKCourse Foreign Key (CourseID) References Courses(CourseID),
Constraint GradeAuth Check ((Grade In('O','E','P','A','D','T') ))
)
/


Create table Enrollment
(StudentID Number Not Null,
CourseID Number Not Null,
Constraint FEnKStudent Foreign Key (StudentID) References Students(StudentID),
Constraint FEnKCourse Foreign Key (CourseID) References Courses(CourseID)
)
/

Create table Professors
(ProfessorID Number Not Null,
ProfessorName Varchar2(30) Not Null,
Age Number(3) Not Null,
CourseID Number Not Null,
CharacterID Number Not Null,

Constraint PKProfessor Primary Key (ProfessorID),
Constraint FPKCharacter Foreign Key (CharacterID) References Characters(CharacterID),
Constraint FPKCourse Foreign Key (CourseID) References Courses(CourseID),
Constraint AgeAuth Check ((Age > 0))
)
/


Create table Ministers
(MinisterID Number Not Null,
MinisterName Varchar2(30) Not Null,
HireDate Date Not Null,

Constraint PKMinister Primary Key (MinisterID)
)
/

Create table Levels
(LevelID Number Not Null,
LevelName Varchar2(30) Not Null,
MinisterID Number Not Null,

Constraint PKLevel Primary Key (LevelID),
Constraint FKMinister Foreign Key (MinisterID) References Ministers(MinisterID)
)
/


Create table InCharge
(InchargeID Number Not Null,
InchargeName Varchar2(30) Not Null,
HireDate Date Not Null,

Constraint PKIncharge Primary Key (InchargeID)
)
/

Create table MinistryEmployees
(EmpID Number Not Null,
EmpName Varchar2(30) Not Null,
Age Number(3) Not Null,
Job Varchar2(20) Not Null,
CharacterID Number Not Null,
StudentID Number Not Null,

Constraint PKMinEmployee Primary Key (EmpID),
Constraint FEKCharacter Foreign Key (CharacterID) References Characters(CharacterID),
Constraint FEKStudent Foreign Key (StudentID) References Students(StudentID),
Constraint EmpAgeAuth Check ((Age > 0))
)
/


Create table Offices
(OfficeID Number Not Null,
OfficeName Varchar2(30) Not Null,
LevelID Number Not Null,
InchargeID Number Not Null,
EmpID Number Not Null,

Constraint PKOffice Primary Key (OfficeID),
Constraint FKLevel Foreign Key (LevelID) References Levels(LevelID),
Constraint FKEmployee Foreign Key (EmpID) References MinistryEmployees(EmpID),
Constraint FKIncharge Foreign Key (InchargeID) References InCharge(InchargeID)
)
/

Create table Examiners
(ExaminerID Number Not Null,
ExaminerName Varchar2(30) Not Null,
CharacterID Number Not Null,
LevelID Number Not Null,

Constraint PKExaminer Primary Key (ExaminerID),
Constraint FExKCharacter Foreign Key (CharacterID) References Characters(CharacterID),
Constraint FExKLevel Foreign Key (LevelID) References Levels(LevelID)
)
/

Create Table Owls
(ExaminerID Number Not Null,
CourseID Number Not Null,
Slot Number(2) Not Null,
Nature Varchar2(20) Not Null,

Constraint FOKExaminer Foreign Key (ExaminerID) References Examiners(ExaminerID),
Constraint FOKCourse Foreign Key (CourseID) References Courses(CourseID),
Constraint SlotAuth Check ((Slot Between 1 And 19)),
Constraint OwlsNatureAuth Check ((Nature In('Theory','Practical','Thery&Practical') ))
)
/
