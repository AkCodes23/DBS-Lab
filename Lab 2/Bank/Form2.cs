using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Banking
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        public Form2(String str,String i, String str2,String j)
        {
            InitializeComponent();
            if(str == "Harsh"){
                j = "10";
            }
            if (str == "Akhil")
            {
                j = "1000000000000";
            }
            textBox1.Text = str;
            textBox2.Text = i;
            textBox3.Text = str2;
            textBox4.Text = j;
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
