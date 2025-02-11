CREATE OR REPLACE PROCEDURE display_total_damage(
  driver_id IN VARCHAR2, 
  year IN INT
) 
IS
  total_damage INT;
BEGIN
  SELECT SUM(p.damage_amount) INTO total_damage
  FROM PARTICIPATED p
  JOIN ACCIDENT a ON p.report_number = a.report_number
  WHERE p.driver_id = driver_id
    AND EXTRACT(YEAR FROM a.accd_date) = year;
    
  DBMS_OUTPUT.PUT_LINE('Total Damage for Driver ' || driver_id || ' in Year ' || year || ' is ' || total_damage);
END;
/

BEGIN
  display_total_damage('Ak23', 2022);
END;
/
