module Functions
// удаляет из списка list элементы меньшие или равные n
let rec cut list n =
    match list with
    |[] -> []
    |head::tail -> if head > n then head::cut tail n
                               else cut tail n
// проверяет делимость числа f на число n
let is_divided f n =
       if f % n = 0 then true
       else false
// индивидуальная задача 12
let dividers list = 
    let rec process_list list n =
        if (list = []) then []
        else 
            let rec exist_dividend list =
                match list with
                |[] -> false
                |head::tail -> is_divided head n || exist_dividend tail
            if exist_dividend list then n::process_list (cut list n) (n+1)
            else process_list (cut list n) (n+1)
    process_list list 1

// проверка на простоту
let is_simple n = 
    let rec simplicity_test n k =
        match k with
        | 0 -> false
        | 1 -> true
        | _ -> not (is_divided n k) && simplicity_test n (k - 1)
    simplicity_test n (n - 1);

// проверка на взаимопростоту
let are_mutually_simple n1 n2 =
    let rec mutual_simplicity_test n1 n2 k =
        match k with
        | 1 -> true
        | _ -> not (is_divided n1 k && is_divided n2 k) && mutual_simplicity_test n1 n2 (k - 1)
    mutual_simplicity_test n1 n2 n1;

// функция Эйлера
let fi x =
    let rec tailRecursiveFi k acc =
        match k with
        | 0| 1 -> acc
        | _ -> if are_mutually_simple x k then tailRecursiveFi (k - 1) acc + 1 else tailRecursiveFi (k - 1) acc
    tailRecursiveFi (x - 1) 1
// 
let pi x =
    let rec tailRecursivePi k acc =
        match k with
        | 0 -> acc
        | _ -> if is_simple k then tailRecursivePi (k - 1) acc + 1 else tailRecursivePi (k - 1) acc
    tailRecursivePi (x - 1) 0

// индивидуальная задача 13
let fi_pi_dividers list =
    let fi_pi_list = List.map (fun i -> pi(i) + fi(i)) list
    let rec get_dividers list n =
        if List.isEmpty list then List.Empty
        else
            if List.exists (fun elem -> is_divided elem n) list then List.append [n] (get_dividers (List.filter (fun elem -> elem > n) list) (n+1)) 
            else 
                get_dividers (List.filter (fun elem -> elem > n) list) (n+1)
    get_dividers fi_pi_list 1


// индивидуальная задача 9
let rec cut_left n =
    if (n < 10) then 0
    else 10 * cut_left (n / 10) + (n % 10)

let cut_right n = n / 10;

let is_super_cut n =
    let rec is_super_left_cut k boolean =
        if k < 10 then is_simple k && boolean
        else is_super_left_cut (cut_left k) (is_simple k && boolean)
    let rec is_super_right_cut k boolean =
        if k < 10 then is_simple k && boolean
        else is_super_right_cut (cut_right k) (is_simple k && boolean)
    (is_super_left_cut n true) && (is_super_right_cut n true)

let super_cut_sum =
    let rec summing number sum = 
        match number with
        | 100000 -> sum
        | _ -> if is_super_cut number then summing (number+1) (sum+number)
               else summing (number+1) sum
    summing 10 0