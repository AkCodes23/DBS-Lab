SELECT pe.name AS OWNER_NAME, COUNT(p.report_number) AS No_of_Accidents, SUM(p.damage_amount) AS Total_Damage_Amount
FROM PERSON pe, OWNS o, PARTICIPATED p
WHERE pe.driver_id = o.driver_id
  AND o.regno = p.regno
GROUP BY pe.name
ORDER BY Total_Damage_Amount DESC;
