write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

exist([Head|_],Head).
exist([_|Tail],P):-exist(Tail,P).

comb(0,_,[]).
comb(N,[X|T],[X|Comb]):-N>0,N1 is N-1,comb(N1,T,Comb).
comb(N,[_|T],Comb):-N>0,comb(N,T,Comb).

varia_rep(0,_,[]).
varia_rep(N,L,[H|RVaria]):-N>0,N1 is N-1,exist(L,H),varia_rep(N1,L,RVaria).

put(_,0,_):-!.
put(P,N,[P|List]):-N1 is N-1,put(P,N1,List).
put(P,N,[_|List]):-put(P,N,List).

to_file:-List=[_,_,_,_,_,_,_,_],comb(3,[a,b,c,d,e,f],[A,B,C]),varia_rep(3,[1,2,3,4,5,6],[A1,B1,C1]),Sum is A1+B1+C1,Sum = 8,put(A,A1,List),put(B,B1,List),put(C,C1,List),write_str(List),nl,false.

task:-tell('C:\\Users\\Диана\\Documents\\Prolog\\repo\\Individual task 5.txt'),to_file.
task:-told.
