sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset:-read(N),read_list(A,N),sub_set(B,A),write(B),nl,fail.

soch([],[],0).
soch([H|Sub_set],[H|Set],K):-K1 is K-1,soch(Sub_set,Set,K1).
soch(Sub_set,[_|Set],K):-soch(Sub_set,Set,K).
pr_soch:-read(N),read_list(A,N),read(K),soch(B,A,K),write(B),nl,fail.

sub_set_pov([],[],_).
sub_set_pov([H|Sub_set],[H|Set],_):-sub_set_pov(Sub_set,Set,H).
sub_set_pov(Sub_set,[H|Set],A):-H \= A,sub_set_pov(Sub_set,Set,A).
pr_pov:-read(N),read_list(A,N),sub_set_pov(B,A,'N'),write(B),nl,fail.
