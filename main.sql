# Challenge 1 - Who Have Published What At Where?
#In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
USE publications;
SELECT authors.au_id as AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS F_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM publishers
    JOIN titles
		ON publishers.pub_id=titles.pub_id
    JOIN titleauthor
		ON titles.title_id=titleauthor.title_id
	JOIN authors
		ON titleauthor.au_id=authors.au_id;

## Challenge 2 - Who Have Published How Many At Where?
#Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
USE publications;
SELECT authors.au_id as AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS F_NAME, COUNT(titles.title) AS TITLE, publishers.pub_name AS PUBLISHER
FROM publishers
    JOIN titles
		ON publishers.pub_id=titles.pub_id
    JOIN titleauthor
		ON titles.title_id=titleauthor.title_id
	JOIN authors
		ON titleauthor.au_id=authors.au_id
        GROUP BY 
		authors.au_id, pub_name;

## Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT authors.au_id as 'AUTHOR_ID', au_lname as 'LAST_NAME', au_fname as 'FIRST_NAME', 
COUNT(sales.title_id) as 'TOTAL' FROM authors
    JOIN titleauthor 
        ON titleauthor.au_id = authors.au_id
    JOIN titles 
        ON titles.title_id = titleauthor.title_id
    JOIN sales
        ON sales.title_id = titles.title_id
    GROUP BY authors.au_id
    ORDER BY COUNT(sales.title_id) DESC
    LIMIT 3;        
        
## Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
COUNT(sales.title_id) as 'TOTAL' FROM authors
    LEFT JOIN titleauthor 
        ON titleauthor.au_id = authors.au_id
    LEFT JOIN titles 
        ON titles.title_id = titleauthor.title_id
    LEFT JOIN sales
        ON sales.title_id = titles.title_id
    GROUP BY authors.au_id
    ORDER BY COUNT(sales.title_id) DESC
    LIMIT 23;
