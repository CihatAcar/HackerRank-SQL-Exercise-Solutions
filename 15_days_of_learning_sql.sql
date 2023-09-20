/*
Julia conducted a 15 days of learning SQL contest. 
The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 
1 submission each day (starting on the first day of the contest), 
and find the hacker_id and name of the hacker who made maximum number of submissions each day. 
If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 
The query should print this information for each day of the contest, sorted by the date.

Input Format
The following tables hold contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
hacker_id: Integer
name: String

Submissions: The submission_date is the date of the submission, 
submission_id is the id of the submission, 
hacker_id is the id of the hacker who made the submission, 
and score is the score of the submission.
submission_date: Date
submission_id: Integer
hacker_id: Integer
score: Integer
 */
 SELECT 
    SubmissionDates.submission_date,
    (
        SELECT COUNT(DISTINCT hacker_id)
        FROM Submissions AS DailySubmissions
        WHERE 
            DailySubmissions.submission_date = SubmissionDates.submission_date 
            AND (
                SELECT COUNT(DISTINCT submission_date) 
                FROM Submissions AS HackerSubmissionDates 
                WHERE 
                    HackerSubmissionDates.hacker_id = DailySubmissions.hacker_id 
                    AND HackerSubmissionDates.submission_date < SubmissionDates.submission_date
            ) = DATEDIFF(SubmissionDates.submission_date, '2016-03-01')
    ) AS daily_hacker_count,
    (
        SELECT hacker_id 
        FROM Submissions AS MaxSubmissionHacker
        WHERE MaxSubmissionHacker.submission_date = SubmissionDates.submission_date
        GROUP BY hacker_id 
        ORDER BY COUNT(submission_id) DESC, hacker_id 
        LIMIT 1
    ) AS max_submission_hacker_id,
    (
        SELECT name 
        FROM Hackers 
        WHERE hacker_id = max_submission_hacker_id
    ) AS hacker_name
FROM
    (SELECT DISTINCT submission_date FROM Submissions) AS SubmissionDates
GROUP BY 
    SubmissionDates.submission_date;
