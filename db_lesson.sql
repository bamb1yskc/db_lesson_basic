
-- 練習　レコードを作成してみよう
/*
INSERT INTO reports (person_id, content)
VALUES
('1', 'person NO1の日報です'),
('3', 'person NO3の日報です'),
('4', 'person NO4の日報です'),
('5', 'person NO5の日報です'),
('6', 'person NO6の日報です'),
('7', 'person NO7の日報です'),
('8', 'person NO8の日報です'),
('9', 'person NO9の日報です'),
('10', 'person NO10の日報です'),
('11', 'person NO11の日報です'),
('12', 'person NO12の日報です');
*/

-- 課題No1

  CREATE TABLE departments (
  department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- 課題No2

ALTER TABLE people
ADD COLUMN department_id INT unsigned AFTER email;


-- 課題No3 departments

INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');


-- 課題No3 people

INSERT INTO people (name, email, department_id, age, gender)
VALUES 
('ミッキーマウス', 'mickey@Disney.com', 1, 28, 1),
('ミニーマウス', 'minnie@Disney.com', 1, 28, 2),
('ドナルドダック', 'Donald@Disney.com', 1, 26, 1),
('デイジーダック', 'DAISY@Disney.com', 2, 26, 2),
('グーフィ', 'goofy@Disney.com', 2, 30, 1),
('チップ', 'chip@Disney.com', 2, 22, 1),
('デール', 'dale@Disney.com', 2, 22, 1),
('ウッディ', 'woody@Disney.com', 3, 29, 1),
('バズライトイヤー', 'buzz@Disney.com', 4, 32, 1),
('ジェシー', 'jesse@Disney.com', 5, 23, 2);


-- 課題No3 reports

INSERT INTO reports (person_id, content)
VALUES 
(7, '今日はみんなでダンスの練習をして楽しかったよ！'),
(8, '新しいリボンを作ってもらえてとても嬉しかったわ。'),
(9, '釣りに行ったけど全然釣れなくて悔しかった！'),
(10, 'みんなでカフェに行って素敵な時間を過ごしたわ。'),
(11, '今日はうっかり転んだけど笑って元気になったよ。'),
(12, 'デールとどんぐりを集めて森を探検したよ。'),
(13, 'チップと追いかけっこをしてたくさん走ったよ。'),
(14, '仲間を守るために今日もリーダーとして頑張った。'),
(15, '宇宙の平和を守る任務は今日も順調だった。'),
(16, 'ロデオの練習をして汗をかいたけど楽しかった！');


-- 課題No4

UPDATE people
SET department_id = 3
WHERE department_id IS NULL
AND age BETWEEN 20 AND 29;

UPDATE people
SET department_id = 4
WHERE department_id IS NULL
AND age BETWEEN 30 AND 39;

UPDATE people
SET department_id = 5
WHERE department_id IS NULL
AND age >= 40;

UPDATE people
SET department_id = 1
WHERE department_id IS NULL
AND age IS NULL;


-- 課題No5

SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;


-- 課題No6

/*
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
*/

日本語で説明
  peopleというテーブルから
  name email ageという名のカラムを取得している
　また、department_idが1のレコードだけに絞っている
　そして当てはまるレコードをcreated_at（作成時間）昇順で並べています


-- 課題No7

SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);


-- 課題No8

SELECT name, age
FROM people
WHERE department_id = 1
ORDER BY age ASC;


-- 課題No9

SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2
AND gender = 2;


-- 課題No10

SELECT p.name, d.name, r.content
FROM people p
JOIN departments d
ON p.department_id = d.department_id
JOIN reports r
ON p.person_id = r.person_id;


-- 課題No11

SELECT p.name
FROM people p
LEFT JOIN reports r
ON p.person_id = r.person_id
WHERE r.content IS NULL;



