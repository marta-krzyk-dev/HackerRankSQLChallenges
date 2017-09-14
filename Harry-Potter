--Problem: https://www.hackerrank.com/challenges/harry-potter-and-wands

SELECT w.id, wp.age, w.coins_needed, w.power  --Select wand's id, age, price and power

FROM Wands as w INNER JOIN Wands_Property as wp ON w.code=wp.code

WHERE wp.is_evil=0 --Take only non-evil wands into consideration

AND (coins_needed = ( SELECT MIN(coins_needed)          --Select the cheapest wands in their range of power
                      FROM Wands INNER JOIN Wands_Property USING(code) 
                      WHERE Wands.power=w.power 
                      
AND Wands_Property.age=wp.age))

ORDER BY w.power DESC, wp.age DESC;
