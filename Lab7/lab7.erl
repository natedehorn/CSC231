% Nate DeHorn
% CSC Lab7

-module(lab7).
-export([map/2, reduce/2, filter/2, getStringTree/0, stringToFloat/1, getExpression1/0, getExpression2/0, getExpression3/0, isEven/1, extractEvens/1, isAWord/1, extractAWords/1, isTrue/1, logicalOR/1, isLongString/1, longStrings/1, mergewords/2, strcat/1, largest/2, max/1, inTree/2, findInTree/2, evalNode/1, evaluate/1]).

-record(binaryTreeNode, {value,left=null,right=null}).
-record(binaryTree, {rootNode=null}).

getStringTree() -> 
#binaryTree{rootNode = #binaryTreeNode{value = "Erlang", left = #binaryTreeNode{value = "as", left = #binaryTreeNode{value = "a",left = null,right = null},right = #binaryTreeNode{value = "in",left = null,right = null}},right = #binaryTreeNode{value = "types",left = null, right = null}}}.

getExpression1() ->
#binaryTree{rootNode = #binaryTreeNode{value="2.0"}}.

getExpression2() ->
#binaryTree{rootNode = #binaryTreeNode{value="+",left=#binaryTreeNode{value="2.0"},right=#binaryTreeNode{value="4.0"}}}.

getExpression3() ->
#binaryTree{rootNode = #binaryTreeNode{value="/",left=#binaryTreeNode{value="+", left=#binaryTreeNode{value="3.0"},right=#binaryTreeNode{value="2.0"}},right=#binaryTreeNode{value="*",left=#binaryTreeNode{value="2.0"},right=#binaryTreeNode{value="2.5"}}}}.

stringToFloat(X) -> 
	element(1,string:to_float(X)).

map(_,[]) ->
	[];
map(F,[X|XS]) ->
	[F(X)|map(F,XS)].

reduce(_, [A]) ->
	A;
reduce(F, [A|AS]) ->
	F(A, reduce(F,AS)).

filter(_,[]) ->
	[];
filter(P,[X|XS]) ->
	case P(X) of 
	true ->
		 [X|filter(P,XS)];
	_ -> 
		filter(P,XS)
	end.


%---------- Begin User-Defined Methods ----------


%-----Part 1a-----
%isEven
isEven(X) ->
	case(X rem 2) == 0 of
		true -> true;
		false -> false
	end.

extractEvens(X) ->
	filter(fun isEven/1, X).


%-----Part 1b-----
%isAWords
isAWord(X) ->
	Y = hd(X),
	case(Y == $a orelse Y == $A) of
		true -> true;
		false -> false
	end.

%extractAWords
extractAWords(X) ->
	filter(fun isAWord/1, X).


%-----Part 1c-----
%isTrue			
isTrue(X) ->
	if X == true -> true;
	true -> false
end.

%logicalOR
logicalOR(X) ->
	Y = filter(fun isTrue/1, X),
	if length(Y) > 0 -> true;
	true -> false
end.


%-----Part 1d-----
%isLongString
isLongString(X) ->
	if length(X) > 3 -> true;
	true -> false
end.

%longStrings
longStrings(X) ->
	filter(fun isLongString/1, X).


%-----Part 1e-----
%mergewords
mergewords([],[]) -> [];
mergewords([X],[]) -> [X];
mergewords([],[Y]) -> [Y];
mergewords(X,Y) -> X ++ Y.

%strcat
strcat(X) ->
	reduce(fun mergewords/2, X).


%-----Part 1f-----
%largest
largest(X,Y) ->
	if X > Y -> X;
	true -> Y
end.

%max
max(X) ->
	reduce(fun largest/2, X).


%-----Part 2-----
%inTree
inTree(_,null) -> false;
inTree(X,Y) ->
	if Y#binaryTreeNode.value == X -> true;
	true -> inTree(X, Y#binaryTreeNode.left) orelse inTree(X, Y#binaryTreeNode.right)
end.

%findInTree
findInTree(X,Y) -> 
	inTree(X,Y#binaryTree.rootNode).


%-----Part 3------
%evalNode
evalNode(X) -> 
if 
	X#binaryTreeNode.value == "+" -> evalNode(X#binaryTreeNode.left) + evalNode(X#binaryTreeNode.right);
	X#binaryTreeNode.value == "-" -> evalNode(X#binaryTreeNode.left) - evalNode(X#binaryTreeNode.right);
	X#binaryTreeNode.value == "*" -> evalNode(X#binaryTreeNode.left) * evalNode(X#binaryTreeNode.right);
	X#binaryTreeNode.value == "/" -> evalNode(X#binaryTreeNode.left) / evalNode(X#binaryTreeNode.right);
	true -> stringToFloat(X#binaryTreeNode.value)
end.

%evaluate
evaluate(X) -> 
	evalNode(X#binaryTree.rootNode).