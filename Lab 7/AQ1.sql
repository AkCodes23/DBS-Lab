CREATE OR REPLACE PROCEDURE send_accident_alert(driver_id IN VARCHAR2) 
IS
  driver_name PERSON.name%TYPE;
  driver_address PERSON.address%TYPE;
BEGIN
  SELECT name, address INTO driver_name, driver_address
  FROM PERSON
  WHERE driver_id = driver_id;
  
  DBMS_OUTPUT.PUT_LINE('Alert: Driver ' || driver_name || ' (ID: ' || driver_id || ') has been involved in 2 accidents. Address: ' || driver_address);
END;


CREATE OR REPLACE TRIGGER accident_count_trigger
AFTER INSERT ON PARTICIPATED
FOR EACH ROW
DECLARE
  accident_count INT;
BEGIN
  SELECT COUNT(*)
  INTO accident_count
  FROM PARTICIPATED
  WHERE driver_id = :NEW.driver_id;

  IF accident_count = 2 THEN
    send_accident_alert(:NEW.driver_id);
  END IF;
END;
