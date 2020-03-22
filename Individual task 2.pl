read_list(A,N):-r_1([],A,0,N).
r_1(A,A,N,N):-!.
r_1(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_1(B1,A,I1,N).

task:-read(N),read_list(A,N),insertion_sort(A,B),write(B).

insertion_sort(A,B):-ins_sort(A,[],B).
ins_sort([],B1,B):-append([],B1,B),!.
ins_sort([Head|Tail],B1,B):-insert(Head,B1,B2),ins_sort(Tail,B2,B).
insert(P,A1,A):-insert(P,[],A1,A).
insert(P,Start,[],Result):-append(Start,[P],Result),!.
insert(P,Start,[Head|Tail],Result):-(P =< Head),append(Start,[P],NewStart),append(NewStart,[Head|Tail],Result),!.
insert(P,Start,[Head|Tail],Result):-append(Start,[Head],NewStart),insert(P,NewStart,Tail,Result).

