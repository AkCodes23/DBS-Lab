SELECT c.model, COUNT(DISTINCT p.report_number) AS number_of_accidents
FROM CAR c, PARTICIPATED p, ACCIDENT a
WHERE c.regno = p.regno
  AND p.report_number = a.report_number
  AND c.model = 'Honda City' 
GROUP BY c.model;
