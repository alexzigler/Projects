using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;

namespace Tema1
{
    public partial class Form1 : Form
    {
        List <Button> buttons = new List<Button>();
        TableLayoutPanel2[] tabes = new TableLayoutPanel2[9];
        bool turn = true; //x
        //Button[] buttons = new Button[81];

        public Form1()
        {
            InitializeComponent();
            //
            for (int i = 0; i < 81; i++)
            {
                //buttons[i] = new Button();
                buttons.Add(new Button());
            }
            

            for (int i = 0; i < 9; i++)
            {
                tabes[i] = new TableLayoutPanel2();
                tabes[i].ColumnCount = 3;
                tabes[i].RowCount = 3;
            }
            foreach (TableLayoutPanel t in tabes)
            {
                t.BackColor = Color.Gold;
                tableLayoutPanel1.Controls.Add(t);
                t.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
                t.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
                t.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
                t.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
                t.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
                t.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            }
            for (int i = 0; i < 9; i++)
            {
                tabes[i].Dock = DockStyle.Fill;
                for (int j = 0; j < 9; j++)
                {
                    tabes[i].Controls.Add(buttons[9 * i + j]);
                    buttons[9 * i + j].Dock = DockStyle.Fill;
//                    buttons[9 * i + j].ForeColor = Color.Blue;
                    buttons[9 * i + j].BackColor = Color.Lime;
                    buttons[9 * i + j].TabStop = false;
                    buttons[9 * i + j].FlatStyle = FlatStyle.Flat;
                    buttons[9 * i + j].FlatAppearance.BorderSize = 0;
                    buttons[9 * i + j].FlatAppearance.BorderColor = Color.FromArgb(0, 255, 255, 255);
                    buttons[9 * i + j].FlatAppearance.MouseOverBackColor = System.Drawing.Color.Chartreuse;
                    buttons[9 * i + j].FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
                    buttons[9 * i + j].FlatAppearance.CheckedBackColor = System.Drawing.Color.Transparent;
                    
                    buttons[9 * i + j].Click += new System.EventHandler(this.button_Click);
                }
            }
        }

        private void button_Click(object sender, EventArgs e)
        {
            Button b = (Button)(sender);

            /*foreach(Button bx in buttons)
            {
                bx.Text = buttons.IndexOf(bx).ToString();
            }*/
            

            if (isWritable(b)) {
                if (turn)
                {
                    b.ForeColor = Color.Red;
                    b.Text = "X";
                }
                else
                {
                    b.ForeColor = Color.Blue;
                    b.Text = "O";
                }
                turn = !turn;
                b.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Lime;
                b.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Lime;


                foreach (TableLayoutPanel2 p in tabes)// update boards with moves and check if concluded
                {
                    partialWinner(p);
                }

                foreach (TableLayoutPanel2 t in tabes)
                {
                    if (t.Contains(b))
                    {
                        int a = buttons.IndexOf(b);
                        foreach (TableLayoutPanel2 tt in tabes) //make all boards not highlighted
                        {
                            tt.BackColor = Color.Transparent;
                        }
                        if (tabes[a % 9].xresult == "null") //if next board is N/A, highlight it
                        {
                            tabes[a % 9].BackColor = Color.Gold;
                        }
                        else //next board is concludeded, highlight all available boards
                        {
                            foreach(TableLayoutPanel2 tt in tabes)
                            {
                                if (tt.xresult == "null"){
                                    tt.BackColor = Color.Gold;
                                }
                            }
                        }
                        break;
                    }
                }

                //
                
                findPartialWinner();
                findWinner();
            }
            
        }

        private bool isWritable(Button b)
        {
            if (b.Text != "")
                return false;
            int ind=-1;
            foreach(Button bq in buttons)
            {
                if (bq.Equals(b))
                {
                    ind = buttons.IndexOf(bq);
                }
            }
            if (tabes[(int)ind / 9].xresult=="null" && tabes[(int)ind / 9].BackColor == Color.Gold)
            {
                return true;
            }
            return false;
        }
        private void partialWinner(TableLayoutPanel2 p)
        {
            //return win for x, lose (if O wins), draw, or null for N/A

            int i;
            for (i = 0; i < 9; i++)
            {
                if (p.Equals(tabes[i]))
                    break;
            }
            //9i------>9i+8

            //X

            if ((buttons[9 * i].Text == "X" && buttons[9 * i + 1].Text == "X" && buttons[9 * i + 2].Text == "X") ||
                (buttons[9 * i + 3].Text == "X" && buttons[9 * i + 4].Text == "X" && buttons[9 * i + 5].Text == "X") ||
                (buttons[9 * i + 6].Text == "X" && buttons[9 * i + 7].Text == "X" && buttons[9 * i + 8].Text == "X")
                )
            {
                tabes[i].xresult = "win";
                return;
            }

            if ((buttons[9 * i].Text == "X" && buttons[9 * i + 3].Text == "X" && buttons[9 * i + 6].Text == "X") ||
                (buttons[9 * i + 1].Text == "X" && buttons[9 * i + 4].Text == "X" && buttons[9 * i + 7].Text == "X") ||
                (buttons[9 * i + 2].Text == "X" && buttons[9 * i + 5].Text == "X" && buttons[9 * i + 8].Text == "X")
                )
            {
                tabes[i].xresult = "win";
                return;
            }

            if ((buttons[9 * i].Text == "X" && buttons[9 * i + 4].Text == "X" && buttons[9 * i + 8].Text == "X") ||
                (buttons[9 * i + 2].Text == "X" && buttons[9 * i + 4].Text == "X" && buttons[9 * i + 6].Text == "X")
                )
            {
                tabes[i].xresult = "win";
                return;
            }

            //O

            if ((buttons[9 * i].Text == "O" && buttons[9 * i + 1].Text == "O" && buttons[9 * i + 2].Text == "O") ||
                (buttons[9 * i + 3].Text == "O" && buttons[9 * i + 4].Text == "O" && buttons[9 * i + 5].Text == "O") ||
                (buttons[9 * i + 6].Text == "O" && buttons[9 * i + 7].Text == "O" && buttons[9 * i + 8].Text == "O")
                )
            {
                tabes[i].xresult = "lose";
                return;
            }

            if ((buttons[9 * i].Text == "O" && buttons[9 * i + 3].Text == "O" && buttons[9 * i + 6].Text == "O") ||
                (buttons[9 * i + 1].Text == "O" && buttons[9 * i + 4].Text == "O" && buttons[9 * i + 7].Text == "O") ||
                (buttons[9 * i + 2].Text == "O" && buttons[9 * i + 5].Text == "O" && buttons[9 * i + 8].Text == "O")
                )
            {
                tabes[i].xresult = "lose";
                return;
            }

            if ((buttons[9 * i].Text == "O" && buttons[9 * i + 4].Text == "O" && buttons[9 * i + 8].Text == "O") ||
                (buttons[9 * i + 2].Text == "O" && buttons[9 * i + 4].Text == "O" && buttons[9 * i + 6].Text == "O")
                )
            {
                tabes[i].xresult = "lose";
                return;
            }

            // draw
            bool draw = true;
            for (int j = 0; j < 9; j++)
            {
                if (buttons[9 * i + j].Text == "")
                {
                    draw = false;
                }
            }
            if (draw)
            {
                tabes[i].xresult = "draw";
                return;
            }
            tabes[i].xresult = "null";
        }
        private void drawPartialresult(TableLayoutPanel2 p)
        {
            if (p.xresult == "draw")
                return;

            p.BackColor = Color.Transparent;
            foreach (Button b in p.Controls)
            {
                b.BackColor = Color.Transparent;
            }
            int i;
            for (i = 0; i < 9; i++)
            {
                if (p.Equals(tabes[i]))
                    break;
            }
            foreach(Button bx in p.Controls)
            {
                //bx.Text = "";
                bx.Enabled = false;
            }
            if (p.xresult == "win")
            {
                buttons[9*i].BackColor = Color.Red;
                buttons[9*i+2].BackColor = Color.Red;
                buttons[9*i+4].BackColor = Color.Red;
                buttons[9*i+6].BackColor = Color.Red;
                buttons[9*i+8].BackColor = Color.Red;
            }
            if (p.xresult == "lose")
            {
                buttons[9*i].BackColor = Color.Blue;
                buttons[9*i+1].BackColor = Color.Blue;
                buttons[9*i+2].BackColor = Color.Blue;
                buttons[9*i+3].BackColor = Color.Blue;
                buttons[9*i+5].BackColor = Color.Blue;
                buttons[9*i+6].BackColor = Color.Blue;
                buttons[9*i+7].BackColor = Color.Blue;
                buttons[9*i+8].BackColor = Color.Blue;
            }

        }
        private void findPartialWinner()
        {
            foreach(TableLayoutPanel2 p in tabes)
            {
                if (p.xresult != "null")
                {
                    drawPartialresult(p);
                }
            }
        }
        private void findWinner()
        {
            if ((tabes[0].xresult == "win" && tabes[1].xresult == "win" && tabes[2].xresult == "win") ||
                (tabes[3].xresult == "win" && tabes[4].xresult == "win" && tabes[5].xresult == "win") ||
                (tabes[6].xresult == "win" && tabes[7].xresult == "win" && tabes[8].xresult == "win") ||

                (tabes[0].xresult == "win" && tabes[3].xresult == "win" && tabes[6].xresult == "win") ||
                (tabes[1].xresult == "win" && tabes[4].xresult == "win" && tabes[7].xresult == "win") ||
                (tabes[2].xresult == "win" && tabes[5].xresult == "win" && tabes[8].xresult == "win") ||

                (tabes[0].xresult == "win" && tabes[4].xresult == "win" && tabes[8].xresult == "win") ||
                (tabes[2].xresult == "win" && tabes[4].xresult == "win" && tabes[6].xresult == "win")
                )
            {
                DialogResult dialogResult = MessageBox.Show(Menu.name1 + " has won");
                if (dialogResult == DialogResult.OK)
                {
                    Application.Exit();
                }
                foreach (Button bq in buttons)
                    bq.Enabled = false;
                foreach (TableLayoutPanel2 p in tabes)
                {
                    p.BackColor = Color.Transparent;
                }
            }
            else if ((tabes[0].xresult == "lose" && tabes[1].xresult == "lose" && tabes[2].xresult == "lose") ||
                (tabes[3].xresult == "lose" && tabes[4].xresult == "lose" && tabes[5].xresult == "lose") ||
                (tabes[6].xresult == "lose" && tabes[7].xresult == "lose" && tabes[8].xresult == "lose") ||

                (tabes[0].xresult == "lose" && tabes[3].xresult == "lose" && tabes[6].xresult == "lose") ||
                (tabes[1].xresult == "lose" && tabes[4].xresult == "lose" && tabes[7].xresult == "lose") ||
                (tabes[2].xresult == "lose" && tabes[5].xresult == "lose" && tabes[8].xresult == "lose") ||

                (tabes[0].xresult == "lose" && tabes[4].xresult == "lose" && tabes[8].xresult == "lose") ||
                (tabes[2].xresult == "lose" && tabes[4].xresult == "lose" && tabes[6].xresult == "lose")
                )
            {
                DialogResult dialogResult = MessageBox.Show(Menu.name2+" has won");
                if (dialogResult == DialogResult.OK)
                {
                    Application.Exit();
                }
                foreach (Button bq in buttons)
                    bq.Enabled = false;
                foreach(TableLayoutPanel2 p in tabes)
                {
                    p.BackColor = Color.Transparent;
                }
            }
            else
            {
                bool gameover = true;
                foreach (Button by in buttons)
                {
                    if (by.Enabled == true)
                    {
                        gameover = false;
                        break;
                    }
                }
                if (gameover)
                {
                    DialogResult dialogResult = MessageBox.Show("Draw");
                    if (dialogResult == DialogResult.OK)
                    {
                        Application.Exit();
                    }
                }
                else
                {
                    return;
                }
            }

        }
            
    }


}
