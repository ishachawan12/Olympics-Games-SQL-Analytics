Select * From Broadcast;
Select * From EVENTS_UPDATED;
Select * From OFFICIALS;
Select * From EVENTS;
Select * from Organizers;
Select * from IS_TRACKED_BY;

CREATE TABLE IS_TRACKED_BY (
    broadcastID CHAR(6),
    eventID CHAR(6),
    PRIMARY KEY (broadcastID, eventID ),
    FOREIGN KEY (broadcastID) REFERENCES Broadcast(broadcastID),
    FOREIGN KEY (eventID ) REFERENCES EVENTS(eventID )
);

CREATE TABLE OFFICIATES (
    officialID CHAR(6),
    eventID CHAR(6),
    PRIMARY KEY (officialID, eventID ),
    FOREIGN KEY (officialID) REFERENCES OFFICIALS(officialID),
    FOREIGN KEY (eventID ) REFERENCES EVENTS(eventID )
);

CREATE TABLE ORGANIZES(
    organizersID CHAR(6),
    eventID CHAR(6),
    PRIMARY KEY (organizersID, eventID ),
    FOREIGN KEY (organizersID) REFERENCES Organizers(organizersID),
    FOREIGN KEY (eventID) REFERENCES EVENTS (eventID)
);

CREATE TABLE ATHLETES_EVENTS(
    athleteID CHAR(6),
    events VARCHAR2(30),
    PRIMARY KEY (athleteID, events),
    FOREIGN KEY (athleteID) REFERENCES ATHLETES_UPDATED(athleteID)
);

-- IS_TRACKED_BY
-- Insert statement for ('B00101', 'EV0001')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00101', 'EV0001');

-- Insert statement for ('B00202', 'EV0002')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00202', 'EV0002');

-- Insert statement for ('B00303', 'EV0003')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00303', 'EV0003');

-- Insert statement for ('B00404', 'EV0004')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00404', 'EV0004');

-- Insert statement for ('B00505', 'EV0005')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00505', 'EV0005');

-- Insert statement for ('B00606', 'EV0006')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00606', 'EV0006');

-- Insert statement for ('B00707', 'EV0007')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00707', 'EV0007');

-- Insert statement for ('B00808', 'EV0008')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00808', 'EV0008');

-- Insert statement for ('B00909', 'EV0009')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B00909', 'EV0009');

-- Insert statement for ('B01010', 'EV0010')
INSERT INTO IS_TRACKED_BY (broadcastID, eventID) VALUES ('B01010', 'EV0010');

commit;

--OFFICIATES
-- Insert statement for ('OFC001', 'EV0001')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC001', 'EV0001');

-- Insert statement for ('OFC002', 'EV0002')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC002', 'EV0002');

-- Insert statement for ('OFC003', 'EV0003')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC003', 'EV0003');

-- Insert statement for ('OFC004', 'EV0004')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC004', 'EV0004');

-- Insert statement for ('OFC005', 'EV0005')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC005', 'EV0005');

-- Insert statement for ('OFC006', 'EV0006')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC006', 'EV0006');

-- Insert statement for ('OFC007', 'EV0007')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC007', 'EV0007');

-- Insert statement for ('OFC008', 'EV0008')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC008', 'EV0008');

-- Insert statement for ('OFC009', 'EV0009')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC009', 'EV0009');

-- Insert statement for ('OFC010', 'EV0010')
INSERT INTO OFFICIATES (officialID, eventID) VALUES ('OFC010', 'EV0010');


commit;


