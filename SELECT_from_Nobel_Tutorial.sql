-- Winners from 1950
SELECT yr, subject, winner FROM nobel
WHERE yr = 1950

-- 1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- Albert Einstein
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein'

-- Recent Peace Prizes
SELECT winner FROM nobel
WHERE yr>=2000 AND subject = 'Peace'

-- Literature in the 1980's
SELECT yr,subject,winner FROM nobel
WHERE subject='Literature' AND yr >= 1980 AND yr <= 1989

-- Only Presidents
SELECT yr,subject,winner FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- John
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

-- Chemistry and Physics from different years
SELECT yr, subject,winner  FROM nobel
WHERE (yr=1980 AND subject='Physics')
   OR (yr=1984 AND subject='Chemistry' )

-- Exclude Chemists and Medics
SELECT yr,subject,winner FROM nobel
WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine';

-- Early Medicine, Late Literature
SELECT yr,subject,winner FROM nobel
WHERE (subject = 'Medicine' AND yr<1910)
      OR   (subject = 'Literature' AND yr>=2004 )

-- Umlaut
SELECT * FROM nobel
WHERE winner ='PETER GRÜNBERG'

-- Apostrophe
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- Knights of the realm
SELECT winner, yr, subject from nobel
WHERE winner LIKE 'Sir%';
ORDER BY yr,name

-- Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner


