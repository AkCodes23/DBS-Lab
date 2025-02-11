CREATE OR REPLACE FUNCTION get_total_accidents_by_license(license IN VARCHAR2) 
RETURN INT 
IS
  total_accidents INT;
BEGIN
  SELECT COUNT(*)
  INTO total_accidents
  FROM PARTICIPATED
  WHERE regno = license;
  
  RETURN total_accidents;
END;
/

SELECT get_total_accidents_by_license('KA01AB1234') FROM DUAL;
/
