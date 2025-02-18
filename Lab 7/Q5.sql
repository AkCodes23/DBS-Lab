SELECT a.location, AVG(p.damage_amount) AS average_damage
FROM ACCIDENT a, PARTICIPATED p
WHERE a.report_number = p.report_number
GROUP BY a.location;
