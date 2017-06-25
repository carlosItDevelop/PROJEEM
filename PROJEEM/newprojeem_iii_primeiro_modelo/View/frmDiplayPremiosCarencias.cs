using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace View
{
    public partial class frmDiplayPremiosCarencias : Form
    {
        public frmDiplayPremiosCarencias(int Vcar1,
                                         int Vcar2,
                                         int Vcar3,
                                         int Vcar4,
                                         int Vcar5,
                                         int Vcar6,
                                         int Vcar7,
                                         int Vcar8,
                                         int Vcar9,
                                         int Vcar10,
                                         int Vcar11,
                                         int Vcar12,
                                         int Vcar13,
                                         int Vcar14,
                                         int Vcar15,
                                         int vCountCarDoPremio1,
                                         int vCountCarDoPremio2,
                                         int vCountCarDoPremio3,
                                         int vCountCarDoPremio4,
                                         int vCountCarDoPremio5,
                                         int vCountCarDoPremio6,
                                         int vCountCarDoPremio7,
                                         int vCountCarDoPremio8,
                                         int vCountCarDoPremio9,
                                         int vCountCarDoPremio10,
                                         int vCountCarDoPremio11,
                                         int vCountCarDoPremio12,
                                         int vCountCarDoPremio13,
                                         int vCountCarDoPremio14,
                                         int vCountCarDoPremio15)

        {
            InitializeComponent();

            lblCar1.Text = Vcar1.ToString();
            lblCar2.Text = Vcar2.ToString();
            lblCar3.Text = Vcar3.ToString();
            lblCar4.Text = Vcar4.ToString();
            lblCar5.Text = Vcar5.ToString();
            lblCar6.Text = Vcar6.ToString();
            lblCar7.Text = Vcar7.ToString();
            lblCar8.Text = Vcar8.ToString();
            lblCar9.Text = Vcar9.ToString();
            lblCar10.Text = Vcar10.ToString();
            lblCar11.Text = Vcar11.ToString();
            lblCar12.Text = Vcar12.ToString();
            lblCar13.Text = Vcar13.ToString();
            lblCar14.Text = Vcar14.ToString();
            lblCar15.Text = Vcar15.ToString();

            lblPremio1periodo.Text = vCountCarDoPremio1.ToString();
            lblPremio2periodo.Text = vCountCarDoPremio2.ToString();
            lblPremio3periodo.Text = vCountCarDoPremio3.ToString();
            lblPremio4periodo.Text = vCountCarDoPremio4.ToString();
            lblPremio5periodo.Text = vCountCarDoPremio5.ToString();
            lblPremio6periodo.Text = vCountCarDoPremio6.ToString();
            lblPremio7periodo.Text = vCountCarDoPremio7.ToString();
            lblPremio8periodo.Text = vCountCarDoPremio8.ToString();
            lblPremio9periodo.Text = vCountCarDoPremio9.ToString();
            lblPremio10periodo.Text = vCountCarDoPremio10.ToString();
            lblPremio11periodo.Text = vCountCarDoPremio11.ToString();
            lblPremio12periodo.Text = vCountCarDoPremio12.ToString();
            lblPremio13periodo.Text = vCountCarDoPremio13.ToString();
            lblPremio14periodo.Text = vCountCarDoPremio14.ToString();
            lblPremio15periodo.Text = vCountCarDoPremio15.ToString();

        }


        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
