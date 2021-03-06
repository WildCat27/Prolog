/*Функция ввода*/
minimum_spanning_tree:-write("Введите количество ребер графа: "),read(EdgeNumber),nl,
    read_list(Graph,EdgeNumber),insertion_sort(Graph,SortGraph),minimum_spanning_tree(SortGraph,[MST]),
    write("Минимальное остовное дерево:"),nl,write_list(MST).

read_list(A,N):-r_1([],A,0,N).
r_1(A,A,N,N):-!.
r_1(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_1(B1,A,I1,N).

write_list([]):-!.
write_list([H|T]):-write(H),nl,write_list(T).

/*Cортировка ребер*/
insertion_sort(List,SortList):-insertion_sort(List,[],SortList).
insertion_sort([],SortList,SortList):-!.
insertion_sort([Head|Tail],SortSublist,SortList):-insert(Head,SortSublist,S),insertion_sort(Tail,S,SortList).

insert(P,List,Result):-insert(P,[],List,Result).
insert(P,Start,[],Result):-append(Start,[P],Result),!.
insert(P,Start,[Head|Tail],Result):-edge_more(P,Head),append(Start,[Head],NewStart),insert(P,NewStart,Tail,Result),!.
insert(P,Start,Tail,Result):-append(Start,[P|Tail],Result).

edge_more(edge(_,_,X),edge(_,_,Y)):-X > Y.
/*****/

/*Проверяет принадлежность ребра дереву*/
belong(X,[edge(X,_,_)|_]):-!.
belong(X,[edge(_,X,_)|_]):-!.
belong(X,[edge(_,_,_)|OtherEdges]):-belong(X,OtherEdges).

/*Проверяет, создаст ли новое ребро цикл*/
cycle(edge(X,Y,_),[Tree|_]):-belong(X,Tree),belong(Y,Tree),!.
cycle(edge(X,Y,_),[_|OtherTrees]):-cycle(edge(X,Y,_),OtherTrees).

/*Возвращает дерево содержащий узел X и удаляет его из остова*/
tree_return_and_delete(_,[],[],[]):-!.
tree_return_and_delete(X,[Tree|OtherTrees],OtherTrees,Tree):-belong(X,Tree).
tree_return_and_delete(X,[Tree|OtherTrees],[Tree|NewTrees],ReturnTree):-tree_return_and_delete(X,OtherTrees,NewTrees,ReturnTree).

/*Ищет минимальное остовное дерево графа*/
minimum_spanning_tree(Graph,MST):-minimum_spanning_tree(Graph,[],MST).
minimum_spanning_tree([],MST,MST):-!.
minimum_spanning_tree([edge(X,Y,C)|OtherEdges],TempMST,MST):-cycle(edge(X,Y,C),TempMST),minimum_spanning_tree(OtherEdges,TempMST,MST),!.
minimum_spanning_tree([edge(X,Y,C)|OtherEdges],TempMST,MST):-
    tree_return_and_delete(X,TempMST,TempMST1,XTree),
    tree_return_and_delete(Y,TempMST1,TempMST2,YTree),
    append(XTree,YTree,UnionTree),append(TempMST2,[[edge(X,Y,C)|UnionTree]],NewTempMST),minimum_spanning_tree(OtherEdges,NewTempMST,MST).
