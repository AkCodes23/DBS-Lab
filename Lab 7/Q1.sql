CREATE OR REPLACE TRIGGER display_driver_info
AFTER INSERT ON PARTICIPATED
FOR EACH ROW
DECLARE
  driver_name PERSON.name%TYPE;
  driver_address PERSON.address%TYPE;
BEGIN
  SELECT name, address INTO driver_name, driver_address
  FROM PERSON
  WHERE driver_id = :NEW.driver_id;
  
  DBMS_OUTPUT.PUT_LINE('Driver ID: ' || :NEW.driver_id);
  DBMS_OUTPUT.PUT_LINE('Driver Name: ' || driver_name);
  DBMS_OUTPUT.PUT_LINE('Driver Address: ' || driver_address);
  DBMS_OUTPUT.PUT_LINE('Accident Report Number: ' || :NEW.report_number);
  DBMS_OUTPUT.PUT_LINE('Car Registration Number: ' || :NEW.regno);
  DBMS_OUTPUT.PUT_LINE('Damage Amount: ' || :NEW.damage_amount);
END;
