CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size FROM dogs AS d, sizes AS s WHERE d.height > s.min AND d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child FROM parents, dogs WHERE name = parent ORDER BY -height;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  WITH pairs(r1, r2) AS (
    SELECT a.child, b.child FROM parents AS a, parents AS b
      WHERE a.parent = b.parent 
        AND a.child < b.child
  )
  SELECT r1 || " and " || r2 || " are " || s1.size || " siblings"
  FROM pairs, size_of_dogs AS s1, size_of_dogs AS s2
  WHERE s1.size = s2.size AND s1.name = r1 AND s2.name = r2;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
  WITH recs(group_dogs, num_dogs, last_dog, last_height, total_height) AS (
    select d1.name, 1, d1.name, d1.height, d1.height from dogs as d1 union 
    select group_dogs || ", " || d2.name, num_dogs+1, d2.name, d2.height, d2.height+total_height FROM recs, dogs as d2 WHERE num_dogs < 4 AND d2.height > last_height AND d2.name != last_dog
  )
  SELECT group_dogs, total_height FROM recs WHERE total_height >= 170 order by total_height;
