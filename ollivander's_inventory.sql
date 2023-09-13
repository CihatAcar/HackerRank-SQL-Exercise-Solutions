/*
Harry Potter and his friends are at Ollivander's with Ron, 
finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is 
by determining the minimum number of gold galleons 
needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, 
and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.

Input Format
The following tables contain data on the wands in Ollivander's inventory:
Wands: The id is the id of the wand, code is the code of the wand, 
coins_needed is the total number of gold galleons needed to buy the wand, 
and power denotes the quality of the wand (the higher the power, the better the wand is). 

id: Integer
code: Integer
coins_needed: Integer
power: Integer

Wands_Property: The code is the code of the wand, 
age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. 
If the value of is_evil is 0, it means that the wand is not evil. 
The mapping between code and age is one-one, meaning that if there are two pairs,
(code1, age1) and (code2, age2), then code1 != code2 and age1 !=age2

code: Integer
age: Integer
is_evil: Integer
 */
SELECT w1.id, wp1.age, w1.coins_needed, w1.power
FROM Wands w1
JOIN Wands_Property wp1 ON w1.code = wp1.code
WHERE wp1.is_evil = 0 AND w1.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    JOIN Wands_Property wp2 ON  w2.code = wp2.code
    WHERE wp2.is_evil = 0 AND w2.power = w1.power AND wp2.age = wp1.age
)
ORDER BY w1.power DESC, wp1.age DESC;