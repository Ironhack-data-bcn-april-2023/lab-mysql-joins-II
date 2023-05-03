use publications;

SHOW TABLES FROM publications;

SELECT authors.au_id AS 'AUTHOR ID', 
       authors.au_lname AS 'LAST NAME', 
       authors.au_fname AS 'FIRST NAME', 
       titles.title AS 'TITLE', 
       publishers.pub_name AS 'PUBLISHER'
FROM authors 
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id;

SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS AUTHOR_LAST_NAME,
    publishers.pub_id AS PUBLISHER_ID,
    publishers.pub_name AS PUBLISHER_NAME,
    COUNT(titles.title_id) AS TITLE_COUNT
FROM 
    authors 
    JOIN titleauthor ON authors.au_id = titleauthor.au_id 
    JOIN titles ON titleauthor.title_id = titles.title_id 
    JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, publishers.pub_id;
    
Select  authors.au_id, au_lname, au_fname, count(qty) as book_sold 
    from authors
    join titleauthor on authors.au_id = titleauthor.au_id
    join titles on titleauthor.title_id = titles.title_id
    join sales on titles.title_id = sales.title_id
    GROUP BY authors.au_id
    order by book_sold desc
    limit 3;

Select  authors.au_id, au_lname, au_fname, count(qty) as book_sold 
    from authors
    left join titleauthor on authors.au_id = titleauthor.au_id
    left join titles on titleauthor.title_id = titles.title_id
    left join sales on titles.title_id = sales.title_id
    GROUP BY authors.au_id
    order by book_sold desc;


    





