% Nate DeHorn
% CSC231 Lab 6

-module(lab6).
-export([productOfPairs/1,polyadd/2,polydiff/2,polyeval/2,member/2,insert/2,largest/1,selectionSort/1,flipSign/1,flipSigns/1,chop/2,truncate/1,truncateWords/1,map/2,delete/2]).

% productOfPairs function		-----Passed test1()-----
productOfPairs([]) -> 
	[];
productOfPairs([X]) -> 
	[X];
productOfPairs([X|XS]) -> 
	[X*hd(XS)] ++ productOfPairs(tl(XS)).

% polyadd function		-----Passed test2a()-----
polyadd(List1,[]) ->
	List1;
polyadd([],List2) ->
	List2;
polyadd([X|XS],[Y|YS]) ->
	[X+Y | polyadd(XS,YS)].

% polydiff function		-----Passed test2b()-----
polydiff(List1,[]) ->
	List1;
polydiff([],[X|XS]) ->
	[0-X | polydiff([],XS)];
polydiff([X|XS],[Y|YS]) ->
	[X-Y | polydiff(XS,YS)].

% polyeval function		-----Passed test2c()-----
polyeval([],_) ->
	0;
polyeval([X],_) ->
	X;
polyeval([X|XS],Y) ->
		(X + (Y * polyeval(XS, Y))).

% member	function	-----Passed test3a()-----
member(_,[]) ->
	false;
member(X,[X|_]) -> 
	true;
member(X,[_|YS]) ->
	member(X,YS).

% delete function		-----Passed test3b()-----
delete(X,L) -> [Y || Y <- L, Y =/= X].		%For explanation check dat StackOverflow

% insert	function	-----Passed test3c()-----
insert(X,S) ->
        AlreadyInList = member(X,S),
        if
                AlreadyInList == true -> S;
                true -> [X|S]
        end.

% largest function		-----Passed test4()-----
largest(L)->
        X = tl(L),
        Y = hd(L),
        if (X == [])->
                Y;
        true->
                if (Y > hd(X))->
                        largest([Y|tl(X)]);
                true->
                        largest(X)
        end
end.

% selectionSort function		-----Passed test5()-----
selectionSort([]) -> 
	[];
selectionSort([X]) -> 
	[X];
selectionSort([X|[Y|YS]]) -> 
	Z = largest([X|[Y|YS]]), 
	R = delete(Z, [X|[Y|YS]]), 
	S = selectionSort(R), 
	[Z] ++ S.

map(_,[]) -> 
	[];
map(Y,[X|XS])->
	[Y(X)|map(Y,XS)].

% flipSign function		-----Passed test6a()-----
flipSign(X) ->
	 -X.
flipSigns(X) -> 
	map(fun flipSign/1, X).

chop([],_) -> 
	[];
chop([Y|YS],X) ->
    if
        X==0 -> [];
        true -> [Y] ++ chop(YS,X-1)
    end.

% truncateWords function		-----Passed test6b()-----
truncate(X) -> 
	chop(X,4).
truncateWords([]) -> 
	[];
truncateWords([X|XS]) -> 
	map(fun truncate/1,[X|XS]).