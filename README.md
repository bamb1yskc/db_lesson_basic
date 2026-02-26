課題No6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

日本語で説明
  peopleというテーブルから
  name email ageという名のカラムを取得している
　また、department_idが1のレコードだけに絞っている
　そして当てはまるレコードをcreated_at（作成時間）順で並べています