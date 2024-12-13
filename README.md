# BallsAndBuckets
The "Balls And Buckets" Codility challenge solved for short sequences only.

The requirement that strings can be 100,000 characters makes this problem
difficult.  The solution here is not O(n) 

Problem:

There are N buckets arranged in a row list. Each bucket either is empty or contains a ball. 
    The buckets are specified as a string, buckets, consisting of characters, "." (empty bucket),
    and "B" (bucket with a ball). For example, "B.BB.B..B"

In one move you can take the ball out of any bucket and place it in another 
  (empty) bucket. Your goal is to arrange the balls to create an alternating sequence
   of full and empty buckets. In other words, the distance between two consecutive balls
   should be equal to 2. Note that the sequence may start at any bucket. 
   
What is the minimum number of moves required to create a correct sequence
   of balls in buckets? 
   
Write a function: (func solution (buckets[Int]) -> Int), that, 
   given a string, buckets, of length N, 
   returns the minimum number of moves required to create the described sequence. 
   
If it is impossible to create a correct sequence, return -1. 

Write an efficient algorithm for the following assumptions:

• the length of string buckets is within the range [1..100,000];

• string buckets is made only of the characters 'B' and/or'.;

• there is at least one ball in the buckets.

Examples: 

a) Given buckets = "..B....B.BB", 
  the function should return 2.
  
b) Given buckets = "BB.B.BBB..." 
  the function should return 4. 
  
c) Given buckets = BBB.B 
  the function should return -1 because it is impossible to create a correct sequence. 
  
d) Given buckets ="......B.B", the function should return 0. 
   There is no need to move any ball because the sequence is already correct.
   
