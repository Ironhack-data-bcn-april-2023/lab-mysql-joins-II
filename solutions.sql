## Challenge 1 - Who Have Published What At Where?

use publications;
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', 
pub_name as 'PUBLISHER' FROM AUTHORS
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;

## Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME',  
pub_name as 'PUBLISHER', COUNT(title) as 'TITLE COUNT' FROM AUTHORS
	JOIN titleauthor 
		ON titleauthor.au_id = authors.au_id
	JOIN titles 
		ON titles.title_id = titleauthor.title_id
	JOIN publishers 
		ON publishers.pub_id = titles.pub_id
	GROUP BY authors.au_id, pub_name;

## Challenge 3 - Best Selling Authors

SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
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
    
