CREATE TABLE tweets (
    tweet_id INT PRIMARY KEY,
    user_id INT,
    msg TEXT,
    tweet_date TIMESTAMP
);

-- Insert data into the `tweets` table
INSERT INTO tweets (tweet_id, user_id, msg, tweet_date) VALUES
(214252, 111, 'Am considering taking Tesla private at $420. Funding secured.', '2021-12-30 00:00:00'),
(739252, 111, 'Despite the constant negative press covfefe', '2022-01-01 00:00:00'),
(846402, 111, 'Following @NickSinghTech on Twitter changed my life!', '2022-02-14 00:00:00'),
(241425, 254, 'If the salary is so competitive why won’t you tell me what it is?', '2022-03-01 00:00:00'),
(231574, 148, 'I no longer have a manager. I can’t be managed', '2022-03-23 00:00:00');


 SELECT 
    tweet_count AS tweet_bucket,
    COUNT(user_id) AS num_users
FROM (
    SELECT 
        user_id,
        COUNT(*) AS tweet_count
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY user_id
) tweet_counts
GROUP BY tweet_count
ORDER BY tweet_bucket;