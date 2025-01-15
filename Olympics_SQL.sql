CREATE TABLE JUDGES (
    officialID CHAR(6),
    sportID CHAR(6),
    PRIMARY KEY (officialID, sportID),
    FOREIGN KEY (officialID) REFERENCES OFFICIALS(officialID),
    FOREIGN KEY (sportID) REFERENCES SPORTS(sportID)
);
-- Insert data into JUDGES table
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC002', 'SPT002');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC007', 'SPT007');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC011', 'SPT011');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC017', 'SPT013');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC012', 'SPT014');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC001', 'SPT001');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC006', 'SPT001');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC016', 'SPT001');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC008', 'SPT003');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC013', 'SPT003');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC004', 'SPT004');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC009', 'SPT009');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC018', 'SPT018');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC015', 'SPT015');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC020', 'SPT020');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC005', 'SPT005');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC010', 'SPT010');
INSERT INTO JUDGES (officialID, sportID) VALUES ('OFC019', 'SPT019');


CREATE TABLE SPORTS_EQUIPMENTS (
    equipmentID CHAR(6),
    sportID CHAR(6),
    PRIMARY KEY (equipmentID, sportID),
    FOREIGN KEY (equipmentID) REFERENCES EQUIPMENTS(equipmentID),
    FOREIGN KEY (sportID) REFERENCES SPORTS(sportID)
);

-- Insert data into SPORTS_EQUIPMENTS table
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP011', 'SPT010'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP012', 'SPT018'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP013', 'SPT003'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP014', 'SPT016'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP015', 'SPT005'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP016', 'SPT010'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP017', 'SPT008'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP018', 'SPT014'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP019', 'SPT003'); 
INSERT INTO SPORTS_EQUIPMENTS (equipmentID, sportID) VALUES ('EQP020', 'SPT006'); 


CREATE TABLE INDULGES_IN (
    DOPING_RESULTID CHAR(6),
    athleteID CHAR(6),
    PRIMARY KEY (DOPING_RESULTID, athleteID),
    FOREIGN KEY (DOPING_RESULTID) REFERENCES DOPING_RESULTS (DOPING_RESULTID),
    FOREIGN KEY (athleteID) REFERENCES ATHLETES(athleteID)
);

-- Create Sells_Ticket_Events table
CREATE TABLE SELLS_TICKET_EVENTS (
    eventID CHAR(6),
    ticketcategoryID CHAR(6),
    PRIMARY KEY (eventID, ticketcategoryID),
    FOREIGN KEY (eventID) REFERENCES EVENTS(eventID),
    FOREIGN KEY (ticketcategoryID) REFERENCES TICKET_CATEGORY(ticketcategoryID)
);

INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0001', 'TC0001');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0002', 'TC0002');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0003', 'TC0003');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0004', 'TC0004');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0005', 'TC0005');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0006', 'TC0006');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0007', 'TC0007');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0008', 'TC0008');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0009', 'TC0009');
INSERT INTO SELLS_TICKET_EVENTS (eventID, ticketcategoryID) VALUES ('EV0010', 'TC0010');

CREATE TABLE AUDIT_LOG (
  operationType VARCHAR2(10) NOT NULL,
  tableName VARCHAR2(30) NOT NULL,
  columnName VARCHAR2(30) NOT NULL,
  oldValue VARCHAR2(255),
  newValue VARCHAR2(255),
  dateChanged TIMESTAMP NOT NULL
);

DROP TABLE  AUDIT_LOG;

CREATE TABLE TICKET_CATEGORY_UPDATED (
    ticketcategoryID CHAR(6),
    listedPrice DECIMAL(10, 2) NOT NULL,
    categoryName VARCHAR2(255),
    ticketType VARCHAR2(30) NOT NULL,
    availability VARCHAR2(30),
    seatInformation VARCHAR2(30),
    PRIMARY KEY (ticketcategoryID)
);

CREATE TABLE TICKET_SALE_UPDATED (
    transactionID CHAR(6),
    ticketcategoryID CHAR(6),
    purchasePrice NUMBER(20,2),
    ticketQuantity NUMBER(4,2) NOT NULL,
    paymentMethod VARCHAR2(25) NOT NULL,
    PRIMARY KEY (transactionID, ticketcategoryID),
    FOREIGN KEY (ticketcategoryID) REFERENCES TICKET_CATEGORY(ticketcategoryID)
);

DROP TABLE TICKET_SALE_UPDATED;

-- Insert Data into Ticket Category
INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0100', 30, 'Sports', 'General Admission', 'Available', 'Seat info for TC0100');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0101', 50, 'Sports', 'Regular', 'Available', 'Seat info for TC0101');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0102', 75, 'Sports', 'Premium', 'Available', 'Seat info for TC0102');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0104', 100, 'Sports', 'VIP', 'Available', 'Seat info for TC0104');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0105', 25, 'Ceremony', 'General Admission', 'Available', 'Seat info for TC0105');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0106', 45, 'Ceremony', 'Regular', 'Available', 'Seat info for TC0106');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0107', 70, 'Ceremony', 'Premium', 'Available', 'Seat info for TC0107');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0108', 90, 'Ceremony', 'VIP', 'Available', 'Seat info for TC0108');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0109', 10, 'Conference', 'General Admission', 'Limited', 'Seat info for TC0109');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0110', 25, 'Conference', 'Regular', 'Available', 'Seat info for TC0110');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0111', 35, 'Conference', 'Premium', 'Available', 'Seat info for TC0111');

INSERT INTO TICKET_CATEGORY_UPDATED (ticketCategoryID, listedPrice, categoryName, ticketType, availability, seatInformation)
VALUES ('TC0112', 50, 'Conference', 'VIP', 'Limited', 'Seat info for TC0112');


TRUNCATE TABLE TICKET_CATEGORY;


-- Inser Into Ticket Sales
INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0001', 'TC0100', 7, 'Cash');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0002', 'TC0101', 6, 'Debit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0003', 'TC0102', 11, 'Credit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0004', 'TC0104', 2, 'Credit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0005', 'TC0105', 11, 'Debit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0006', 'TC0106', 7, 'Cash');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0007', 'TC0107', 1, 'Debit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0008', 'TC0108', 5, 'Cash');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0009', 'TC0109', 21, 'Debit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0010', 'TC0110', 9, 'Credit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0011', 'TC0111', 3, 'Debit card');

INSERT INTO TICKET_SALE_UPDATED (transactionID, ticketcategoryID, ticketQuantity, paymentMethod)
VALUES ('TS0012', 'TC0112', 4, 'Credit card');

TRUNCATE TABLE TICKET_SALE_UPDATED;

DELETE FROM TICKET_SALE
WHERE transactionID = 'TS0001';

Commit;