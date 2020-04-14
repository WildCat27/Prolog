
is_pent(P):-pent(1,P).
pent(N,P):-Pent is N*(3*N-1)/2,(Pent =< P),(Pent = P,!;N1 is N+1,pent(N1,P)).

task:-task(1,1).
task(J,K):-pentagonal(J,Pj),pentagonal(K,Pk),SUM is Pj+Pk,is_pent(SUM),write(SUM).
task(J,K):-(J < 500),J1 is J+1,task(J1,K).
task(J,K):-(J = 500),(K < 500),K1 is K+1,task(K1,K1).
pentagonal(N,P):-P is N*(3*N-1)/2.

j:-j(1,1).
j(J,K):-JK is J*K,JK = 900,!.
j(J,K):-(J < 30),J1 is J+1,j(J1,K).
j(J,K):-(J = 30),(K < 30),K1 is K+1,j(K1,K1).
is_pent(DIF),,DIF is Pj-Pk
