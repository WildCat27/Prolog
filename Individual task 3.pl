
/*читает строку*/
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(-1,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,char_code(S,X),append(B,[S],B1),get0(X1),r_str(X1,A,B1,N,K1).

/*считает кол-во элементов в списке*/
list_length([],0):-!.
list_length([_|Tail],NUM):-list_length(Tail,NUM1),NUM is NUM1+1.

/*ищет номер элемента в списке*/
number([Head|_],Head,0):-!.
number([_|Tail],P,N):-number(Tail,P,N1),N is N1+1.

alphabet([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]).

encrypt([],_):-!.
encrypt([' '|Str],Shift):-write(" "),encrypt(Str,Shift),!.
encrypt([H|Str],Shift):-alphabet(A),number(A,H,NUM),code(NUM+Shift,H,HH,A),put(HH),encrypt(Str,Shift),!.

code(0,_,NewS,[NewS|_]):-!.
code(Rot,S,NewS,[]):-alphabet(A),code(Rot,S,NewS,A).
code(Rot,S,NewS,[_|A]):-Rot1 is Rot-1,code(Rot1,S,NewS,A).

task:-read_str(String,_),alphabet(A),list_length(A,L),task(1,String,L).
task(L,_,L):-!.
task(N,String,L):-write(N),write(" "),encrypt(String,N),nl,N1 is N+1,task(N1,String,L).
