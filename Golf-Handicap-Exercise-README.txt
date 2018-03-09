The exercise is to calculate a golfers handicap based on the CSV of their score information provided.

The (simplified) rules to calculating a handicap are as follows:

Take the golfers scores for each round and calculate the "Differential" for each round.  To calculate the differential, you use the following formula:
((SCORE - RATING) * 113) / SLOPE

First step is to sort the rounds by their date in descending order, if the golfer has more than 20 rounds, take only the most recent 20 rounds for scores, if the golfer has less than 5 rounds you can not calculate their handicap and an error should be raised.
After you have the set of rounds you are going to use there is some logic based on the number of rounds for how many rounds from that set you will use to calculate the handicap.

The logic is in the following table:

# ROUNDS | # SCORES
-------------------
5        | 1
6        | 1
7        | 2
8        | 2
9        | 3
10       | 3
11       | 4
12       | 4
13       | 5
14       | 5
15       | 6
16       | 6
17       | 7
18       | 8
19       | 9
20       | 10

Based on the number of rounds *that you have scores for*, you sort the scores by differential asc, and take the first X where X is the number of scores from the table above.
From those X scores, you take the average differential *from the score* and then multiple by 96%.
That number will be the handicap for the golfer.

I have provided a CSV of scores for rounds of golf. Please create a script that will read the file and create an instance of a Round for each record.  You will then have a Handicap class that has a set of rounds and will calculate the Handicap based on the rounds passed to that class.  All of the logic for choosing the rounds to use to calculate the handicap should be in the Handicap class.

Please round the handicap to 2 decimal places.  The correct answer should be 19.97.

