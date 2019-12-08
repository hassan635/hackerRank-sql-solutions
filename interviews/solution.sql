with Submission_Stats_CTE as (select Submission_Stats.challenge_id, SUM(Submission_Stats.total_submissions) AS total_submissions, SUM(Submission_Stats.total_accepted_submissions) AS total_accepted_submissions from Submission_Stats group by Submission_Stats.challenge_id), 

View_Stats_CTE as (select View_Stats.challenge_id, SUM(View_Stats.total_views) AS total_views, SUM(View_Stats.total_unique_views) as total_unique_views from View_Stats group by View_Stats.challenge_id) 

select Contests.contest_id, Contests.hacker_id, Contests.name, SUM(Submission_Stats_CTE.total_submissions) AS total_c_submissions, SUM(Submission_Stats_CTE.total_accepted_submissions) as total_c_accepted_submissions, SUM(View_Stats_CTE.total_views) as total_c_views, 
SUM(View_Stats_CTE.total_unique_views) as total_c_unique_views 
from Contests inner join Colleges on Contests.contest_id = Colleges.contest_id inner join Challenges on Colleges.college_id = Challenges.college_id left join View_Stats_CTE on Challenges.challenge_id = View_Stats_CTE.challenge_id left join Submission_Stats_CTE on Challenges.challenge_id = Submission_Stats_CTE.challenge_id 
group by Contests.contest_id, Contests.hacker_id, Contests.name 
having sum(Submission_Stats_CTE.total_submissions) + sum(Submission_Stats_CTE.total_accepted_submissions) <> 0 and sum(View_Stats_CTE.total_views) <> 0 and sum(View_Stats_CTE.total_unique_views) <> 0 order by Contests.contest_id;
