min(X,X,X):-!.
min(X,Y,X):-X > Y,!.
min(_,Y,Y).


is_pent(P):-is_pent(0,P).
is_pent(N,Pent):-pent(N,Pent),!.
is_pent(N,P):-pent(N,Pent),Pent < P,N1 is N+1,is_pent(N1,P).

task:-task(D,Pj,Pk),write("Pj = "),write(Pj),write(" Pk = "),write(Pk),write(" D = "),write(D).
/*
task(299,299,_,_,_):-!.
task(J,K,D,_,_):-(J \= K),pent(J,Pj),pent(K,Pk),/*Sum is Pj+Pk,is_pent(Sum),*/Dif is Pj-Pk,is_pent(Dif),((var(D),task(J,K,Dif,Pj,Pk),!,fail);(Dif < D,write(D),nl,task(J,K,Dif,Pj,Pk),!,fail)).
task(J,K,D,Pj,Pk):-J < 300,J1 is J+1,task(J1,K,D,Pj,Pk).
task(300,K,D,Pj,Pk):-K < 300,K1 is K+1,task(K1,K1,D,Pj,Pk).*/

inc(300,K,J1,K1):-K1 is K+1,J1 is K+2,!.
inc(J,K,J1,K):-J1 is J+1.

task(D,Pj,Pk):-task(2,1,0,0,Pj,Pk,_,D).
task(301,300,Pj,Pk,Pj,Pk,D,D):-(nonvar(D),!);fail.
task(J,K,TempPj,TempPk,PJ,PK,TempD,D):-K \= J,pent(J,Pj),pent(K,Pk),inc(J,K,J1,K1),
    ((   Sum is Pj+Pk,is_pent(Sum),/*Dif is Pj-Pk,is_pent(Dif),*/((var(TempD),!);(TempD > Dif)),task(J1,K1,Pj,Pk,PJ,PK,Dif,D),!);
       task(J1,K1,TempPj,TempPk,PJ,PK,TempD,D)).

sum:-task_s(1,1).
task_s(J,K):-pent(J,Pj),pent(K,Pk),Sum is Pj+Pk,is_pent(Sum),write(Pj),write(" "),write(Pk),nl,fail.
task_s(J,K):-J < 900,J1 is J+1,task_s(J1,K).
task_s(900,K):-K < 900,K1 is K+1,task_s(K1,K1).

dif:-task_d(1,1).
task_d(J,K):-pent(J,Pj),pent(K,Pk),Dif is Pj-Pk,is_pent(Dif),write(Pj),write(" "),write(Pk),nl,fail.
task_d(J,K):-J < 900,J1 is J+1,task_d(J1,K).
task_d(900,K):-K < 900,K1 is K+1,task_d(K1,K1).

pent(N,P):-P is N*(3*N-1)/2.


