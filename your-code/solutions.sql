USE publication;

-- Challenge 1 - Who Have Published What At Where?

SELECT
titleauthor.au_id,
authors.au_lname,
authors.au_fname,
titles.title,
publishers.pub_name
FROM
publication.titleauthor,
publication.authors,
publication.titles,
publication.publishers
WHERE
titleauthor.au_id = authors.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT
titleauthor.au_id,
authors.au_lname,
authors.au_fname,
publishers.pub_name,
COUNT(titles.title_id) AS title_count
FROM
publication.titleauthor,
publication.authors,
publication.titles,
publication.publishers
WHERE
titleauthor.au_id = authors.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id
GROUP BY
titleauthor.au_id, publishers.pub_name;

-- Challenge 3 - Best Selling Authors (Top 3)

SELECT
titleauthor.au_id,
authors.au_lname,
authors.au_fname,
COUNT(titles.title_id) AS total
FROM
publication.titleauthor,
publication.authors,
publication.titles
WHERE
titleauthor.au_id = authors.au_id
AND titleauthor.title_id = titles.title_id
GROUP BY
titleauthor.au_id
ORDER BY
total DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking (All 23)

SELECT
titleauthor.au_id,
authors.au_lname,
authors.au_fname,
COALESCE(COUNT(titles.title_id), 0) AS total
FROM
publication.titleauthor,
publication.authors,
publication.titles
WHERE
titleauthor.au_id = authors.au_id
AND titleauthor.title_id = titles.title_id
GROUP BY
titleauthor.au_id
ORDER BY
total DESC;

