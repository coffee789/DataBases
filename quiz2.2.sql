--PART1
--1. c) 1,2,4,6 --> because, we match them with each other since it has 2 in the row. hence, it is the correct answer (the answer also could be 3,4,6,8 and 3,4,7,9)
--2. d) 2,5,3 --> because, it is in both tuples
--3. a) because, gpa is less important and applyid and appy.cname comes from college
--4
--5



--PART2

--task 6. List movie titles and average ratings, from highest-rated to lowest-rated.
--If two or more movies have the same average rating, list them in alphabetical order.

SELECT title, AVG(stars) as average FROM Movie INNER JOIN Rating USING(mID) GROUP BY mID ORDER BY average DESC, title;

--task 7. For each movie that has at least one rating, find the lowest number of stars that movie received.
-- Return the movie title and number of stars. Sort by movie title.

SELECT title, MIN(stars) FROM Movie INNER JOIN Rating USING(mID) GROUP BY mID ORDER BY title;

--task 8. Some reviewers didn't provide a date with their rating.
-- Find the names of all reviewers who have ratings with a NULL value for the date.

SELECT name FROM Reviewer INNER JOIN Rating USING (rID) WHERE ratingDate NULL;

--task 9. . Create materialized view for the next statement. Find the titles of all movies that have no ratings.

CREATE MATERIALIZED VIEW movies_with_no_ratings SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating);

--10. Create role with any name and give select and update privileges on the previous view.
CREATE role any_name GRANT UPDATE, SELECT to any_name on movies_with_no_ratings;

