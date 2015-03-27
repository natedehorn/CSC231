-module(lab6Tester).
-export([test1/0,test2a/0,test2b/0,test2c/0,test3a/0,test3b/0,test3c/0,test4/0,test5/0,test6a/0,test6b/0]).

test1() ->
	io:write(lab6:productOfPairs([])), 
	io:format("\n"), 
	io:write(lab6:productOfPairs([3])), 
	io:format("\n"),
	io:write(lab6:productOfPairs([3,2])),
	io:format("\n"),
	%io:write(lab6:productOfPairs([2,3,4])),	%added test case (odd number of elements , larger than one)
	%io:format("\n").
	io:write(lab6:productOfPairs([2,3,4,5])),
	io:format("\n").

test2a() ->
	io:write(lab6:polyadd([],[])),  %added test case (two empty lists)
	io:format("\n"),
	io:write(lab6:polyadd([],[2.0,4.0,6.0])), 
	io:format("\n"), 
	io:write(lab6:polyadd([2.0,4.0,6.0],[])), 
	io:format("\n"),
	io:write(lab6:polyadd([2.0,4.0,6.0],[2.0,4.0,6.0])), 	%added test case (lists of equal value length)
	io:format("\n"),
	%io:write(lab6:polyadd([2.0,4.0,6.0,8.0],[2.0,4.0,6.0])),	%added test case (first list has more elements than the second)
	%io:format("\n").
	io:write(lab6:polyadd([2.0,4.0,6.0],[2.0,4.0,6.0,8.0])),
	io:format("\n").

test2b() ->
	io:write(lab6:polydiff([],[])),  %added test case (two empty lists)
	io:format("\n"),
	io:write(lab6:polydiff([],[2.0,4.0,6.0])), 
	io:format("\n"), 
	io:write(lab6:polydiff([2.0,4.0,6.0],[])), 
	io:format("\n"),
	io:write(lab6:polydiff([2.0,4.0,6.0],[2.0,4.0,6.0])), 	%added test case (lists of equal value length)
	io:format("\n"),
	%io:write(lab6:polydiff([2.0,4.0,6.0,8.0],[2.0,4.0,6.0])),	%added test case (first list has more elements than the second)
	%io:format("\n").
	io:write(lab6:polydiff([2.0,4.0,6.0],[2.0,4.0,6.0,8.0])),
	io:format("\n").

test2c() ->
	io:write(lab6:polyeval([],2.0)),	%added test case (empty list passed as polynomial)
	io:format("\n"), 
	io:write(lab6:polyeval([2.0],2.0)),
	io:format("\n"), 
	io:write(lab6:polyeval([1.0,2.0],2.0)),
	io:format("\n"), 
	io:write(lab6:polyeval([0.0,0.0,3.0],2.0)),
	io:format("\n").

test3a() ->
	io:write(lab6:member(2,[])),	%added test case (member of empty list)
	io:format("\n"),
	io:write(lab6:member(2,[1,2,3])),
	io:format("\n"),
	io:write(lab6:member(4,[1,2,3])),
	io:format("\n").

test3b() ->
	io:write(lab6:delete(2,[])),	%added test case (delete from empty list)
	io:format("\n"),
	io:write(lab6:delete(2,[2])),	%added test case (deleting only element in list)
	io:format("\n"),
	io:write(lab6:delete(2,[1,2,3])),
	io:format("\n"),
	io:write(lab6:delete(4,[1,2,3])),
	io:format("\n").

test3c() ->
	io:write(lab6:insert(2,[])),	%added test case (insert into the empty list)
	io:format("\n"),
	io:write(lab6:insert(2,[1])),	%added test case (insert into list of one item)
	io:format("\n"),
	io:write(lab6:insert(2,[1,2,3])),
	io:format("\n"),
	io:write(lab6:insert(4,[1,2,3])),
	io:format("\n").

test4() ->
	io:write(lab6:largest([5])),
	io:format("\n"),
	io:write(lab6:largest([4,5])),
	io:format("\n"),
	io:write(lab6:largest([4,6,5])),
	io:format("\n").

test5() ->
	io:write(lab6:selectionSort([-1,-2,-4])),
	io:format("\n"),
	io:write(lab6:selectionSort([])),
	io:format("\n"),
	io:write(lab6:selectionSort([5])),
	io:format("\n"),
	io:write(lab6:selectionSort([3,5])),
	io:format("\n").


test6a() ->
	io:write(lab6:flipSigns([])),	%added test case (flip signs of an empty list)
	io:format("\n"),
	io:write(lab6:flipSigns([1.0,2.0,3.0])),
	io:format("\n"),
	io:write(lab6:flipSigns([-1.0,-2.0,-3.0])),
	io:format("\n").


test6b() ->
	io:write(lab6:truncateWords([])),
	io:format("\n"),
	io:format("[~p,~p,~p]",lab6:truncateWords(["short","longword","longword"])),
	io:format("\n"),
	io:format("[~p]",lab6:truncateWords(["t"])),
	io:format("\n"),
	io:format("[~p,~p,~p,~p,~p]",lab6:truncateWords(["mix","of","longish","and","shortish"])),
	io:format("\n").