/*Задача*/
one_option(Students):-is_present(A),is_present(D),is_present(B),is_present(V),is_present(G),
    VisitLog = [A,D,B,V,G],students_today(VisitLog),get_students(1,VisitLog,Students).

get_students(_,[],[]):-!.
get_students(N,["+"|T],[Student|Rest]):-get_student(N,Student),N1 is N+1,get_students(N1,T,Rest),!.
get_students(N,[_|T],Rest):-N1 is N+1,get_students(N1,T,Rest).

get_student(1,"Andrew").
get_student(2,"Dmitry").
get_student(3,"Boris").
get_student(4,"Victor").
get_student(5,"Gregory").


/*определяет, пришел ли студент на лекции*/
is_present(Student):-Student = "+";Student = "-".

/*1. Если пришли Андрей и Дмитрий, то Бориса быть не должно, но если Дмитрий не пришел, то Борис должен быть, а Виктор быть не должен.*/

condition1([A,D,B,V,_]):-(A="+",D="+" -> B="-"; (D="-"->(B="+",V="-");true)).

/*2. Если Виктор пришел, то Андрея быть не должно и наоборот.*/

condition2(["-",_,_,"+",_]).
condition2(["+",_,_,"-",_]).

/*3. Если Дмитрий пришел, то Григория быть не должно.*/

condition3([_,"+",_,_,"-"]).
condition3([_,"-",_,_,_]).

/*4. Если Бориса нет, то Дмитрий должен быть, но если нет также и Виктора, а если Виктор есть, Дмитрия быть не должно, но должен быть Григорий.*/

condition4([_,D,B,V,G]):-(B="-" -> (V="-" -> D="+";(D="-",G="+"));true).

/*Проверяет, удовлетворяет ли сочетание студентов заданным условиям*/
students_today(Students):-condition1(Students),condition2(Students),condition3(Students),condition4(Students).

del(X,[X|T],T).
del(X,[H|T],[H|NT]):-del(X,T,NT).

varia_rep(0,_,[]).
varia_rep(N,L,[H|RVaria]):-N>0,N1 is N-1,del(H,L,_),varia_rep(N1,L,RVaria).

exist([Head|_],Head):-!.
exist([_|Tail],P):-exist(Tail,P).

in_schedule(X,[Head|_]):-exist(Head,X),!.
in_schedule(X,[_|Tail]):-in_schedule(X,Tail).

write_list([]):-!.
write_list([Head|Tail]):-write(" "),write(Head),write_list(Tail).

write_schedule([],_):-put(10),!.
write_schedule([Students|RestStudents],[Day|RestDays]):-write(Day),write(":"),write_list(Students),write("; "),write_schedule(RestStudents,RestDays).

logical_task:-tell('C:\\Users\\Диана\\Documents\\Prolog\\Пятидневное расписание.txt'),fail.
logical_task:-bagof(X,one_option(X),List),varia_rep(5,List,Schedule),
    in_schedule("Andrew",Schedule),
    in_schedule("Dmitry",Schedule),
    in_schedule("Boris",Schedule),
    in_schedule("Victor",Schedule),
    in_schedule("Gregory",Schedule),write_schedule(Schedule,["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]),fail.
logical_task:-told.

