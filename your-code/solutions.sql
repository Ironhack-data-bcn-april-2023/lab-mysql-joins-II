USE publications;



# CHALLENGE 1
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title AS TITLE, pub_name as PUBLISHER
	FROM authors
		JOIN titleauthor 
			ON authors.au_id= titleauthor.au_id
		JOIN titles 
			ON titleauthor.title_id = titles.title_id
		JOIN publishers
			ON titles.pub_id = publishers.pub_id;  -- 25 rows
            
            
SELECT au_ord
FROM titleauthor;  -- 25 rows


# CHALLENGE 2        

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, pub_name as PUBLISHER, COUNT(titles.title_id) as title_count
	FROM titles
		JOIN titleauthor 
			ON  titles.title_id = titleauthor.title_id
        JOIN authors
			ON titleauthor.au_id = authors.au_id
		JOIN publishers
			ON titles.pub_id = publishers.pub_id 
	GROUP BY pub_name, authors.au_id
	ORDER BY title_count DESC;    -- 24 rows
            

-- The sum number should be the same as the total number of records in Table titleauthor.


SELECT COUNT(au_ord) as count_au
FROM titleauthor;  -- 25 rows


# CHALLENGE 3

SELECT  authors.au_id, au_lname, au_fname, count(qty) as book_sold 
	FROM authors
        JOIN titleauthor 
			ON authors.au_id = titleauthor.au_id
        JOIN titles 
			ON titleauthor.title_id = titles.title_id
        JOIN sales
			ON titles.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY book_sold desc
        limit 3;


# CHALLENGE 4
 SELECT  authors.au_id, au_lname, au_fname, count(qty) as book_sold 
	FROM authors
        LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
        LEFT JOIN titles on titleauthor.title_id = titles.title_id
        LEFT JOIN sales on titles.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY book_sold DESC;

