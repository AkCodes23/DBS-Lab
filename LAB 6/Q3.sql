CREATE OR REPLACE PROCEDURE display_accident_info(location_name IN VARCHAR2) 
IS
  CURSOR accident_cursor IS
    SELECT report_number, accd_date, location
    FROM ACCIDENT
    WHERE location = location_name;
BEGIN
  FOR accident_record IN accident_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Report Number: ' || accident_record.report_number);
    DBMS_OUTPUT.PUT_LINE('Accident Date: ' || accident_record.accd_date);
    DBMS_OUTPUT.PUT_LINE('Location: ' || accident_record.location);
  END LOOP;
END;
/

BEGIN
  display_accident_info('MG Road, Bengaluru');
END;
/
