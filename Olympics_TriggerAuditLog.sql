CREATE OR REPLACE TRIGGER log_athlete_changes
BEFORE DELETE OR INSERT OR UPDATE ON ATHLETES_UPDATED
FOR EACH ROW
DECLARE
  -- Declare variables for the operation type, attribute name, old value, and updated value
  v_operation VARCHAR2(10);
  v_attribute_name VARCHAR2(30);
  v_old_value VARCHAR2(255);
  v_updated_value VARCHAR2(255);

BEGIN
  -- Determine the operation type
  IF DELETING THEN
    v_operation := 'DELETE';
    v_attribute_name := 'athleteID';
    v_old_value := :OLD.athleteID;
    v_updated_value := NULL;
  ELSIF INSERTING THEN
    v_operation := 'INSERT';
    v_attribute_name := 'athleteID';
    v_old_value := NULL;
    v_updated_value := :NEW.athleteID;
  ELSIF UPDATING THEN
    v_operation := 'UPDATE';

    -- Set the attribute name, old value, and updated value based on the updated column
    CASE
      WHEN :OLD.country IS NOT NULL AND :NEW.country != :OLD.country THEN
        BEGIN
          v_attribute_name := 'country';
          v_old_value := :OLD.country;
          v_updated_value := :NEW.country;
        END;
      WHEN :OLD.gender IS NOT NULL AND :NEW.gender != :OLD.gender THEN
        BEGIN
          v_attribute_name := 'gender';
          v_old_value := :OLD.gender;
          v_updated_value := :NEW.gender;
        END;
      WHEN :OLD.Fname IS NOT NULL AND :NEW.Fname != :OLD.Fname THEN
        BEGIN
          v_attribute_name := 'Fname';
          v_old_value := :OLD.Fname;
          v_updated_value := :NEW.Fname;
        END;
      WHEN :OLD.Lname IS NOT NULL AND :NEW.Lname != :OLD.Lname THEN
        BEGIN
          v_attribute_name := 'Lname';
          v_old_value := :OLD.Lname;
          v_updated_value := :NEW.Lname;
        END;
      WHEN :OLD.DOB IS NOT NULL AND :NEW.DOB != :OLD.DOB THEN
        BEGIN
          v_attribute_name := 'DOB';
          v_old_value := :OLD.DOB;
          v_updated_value := :NEW.DOB;
        END;
      WHEN :OLD.height IS NOT NULL AND :NEW.height != :NEW.height THEN
        BEGIN
          v_attribute_name := 'height';
          v_old_value := :OLD.height;
          v_updated_value := :NEW.height;
        END;
      WHEN :OLD.weight IS NOT NULL AND :NEW.weight != :NEW.weight THEN
        BEGIN
          v_attribute_name := 'weight';
          v_old_value := :OLD.weight;
          v_updated_value := :NEW.weight;
        END;
      ELSE
        v_attribute_name := NULL;
        v_old_value := NULL;
        v_updated_value := NULL;
    END CASE;
  END IF;

  -- Insert information into the audit log table if an attribute value has changed
  IF v_attribute_name IS NOT NULL THEN
    INSERT INTO AUDIT_LOG (operationType, tableName, columnName, oldValue, newValue, dateChanged)
    VALUES (v_operation, 'ATHLETES', v_attribute_name, v_old_value, v_updated_value, CURRENT_TIMESTAMP);
  END IF;
END;
/

-- Working
INSERT INTO ATHLETES_UPDATED (athleteID, country, gender, Fname, Lname, DOB, height, weight)
VALUES ('ATH031', 'France', 'Female', 'Lydia', 'Rojas', TO_DATE('1990-03-11', 'YYYY-MM-DD'), 180.50, 75.20);

-- Working
UPDATE ATHLETES_UPDATED
SET FNAME = 'Perec'
WHERE ATHLETEID = 'ATH023';

--Working
DELETE FROM ATHLETES_UPDATED
WHERE ATHLETEID = 'ATH031';



SELECT * From AUDIT_LOG;
Select * FROM Athletes_UPDATED;
DROP trigger LOG_ATHLETE_CHANGES;

ALTER TRIGGER LOG_ATHLETE_CHANGES DISABLE;

COMMIT;


SELECT * FROM BROADCAST;