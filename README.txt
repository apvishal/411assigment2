Vishal Patel	vpatel589@csu.fullerton.edu
		CWID: 893928630

Class:		CPSC411
Assignment	3

Answers:
1. The max string is: acert with 8 occurances
2. 2015-09-08 00:39:30.339 a.out[2446:74943] The total time is: 9.908596 seconds 


Description:

This program reads an input file stream into an NSString, converts it to an 
NSArray, then into a mutable array.  each individual element, containing 
a string, will be converted into another mutable array, and will be sorted 
alphabetically. after being sorted it will be put back into the mutable array.
Once all strings have been sorted, the final mutable array will be sorted
alphabetically as well.  Once this is finished, the program will begin 
searching for anagrams.  Once completed, the program displays the most
frequent anagram, the amount of occurences it had, as well as the amount
of time that the program took to execute and find the result.  


How to run the program:

Professor, the program works as it should, but did not work when running
from xCode on either of my two computers.  I was able to get this program 
running sucessfully from the terminal.  The instructions below will show how
I ran the program from the terminal.

Steps:
1.Navigate into the folder Assignment3VPATEL411
2.Navigate into the folder read_file 
	(the folder should contain main.m and words.txt)
3.Once you are in this directory, you may run the program by entering the
following commands:

	gcc -framework Foundation main.m
	./a.out

4. The program will execute and display the results!
