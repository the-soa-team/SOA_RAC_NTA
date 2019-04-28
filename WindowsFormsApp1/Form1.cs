using RentACar.Dal.Concretes.Repo;
using RentACar.Bll.Concretes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //using (var a = new CarRepository())
            //{
            //    dataGridView1.DataSource = a.SelectAll();
            //}
            using (var x = new CarManager())
            {
                dataGridView1.DataSource = x.SelectAll();
            }


        }
    }
}
