// Learn more about F# at https://fsharp.org
// See the 'F# Tutorial' project for more help.

let rec readList n =
    match n with
    |0 -> []
    |_ -> System.Convert.ToInt32(System.Console.ReadLine())::readList (n-1)
    

let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    readList n

let rec cut list n =
    match list with
    |[] -> []
    |head::tail -> if head > n then head::cut tail n
                               else cut tail n

let rec prog list=
    match list with
    |[] -> []
    |h::t ->    let tail=prog t
                if h%2=0 then h::tail
                         else tail  

let rec write_list list=
    match list with
    |[] ->   let z=System.Console.ReadKey()

             0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t   

let is_divided f n =
       if f % n = 0 then true
       else false

let rec build list n =
    if (list = []) then []
    else 
        let rec div list =
            match list with
            |[] -> false
            |head::tail -> is_divided head n || div tail
        if div list then n::build (cut list n) (n+1)
        else build (cut list n) (n+1)

[<EntryPoint>]
let main argv = 
    build read_data 1 |> write_list