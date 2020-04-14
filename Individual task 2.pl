read_list(A,N):-r_1([],A,0,N).
r_1(A,A,N,N):-!.
r_1(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_1(B1,A,I1,N).

insertion_sort:-read(N),read_list(A,N),insertion_sort(A,B),write(B).

insertion_sort(List,SortList):-insertion_sort(List,[],SortList).
insertion_sort([],SortList,SortList):-!.
insertion_sort([Head|Tail],SortSublist,SortList):-insert(Head,SortSublist,S),insertion_sort(Tail,S,SortList).

insert(P,List,Result):-insert(P,[],List,Result).
insert(P,Start,[],Result):-append(Start,[P],Result),!.
insert(P,Start,[Head|Tail],Result):-P > Head,append(Start,[Head],NewStart),insert(P,NewStart,Tail,Result),!.
insert(P,Start,Tail,Result):-append(Start,[P|Tail],Result).
