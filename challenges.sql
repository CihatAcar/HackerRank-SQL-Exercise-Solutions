/*
Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges 
created by each student. Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges 
and the count is less than the maximum number of challenges created, 
then exclude those students from the result.

Input Format
The following tables contain challenge data:
Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
hacker_id: Integer
name: String

Challenges: The challenge_id is the id of the challenge, 
the hacker_id is the id of the hacker who created the challenge, 
and difficulty_level is the level of difficulty of the challenge.
challenge_id: Integer
hacker_id: Integer
 */
WITH HackerChallengeCount AS (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenge_count
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
MaxChallengeCount AS (
    SELECT MAX(challenge_count) AS max_challenge_count
    FROM HackerChallengeCount
),
RepeatedChallengeCount AS (
    SELECT challenge_count
    FROM HackerChallengeCount
    GROUP BY challenge_count
    HAVING COUNT(hacker_id) > 1
)
SELECT hcc.hacker_id, hcc.name, hcc.challenge_count
FROM HackerChallengeCount hcc
JOIN MaxChallengeCount mcc ON hcc.challenge_count = mcc.max_challenge_count
OR hcc.challenge_count NOT IN (SELECT challenge_count FROM RepeatedChallengeCount)
ORDER BY hcc.challenge_count DESC, hcc.hacker_id ASC;
