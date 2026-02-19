-- first lets see what tables we have and what columns they got

\d forum_posts
\d forum_accounts
\d emptystack_accounts

-- ok so the clue says the post was made in april 2048, lets find it

SELECT * FROM forum_posts WHERE date >= '2048-04-01' AND date < '2048-05-01';

-- found a post called "Get rich fast" where the guy talks about his dad at EmptyStack
-- author is smart-money-44

SELECT author FROM forum_posts WHERE title = 'Get rich fast';

-- now i need to find out who smart-money-44 actually is

SELECT * FROM forum_accounts WHERE username = 'smart-money-44';

-- its Brad Steele. so his dad should also have last name Steele
-- looking for other Steeles on the forum

SELECT * FROM forum_accounts WHERE last_name = 'Steele' AND first_name != 'Brad';

-- got two people: Andrew Steele and Kevin Steele
-- need to check which one works at EmptyStack

SELECT * FROM emptystack_accounts WHERE last_name = 'Steele';

-- Andrew Steele is in there! username: triple-cart-38, password: password456
-- logged in with node mainframe.cjs and got emptystack.sql
-- loaded it into the database, now checking the new tables

\d emptystack_messages
\d emptystack_projects

-- the assignment mentions self-driving taxis so im looking for TAXI in messages

SELECT * FROM emptystack_messages WHERE subject LIKE '%TAXI%';

-- theres a message from your-boss-99 about Project TAXI
-- need to find the boss's password

SELECT * FROM emptystack_accounts WHERE username = 'your-boss-99';

-- password is notagaincarter
-- now finding the project ID for TAXI

SELECT * FROM emptystack_projects WHERE code = 'TAXI';

-- project ID is DczE0v2b
-- ran node mainframe.cjs -stop with:
--   username: your-boss-99
--   password: notagaincarter
--   project ID: DczE0v2b
-- 5... 4... 3... 2... 1... project shutdown complete!