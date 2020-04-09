/*Задача*/
task:-write("Возможные варианты посещений лекций студентами:"),nl,
    is_present(A),is_present(D),is_present(B),is_present(V),is_present(G),
    Students = [A,D,B,V,G],students_today(Students),wr(Students),nl,fail.

/*выводит список студентов, пришедших на лекции*/
wr(Students):-wr(1,Students).
wr(_,[]):-!.
wr(N,[S|Rest]):-((S = "+",
    (
       N = 1,write(" Андрей");
       N = 2,write(" Дмитрий");
       N = 3,write(" Борис");
       N = 4,write(" Виктор");
       N = 5,write(" Григорий")
    ));
    S = "-"),N1 is N+1,wr(N1,Rest).

/*определяет, пришел ли студент на лекции*/
is_present(Student):-Student = "+";Student = "-".

/*1. Если пришли Андрей и Дмитрий, то Бориса быть не должно, но если Дмитрий не пришел, то Борис должен быть, а Виктор быть не должен.*/

condition1(["+","+","-",_,_]).
condition2(["+","-","+","-",_]).

/*2. Если Виктор пришел, то Андрея быть не должно и наоборот.*/

restriction1(["-",_,_,"+",_]).
restriction1(["+",_,_,"-",_]).

/*3. Если Дмитрий пришел, то Григория быть не должно.*/

restriction2([_,"+",_,_,"-"]).
restriction2([_,"-",_,_,_]).

/*4. Если Бориса нет, то Дмитрий должен быть, но если нет также и Виктора, а если Виктор есть, Дмитрия быть не должно, но должен быть Григорий.*/

condition3([_,"+","-","-",_]).
condition4([_,"-","-","+","+"]).

/*Проверяет, удовлетворяет ли сочетание студентов заданным условиям*/
students_today(Students):-restriction1(Students),restriction2(Students),
    (
        condition1(Students),!;
        condition2(Students),!;
        condition3(Students),!;
        condition4(Students)
    ).


