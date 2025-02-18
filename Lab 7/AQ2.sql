SELECT DISTINCT p.driver_id, pe.name, pe.address
FROM PARTICIPATED p
JOIN PERSON pe ON p.driver_id = pe.driver_id
WHERE NOT EXISTS (
    SELECT 1
    FROM OWNS o
    WHERE o.driver_id = p.driver_id
      AND o.regno = p.regno
);
