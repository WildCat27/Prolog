pent(N,P):-P is N*(3*N-1)/2.

is_pent(P):-is_pent(0,P).
is_pent(N,Pent):-pent(N,Pent),!.
is_pent(N,P):-pent(N,Pent),Pent < P,N1 is N+1,is_pent(N1,P).

task:-task(D,Pj,Pk),write("Pj = "),write(Pj),write(" Pk = "),write(Pk),write(" D = "),write(D),!.
task:-write("Такой пары чисел нет").
border(100).

inc(J,K,J1,K1):-border(J),K1 is K+1,J1 is K+2,!.
inc(J,K,J1,K):-J1 is J+1.

task(D,Pj,Pk):-task(2,1,0,0,Pj,Pk,_,D).
task(_,K,Pj,Pk,Pj,Pk,D,D):-border(K),!,nonvar(D);fail.
task(J,K,TempPj,TempPk,PJ,PK,TempD,D):-pent(J,Pj),pent(K,Pk),inc(J,K,J1,K1),
    ((   Sum is Pj+Pk,is_pent(Sum),Dif is Pj-Pk,is_pent(Dif),((var(TempD),!);(TempD > Dif)),task(J1,K1,Pj,Pk,PJ,PK,Dif,D),!);
         task(J1,K1,TempPj,TempPk,PJ,PK,TempD,D)).




