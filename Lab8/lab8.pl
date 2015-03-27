/* Nate DeHorn */
/* CSC Lab 8 */


/* ------ Problem 1 Related ------ */

/* Facts about who's male */
male(nate).
male(thomas).
male(cornelius).
male(jim).
male(terry).
male(bruce).
male(nick).
male(chris).
male(matt).
make(chad).

/* Facts about who's female */
female(gwen).
female(grace).
female(gail).
female(nancy).
female(donna).
female(julie).
female(robin).
female(gracek).
female(sarah).

/* Facts describing parent, child relationships */ 
parent(thomas,nate).
parent(thomas,gracek).
parent(thomas,sarah).
parent(gwen,nate).
parent(gwen,gracek).
parent(gwen,sarah).
parent(cornelius,thomas).
parent(cornelius,gail).
parent(cornelius,nancy).
parent(cornelius,donna).
parent(grace,thomas).
parent(grace,gail).
parent(grace,nancy).
parent(grace,donna).
parent(jim,nick).
parent(jim,chris).
parent(gail,nick).
parent(gail,chris).
parent(bruce,robin).
parent(bruce,chad).
parent(donna,robin).
parent(donna,chad).

/* A definition for siblings - share the same parent */
siblings(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.

/* A definition for mother - a female parent */
mother(X,Y) :- parent(X,Y), female(X).

/* Alternate definitions for grandmother (mother's mother or father's mother). */
grandmother(X,Y) :- mother(X,Z), mother(Z,Y).
grandmother(X,Y) :- mother(X,Z), father(Z,Y).

/* Recursive definition of ancestor */
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

/* Father Relationship */
father(X,Y) :- parent(X,Y), male(X).

/* Daughter Relationship */
daughter(X,Y) :- female(X), parent(Y,X).

/* Son Relationship */
son(X,Y) :- male(X), parent(Y,X).

/* Sister Relationship */
sister(X,Y) :- siblings(X,Y), female(X), X \= Y.

/* Brother Relationship */
brother(X,Y) :- siblings(X,Y), male(X), X \= Y.

/* Grandfather Relationship */
grandfather(X,Y) :- father(X,Z), father(Z,Y).
grandfather(X,Y) :- father(X,Z), mother(Z,Y).

/* Aunt Relationship */
aunt(X,Y) :- sister(X,Z), father(Z,Y).
aunt(X,Y) :- sister(X,Z), mother(Z,Y).

/* Uncle Relationship */
uncle(X,Y) :- brother(X,Z), father(Z,Y).
uncle(X,Y) :- brother(X,Z), mother(Z,Y).

/* Cousin Relationship */
cousin(X,Y) :- parent(X,Z), uncle(Z,Y).
cousin(X,Y) :- parent(X,Z), aunt(Z,Y).


/* ----- Problem 2 Related ----- */

/* isnatural() function */
isnatural(0).
isnatural(X) :- X > 0, Y is X - 1, isnatural(Y).

/* factorial() function */
factorial(0,1).
factorial(A,B) :- A > 0, C is A - 1, factorial(C,D), B is A * D.

/* fibonacci() function */
fibonacci(0,1).
fibonacci(1,1).
fibonacci(A,B) :- A > 1, C is A - 1, E is A - 2, fibonacci(C,D), fibonacci(E,F), B is D + F.


/* ----- Problem 3 Related ----- */

/* Gives students the option between three math courses */
mathoption(X) :- taken(X,math,121).
mathoption(X) :- taken(X,math,205).
mathoption(X) :- taken(X,math,206).

/* Math Requirements */
math(X) :- taken(X,math,112), taken(X,math,117), mathoption(X).

/* CS Core Requirements */
cscore(X) :- taken(X,cs,111), taken(X,cs,112), taken(X,cs,211), taken(X,cs,221), taken(X,cs,222), taken(X,cs,231), taken(X,cs,241), taken(X,cs,399).

/* CS Elective Requirements */
cselectives(X) :- taken(X,cs,A), taken(X,cs,B), taken(X,cs,C), taken(X,cs,D), A > 299, B > 299, C > 299, D > 299, A \= 399, B \= 399, C \= 399, D \= 399.

/* Checks that the student has fulfilled the Math, CS Core, and CS Elective Requirements */
fulfilledCSMajor(X) :- math(X), cscore(X), cselectives(X).

/* This student, studentA, has fulfilled the BS in CS major requirements */
taken(studentA,cs,111).
taken(studentA,cs,112).
taken(studentA,cs,211).
taken(studentA,cs,221).
taken(studentA,cs,222).
taken(studentA,cs,231).
taken(studentA,cs,241).
taken(studentA,cs,399).
taken(studentA,math,112).
taken(studentA,math,117).
taken(studentA,math,121).
taken(studentA,cs,391).
taken(studentA,cs,385).
taken(studentA,cs,343).
taken(studentA,cs,341).

/* This student, studentB, has taken a lot, but has not fulfilled the */
/* BS in CS major requirements. */ 
taken(studentB,cs,111).
taken(studentB,cs,112).
taken(studentB,cs,221).
taken(studentB,cs,222).
taken(studentB,cs,231).
taken(studentB,cs,241).
taken(studentB,math,111).
taken(studentB,math,112).
taken(studentB,math,117).

/* This student, studentC, has not fulfilled the BS in CS major requirements */
taken(studentC,cs,101).
taken(studentC,cs,111).
taken(studentC,math,117).