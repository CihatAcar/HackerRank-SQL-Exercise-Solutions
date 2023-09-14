/*
Samantha interviews many candidates from different colleges using coding challenges and contests. 
Write a query to print the contest_id, hacker_id, name, 
and the sums of total_submissions, total_accepted_submissions, total_views, 
and total_unique_views for each contest sorted by contest_id. 
Exclude the contest from the result if all four sums are 0

Note: A specific contest can be used to screen candidates at more than one college, 
but each college only holds 1 screening contest.

Input Format
The following tables hold interview data:
Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, 
and name is the name of the hacker.
contest_id: Integer
hacker_id: Integer
name: String

Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates. 
college_id: Integer
contest_id: Integer

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, 
and college_id is the id of the college where the challenge was given to candidates. 
challenge_id: Integer
college_id: Integer

View_Stats: The challenge_id is the id of the challenge, 
total_views is the number of times the challenge was viewed by candidates, 
and total_unique_views is the number of times the challenge was viewed by unique candidates.
challenge_id: Integer
total_views: Integer
total_unique_views: Integer

Submission_Stats: The challenge_id is the id of the challenge, 
total_submissions is the number of submissions for the challenge, 
and total_accepted_submission is the number of submissions that achieved full scores. 
challenge_id: Integer
total_submissions: Integer
total_accepted_submissions: Integer
 */
-- Outer query filters the aggregated stats to only include those with non-zero activity and orders them by contest_id
SELECT 
    * 
FROM 
    (
        -- AggregatedStats subquery groups the data by contest and hacker and sums up the individual stats
        SELECT 
            ContestDetails.contest_id,
            ContestDetails.hacker_id,
            ContestDetails.name,
            SUM(ContestDetails.total_submissions) AS TotalSubmissions,
            SUM(ContestDetails.total_accepted_submissions) AS TotalAcceptedSubmissions,
            SUM(ContestDetails.total_views) AS TotalViews,
            SUM(ContestDetails.total_unique_views) AS TotalUniqueViews
        FROM 
            (
                -- IndividualStats subquery fetches the contest details and individual stats for each challenge
                SELECT 
                    con.contest_id,
                    con.hacker_id,
                    con.name,
                    IFNULL((SELECT SUM(s.total_submissions) FROM Submission_Stats s WHERE s.challenge_id = cha.challenge_id GROUP BY s.challenge_id), 0) AS total_submissions,
                    IFNULL((SELECT SUM(s.total_accepted_submissions) FROM Submission_Stats s WHERE s.challenge_id = cha.challenge_id GROUP BY s.challenge_id), 0) AS total_accepted_submissions,
                    IFNULL((SELECT SUM(v.total_views) FROM View_Stats v WHERE v.challenge_id = cha.challenge_id GROUP BY v.challenge_id), 0) AS total_views,
                    IFNULL((SELECT SUM(v.total_unique_views) FROM View_Stats v WHERE v.challenge_id = cha.challenge_id GROUP BY v.challenge_id), 0) AS total_unique_views
                FROM 
                    Contests con
                    INNER JOIN Colleges col ON con.contest_id = col.contest_id
                    INNER JOIN Challenges cha ON cha.college_id = col.college_id
            ) AS ContestDetails
        GROUP BY 
            ContestDetails.contest_id,
            ContestDetails.hacker_id,
            ContestDetails.name
    ) AS AggregatedStats
WHERE 
    (AggregatedStats.TotalSubmissions <> 0 
    OR AggregatedStats.TotalAcceptedSubmissions <> 0 
    OR AggregatedStats.TotalViews <> 0 
    OR AggregatedStats.TotalUniqueViews <> 0)
ORDER BY 
    AggregatedStats.contest_id;
