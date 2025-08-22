
-- Sequences for Entity Tables
CREATE SEQUENCE staff_member_seq START WITH 1 INCREMENT BY 1; --Done
CREATE SEQUENCE event_seq START WITH 1 INCREMENT BY 1; --done
CREATE SEQUENCE team_seq START WITH 1 INCREMENT BY 1; --done
CREATE SEQUENCE players_seq START WITH 1 INCREMENT BY 1; --- 's' in the name
CREATE SEQUENCE profile_seq START WITH 1 INCREMENT BY 1; --done
CREATE SEQUENCE booking_seq START WITH 1 INCREMENT BY 1; --done
CREATE SEQUENCE turfs_seq START WITH 1 INCREMENT BY 1;  --'S' 
CREATE SEQUENCE payment_seq START WITH 1 INCREMENT BY 1; --done
CREATE SEQUENCE payment_type_seq START WITH 1 INCREMENT BY 1; --done

-- Entity Tables
CREATE TABLE Staff_Members (              --check this when update the table name has a new 's'
    Staff_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    Department VARCHAR2(50)
);

CREATE TABLE Events (                      --- same 's'
    Event_ID NUMBER PRIMARY KEY, 
    Event_Name VARCHAR2(100),
    Event_Date DATE,        --here is the change
    Rules VARCHAR2(500)
);

CREATE TABLE Team (          --done
    Team_ID NUMBER PRIMARY KEY,
    Team_Name VARCHAR2(100),
    Sport_Type VARCHAR2(50)
);

CREATE TABLE Players (       --'S'
    Player_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    DOB DATE,
    Phone_Number VARCHAR2(15)
);

CREATE TABLE Profile (   --done
    Profile_ID NUMBER PRIMARY KEY,
    Skill_Level VARCHAR2(50),
    Achievements VARCHAR2(500)
);

CREATE TABLE Booking (   --done
    Booking_ID NUMBER PRIMARY KEY,
    Start_Time TIMESTAMP,
    End_Time TIMESTAMP,
    Booking_Date DATE,
    Status VARCHAR2(50)
);

CREATE TABLE Turf (   -- done
    Turf_ID NUMBER PRIMARY KEY,
    Turf_Name VARCHAR2(100),
    Turf_location VARCHAR2(100),
    Truf_size VARCHAR2(50),
    Truf_type VARCHAR2(50)
);

CREATE TABLE Payment (  --done
    Payment_ID NUMBER PRIMARY KEY,
    Amount NUMBER(10,2),
    Payment_Date DATE,
    Payment_Type_Code NUMBER
);

CREATE TABLE Payment_Type ( --done
    Payment_Type_Code NUMBER PRIMARY KEY,
    Payment_Method VARCHAR2(50),
    Description VARCHAR2(200)
);

-- Relationship Tables
CREATE TABLE Can_Manage (  --done
    Staff_ID NUMBER,
    Event_ID NUMBER,
    PRIMARY KEY (Staff_ID, Event_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff_Members(Staff_ID),
    FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID)
);

CREATE TABLE Participates ( --done
    Event_ID NUMBER,
    Team_ID NUMBER,
    PRIMARY KEY (Event_ID, Team_ID),
    FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Belongs_To ( --done
    Player_ID NUMBER,
    Team_ID NUMBER,
    PRIMARY KEY (Player_ID, Team_ID),
    FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Has_Profile (  --done
    Player_ID NUMBER,
    Profile_ID NUMBER,
    PRIMARY KEY (Player_ID, Profile_ID),
    FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID),
    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID)
);

CREATE TABLE Can_Make ( --done
    Team_ID NUMBER,
    Booking_ID NUMBER,
    PRIMARY KEY (Team_ID, Booking_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

CREATE TABLE Makes (  --done
    Player_ID NUMBER,
    Booking_ID NUMBER,
    PRIMARY KEY (Player_ID, Booking_ID),
    FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

CREATE TABLE Can_Be_Made (
    Booking_ID NUMBER,
    Turf_ID NUMBER,
    PRIMARY KEY (Booking_ID, Turf_ID),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
    FOREIGN KEY (Turf_ID) REFERENCES Turf(Turf_ID)
);

CREATE TABLE Can_Have (
    Booking_ID NUMBER,
    Payment_ID NUMBER,
    PRIMARY KEY (Booking_ID, Payment_ID),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);

CREATE TABLE Can_Use (
    Payment_ID NUMBER,
    Payment_Type_Code NUMBER,
    PRIMARY KEY (Payment_ID, Payment_Type_Code),
    FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID),
    FOREIGN KEY (Payment_Type_Code) REFERENCES Payment_Type(Payment_Type_Code)
);


---data insertion
--1st  table
INSERT INTO Staff_Members (Staff_ID, First_Name, Last_Name, Department) VALUES (staff_member_seq.NEXTVAL, 'alam', 'shakib', 'Operations');
INSERT INTO Staff_Members (Staff_ID, First_Name, Last_Name, Department) VALUES (staff_member_seq.NEXTVAL, 'rimon', 'promanik', 'Marketing');
INSERT INTO Staff_Members (Staff_ID, First_Name, Last_Name, Department) VALUES (staff_member_seq.NEXTVAL, 'maruf', 'maruf', 'Finance');
INSERT INTO Staff_Members (Staff_ID, First_Name, Last_Name, Department) VALUES (staff_member_seq.NEXTVAL, 'lamia', 'thahsin', 'HR');
INSERT INTO Staff_Members (Staff_ID, First_Name, Last_Name, Department) VALUES (staff_member_seq.NEXTVAL, 'shadman', 'shakib', 'IT');

SELECT * FROM Staff_Members;

--2nd table
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Rules) VALUES (event_seq.NEXTVAL, 'Football Championship', TO_DATE('2025-09-01', 'YYYY-MM-DD'), 'Standard FIFA rules');
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Rules) VALUES (event_seq.NEXTVAL, 'Basketball Tournament', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'NBA rules');
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Rules) VALUES (event_seq.NEXTVAL, 'Cricket League', TO_DATE('2025-10-10', 'YYYY-MM-DD'), 'ICC rules');
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Rules) VALUES (event_seq.NEXTVAL, 'Tennis Open', TO_DATE('2025-11-05', 'YYYY-MM-DD'), 'ATP rules');
INSERT INTO Events (Event_ID, Event_Name, Event_Date, Rules) VALUES (event_seq.NEXTVAL, 'Hockey Cup', TO_DATE('2025-12-20', 'YYYY-MM-DD'), 'FIH rules');


SELECT * FROM Events;

--3rd table
INSERT INTO Team (Team_ID, Team_Name, Sport_Type) VALUES (team_seq.NEXTVAL, 'Warriors', 'Football');
INSERT INTO Team (Team_ID, Team_Name, Sport_Type) VALUES (team_seq.NEXTVAL, 'Titans', 'Basketball');
INSERT INTO Team (Team_ID, Team_Name, Sport_Type) VALUES (team_seq.NEXTVAL, 'Strikers', 'Cricket');
INSERT INTO Team (Team_ID, Team_Name, Sport_Type) VALUES (team_seq.NEXTVAL, 'Aces', 'Tennis');
INSERT INTO Team (Team_ID, Team_Name, Sport_Type) VALUES (team_seq.NEXTVAL, 'Blazers', 'Hockey');



SELECT * FROM Team;

--4th table

INSERT INTO Players (Player_ID, First_Name, Last_Name, DOB, Phone_Number) VALUES (players_seq.NEXTVAL, 'shadman', 'alam', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '01888488409');
INSERT INTO Players (Player_ID, First_Name, Last_Name, DOB, Phone_Number) VALUES (players_seq.NEXTVAL, 'amin', 'ali', TO_DATE('1992-04-15', 'YYYY-MM-DD'), '01677747747');
INSERT INTO Players (Player_ID, First_Name, Last_Name, DOB, Phone_Number) VALUES (players_seq.NEXTVAL, 'arif', 'aslma', TO_DATE('1985-06-13', 'YYYY-MM-DD'), '0198787766');
INSERT INTO Players (Player_ID, First_Name, Last_Name, DOB, Phone_Number) VALUES (players_seq.NEXTVAL, 'tanvir', 'evan', TO_DATE('1984-11-22', 'YYYY-MM-DD'), '01715748774');
INSERT INTO Players (Player_ID, First_Name, Last_Name, DOB, Phone_Number) VALUES (players_seq.NEXTVAL, 'mainul', 'islam', TO_DATE('1965-04-04', 'YYYY-MM-DD'), '0181660948');




SELECT * FROM Players;

--5th table
INSERT INTO Profile (Profile_ID, Skill_Level, Achievements) VALUES (profile_seq.NEXTVAL, 'Advanced', 'MVP 2022');
INSERT INTO Profile (Profile_ID, Skill_Level, Achievements) VALUES (profile_seq.NEXTVAL, 'Intermediate', 'Best Player 2021');
INSERT INTO Profile (Profile_ID, Skill_Level, Achievements) VALUES (profile_seq.NEXTVAL, 'Beginner', 'Rookie of the Year');
INSERT INTO Profile (Profile_ID, Skill_Level, Achievements) VALUES (profile_seq.NEXTVAL, 'Advanced', 'Champion 2020');
INSERT INTO Profile (Profile_ID, Skill_Level, Achievements) VALUES (profile_seq.NEXTVAL, 'Intermediate', 'Top Scorer 2019');



SELECT * FROM Profile;

--6th table

INSERT INTO Booking (Booking_ID, Start_Time, End_Time, Booking_Date, Status) VALUES (booking_seq.NEXTVAL, TO_TIMESTAMP('2025-08-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'Confirmed');
INSERT INTO Booking (Booking_ID, Start_Time, End_Time, Booking_Date, Status) VALUES (booking_seq.NEXTVAL, TO_TIMESTAMP('2025-08-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Booking (Booking_ID, Start_Time, End_Time, Booking_Date, Status) VALUES (booking_seq.NEXTVAL, TO_TIMESTAMP('2025-08-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-03', 'YYYY-MM-DD'), 'Cancelled');
INSERT INTO Booking (Booking_ID, Start_Time, End_Time, Booking_Date, Status) VALUES (booking_seq.NEXTVAL, TO_TIMESTAMP('2025-08-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-04', 'YYYY-MM-DD'), 'Confirmed');
INSERT INTO Booking (Booking_ID, Start_Time, End_Time, Booking_Date, Status) VALUES (booking_seq.NEXTVAL, TO_TIMESTAMP('2025-08-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-08-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'Pending');


SELECT * FROM Booking;

--7th table
INSERT INTO Turf (TURF_ID, TURF_NAME, TURF_LOCATION, TRUF_SIZE, TRUF_TYPE) VALUES (turfs_seq.NEXTVAL, 'Green Field', 'Mirpur-2', '100x50', 'Grass');
INSERT INTO Turf (Turf_ID, Turf_Name, Turf_location, Truf_size, Truf_type) VALUES (turfs_seq.NEXTVAL, 'Blue Arena', 'Mirpur-10', '80x40', 'Synthetic');
INSERT INTO Turf (Turf_ID, Turf_Name, Turf_location, Truf_size, Truf_type) VALUES (turfs_seq.NEXTVAL, 'Red Court', 'Badda', '60x30', 'Clay');
INSERT INTO Turf (Turf_ID, Turf_Name, Turf_location, Truf_size, Truf_type) VALUES (turfs_seq.NEXTVAL, 'Yellow Pitch', 'Uttora', '120x60', 'Artificial');
INSERT INTO Turf (Turf_ID, Turf_Name, Turf_location, Truf_size, Truf_type) VALUES (turfs_seq.NEXTVAL, 'White Ground', 'Nikunjo-2', '90x45', 'Hybrid');


SELECT * FROM Turf;

--8th table

INSERT INTO Payment_Type (Payment_Type_Code, Payment_Method, Description) VALUES (payment_type_seq.NEXTVAL, 'Credit Card', 'Visa or MasterCard');
INSERT INTO Payment_Type (Payment_Type_Code, Payment_Method, Description) VALUES (payment_type_seq.NEXTVAL, 'Debit Card', 'Bank issued debit cards');
INSERT INTO Payment_Type (Payment_Type_Code, Payment_Method, Description) VALUES (payment_type_seq.NEXTVAL, 'Cash', 'Physical currency');
INSERT INTO Payment_Type (Payment_Type_Code, Payment_Method, Description) VALUES (payment_type_seq.NEXTVAL, 'Online Transfer', 'Bank to bank transfer');
INSERT INTO Payment_Type (Payment_Type_Code, Payment_Method, Description) VALUES (payment_type_seq.NEXTVAL, 'Mobile Payment', 'Payment via mobile apps');

SELECT * FROM Payment_Type;

--9th table

INSERT INTO Payment (Payment_ID, Amount, Payment_Date, Payment_Type_Code) VALUES (payment_seq.NEXTVAL, 1000.00, TO_DATE('2025-08-01', 'YYYY-MM-DD'), 1);
INSERT INTO Payment (Payment_ID, Amount, Payment_Date, Payment_Type_Code) VALUES (payment_seq.NEXTVAL, 1500.00, TO_DATE('2025-08-02', 'YYYY-MM-DD'), 2);
INSERT INTO Payment (Payment_ID, Amount, Payment_Date, Payment_Type_Code) VALUES (payment_seq.NEXTVAL, 2000.00, TO_DATE('2025-08-03', 'YYYY-MM-DD'), 3);
INSERT INTO Payment (Payment_ID, Amount, Payment_Date, Payment_Type_Code) VALUES (payment_seq.NEXTVAL, 2500.00, TO_DATE('2025-08-04', 'YYYY-MM-DD'), 4);
INSERT INTO Payment (Payment_ID, Amount, Payment_Date, Payment_Type_Code) VALUES (payment_seq.NEXTVAL, 3000.00, TO_DATE('2025-08-05', 'YYYY-MM-DD'), 5);

SELECT * FROM Payment;

--relation table data insertion

--10th table

INSERT INTO Can_Manage (Staff_ID, Event_ID) VALUES (1, 1);
INSERT INTO Can_Manage (Staff_ID, Event_ID) VALUES (2, 2);
INSERT INTO Can_Manage (Staff_ID, Event_ID) VALUES (3, 3);
INSERT INTO Can_Manage (Staff_ID, Event_ID) VALUES (4, 4);
INSERT INTO Can_Manage (Staff_ID, Event_ID) VALUES (5, 5);


SELECT * FROM Can_Manage;

--11th table
INSERT INTO Participates (Event_ID, Team_ID) VALUES (1, 1);
INSERT INTO Participates (Event_ID, Team_ID) VALUES (2, 2);
INSERT INTO Participates (Event_ID, Team_ID) VALUES (3, 3);
INSERT INTO Participates (Event_ID, Team_ID) VALUES (4, 4);
INSERT INTO Participates (Event_ID, Team_ID) VALUES (5, 5);

SELECT * FROM Participates;

--12th table

INSERT INTO Belongs_To (Player_ID, Team_ID) VALUES (1, 1);
INSERT INTO Belongs_To (Player_ID, Team_ID) VALUES (2, 2);
INSERT INTO Belongs_To (Player_ID, Team_ID) VALUES (3, 3);
INSERT INTO Belongs_To (Player_ID, Team_ID) VALUES (4, 4);
INSERT INTO Belongs_To (Player_ID, Team_ID) VALUES (5, 5);


SELECT * FROM Belongs_To ;

--13th table

INSERT INTO Has_Profile (Player_ID, Profile_ID) VALUES (1, 1);
INSERT INTO Has_Profile (Player_ID, Profile_ID) VALUES (2, 2);
INSERT INTO Has_Profile (Player_ID, Profile_ID) VALUES (3, 3);
INSERT INTO Has_Profile (Player_ID, Profile_ID) VALUES (4, 4);
INSERT INTO Has_Profile (Player_ID, Profile_ID) VALUES (5, 5);


SELECT * FROM Has_Profile ;

--14th table

INSERT INTO Can_Make (Team_ID, Booking_ID) VALUES (1, 1);
INSERT INTO Can_Make (Team_ID, Booking_ID) VALUES (2, 2);
INSERT INTO Can_Make (Team_ID, Booking_ID) VALUES (3, 3);
INSERT INTO Can_Make (Team_ID, Booking_ID) VALUES (4, 4);
INSERT INTO Can_Make (Team_ID, Booking_ID) VALUES (5, 5);


SELECT * FROM Can_Make ;

--15th table

INSERT INTO Makes (Player_ID, Booking_ID) VALUES (1, 1);
INSERT INTO Makes (Player_ID, Booking_ID) VALUES (2, 2);
INSERT INTO Makes (Player_ID, Booking_ID) VALUES (3, 3);
INSERT INTO Makes (Player_ID, Booking_ID) VALUES (4, 4);
INSERT INTO Makes (Player_ID, Booking_ID) VALUES (5, 5);


SELECT * FROM Makes ;

--16th table

INSERT INTO Can_Be_Made (Booking_ID, Turf_ID) VALUES (1, 1);
INSERT INTO Can_Be_Made (Booking_ID, Turf_ID) VALUES (2, 2);
INSERT INTO Can_Be_Made (Booking_ID, Turf_ID) VALUES (3, 3);
INSERT INTO Can_Be_Made (Booking_ID, Turf_ID) VALUES (4, 4);
INSERT INTO Can_Be_Made (Booking_ID, Turf_ID) VALUES (5, 5);


SELECT * FROM Can_Be_Made ;

--17th table

INSERT INTO Can_Have (Booking_ID, Payment_ID) VALUES (1, 1);
INSERT INTO Can_Have (Booking_ID, Payment_ID) VALUES (2, 2);
INSERT INTO Can_Have (Booking_ID, Payment_ID) VALUES (3, 21);
INSERT INTO Can_Have (Booking_ID, Payment_ID) VALUES (4, 22);
INSERT INTO Can_Have (Booking_ID, Payment_ID) VALUES (5, 23);


SELECT * FROM Can_Have ;

--18th table

INSERT INTO Can_Use (Payment_ID, Payment_Type_Code) VALUES (1, 1);
INSERT INTO Can_Use (Payment_ID, Payment_Type_Code) VALUES (2, 2);
INSERT INTO Can_Use (Payment_ID, Payment_Type_Code) VALUES (21, 3);
INSERT INTO Can_Use (Payment_ID, Payment_Type_Code) VALUES (22, 4);
INSERT INTO Can_Use (Payment_ID, Payment_Type_Code) VALUES (23, 5);


SELECT * FROM Can_Use ;