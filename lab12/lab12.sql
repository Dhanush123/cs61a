.read sp17data.sql
.read fa17data.sql

CREATE TABLE obedience AS
  SELECT seven, denero, hilfinger FROM students;

CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 18 ORDER BY smallest LIMIT 20;

CREATE TABLE greatstudents AS
  SELECT a.date, a.color, a.pet, a.number, b.number FROM students_pt1 AS a, sp17students AS b WHERE a.date = b.date AND a.color = b.color AND a.pet = b.pet;

CREATE TABLE sevens AS
  SELECT s.seven FROM students AS s, checkboxes AS c WHERE s.time = c.time AND s.number = 7 AND c."7" = "True";

CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;
