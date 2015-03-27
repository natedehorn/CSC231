# Lab 5
<b>Introduction to Erlang - The Basics</b>

<b>Created by:</b> Nate DeHorn

User defined functions found in Lab5

Part 1a
=======
```Erlang
	fourthPower(N)
```
This function finds N^4 by taking an input `N` and multiplying it by itself three more times.

Part 1b
=======
```Erlang
	square(N)
```
This function finds N^2 by taking an input `N` and multiplies it by itself.

```Erlang
	forthPower2(N)
```
This function also calculates N^4, but does so by first calculating the square of `N`, then multiplying that by the square of `N` again.This can also be done by doing square(square(N)), or in plain english, taking the square of the square of `N`.

Part 1c
=======
```Erlang
	median3({A,B,C})
```
This function calculates the median by first identifying the largest value of the tuple. Once we know the largest value, we can find the median by comparing the other two lesser values. The larger of these is the median. This function will work if any or all of the values are equal also.

Part 2a
=======
```Erlang
	factorial(N)
```
This calculates N factorial for some input `N`. First, when N == 0 and when N == 1 is defined, then it recursively steps through each multiplication of the factorial until N == 1. Once this point is reached, you know that the factorial calculation is completed.

Part 2b
=======
```Erlang
	getNth(L,N)
```
This finds the Nth item out of a list. First, if the user wants the first element of the list, then it just returns the head of the list. Otherwise, the function goes through the list using the cycleOnce function to ignore the previous head element and look at the next element to see if it is the Nth element yet. This continues until the statement N == 1 is true, then you know that the current head is the Nth element.

Part 2c
=======
```Erlang
	logarithm(X,Y)
```
This finds the power of `X` that equals `Y`. First, if X == Y, then the power is just 1. Otherwise, the function divides `Y` by `X` continuously, counting the amount of times it takes until the X == Y condition is satisfied. It then returns the amount of divisions/steps that occured before this condition was satisfied.

Part 2d
=======
```Erlang
	largest(L)
```
Given a list of integers, this function will return the largest element. If the tail of the list is empty, meaning there is only one item in the list, then it returns the head, which is the only element in the list and therefore is the largest element. Then there are always two possibilities. First, you check if the head is larger than the head of the tail. If this is true, then you push the head into the tail and then recursively call largest. The other case is when the head of the tail is greater than the head. For this case, largest is recursively called on just the tail. This will eventually shrink the list to one element, the largest.

Part 2e
=======
```Erlang
	contains(Item,List)
```
Given a list, this function will return true or false based on if the list contains a specific item. If the list is empty, it immediately returns false. Otherwise, it will step through the list checking for a match. If it finds one, it returns true. If it gets through the whole list and List == [] becomes satisfied, then it returns false.