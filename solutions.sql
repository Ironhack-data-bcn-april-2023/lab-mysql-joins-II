USE publications;
Select  authors. au_id, authors.au_lname, authors.au_fname, title, pub_name
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
JOIN publishers
ON titles.pub_id=publishers.pub_id

-- CHALLENGE 2
-- query how many titles each author has published at each publisher. 

Select  authors. au_id, authors.au_lname, authors.au_fname, count(title), pub_name
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
JOIN publishers
ON titles.pub_id=publishers.pub_id
group by pub_name, authors.au_id

-- CHALLENGE 3

Select  authors. au_id, authors.au_lname, authors.au_fname, count(title)
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY count(title) DESC
limit 3

-- CHALLENGE 4
Select  authors. au_id, authors.au_lname, authors.au_fname, count(title)
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY COUNT(TITLE) DESC



	