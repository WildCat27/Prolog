/*task1*/
max(X,Y,X):-(X>Y),!.
max(_,Y,Y).

/*tas2*/
max(X,Y,Z,X):-(X>Y),(Y>Z),!.
max(_,Y,Z,Y):-(Y>Z),!.
max(_,_,Z,Z).

/*task3*/
fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact1(N,X):-fact2(1,N,1,X).
fact2(N,N,X,X):-!.
fact2(Z,N,Y,X):-Z1 is Z+1,Y1 is Y*Z1,fact2(Z1,N,Y1,X).

/*task4*/
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N2,X2),fib(N1,X1),X is X1+X2.

/*task5*/
pr(X):-D is X-1,pr1(X,D).
pr1(_,1):-!.
pr1(X,D):-S is X mod D,S \= 0,D1 is D-1,pr1(X,D1).

/*task6*/
seq_max(Max):-seq_max(1,1,1,Max).
seq_max(100000,Max,_,Max):-!.
seq_max(N,_,KCurMax,Max):-(N < 1000000),seq(N,K),K > KCurMax,N1 is N+1,seq_max(N1,N,K,Max),!.
seq_max(N,CurMax,KCurMax,Max):-N1 is N+1,seq_max(N1,CurMax,KCurMax,Max).
seq(1,1):-!.
seq(N,K):-(N \= 1),S is N mod 2,S = 0,NEXT is N/2,seq(NEXT,K1),K is K1+1,!.
seq(N,K):-(N \= 1),S is N mod 2,S \= 0,NEXT is 3*N+1,seq(NEXT,K1),K is K1+1.

/*task7*/
sum(N,N):-N<10,!.
sum(N,SUM):-OST is N mod 10,NDIV is N div 10,sum(NDIV,S),SUM is S+OST.

/*task8*/
pr_max(N,MaxD):-pr_max(N,N,MaxD).
pr_max(N,D,MaxD):-pr(D),S is N mod D,S = 0,MaxD is D,!.
pr_max(N,D,MaxD):-D1 is D-1,pr_max(N,D1,MaxD).

/*task9*/
gcf(A,B,B):-R is A mod B,(R = 0),!.
gcf(A,B,D):-R is A mod B,gcf(B,R,D).

/*task10*/
phi(N,C):-phi(N,1,C).
phi(1,1,1):-!.
phi(N,N,0):-!.
phi(N,P,C):-gcf(N,P,D),D = 1,P1 is P+1,phi(N,P1,C1),C is C1+1,!.
phi(N,P,C):-P < N,P1 is P+1,phi(N,P1,C).

