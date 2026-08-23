/*Problem Description:

The academic team wants to see which students passed their Math or Science exams in 2024 (passing score is 70 or above), 
ranked from highest score to lowest.

The result must contain the following columns:

student_name — name of the student
subject — the exam subject
score — the score they achieved*/

select student_name,
subject, score from exam_scores
where subject in ('Math', 'Science') and
score >= 70 and exam_date > '2023-12-31' and exam_date < '01-01-2025'
order by score desc
limit 5
