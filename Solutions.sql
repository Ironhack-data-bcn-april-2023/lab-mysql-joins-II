# LAB MYSQL-SELECT
USE publications;

# Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id, au_lname, au_fname, title, pub_name FROM authors
JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
JOIN titles 
ON titles.title_id = titleauthor.title_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id;

# Challenge 2 - Who Have Published How Many At Where?
# How many titles each author has published at each publisher
SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(title) as title_count FROM authors
JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
JOIN titles 
ON titles.title_id = titleauthor.title_id
JOIN publishers 
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, pub_name;

# Challenge 3 - Best Selling Authors
# Who are the top 3 authors who have sold the highest number of titles?
SELECT authors.au_id, au_lname, au_fname, COUNT(title) as title_count FROM authors
JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
JOIN titles 
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY title_count DESC
LIMIT 3;

# Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id, au_lname, au_fname, COUNT(title) as title_count FROM authors
LEFT JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles 
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY title_count DESC;
