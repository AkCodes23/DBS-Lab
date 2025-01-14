using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace banking_application
{
    public partial class Form1 : Form
    {
        String password; // Current password

        public Form1()
        {
            InitializeComponent();
            password = "student"; // Initial password
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // You can leave this empty or implement any required logic
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            // Handle the TextChanged event if needed
        }

        private void button1_Click(object sender, EventArgs e)
        {
           

            // Step 3: Update the password
            password = textBox3.Text;

            // Show success message
            MessageBox.Show("Password changed successfully!");

            // Optionally, clear the text boxes after password change
            
            textBox3.Clear();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            // Handle the TextChanged event for textBox1 if needed
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Validate the password entered by the user
            if (textBox2.Text != password)
            {
                MessageBox.Show("Incorrect password.");
            }
            else
            {
                // If the password is correct, open Form2
                Form2 f2 = new Form2();
                f2.Show();
            }
        }
    }
}
