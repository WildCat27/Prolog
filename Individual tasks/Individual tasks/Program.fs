// Learn more about F# at https://fsharp.org
// See the 'F# Tutorial' project for more help.
open System
open System.Drawing
open System.IO
open System.Windows.Forms
open Form_template
open Functions
open System.Threading

let form = new Form(FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog, Width= 492, Height = 532, Text = "F# Задачи", Menu = new MainMenu())
let picture = new PictureBox(Height = 500, Width = 470, Image = Image.FromFile(@"C:\Users\Диана\Documents\Prolog\repo\ufo.gif"), Left = 3)
form.Controls.Add(picture);

// Меню бар
let mFile = form.Menu.MenuItems.Add("Файл")
let mForms = form.Menu.MenuItems.Add("Задачи")
let mHelp = form.Menu.MenuItems.Add("Помощь")

// Подменю
let miExit = new MenuItem("Выход")
let miAbout = new MenuItem("О программе...")
let miTask = new MenuItem("Задача 9")
let miForm1 = new MenuItem("Задача 12")
let miForm2 = new MenuItem("Задача 13")
let miForm3 = new MenuItem("Задача 14")

// Добавление подменю в пункты меню
mFile.MenuItems.Add(miExit) |>ignore
mHelp.MenuItems.Add(miAbout) |>ignore
mForms.MenuItems.Add(miTask) |>ignore
mForms.MenuItems.Add(miForm1) |>ignore
mForms.MenuItems.Add(miForm2) |>ignore
mForms.MenuItems.Add(miForm3) |>ignore
// Закрытие приложения
let Exit _ = form.Close ()
let _ = miExit.Click.Add(Exit)

//Индивидуальная задача 12
let Task12 = new Template(System.Drawing.Color.Orchid, 12, dividers)

//Индивидуальная задача 13
let Task13 = new Template(System.Drawing.Color.DeepSkyBlue, 13, fi_pi_dividers)

//Индивидуальная задача 14
let Task14 = new Template(System.Drawing.Color.YellowGreen, 14, List.filter is_super_cut)

//Вызов форм
let opTask() = MessageBox.Show("Сумма простых чисел, которых можно обрезать слева направо и справа налево, равна " + super_cut_sum.ToString()) |> ignore
//let opTask _ = do MessageBox.Show("Сумма простых чисел, которых можно обрезать слева направо и справа налево, равна " + super_cut_sum.ToString()) |> ignore
let task = new Thread(opTask)
let task_start _ = do task.Start()
let opForm1 _ = do Task12.ShowDialog() |>ignore
let opForm2 _ = do Task13.ShowDialog() |>ignore
let opForm3 _ = do Task14.ShowDialog() |>ignore
//
let _ = miTask.Click.Add(task_start)
let _ = miForm1.Click.Add(opForm1)
let _ = miForm2.Click.Add(opForm2)
let _ = miForm3.Click.Add(opForm3)
// Запускаем форму
do Application.Run(form)
//(fun i -> List.map pi i)

//let rec readList n =
//    match n with
//    |0 -> []
//    |_ -> System.Convert.ToInt32(System.Console.ReadLine())::readList (n-1)
    

//let rec read_list n = 
//    if n=0 then []
//    else
//    let Head = System.Convert.ToInt32(System.Console.ReadLine())
//    let Tail = read_list (n-1)
//    Head::Tail

//let read_data = 
//    let n=System.Convert.ToInt32(System.Console.ReadLine())
//    readList n

//let rec cut list n =
//    match list with
//    |[] -> []
//    |head::tail -> if head > n then head::cut tail n
//                               else cut tail n

//let rec prog list=
//    match list with
//    |[] -> []
//    |h::t ->    let tail=prog t
//                if h%2=0 then h::tail
//                         else tail  

//let rec write_list list=
//    match list with
//    |[] ->   let z=System.Console.ReadKey()

//             0
//    |h::t -> System.Console.WriteLine(h.ToString())
//             write_list t   

//let is_divided f n =
//       if f % n = 0 then true
//       else false

//let rec build list n =
//    if (list = []) then []
//    else 
//        let rec div list =
//            match list with
//            |[] -> false
//            |head::tail -> is_divided head n || div tail
//        if div list then n::build (cut list n) (n+1)
//        else build (cut list n) (n+1)

//let rec sh list n =
//    if (List.isEmpty list) then List.Empty
//    else
//        if (List.exists (fun elem -> is_divided elem n) list) then List.append (sh (List.filter (fun elem -> elem > n) list) (n+1)) [n]
//        else 
//            sh list (n+1)

//[<EntryPoint>]
//let main argv = 
//    sh read_data 1 |> write_list
    