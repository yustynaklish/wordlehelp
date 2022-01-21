/* 
p is the probability that anyone, out of all of today's players, guessed today's wordle on the first guess. 
I am using a binomial distribution to calculate this probability. 
This value can be adjusted to your preferred level of certainty.

s is the amount of words each guesser could choose. The word pool.
For the sake of simplicity, I am assuming s is the same for each player.
I am also assuming the word pool is strictly larger than the total set of wordle answers
There are 12972 valid guesses in wordle, but people are more likely to choose from a smaller set of more common words.


n is the amount of players. This is adjustable!

The probability that someone guesses today's wordle on the first try
= P(player's guess is in the set of all possible wordles)

2315/s^2 is the probability that someone guessed today's wordle on the first guess.
*/


SELECT 
s AS "word pool",
n AS "number of players",
p AS "probability"

FROM (
    WITH n AS (SELECT * FROM generate_series(1,10000) n),      -- adjust number of players here!
    s AS (SELECT * FROM generate_series(2315, 12972) s)     -- adjust word pool size here! 
    
    SELECT 
        n.n, 
        s.s,
        1-(1-s.s/(s.s^2))^n.n AS p

    FROM n,s
    
    ORDER BY p DESC
)t

WHERE p > 0.8                      -- adjust certainty here!
;








/* 
The code below finds the minimum number of players required to 
attain a probability of p that at least one of them gets Wordle 1/6, 
given a set amount of words each player can guess from (the word pool).
*/

-- SELECT 
-- s AS "word pool",
-- MIN(n) AS "min. no. of players",
-- MIN(p) AS "min. p(wordle 1/6)"

-- FROM (
--     WITH n AS (SELECT * FROM generate_series(1,100000) n), -- adjust max no. of players (second parameter in generate_series)
--     s AS (SELECT * FROM generate_series(2300, 13000, 100) s) -- adjust step count (third parameter in generate_series)
    
--     SELECT 
--         n.n, 
--         s.s,
--         1-(1-s.s/(s.s^2))^n.n AS p

--     FROM n,s
--     GROUP BY n, s
--     ORDER BY p DESC
-- )t

-- WHERE p > 0.99 -- adjust certainty here! 

-- GROUP BY s
-- ORDER BY s ASC
-- ;



