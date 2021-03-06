read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(-1,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

task2:-read_str(A,_),count_words(A,K,1),write(K).
count_words([],0,_):-!.
count_words([32|Tail],K,0):-count_words(Tail,K,1),!.
count_words([32|Tail],K,1):-count_words(Tail,K,1),!.
count_words([_|Tail],K,1):-count_words(Tail,K1,0),K is K1+1.
count_words([_|Tail],K,0):-count_words(Tail,K,0).

task3:-read_str(A,_),most_encountered_word(A,WORD),write_str(WORD).

most_encountered_word(A,WORD):-most_encountered_word(A,A,WORD,[],[],0).
most_encountered_word(_,[],WORD,BUF,_,0):-WORD is BUF,!.
most_encountered_word(_,[],WORD,BUF,CUR_WORD,1):-append(CUR_WORD,[32|BUF],WORD),!.
most_encountered_word(_,[],WORD,_,WORD,_):-!.

most_encountered_word(A,[32|_],WORD,BUF,_,NUM):-count_word(A,BUF,BUF_NUM),BUF_NUM > NUM,remove_word(A,BUF,New),most_encountered_word(New,New,WORD,[],BUF,BUF_NUM),!.
most_encountered_word(A,[32|_],WORD,BUF,CUR_WORD,NUM):-count_word(A,BUF,BUF_NUM),BUF_NUM = NUM,append(CUR_WORD,[32|BUF],A1),remove_word(A,BUF,New),most_encountered_word(New,New,WORD,[],A1,NUM),!.
most_encountered_word(A,[32|_],WORD,BUF,CUR_WORD,NUM):-remove_word(A,BUF,New),most_encountered_word(New,New,WORD,[],CUR_WORD,NUM),!.
most_encountered_word(A,[Head|Tail],WORD,BUF,CUR_WORD,NUM):-append(BUF,[Head],NEW_BUF),most_encountered_word(A,Tail,WORD,NEW_BUF,CUR_WORD,NUM).

/*work*/
count_word(A,WORD,NUM):-count_word(A,WORD,[],NUM).
count_word([],WORD,CUR_WORD,1):-compare_str(WORD,CUR_WORD),!.
count_word([],_,_,0):-!.
count_word([32|Tail],WORD,CUR_WORD,NUM):-compare_str(WORD,CUR_WORD),count_word(Tail,WORD,[],NUM1),NUM is NUM1+1,!.
count_word([32|Tail],WORD,[_|_],NUM):-count_word(Tail,WORD,[],NUM),!.
count_word([Head|Tail],WORD,CUR_WORD,NUM):-append(CUR_WORD,[Head],NEW_CUR_WORD),count_word(Tail,WORD,NEW_CUR_WORD,NUM).
/*36*/
find_word(A,WORD,Find):-find_word(A,WORD,[],Find).
find_word([32|_],WORD,CUR_WORD,Find):-compare_str(WORD,CUR_WORD,Equal),Equal = 1,Find is 1,!.
find_word([32|Tail],WORD,_,Find):-find_word(Tail,WORD,[],Find),!.
find_word([Head|Tail],WORD,CUR_WORD,Find):-append(CUR_WORD,Head,NEW_CUR_WORD),find_word(Tail,WORD,NEW_CUR_WORD,Find).

/*work*/
compare_str([],[]):-!.
compare_str([H|T1],[H|T2]):-compare_str(T1,T2),!.
/*45*/
remove_word(String,Word,New_string):-remove_word(String,[],Word,[],New_string).
remove_word([],New_string,Word,Word,New_string):-!.
remove_word([],[],_,Word,Word):-!.
remove_word([],Cur_string,_,Cur_word,New_string):-append(Cur_string,[32|Cur_word],New_string),!.
remove_word([32|Tail],Cur_string,Word,Cur_word,New_string):-compare_str(Word,Cur_word),remove_word(Tail,Cur_string,Word,[],New_string),!.
remove_word([32|Tail],[],Word,Cur_word,New_string):-remove_word(Tail,Cur_word,Word,[],New_string),!.
remove_word([32|Tail],Cur_string,Word,Cur_word,New_string):-append(Cur_string,[32|Cur_word],New_cur_string),remove_word(Tail,New_cur_string,Word,[],New_string).
remove_word([Head|Tail],Cur_string,Word,Cur_word,New_string):-append(Cur_word,[Head],New_cur_word),remove_word(Tail,Cur_string,Word,New_cur_word,New_string).
/*56*/
task4:-read_str(A,N),t4(A,N).
t4(A,N):-N > 5,t4(N,1,A),!.
t4(_,0):-!.
t4([Head|Tail],N):-put(Head),N1 is N-1,t4([Head|Tail],N1).
t4(N,M,_):-(N < M),!.
t4(N,K,[Head|Tail]):-(K =< 3; K > N-3),put(Head),-K1 is K+1,t4(N,K1,Tail),!.
t4(N,K,[_|Tail]):-K1 is K+1,t4(N,K1,Tail).

task5:-read_str(A,_),list_last(A,Last),find_num(A,Last).

list_last([Last],Last):-!.
list_last([_|Tail],Last):-last(Tail,Last).

find_num(A,P):-find_num(A,P,0).
find_num([],_,_):-!.
find_num([Head|Tail],Head,Num):-write(Num),Num1 is Num+1,find_num(Tail,Head,Num1),!.
find_num([_|Tail],P,Num):-Num1 is Num+1,find_num(Tail,P,Num1).

task6:-see('C:\\Users\\Диана\\Documents\\Prolog\\text.txt'),max_str_length(Length),write(Length),seen.

max(X1,X2,X1):-X1 > X2,!.
max(_,X2,X2).

read:-repeat,read_str(A,_),write_str(A),stop(A).
stop([]):-!.

max_str_length(Length):-max_str_length(0,Length).
max_str_length(Cur_length,Length):-read_str(A,N),not(stop(A)),max(Cur_length,N,Max),max_str_length(Max,Length),!.
max_str_length(Length,Length).

task7:-see('C:\\Users\\Диана\\Documents\\Prolog\\text.txt'),t7(Num),write(Num),seen.

t7(Num):-read_str(A,_),not(stop(A)),(exist(A,32),t7(Num);t7(Num1),Num is Num1+1),!.
t7(0):-!.

task8:-see('C:\\Users\\Диана\\Documents\\Prolog\\text.txt'),average(Num),seen,see('C:\\Users\\Диана\\Documents\\Prolog\\text.txt'),t8(Num),seen.

average(Num):-average(Num,0,0).
average(Num,Num_str,Num_A):-read_str(A,_),not(stop(A)),count(A,97,Num_A_str),New_num_str is Num_str+1,New_num_A is Num_A+Num_A_str,average(Num,New_num_str,New_num_A),!.
average(Num,Num_str,Num_A):-Num is Num_A div Num_str.

t8(Num):-read_str(A,_),not(stop(A)),(count(A,97,Num_A_str),Num < Num_A_str,write_str(A),nl,t8(Num);t8(Num)),!.
t8(_):-!.

task9:-see('C:\\Users\\Диана\\Documents\\Prolog\\text.txt'),t9(Text),most_encountered_word(Text,WORD),write_str(WORD),seen.

t9(Text):-t9([],Text).
t9(A,Text):-read_str(S,_),not(stop(S)),append(A,[32|S],New_A),t9(New_A,Text),!.
t9(Text,Text):-!.

task11:-read_str(A,_),t11(A).

t11(A):-t11(A,1).
t11([]):-!.
t11([Head|_],N):-Ost is N mod 3,Ost = 0,put(Head),fail.
t11([_|Tail],N):-N1 is N+1,t11(Tail,N1).

task12:-read_str(A,_),t12(A,Num1,Num2),write(Num1),put(32),write(Num2).
t12(A,Num1,Num2):-t12(A,0,Num1,0,0,Num2).
t12([],Num1,Num1,_,Num2,Num2):-!.
t12([48|Tail],TNum1,Num1,1,TNum2,Num2):-NNum2 is TNum2+1,t12(Tail,TNum1,Num1,0,NNum2,Num2),!.
t12([43|Tail],TNum1,Num1,_,TNum2,Num2):-NNum1 is TNum1+1,t12(Tail,NNum1,Num1,1,TNum2,Num2),!.
t12([45|Tail],TNum1,Num1,_,TNum2,Num2):-NNum1 is TNum1+1,t12(Tail,NNum1,Num1,1,TNum2,Num2),!.
t12([_|Tail],TNum1,Num1,_,TNum2,Num2):-t12(Tail,TNum1,Num1,0,TNum2,Num2).

task13:-read_str(A,_),t13(A).
t13([]):-write("'w' and 'x' are not found").
t13([119|_]):-put(119),!.
t13([120|_]):-put(120),!.
t13([_|T]):-t13(T).
