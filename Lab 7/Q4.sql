SELECT p.regno, COUNT(p.report_number) AS number_of_accidents, SUM(p.damage_amount) AS total_damage
FROM PARTICIPATED p
GROUP BY p.regno
HAVING COUNT(p.report_number) > 1;
