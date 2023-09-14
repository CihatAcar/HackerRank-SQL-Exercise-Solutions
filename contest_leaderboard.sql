/*
You did such a great job helping Julia with her last coding contest challenge that 
she wants you to work on this one, too! The total score of a hacker is 
the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers 
ordered by the descending score. If more than one hacker achieved the same total score, 
then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0
from your result.

Input Format
The following tables contain contest data:
Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
hacker_id: Integer
name: String

Submissions: The submission_id is the id of the submission, 
hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge that the submission belongs to, 
and score is the score of the submission.
submission_id: Integer
hacker_id: Integer
challenge_id: Integer
score: Integer

 */
SELECT h.hacker_id, h.name, SUM(max_score) AS total_score
FROM Hackers h
LEFT JOIN 
    (
        SELECT hacker_id, challenge_id, MAX(score) AS max_score
        FROM Submissions
        GROUP BY hacker_id, challenge_id
    ) AS MaxScorePerChallenge
ON h.hacker_id = MaxScorePerChallenge.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(max_score) > 0
ORDER BY SUM(max_score) DESC, h.hacker_id ASC;
