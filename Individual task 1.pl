
is_pent(P):-is_pent(1,P).
is_pent(N,Pent):-pent(N,Pent),!.
is_pent(N,P):-pent(N,Pent),Pent < P,N1 is N+1,is_pent(N1,P).

task:-task(1,1).
task(J,K):-pent(J,Pj),pent(K,Pk),Sum is Pj+Pk,is_pent(Sum),Dif is Pj-Pk,is_pent(Dif),write(Pj),nl,write(Pk),fail.
task(J,K):-J < 900,J1 is J+1,task(J1,K).
task(900,K):-K < 900,K1 is K+1,task(K1,K1).

sum:-task_s(1,1).
task_s(J,K):-pent(J,Pj),pent(K,Pk),Sum is Pj+Pk,is_pent(Sum),write(Pj),write(" "),write(Pk),nl,fail.
task_s(J,K):-J < 900,J1 is J+1,task_s(J1,K).
task_s(900,K):-K < 900,K1 is K+1,task_s(K1,K1).

dif:-task_d(1,1).
task_d(J,K):-pent(J,Pj),pent(K,Pk),Dif is Pj-Pk,is_pent(Dif),write(Pj),write(" "),write(Pk),nl,fail.
task_d(J,K):-J < 900,J1 is J+1,task_d(J1,K).
task_d(900,K):-K < 900,K1 is K+1,task_d(K1,K1).

pent(N,P):-P is N*(3*N-1)/2.


