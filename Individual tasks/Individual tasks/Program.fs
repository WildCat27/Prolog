// Learn more about F# at https://fsharp.org
// See the 'F# Tutorial' project for more help.

open System
open System.Drawing
open System.IO
open System.Windows.Forms
let form = new Form(Width= 492, Height = 532, Text = "F# Задачи", Menu = new MainMenu())
let picture = new PictureBox(Height = 500, Width = 470, Image = Image.FromFile(@"C:\Users\Диана\Documents\Prolog\repo\ufo.gif"), Left = 3)
form.Controls.Add(picture);

// Меню бар
let mFile = form.Menu.MenuItems.Add("Файл")
let mHelp = form.Menu.MenuItems.Add("Помощь")
let mForms = form.Menu.MenuItems.Add("Задачи")

// Подменю
let miExit = new MenuItem("Выход")
let miAbout = new MenuItem("О программе...")
let miForm1 = new MenuItem("Задача 1")
let miForm2 = new MenuItem("Задача 2")
let miForm3 = new MenuItem("Задача 3")

// Добавление подменю в пункты меню
mFile.MenuItems.Add(miExit)
mHelp.MenuItems.Add(miAbout)
mForms.MenuItems.Add(miForm1)
mForms.MenuItems.Add(miForm2)
mForms.MenuItems.Add(miForm3)
// Закрытие приложения
let Exit _ = form.Close ()
let _ = miExit.Click.Add(Exit)

//Форма_1
let Form1 = new Form(Text = "Индивидуальная задача 12" ,Width= 492, Height = 532, BackColor = System.Drawing.Color.DeepSkyBlue)
let Label1 = new Label(Text = "Введите количество элементов списка", Top = 10, Width = 250)
let TextBox1 = new TextBox(Top = 10, Left = 250)

Form1.Controls.Add(Label1)
Form1.Controls.Add(TextBox1)
//let Edit2 = new TextBox(Top=20, Text="5")
//let button1 = new Button(Text="+", Top=50, Width=25, Height=25)
//let button2 = new Button(Text="-", Top=50, Left=30, Width=25, Height=25)
//let button3 = new Button(Text="*", Top=50, Left=60, Width=25, Height=25)
//let button4 = new Button(Text="/", Top=50, Left=90, Width=25, Height=25)
//Form1.Controls.Add(Edit1)
//Form1.Controls.Add(Edit2)
//Form1.Controls.Add(button1)
//Form1.Controls.Add(button2)
//Form1.Controls.Add(button3)
//Form1.Controls.Add(button4)

//let Summ _ = MessageBox.Show(string(int(Edit1.Text) + (int(Edit2.Text))), "Сумма") |>ignore
//let Minus _ = MessageBox.Show(string(int(Edit1.Text) - (int(Edit2.Text))), "Разность") |>ignore
//let Umnoj _ = MessageBox.Show(string(int(Edit1.Text) * (int(Edit2.Text))), "Умножение") |>ignore
//let Del _ = MessageBox.Show(string(int(Edit1.Text)/ (int(Edit2.Text))), "Деление") |>ignore

//let _ = button1.Click.Add(Summ)
//let _ = button2.Click.Add(Minus)
//let _ = button3.Click.Add(Umnoj)
//let _ = button4.Click.Add(Del)

//Форма_2
let Form2 = new Form(Width= 400, Height = 300, Text = "Дочерняя форма №2")
let ProgressBar1 = new ProgressBar(Dock = DockStyle.Top)
let ScrollBar1 = new TrackBar(Top = 50, Maximum = 100, Width = 400)
let Button1 = new Button(Dock = DockStyle.Bottom, Text = "Перейти на форму 3")
Form2.Controls.Add(ProgressBar1)
Form2.Controls.Add(ScrollBar1)
Form2.Controls.Add(Button1)
let Change _ = ProgressBar1.Value <- ScrollBar1.Value
let _ = ScrollBar1.ValueChanged.Add(Change)

//Форма_3
let Form3 = new Form(Text = "Дочерняя форма №3" ,Width = 400, Height = 300)
let Cal = new MonthCalendar()
let Button2 = new Button(Dock=DockStyle.Bottom, Text = "Нажми меня")
Form3.Controls.Add(Cal)
Form3.Controls.Add(Button2)
let MsgDay _ = MessageBox.Show ("Сегодня " + DateTime.Now.ToString(), "Дата") |>ignore
let _ = Button2.Click.Add(MsgDay)

//Вызов форм
let opForm1 _ = do Form1.ShowDialog()
let opForm2 _ = do Form2.ShowDialog()
let opForm3 _ = do Form3.ShowDialog()
//
let _ = miForm1.Click.Add(opForm1)
let _ = miForm2.Click.Add(opForm2)
let _ = miForm3.Click.Add(opForm3)
let _ = Button1.Click.Add(opForm3)
// Запускаем форму
do Application.Run(form)

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
    