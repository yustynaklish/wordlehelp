SELECT * FROM scrabble_words

--length of word
WHERE CHAR_LENGTH(word)=5 


--letters not in the word                         '[abc]' means neither a nor b nor c are in the word
AND word !~* '[.]'                

--correct letter in right place                   '^t.g..$' means the first letter is t and the third letter is g
AND word ~* '^.....$'            


--letter is somewhere in the word                 '(?=.*a)(?=.*b)' means both a and b are in the word somewhere
AND word ~* '(?=.*)(?=.*)(?=.*)(?=.*)(?=.*)'

--letter is not in this place                      '(^[.])|(^.[ab])|(^..[.])|(^...[.])|(^....[.])' means neither a nor b are in the second place
AND word !~* '(^[.])|(^.[.])|(^..[.])|(^...[.])|(^....[.])'




-- --only the last two are strictly necessary. As an example: if we know:
-- --          neither p nor q are in our word
-- --          s is the second letter of our word
-- --          a is in our word but isn't the first letter
-- --then our query can be expressed as:

-- AND word ~* '(?=.*a)(?=.*s)'
-- AND word !~* '(^[pqsa])|(^.[pq])|(^..[pqs])|(^...[pqs])|(^....[pqs])'