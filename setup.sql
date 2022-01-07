CREATE DATABASE wordle

--Creating a table of words based on a list of words
CREATE TABLE scrabble_words (
    word VARCHAR(16) UNIQUE NOT NULL
);

--Any list of words can be used. The ones I use have each word on a new line.
COPY scrabble_words FROM 'C:\Program Files\PostgreSQL\14\bin\wordle\collins_scrabble_words_2019.txt'
;




