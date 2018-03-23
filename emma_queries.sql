USE el_adlister_db;

SELECT * FROM ads;
SELECT * FROM categories;
SELECT * FROM users;
SELECT * FROM ad_category;

-- For a given ad, what is the email address of the user that created it?
SELECT CONCAT(u.first_name, ' ', u.last_name) AS user_full_name, u.email, a.title
FROM users AS u
  JOIN ads AS a
    ON u.id = a.user_id
WHERE a.id = 8;

-- For a given ad, what category, or categories, does it belong to?
SELECT a.title, c.name
FROM ads AS a
  JOIN ad_category AS ac
    ON a.id = ac.ads_id
  JOIN categories AS c
    ON ac.category_id = c.cat_id
WHERE a.id = 8
ORDER BY a.title;

SELECT name
FROM categories
  WHERE cat_id IN (
    SELECT category_id
    FROM ad_category
      WHERE ads_id = (
        SELECT id
        FROM ads
          WHERE ads.id =8
  )
);

-- For a given category, show all the ads that are in that category.
SELECT a.title
FROM ads AS a
  WHERE id IN (
    SELECT ads_id
    FROM ad_category
      WHERE category_id = (
        SELECT cat_id
        FROM categories
          WHERE cat_id=2
  )
);

SELECT ads.title
FROM ads
  JOIN ad_category a
    ON ads.id = a.ads_id
  JOIN categories c
    ON a.category_id = c.cat_id
WHERE cat_id=2;

-- For a given user, show all the ads they have posted.
SELECT a.title
FROM ads AS a
  WHERE user_id IN (
    SELECT id
    FROM users
      WHERE user_id = 6
  );

SELECT *
FROM users
JOIN ads a ON users.id = a.user_id
WHERE user_id = 6;

SELECT concat(u.first_name, ' ', u.last_name) as FULL_NAME, title, price, name
FROM users as u
JOIN ads a ON u.id = a.user_id
JOIN ad_category a2 ON a.id = a2.ads_id
JOIN categories c ON a2.category_id = c.cat_id
ORDER BY price DESC ;

SELECT * FROM users;

