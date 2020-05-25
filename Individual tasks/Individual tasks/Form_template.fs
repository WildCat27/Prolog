module Form_template
open System.Windows.Forms
open System.Drawing
open System


type Template(color : Color, number : int, task : list<int> -> list<int>) as this=
    inherit System.Windows.Forms.Form( ClientSize = new System.Drawing.Size(400, 330), FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog, BackColor = color, AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi, Text = "Индивидуальная задача " + number.ToString(), Font = new System.Drawing.Font("Microsoft JhengHei", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0))), ForeColor = System.Drawing.Color.White)
    //let label1 = new System.Windows.Forms.Label(BackColor = System.Drawing.Color.Transparent, Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204))), ForeColor = System.Drawing.Color.White, Location = new System.Drawing.Point(20, 20), Size = new System.Drawing.Size(366, 24), Text = "Введите количество элементов списка");
    let label2 = new System.Windows.Forms.Label(Size = new System.Drawing.Size(155, 24), Text = "Введите список через пробел", Location = new System.Drawing.Point(20, 10), ForeColor = System.Drawing.Color.White, Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204))), BackColor = System.Drawing.Color.Transparent);
    //let richTextBox1 = new System.Windows.Forms.RichTextBox(Size = new System.Drawing.Size(360, 30), Location = new System.Drawing.Point(20, 40), Font = new System.Drawing.Font("Microsoft JhengHei", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0))), BorderStyle = System.Windows.Forms.BorderStyle.None, BackColor = System.Drawing.Color.White);
    let richTextBox2 = new System.Windows.Forms.RichTextBox(Size = new System.Drawing.Size(360, 90), Location = new System.Drawing.Point(20, 30), Font = new System.Drawing.Font("Microsoft JhengHei", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0))), BorderStyle = System.Windows.Forms.BorderStyle.None, BackColor = System.Drawing.Color.White);
    let label3 = new System.Windows.Forms.Label(Text = "Результат", Size = new System.Drawing.Size(103, 24), Location = new System.Drawing.Point(20, 140), ForeColor = System.Drawing.Color.White, Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204))), BackColor = System.Drawing.Color.Transparent);
    let richTextBox3 = new System.Windows.Forms.RichTextBox(Size = new System.Drawing.Size(360, 90), Location = new System.Drawing.Point(20, 160), Font = new System.Drawing.Font("Microsoft JhengHei", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0))), BorderStyle = System.Windows.Forms.BorderStyle.None, BackColor = System.Drawing.Color.White);
    let button = new System.Windows.Forms.Button(Location = new System.Drawing.Point(280, 270), Text = "Выполнить", Size = new System.Drawing.Size(100, 40), ForeColor = System.Drawing.Color.White, Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204))), FlatStyle = System.Windows.Forms.FlatStyle.Flat, BackColor = color); 
    do this.Controls.Add(button)
    do this.Controls.Add(richTextBox3)
    do this.Controls.Add(label3)
    do this.Controls.Add(richTextBox2)
    do this.Controls.Add(label2)
    let button_click _ =
        let entered_list = List.map (fun i -> System.Convert.ToInt32(i : string)) (richTextBox2.Text.Split([|' '|], StringSplitOptions.RemoveEmptyEntries) |> List.ofArray)
        let processed_list = List.map (fun i -> System.Convert.ToString(i : int)) (task entered_list)
        richTextBox3.Clear()
        List.map (fun i -> richTextBox3.AppendText(i + " ")) processed_list |> ignore
    do button.Click.Add(button_click)
    
    