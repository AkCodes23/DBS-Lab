CREATE OR REPLACE PROCEDURE identify_no_accident_drivers 
IS
  CURSOR driver_cursor IS
    SELECT p.driver_id, p.name, p.address
    FROM PERSON p
    WHERE NOT EXISTS (
      SELECT 1
      FROM PARTICIPATED pa
      WHERE pa.driver_id = p.driver_id
    );
BEGIN
  FOR driver_record IN driver_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Driver ID: ' || driver_record.driver_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || driver_record.name);
    DBMS_OUTPUT.PUT_LINE('Address: ' || driver_record.address);
  END LOOP;
END;
/

BEGIN
  identify_no_accident_drivers;
END;
/
