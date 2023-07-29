1.constraint to generate unique numbers between 99 to 100.
2.constraint divisible by 5
3.write a constraint for 4bit dynamic array the size of the array should be in between 15 to 20.there should be even number in odd locations and odd number in even locations.
4.write a constraint for two random variables such that one variable should not match the other and the total number of bits toggled in one variable should be 5 w.r.t the other. 
5.write a constraint such that when rand  bit [3:0] a is randomized the value of "a" should not be same as 5 previous occurrences of the value of "a".
6.constraint to generate 0,1,x and z randomly.
7.write a program using dynamic array
  .array1: no.of elements should be between 30-40.
  ..array2:sum of all elements should be <100
  ...array3: sum of all elements should be >100.
8.theree are two constraints applied to same variable . one will generate the value with in the range of [25:50] and another expression should be generate than 40 .what should be the value generated ,and what is the reason?
9.constraint with array size of 5 to 10 values & the array values should be in ascending order.
10.constraint with array size of 5 to 10 values & the array values should be in descending order.
11.constraint for 0-100 range 70% and for 101-255 range 30%.
12.without inside operator generate random values for the range 34-43.
13.generate unique values without using rand or randc.
14.randomize the belowvariables:
    class randvar;
       rand bit [7:0] var1,var2,var3,var4;
    endclass

   1.randomize all variables.
   2.randomize only var2.
   3.randomize var1 and var4.
   4.randomize var1,var3 and var4.
15.write a single constraint to generate  random values for bit [8:0] variable in the below range 1-34,127,129-156,192-202,257-260
16.generate unique random values without using unique constraint.
17.what is wrong with the below code?what the correct process to write the constraint ?
   class const;
      rand bit [7:0] low,mid,high;
        constraint const_1{low < mid < high;}
   endclass
18.write a constraint for 16-bit variables such that no two consecutive (continuous )ones should be generated.
19.write a constraint using $countones.
20.generate a 32-bit random number with only one bit set(should not use $countones).
21.having 16-bit of variable,only single bit high values need to be accessed .write a constraint for that?
22.write a constraint to generate random values for var1[7:0] within 50 and var2[7:0] with the non-repeated value in every randomization.
23.write a constraint to randomly generated unique prime numbers in an array between 1 and 200. the generated prime numbers should have 7 in it (eg:7:17,37...etc)?
24.write a constraint to generate multiples of power 2?


   



