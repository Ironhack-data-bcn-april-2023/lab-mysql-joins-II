USE publications;
-- Challenge 1
SELECT authors.au_id, au_lname, au_fname, title, pub_name FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
    JOIN titles ON titles.title_id = titleauthor.title_id
    JOIN publishers ON publishers.pub_id = titles.pub_id;
    
-- Challenge 2 NO CAN DO IT
SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(titles.title_id) FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
    JOIN titles ON titles.title_id = titleauthor.title_id
    JOIN publishers ON publishers.pub_id = titles.pub_id
		GROUP BY titleauthor.title_id, publishers.pub_name;
        
        
-- Challenge 3
SELECT authors.au_id, au_lname, au_fname, COUNT(sales.title_id) as total FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
    JOIN titles ON titles.title_id = titleauthor.title_id
    JOIN sales ON sales.title_id = titles.title_id
    GROUP BY au_id ORDER BY total DESC LIMIT 3;
    
-- Challenge 4

SELECT authors.au_id, au_lname, au_fname, COALESCE(COUNT(sales.title_id), 0) as total
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC;
