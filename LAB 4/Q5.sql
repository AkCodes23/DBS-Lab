SELECT pe.name AS OWNER_NAME
FROM PERSON pe
WHERE pe.driver_id NOT IN (
  SELECT o.driver_id
  FROM OWNS o, PARTICIPATED p
  WHERE o.regno = p.regno
);
