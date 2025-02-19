SELECT pe.name AS OWNER_NAME, EXTRACT(YEAR FROM a.accd_date) AS Year, COUNT(p.report_number) AS No_of_Accidents
FROM PERSON pe, OWNS o, PARTICIPATED p, ACCIDENT a
WHERE pe.driver_id = o.driver_id
  AND o.regno = p.regno
  AND p.report_number = a.report_number
GROUP BY pe.name, EXTRACT(YEAR FROM a.accd_date)
ORDER BY pe.name, Year;
