# Lab 7
<b>Advanced Erlang: Higher Order Functions, Type Definitions</b>

<b>Created by:</b> Nate DeHorn

# User defined functions found in Lab 7: 

##Part 1a
```Erlang
	extractEvens()
```
This method takes a list and builds a new list containing just even numbers from the original list. It uses a helper method called isEven() to check that a number is even or not. isEven() works by taking an input value and determining if the number divided by two has a remainder or not. If it does, then the number is not even, if it is, then it is even.

##Part 1b
```Erlang
	extractAWords()
```
This method takes a list and builds a new list containing just words from the original list that begin with the letter "A". It uses a helper method called isAWord() to check if a word begins with an "A" or not. isAWord() works by taking an input string and checking if the first letter in the string is "A". If the first letter is "A", then we return true, otherwise, we return false.

##Part 1c
```Erlang
	logicalOR()
```
This method takes a list and looks through it to see if any of the items in it are true. If there is a true anywhere in the list, then logicalOR() will also return true. If the list only contains falses, however, then logicalOR() will return false. This function works by using the filter method to iterate through each item in the list, and using the isTrue() helper method to check if an item is true or false. isTrue() works by checking if a single item is true. If it is true, it returns true; if it is false, it returns false.

##Part 1d
```Erlang
	longStrings()
```
This method takes a list of strings and returns all strings that are "long" (greater than 3 characters long). It works by using the filter method to extract elements from the list, then checking if they are "long" by using the method isLongString(). isLongString() works to check if strings are greater than 3 characters by taking an input string and checking if the length is greater than 3. If it is, then it returns true; otherwise, it returns false.

##Part 1e
```Erlang
	strcat()
```
This method takes a list and combines all the values into a single string. Here we use the reduce method, combined with the "fun" keyword to apply mergewords() to every item in the list. mergewords() works by taking two lists and returning the sum of them. 

##Part 1f
```Erlang
	max()
```
This method takes a list and returns the largest value in the list. This is done by using the reduce method, combined with the "fun" keyword to apply largest() to every item in the list. largest() works by simply returning the largest of two values.

##Part 2
```Erlang
	findInTree()
```
This method takes an item and a tree input, and searches the tree to see if the item is in the tree. This utilizes the helper function inTree(), which for searches the tree for a specified item. If the passed in item is null, then the node does not exist, so return false. Otherwise, we recursively sift through each node of the tree, checking if the specified value matches the value of the current node we are at in the tree. if it exists, it returns true.

##Part 3
```Erlang
	getExpression()
```
This method takes a tree input which contains operators and numbers, 
and returns the evaluated answer. This is done by calling the helper function evalNode(). evalNode() is a helper method that recursively calls itself on children nodes, combining two numerical values and an operator by the manner specified in the tree, until the node has no more children values, then it returns the final value.