SELECT p.regno, SUM(p.damage_amount) AS total_damage
FROM PARTICIPATED p
GROUP BY p.regno
HAVING SUM(p.damage_amount) > specific_amount;
