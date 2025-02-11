CREATE OR REPLACE FUNCTION get_total_accidents(year INT) 
RETURN INT 
IS
  total_accidents INT;
BEGIN
  SELECT COUNT(*) INTO total_accidents
  FROM ACCIDENT
  WHERE EXTRACT(YEAR FROM accd_date) = year;
  RETURN total_accidents;
END;
/


SELECT get_total_accidents(2022) FROM DUAL;
