# Lab 8
<b>Introduction to Prolog</b>

<b>Created by:</b> Nate DeHorn

# User defined functions found in Lab 8:

##Problem 1:
```Prolog
	father(X,Y)
```
Determines if X is a father of Y.
This method takes an input X and Y and calls parent(X,Y) to determine if X is a parent of Y. If this is true, then calls male(X) to check if X is male. If this is true, then X must be the father of Y.

```Prolog
	daughter(X,Y)
```
Determines if X is a daughter of Y.
This method takes an input X and Y and calls female(X) to check if X is female. If this is true, then it calls parent(Y,X) to determine if Y is a parent of X. If this is true, then X is the daughter of Y.

```Prolog
	son(X,Y)
```
Determines if X is a son of Y.
This method takes an input X and Y and calls male(X) to check if X is male. If this is true, then it calls parent(Y,X) to determine if Y is a parent of X. If this is true, then X is the son of Y.

```Prolog
	sister(X,Y)
```
Determines if X is a sister of Y.
This method takes an input X and Y and calls siblings(X,Y) to determine if X and Y are siblings. If this is true, then it calls female(X) to check if X is female. If this is true, then it checks that X is not the same as Y. If this is true, then X and Y must be sisters.

```Prolog
	brother(X,Y)
```
Determines if X is a brother of Y.
This method takes an input X and Y and calls siblings(X,Y) to determine if X and Y are siblings. If this is true, then it calls male(X) to check if X is male. If this is true, then it checks that X is not the same as Y. If this is true, then X and Y must be brothers.

```Prolog
	grandfather(X,Y)
```
Determines if X is a grandfather of Y.
This method takes an input X and Y and calls father(X,Z) to determine if X is a father for any Z. If this is true, then it must check two things: it calls father(Z,Y) and mother(Z,Y) to determine if Z is either a father or mother of Y. If either one of these is true, then X must be a grandfather of Y.

```Prolog
	aunt(X,Y)
```
Determines if X is an aunt of Y.
This method takes an input X and Y and calls sister(X,Z) to determine if X is a sister for any Z. If this is true, then it must check two things: it calls father(Z,Y) and mother(Z,Y) to determine if Z is either a father or mother of Y. If either one of these is true, then X must be an aunt of Y.

```Prolog
	uncle(X,Y)
```
Determines if X is an uncle of Y.
This method takes an input X and Y and calls brother(X,Z) to determine if X is a brother for any Z. If this is true, then it must check two things: it calls father(Z,Y) and mother(Z,Y) to determine if Z is either a father or mother of Y. If either one of these is true, then X must be an uncle of Y.

```Prolog
	cousin(X,Y)
```
Determines if X is a cousin of Y.
This method takes an input X and Y and calls parent(X,Z) to determine if X is a parent for any Z. If this is true, then it must check two things: it calls uncle(Z,Y) and aunt(Z,Y) to determine if Z is either an uncle or aunt of Y. If either of these is true, then X must be a cousin of Y.


##Problem 2:
```Prolog
	isnatural(X)
```
Determines if X is a natural number.
This method takes an input X and checks if it is equal to zero. If this is true, then we know X is a natural number. Otherwise, it checks if X is greater than zero. If this is true, then it recursively calls isnatural(Y), where Y equals X-1, until X is no longer greater than 0. At this point, if Y equals 0, then X must be a natural number.

```Prolog
	factorial(A,B)
```
Determines A factorial (A!) and places the value in B.
This method takes an input A and checks if it is equal to zero. If this is true, then the factorial is 1. Otherwise, it checks if X is greater than zero. If this is true, then it recurively calls factorial(C,D), where C equals A-1, and sets B equal to A*D.

```Prolog
	fibonacci(A,B)
```
Determines the fibonacci values of A and places the sum of these values in B.
This method takes an input A and checks if it is equal to 0 or 1. If this is true, then the fibonacci secuence is just 1. Otherwise, it checks if A is greater than 1. If this is true, then it recursively calls fibonacci(C,D) and fibonacci(E,F), where C equals A-1 and E equals A-2, then sets B equal to D+F.


##Problem 3:
```Prolog
	mathoption(X)
```
Determines if a student X has completed their optional math course required for the CS major At Wake Forest University.
This method takes an input X and checks if one of three things is true: it calls taken(X,math,121) to check if a student X has taken math 121, calls taken(X,math,205) to check if a student X has taken math 205, and calls taken(X,math,206) to check if a student X has taken math 206. If any of these statements is true, then mathoption(X) is true.

```Prolog
	math(X)
```
Determines if a student X has completed the math courses required for the CS major At Wake Forest University.
This method takes an input X and checks three things: it calls taken(X,math,112) to check if a student X has taken math 112, it calls taken(X,math,117) to check if a student X has taken math 117, and it calls mathoption(X) to check if a student X has taken their optional math requirement. If all of these statements are true, then math(X) is true.

```Prolog
	cscore(X)
```
Determines if a student X has completed their core CS courses required for the CS major At Wake Forest University.
This method takes an input X and checks many things: it calls taken(X,cs,111) to check if a student X has taken CS 111, it calls taken(X,cs,112) to check if a student X has taken CS 112, it calls taken(X,cs,211) to check if a student X has taken CS 211, it calls taken(X,cs,221) to check if a student X has taken CS 221, it calls taken(X,cs,231) to check if a student X has taken CS 231, it calls taken(X,cs,241) to check if a student X has taken CS 241, and it calls taken(X,cs,399) to check if a student X has taken CS 399. If all of these statements are true, then cscore(X) is true.

```Prolog
	cselectives(X)
```
Determines if a student X has completed their CS elective courses required for the CS major At Wake Forest University.
This method takes an input X and checks four things: it calls taken(X,cs,A), taken(X,cs,B), taken(X,cs,C), and taken(X,cs,D) where A,B,C, and D are all greater than 299 and not equal to 399. If all of these statements are true, then cselectives(X) is true.

```Prolog
	fulfilledCSMajor(X)
```
Determines if a student X has completed all the courses required for the CS major At Wake Forest University.
This method takes an input X and checks three things: it calls math(X) to check if a student X has completed their math portion of the CS major, it calls cscore(X) to determine if a student X has completed the required courses for the CS major, and it calls cselectives to check if a student has completed their elective courses for the CS major. If all of these statements are true, then fulfilledCSMajor(X) is true.