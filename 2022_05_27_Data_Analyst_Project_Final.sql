---1 How many rows in this table--1793
Select count(*)
FROM data_analyst_jobs;

---2 First 10 rows and what company is associated with the job posting on row 10---ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

---3a Postings in TN---21
SELECT count(*)   --count(location) will produce same result
FROM data_analyst_jobs
WHERE location = 'TN';

---3b Postings in TN or KY---27
SELECT count(*)   --count(location) will produce same result
FROM data_analyst_jobs
WHERE (location = 'TN' or location  = 'KY');

---4 TN postings w/ above 4 stars---3
SELECT count(*)   --count(location) will produce same result
FROM data_analyst_jobs
WHERE location = 'TN' 
AND star_rating > 4;

---5 Total postings review count between 500 and 1000---151
SELECT count(*)    --count(review_count) will produce same result
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

---6 Average star rating for each company per state - state with highest average rating---NE
SELECT AVG(star_rating) AS avg_rating
      ,location AS state
FROM data_analyst_jobs
GROUP by location
--HAVING AVG(star_rating) IS NOT NULL --This line will remove the nulls that show up
ORDER by avg_rating DESC;


---7 Unique Job Titles---881
SELECT count (DISTINCT title)
FROM data_analyst_jobs;

---8 Unique Jobs California companies---230
SELECT count (DISTINCT title)
FROM data_analyst_jobs
WHERE location  = 'CA';

---9 Company Name avg star rating for companies that have 5000+ reviews acrosss locations---40
SELECT DISTINCT company
      ,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP by company
ORDER by company;

---10 Company Name avg star rating for companies that have 5000+ reviews acrosss locations sorted
---highest to lowest average star rating--Company is AMEX with rating 4.1999998
SELECT DISTINCT company
      ,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP by company
ORDER by avg_rating DESC;

---11 Find all the job titles that contain the word ANALYST and confirm count---754
SELECT count (DISTINCT title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

---12  #job titles that do not contain 'Analyst' or 'Analytics'---4 jobs with common word Tableau
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE UPPER(title) NOT LIKE '%ANALYST%'
  AND UPPER(title) NOT LIKE '%ANALYTICS%';

---BONUS  # jobs by industry that require SQL and posted longer than 3 weeks--
---Internet/Software, Banks/Financial Services, Consulting/Business Services, Health Care
---62, 61, 57, 52
SELECT DISTINCT domain, count(skill) AS sql_jobs_over_3wks
FROM data_analyst_jobs
WHERE domain is NOT NULL
    AND UPPER(skill) LIKE '%SQL%'
	AND days_since_posting > 21
GROUP by domain
ORDER by sql_jobs_over_3wks DESC, domain
















