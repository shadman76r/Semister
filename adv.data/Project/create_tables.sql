
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

--plsql
-------------------------variable type-------------------------------------

--1


-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_total_amount NUMBER(10, 2);
BEGIN
    SELECT SUM(p.Amount) INTO v_total_amount
    FROM Payment p
    JOIN Can_Have ch ON p.Payment_ID = ch.Payment_ID
    JOIN Makes m ON ch.Booking_ID = m.Booking_ID
    WHERE m.Player_ID = 1;

    IF v_total_amount IS NULL THEN
        v_total_amount := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Total payment amount for Player ID 1: Tk' || v_total_amount);
END;
/


--2

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_turf_name VARCHAR2(100);
    v_booking_count NUMBER;
BEGIN
    SELECT t.Turf_Name, COUNT(cbm.Booking_ID)
    INTO v_turf_name, v_booking_count
    FROM Turf t
    LEFT JOIN Can_Be_Made cbm ON t.Turf_ID = cbm.Turf_ID
    WHERE t.Turf_ID = 1
    GROUP BY t.Turf_Name;

    DBMS_OUTPUT.PUT_LINE('Turf Name: ' || v_turf_name);
    DBMS_OUTPUT.PUT_LINE('Number of bookings: ' || v_booking_count);
END;
/


-------------------operator type -----------------------------------
--1
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE
    v_booking_id NUMBER := 1;
    v_start_time TIMESTAMP;
    v_end_time TIMESTAMP;
    v_scheduled_duration NUMBER;
    v_actual_duration NUMBER;
    v_overtime_minutes NUMBER;
    v_late_fee NUMBER := 0;
BEGIN
    SELECT Start_Time, End_Time
    INTO v_start_time, v_end_time
    FROM Booking
    WHERE Booking_ID = v_booking_id;

    v_scheduled_duration := (EXTRACT(HOUR FROM (v_end_time - v_start_time)) * 60) +
                            EXTRACT(MINUTE FROM (v_end_time - v_start_time));
    
    v_actual_duration := (EXTRACT(HOUR FROM (SYSTIMESTAMP - v_start_time)) * 60) +
                         EXTRACT(MINUTE FROM (SYSTIMESTAMP - v_start_time));

    -- Calculate overtime and late fee
    IF v_actual_duration > v_scheduled_duration THEN
        v_overtime_minutes := v_actual_duration - v_scheduled_duration;
        -- Tk120 per hour or part thereof
        v_late_fee := CEIL(v_overtime_minutes / 60) * 100;
    END IF;

    -- Output results
    DBMS_OUTPUT.PUT_LINE('Booking ID: ' || v_booking_id);
    DBMS_OUTPUT.PUT_LINE('Scheduled Duration: ' || v_scheduled_duration || ' minutes');
    DBMS_OUTPUT.PUT_LINE('Actual Duration: ' || v_actual_duration || ' minutes');
    DBMS_OUTPUT.PUT_LINE('Overtime Minutes: ' || NVL(v_overtime_minutes, 0));
    DBMS_OUTPUT.PUT_LINE('Late Fee: Tk' || v_late_fee);
END;
/


--2
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_event_id NUMBER := 1; 
    v_event_name VARCHAR2(100);
    v_event_date DATE;
    v_event_month NUMBER;
    v_total_revenue NUMBER(10,2) := 0;
    v_discount_percent NUMBER := 0;
    v_discounted_revenue NUMBER(10,2);
BEGIN
    SELECT Event_Name, Event_Date
    INTO v_event_name, v_event_date
    FROM Events
    WHERE Event_ID = v_event_id;

    v_event_month := EXTRACT(MONTH FROM v_event_date);

    SELECT SUM(p.Amount)
    INTO v_total_revenue
    FROM Payment p
    JOIN Can_Have ch ON p.Payment_ID = ch.Payment_ID
    JOIN Can_Be_Made cbm ON ch.Booking_ID = cbm.Booking_ID
    JOIN Participates part ON cbm.Booking_ID = part.Event_ID
    WHERE part.Event_ID = v_event_id;

    IF v_event_month = 9 THEN
        v_discount_percent := 15;
    ELSIF v_event_month = 10 THEN
        v_discount_percent := 10;
    ELSE
        v_discount_percent := 0;
    END IF;

    v_discounted_revenue := v_total_revenue - (v_total_revenue * v_discount_percent / 100);

    
    IF v_total_revenue IS NULL THEN
        v_total_revenue := 0;
        v_discounted_revenue := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Event: ' || v_event_name);
    DBMS_OUTPUT.PUT_LINE('Event Date: ' || TO_CHAR(v_event_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Event Month: ' || v_event_month);
    DBMS_OUTPUT.PUT_LINE('Total Revenue: Tk' || v_total_revenue);
    DBMS_OUTPUT.PUT_LINE('Discount Percentage: ' || v_discount_percent || '%');
    DBMS_OUTPUT.PUT_LINE('Discounted Revenue: TK' || v_discounted_revenue);
END;
/


----single-row--------------
--1
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_player_name VARCHAR2(100); 
BEGIN
   
    SELECT UPPER(First_Name || ' ' || Last_Name) 
    INTO v_player_name
    FROM Players
    WHERE Player_ID = 1;

    DBMS_OUTPUT.PUT_LINE('Uppercase Player Name: ' || v_player_name);
END;
/

--2
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_player_age NUMBER;
BEGIN
    SELECT ROUND(MONTHS_BETWEEN(SYSDATE, DOB) / 12)
    INTO v_player_age
    FROM Players
    WHERE Player_ID = 1;

    DBMS_OUTPUT.PUT_LINE('Rounded Player Age: ' || v_player_age);
END;
/

------------2- Group function type questions:-------------

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_avg_players NUMBER;  
BEGIN
    
    SELECT AVG(player_count) 
    INTO v_avg_players
    FROM (SELECT Team_ID, COUNT(*) AS player_count
          FROM Belongs_To
          GROUP BY Team_ID);
    DBMS_OUTPUT.PUT_LINE('Average Number of Players in All Teams: ' || v_avg_players);
END;
/

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_total_confirmed NUMBER;   
BEGIN
   
    SELECT COUNT(*) 
    INTO v_total_confirmed
    FROM Booking
    WHERE Status = 'Confirmed';

   
    DBMS_OUTPUT.PUT_LINE('Total Confirmed Bookings: ' || v_total_confirmed);
END;
/

-------loops--------

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    
    CURSOR c_players IS
        SELECT p.First_Name || ' ' || p.Last_Name AS player_name
        FROM Players p
        JOIN Belongs_To bt ON p.Player_ID = bt.Player_ID
        JOIN Team t ON bt.Team_ID = t.Team_ID
        WHERE t.Team_Name = 'Warriors';
BEGIN
    FOR player IN c_players LOOP
        DBMS_OUTPUT.PUT_LINE('Player Name: ' || player.player_name);
    END LOOP;
END;
/


-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE   
    v_booking_id NUMBER;   
    v_booking_status VARCHAR2(50); 
    CURSOR c_bookings IS
        SELECT Booking_ID, Status
        FROM Booking
        WHERE Booking_Date = TO_DATE('2025-08-01', 'YYYY-MM-DD');
BEGIN
    OPEN c_bookings;
    
    FETCH c_bookings INTO v_booking_id, v_booking_status;
    
    WHILE c_bookings%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE('Booking ID: ' || v_booking_id || ', Status: ' || v_booking_status);
        FETCH c_bookings INTO v_booking_id, v_booking_status;
    END LOOP;
    CLOSE c_bookings;
END;
/


---------------2 conditional statements -------------------

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_skill_level VARCHAR2(50); 
BEGIN
   
    SELECT Skill_Level
    INTO v_skill_level
    FROM Profile
    JOIN Has_Profile hp ON Profile.Profile_ID = hp.Profile_ID
    WHERE hp.Player_ID = 1;

    IF v_skill_level = 'Advanced' THEN
        DBMS_OUTPUT.PUT_LINE('Player is eligible for the event.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Player is not eligible for the event.');
    END IF;
END;
/


-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_booking_status VARCHAR2(50);  
    v_booking_date DATE := TO_DATE('2025-08-01', 'YYYY-MM-DD');  
BEGIN
    
    SELECT Status
    INTO v_booking_status
    FROM Booking
    WHERE Booking_Date = v_booking_date;

    IF v_booking_status = 'Confirmed' THEN
        DBMS_OUTPUT.PUT_LINE('Booking for ' || TO_CHAR(v_booking_date, 'YYYY-MM-DD') || ' is confirmed.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Booking for ' || TO_CHAR(v_booking_date, 'YYYY-MM-DD') || ' is not confirmed.');
    END IF;
END;
/


-------------2 subquery ------

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_top_player_id NUMBER; 
BEGIN
    
    SELECT Player_ID
    INTO v_top_player_id
    FROM (
        SELECT Player_ID
        FROM Belongs_To
        GROUP BY Player_ID
        HAVING COUNT(*) = (
            SELECT MAX(event_count) 
            FROM (
                SELECT Player_ID, COUNT(*) AS event_count
                FROM Belongs_To
                GROUP BY Player_ID
            )
        )
        ORDER BY COUNT(*) DESC
    ) WHERE ROWNUM = 1;  --only one row is selected

   
    DBMS_OUTPUT.PUT_LINE('Top Player ID (Most Event Participation): ' || v_top_player_id);
END;
/

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_top_booking_id NUMBER;   
BEGIN
   
    SELECT Booking_ID
    INTO v_top_booking_id
    FROM (
        SELECT Booking_ID, Amount
        FROM Can_Have ch
        JOIN Payment p ON ch.Payment_ID = p.Payment_ID
        WHERE Amount = (SELECT MAX(Amount) FROM Payment)
    ) WHERE ROWNUM = 1; 

   
    DBMS_OUTPUT.PUT_LINE('Booking ID (Highest Payment): ' || v_top_booking_id);
END;
/

----joining ---------------

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

BEGIN
    FOR r IN (
        SELECT p.First_Name || ' ' || p.Last_Name AS player_name, pr.Skill_Level
        FROM Players p
        JOIN Has_Profile hp ON p.Player_ID = hp.Player_ID
        JOIN Profile pr ON hp.Profile_ID = pr.Profile_ID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Player: ' || r.player_name || ' - Skill Level: ' || r.Skill_Level);
    END LOOP;
END;
/

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

BEGIN
    FOR r IN (
        SELECT b.Booking_ID, t.Turf_location
        FROM Booking b
        JOIN Can_Be_Made cbm ON b.Booking_ID = cbm.Booking_ID
        JOIN Turf t ON cbm.Turf_ID = t.Turf_ID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Booking ID: ' || r.Booking_ID || ' - Turf Location: ' || r.Turf_location);
    END LOOP;
END;
/


---advance code for pl/sql---

--sorted function--

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

CREATE OR REPLACE FUNCTION get_skill_level (p_player_id IN NUMBER) 
RETURN VARCHAR2 IS 
    v_skill_level VARCHAR2(50);   
BEGIN
 
    SELECT pr.Skill_Level
    INTO v_skill_level
    FROM Profile pr
    JOIN Has_Profile hp ON pr.Profile_ID = hp.Profile_ID
    WHERE hp.Player_ID = p_player_id;

    RETURN v_skill_level;
END get_skill_level;
/
--to see the answer

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A


DECLARE
    v_player_id NUMBER := 1;  
    v_skill_level VARCHAR2(50);  
BEGIN    
    v_skill_level := get_skill_level(v_player_id);
    DBMS_OUTPUT.PUT_LINE('Skill Level of Player ' || v_player_id || ': ' || v_skill_level);
END;
/

--2
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A


CREATE OR REPLACE FUNCTION get_turf_location (p_booking_id IN NUMBER) 
RETURN VARCHAR2 IS 
    v_turf_location VARCHAR2(100);   
BEGIN
    
    SELECT t.Turf_location
    INTO v_turf_location
    FROM Turf t
    JOIN Can_Be_Made cbm ON t.Turf_ID = cbm.Turf_ID
    WHERE cbm.Booking_ID = p_booking_id;
    RETURN v_turf_location;
END get_turf_location;
/

-- to see the function
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

DECLARE
    v_booking_id NUMBER := 1;
    v_turf_location VARCHAR2(100); 
BEGIN
  
    v_turf_location := get_turf_location(v_booking_id);
    DBMS_OUTPUT.PUT_LINE('Turf Location for Booking ' || v_booking_id || ': ' || v_turf_location);
END;
/

--- stored procedures------

-- to see the function
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

CREATE OR REPLACE PROCEDURE update_skill_level (p_player_id IN NUMBER, p_skill_level IN VARCHAR2)  
IS 
BEGIN
 
    UPDATE Profile
    SET Skill_Level = p_skill_level
    WHERE Profile_ID = (SELECT Profile_ID FROM Has_Profile WHERE Player_ID = p_player_id);
    
    COMMIT;
END update_skill_level;
/

--test

-- to see the function
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A

BEGIN
    -- Call the procedure to update the skill level of a player
    update_skill_level(1, 'Advanced');
END;
/

--2

-- to see the function
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
CREATE OR REPLACE PROCEDURE update_booking_status (p_booking_id IN NUMBER, p_status IN VARCHAR2)  
IS 
BEGIN
 
    UPDATE Booking
    SET Status = p_status
    WHERE Booking_ID = p_booking_id;

    COMMIT;  
END update_booking_status;
/

--to test
-- to see the function
-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
BEGIN
  
    update_booking_status(6, 'Confirmed'); 
END;
/

----table record -----

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE  
    TYPE player_record_type IS TABLE OF Players%ROWTYPE;    
    v_players player_record_type;  
BEGIN
   
    SELECT * BULK COLLECT INTO v_players FROM Players;
    FOR i IN 1..v_players.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Player Name: ' || v_players(i).First_Name || ' ' || v_players(i).Last_Name);
    END LOOP;
END;
/

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE
    TYPE booking_record_type IS TABLE OF Booking%ROWTYPE;
    
    v_bookings booking_record_type;  
BEGIN  
    SELECT * BULK COLLECT INTO v_bookings FROM Booking;
    
    FOR i IN 1..v_bookings.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Booking ID: ' || v_bookings(i).Booking_ID || ' - Status: ' || v_bookings(i).Status);
    END LOOP;
END;
/

---- explicit cursor

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE

    CURSOR c_player_bookings IS 
        SELECT p.Player_ID, b.Booking_ID, b.Status
        FROM Players p
        JOIN Belongs_To bt ON p.Player_ID = bt.Player_ID
        JOIN Can_Make cm ON bt.Team_ID = cm.Team_ID
        JOIN Booking b ON cm.Booking_ID = b.Booking_ID;
    
   
    v_player_booking c_player_bookings%ROWTYPE;
BEGIN
 
    OPEN c_player_bookings;
    
   
    LOOP
        FETCH c_player_bookings INTO v_player_booking;
        
      
        EXIT WHEN c_player_bookings%NOTFOUND;
        
    
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || v_player_booking.Player_ID || ', Booking ID: ' || v_player_booking.Booking_ID || ', Status: ' || v_player_booking.Status);
    END LOOP;
    
    CLOSE c_player_bookings;
END;
/



----Cursor-based record

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE
   
    TYPE player_rec_type IS RECORD ( 
        player_id NUMBER, 
        first_name VARCHAR2(100),
        last_name VARCHAR2(100)
    );

    TYPE player_tab_type IS TABLE OF player_rec_type;

    v_players player_tab_type;
BEGIN
    SELECT p.Player_ID, p.First_Name, p.Last_Name 
    BULK COLLECT INTO v_players
    FROM Players p
    JOIN Belongs_To bt ON p.Player_ID = bt.Player_ID
    JOIN Can_Make cm ON bt.Team_ID = cm.Team_ID
    JOIN Booking b ON cm.Booking_ID = b.Booking_ID
    WHERE b.Status = 'Confirmed';  
    FOR i IN 1..v_players.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Player Name: ' || v_players(i).first_name || ' ' || v_players(i).last_name);
    END LOOP;
END;
/


-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
DECLARE
   
    TYPE player_team_rec_type IS RECORD (
        player_name VARCHAR2(100),
        team_name VARCHAR2(100)
    );

    
    TYPE player_team_tab_type IS TABLE OF player_team_rec_type;

  
    v_player_teams player_team_tab_type;
BEGIN
 
    SELECT p.First_Name || ' ' || p.Last_Name AS player_name, t.Team_Name
    BULK COLLECT INTO v_player_teams
    FROM Players p
    JOIN Belongs_To bt ON p.Player_ID = bt.Player_ID
    JOIN Team t ON bt.Team_ID = t.Team_ID;

    FOR i IN 1..v_player_teams.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Player: ' || v_player_teams(i).player_name || 
                             ' - Team: ' || v_player_teams(i).team_name);
    END LOOP;
END;
/

---row level trigger

-- Project: Outdoor Sports Management System
-- Semester: Summer 2025
-- Course Name: Advance Database Management Systems
-- Section: A
CREATE OR REPLACE TRIGGER update_phone_number_trigger
BEFORE INSERT ON Players
FOR EACH ROW
BEGIN
    :NEW.Phone_Number := UPPER(:NEW.Phone_Number);
END;
/