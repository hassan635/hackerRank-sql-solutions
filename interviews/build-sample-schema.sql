create table contests (
  contest_id int,
  hacker_id int,
  name nvarchar(100)
);

insert into contests values (66406, 17973,'Rose'),(66556,79153,'Angela'),(94828, 80275,'Frank');

create table colleges (
  college_id int,
  contest_id int
);

insert into colleges values (11219, 66406),(32473, 66556),(56685,94828);

create table challenges (
  challenge_id int,
  college_id int
);

insert into challenges values
  (18765, 11219),
  (47127, 11219),
  (60292, 32473),
  (72974, 56685);

create table view_stats (
  challenge_id int,
  total_views int,
  total_unique_views int
); 

insert into view_stats values
  (47127, 26, 19),
  (47127, 15, 14),
  (18765, 43, 10),
  (18765, 72, 13),
  (75516, 35, 17),
  (60292, 11, 10),
  (72974, 41, 15),
  (75516, 75, 11);

create table submission_stats (
  challenge_id int,
  total_submissions int,
  total_accepted_submissions int
);

insert into submission_stats values
  (75516, 34, 12),
  (47127, 27, 10),
  (47127, 56, 18),
  (75516, 74, 12),
  (75516, 83, 8),
  (72974, 68, 24),
  (72974, 82, 14),
  (47127, 28, 11);

  
