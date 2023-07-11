using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Tema1
{
    public partial class Menu : Form
    {
        public static string name1, name2;
        public Menu()
        {
            InitializeComponent();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (textBox1.Text != "" && textBox2.Text != "")
            {
                name1 = textBox1.Text;
                name2 = textBox2.Text;
                this.Hide();
                new Form1().Show();
            }
            else
            {
                radioButton1.Checked = false;
            }
        }
    }
}
