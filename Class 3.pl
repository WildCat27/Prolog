pr3_task1:-read(N),read_list(A,N),sum_list(A,S),write(S).
read_list(A,N):-r_1([],A,0,N).
r_1(A,A,N,N):-!.
r_1(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_1(B1,A,I1,N).

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1),S is S1+Head.

pr3_task2:-read(N),read_list(A,N),read(NUM),find(A,NUM,P),write(P).

find([Head|_],0,Head):-!.
find([_|Tail],NUM,P):-NUM1 is NUM-1,find(Tail,NUM1,P).

pr3_task3:-read(N),read_list(A,N),find_min(A,P),write(P).

find_min([Head|Tail],Min):-find_min(Tail,Head,Min).
find_min([],Cur_min,Min):-Min is Cur_min,!.
find_min([Head|Tail],Cur_min,Min):-Cur_min > Head,find_min(Tail,Head,Min),!.
find_min([_|Tail],Cur_min,Min):-find_min(Tail,Cur_min,Min).

pr3_task4:-read(N),read_list(A,N),read(P),exist(A,P).

exist([Head|_],Head):-!.
exist([_|Tail],P):-exist(Tail,P).

pr3_task5:-read(N),read_list(A,N),read(P),number(A,P,Num),write(Num).

number([Head|_],Head,0):-!.
number([_|Tail],P,N):-number(Tail,P,N1),N is N1+1.

pr3_task6:-read(N),read_list(A,N),rotage(A,B),write(B).

rotage(A,B):-rotage(A,[],B).
rotage([],B1,B):-append([],B1,B),!.
rotage([Head|Tail],B1,B):-append([Head],B1,B2),rotage(Tail,B2,B).

pr3_task7:-read(N1),read_list(A1,N1),read(N2),read_list(A2,N2),sublist(A1,A2).

sublist([],_):-!.
sublist([H1|T1],[H2|T2]):-(H1 = H2),sublist(T1,T2),!.
sublist(Sublist,[_|T2]):-sublist(Sublist,T2).

pr3_task8:-read(N),read_list(A,N),read(NUM),del(A,NUM,List),write(List).

del(A,NUM,List):-del(A,NUM,[],List).
del([_|Tail],0,Cur_list,List):-append(Cur_list,Tail,List),!.
del([Head|Tail],NUM,Cur_list,List):-NUM1 is NUM-1,append(Cur_list,[Head],New_cur_list),del(Tail,NUM1,New_cur_list,List).

pr3_task9:-read(N),read_list(A,N),read(P),del_all(A,P,List),write(List).

del_all(A,P,List):-del_all(A,P,[],List).
del_all([],_,List,List):-!.
del_all([Head|Tail],Head,Cur_list,List):-del_all(Tail,Head,Cur_list,List),!.
del_all([Head|Tail],P,Cur_list,List):-append(Cur_list,[Head],New_cur_list),del_all(Tail,P,New_cur_list,List).

pr3_task10:-read(N),read_list(A,N),unic(A).

unic([]):-!.
unic([Head|Tail]):-exist(Tail,Head),!,fail.
unic([_|Tail]):-unic(Tail).

pr3_task11:-read(N),read_list(A,N),unic_list(A,B),write(B).

unic_list(A,B):-unic(A,[],B).
unic_list([],B1,B):-append([],B1,B),!.
unic_list([Head|Tail],B1,B):-exist(B1,Head),unic(Tail,B1,B),!.
unic_list([Head|Tail],B1,B):-append(B1,[Head],NEW_B1),unic(Tail,NEW_B1,B),!.

pr3_task12:-read(N),read_list(A,N),read(P),count(A,P,NUM),write(NUM).

count([],_,0):-!.
count([Head|Tail],Head,NUM):-count(Tail,Head,NUM1),NUM is NUM1+1,!.
count([_|Tail],P,NUM):-count(Tail,P,NUM).

pr3_task13:-read(N),read_list(A,N),list_length(A,NUM),write(NUM).

list_length([],0):-!.
list_length([_|Tail],NUM):-list_length(Tail,NUM1),NUM is NUM1+1.
