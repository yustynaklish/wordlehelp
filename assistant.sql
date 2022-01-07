SELECT * FROM scrabble_words

--length of word--
WHERE CHAR_LENGTH(word)=5


--letters not in word--
AND word !~* '[.]'                --eg '[abc]'


--correct letter in right place--
AND word ~* '^.....$'             --eg '^t.g..$'


--correct letter in wrong place-- 

--letter is in the word --
AND word ~* '.'                    --eg 'r'
AND word ~* '.'                    --eg 'i'
AND word ~* '.' 
AND word ~* '.'
--letter isn't in this place--
AND word !~* '^[.].'                --eg '^[ir].'
AND word !~* '^.[.]'                --eg ''^.[r]'
AND word !~* '^..[.]'
AND word !~* '^...[.]'
AND word !~* '.[.]$'
