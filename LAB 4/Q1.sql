SELECT COUNT(DISTINCT o.driver_id) AS total_owners
FROM OWNS o, PARTICIPATED p, ACCIDENT a
WHERE o.regno = p.regno
  AND p.report_number = a.report_number
  AND EXTRACT(YEAR FROM a.accd_date) = 2022;
