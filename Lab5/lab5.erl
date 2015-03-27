% Nate DeHorn
% CSC231 Lab 5 

-module(lab5).
-export([main/0]).
-export([fourthPower/1, square/1, fourthPower2/1, median3/1, factorial/1, cycleOnce/1, logarithm/2, largest/1, contains/2, getNth/2]).
main() -> io:format("lab 5\n").


%----------Part 1----------

%fourthPower(N) -- Passed Test
%Return N^4 for any N
fourthPower(N)-> N*N*N*N.

%square(N) -- Passed Test
%Return N^2 for any N
square(N)-> N*N.

%fourthPower2(N) -- Passed Test
%Returns N^4 by making use of the square(N) function we wrote earlier
fourthPower2(N)-> square(N)*square(N).
	% or square(square(N)).

%median3({A,B,C}) -- Passed Test
%Return the median of three components of a tuple of numbers
median3({A,B,C}) -> if 
		A > B -> if
			A < C -> A;
			true -> if
				B > C -> B;
				true -> C
				end
			end;
		true -> if
			B < C -> B;
			true -> if
				A > C -> A;
				true -> C
				end
			end
end.
			

%----------Part 2----------

%factorial(N) -- Passed Test
%Returns the factorial of integers >=0
factorial(N)-> if 
		N == 0 -> 1;
		N == 1 -> 1;
		true -> N*factorial(N-1)
end.
 
%getNth(L,N) -- Passed Test
%Returns the nth item out of a list
cycleOnce(L) ->	tl(L) ++ [hd(L) | []].

getNth(L,N) -> if
		(N == 1) -> hd(L);
		true -> getNth(cycleOnce(L),N-1)
end.

%logarithm(X,Y) -- Passed Test
%Returns the power of X that equals Y
logarithm(X,Y) -> if
		X == Y -> 1;
		true -> 1 + logarithm(X,Y/X)
end.
 
%largest(L) -- Passed Test
%Returns the largest element of a list of numbers
largest(L) -> if 
		tl(L) == [] -> hd(L);
		hd(L) > hd(tl(L)) -> largest([hd(L)] ++ tl(tl(L)));
		true -> largest(tl(L))
end.

%contains(Item, List) -- Passed Test
contains(Item,List) -> if 
			List == [] -> false;
			Item == hd(List) -> true;
			true -> contains(Item, tl(List))
end.
