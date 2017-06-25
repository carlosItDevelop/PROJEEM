using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.IO;
using View;

namespace Projeem.View
{
    public partial class frmMDIForm : Form
    {
        private const MessageBoxButtons cOk = MessageBoxButtons.OK;
        private const MessageBoxIcon cInfo = MessageBoxIcon.Information;
        private const MessageBoxIcon cErro = MessageBoxIcon.Error;
        public const String appTitle = "PROJEEM III - Projeto de Engenharia Estatística e Matemática";
        SqlConnection cn;
        ArrayList listaImg = new ArrayList();
        public frmMDIForm()
        {
            cn = new SqlConnection();
            InitializeComponent();
            sbLblTitle.Text  = "   PROJEEM III";
            sbLblVersao.Text = " - Versão: " + Application.ProductVersion + " - By: COOPERCHIP - Soluções em Infromática Ltda.";

            int ano = DateTime.Now.Year;
            string mes = DateTime.Now.Month.ToString();
            if (int.Parse(mes) < 10)
            {
                mes = "0" + mes;
            }
            CSharpUtil.Util.Referencia = ano.ToString() + mes;
            CSharpUtil.Util.User = "CAS";
            CSharpUtil.Util.Date = DateTime.Now.ToShortDateString();
        
        
        }


        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void frmMDIForm_Load(object sender, EventArgs e)
        {
            // Preencher um ArrayList com as imagnes do diretório
            // AppSetupPath + @"\img\";
            string diretorio = Application.StartupPath + @"\img";
            DirectoryInfo dir = new DirectoryInfo(diretorio);
            FileInfo[] files = dir.GetFiles();

            foreach (FileInfo file in files)
            {
                listaImg.Add(file);
            }
            tmTrocaImg.Enabled = false;
            this.MaximizeBox = false;
        }




        private void fundoFixoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fundoFixoToolStripMenuItem.Enabled = false;
            imagemDeFundoToolStripMenuItem.Enabled = true;
            congelarImagensToolStripMenuItem.Enabled = false;
            tmTrocaImg.Enabled = false;
            this.BackgroundImage = Image.FromFile(Application.StartupPath + @"\img\logo.jpg");
            lblNameImg.Text = ".: [ " + "LOGO.JPG" + " ] :.";
        }

        private void imagemDeFundoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fundoFixoToolStripMenuItem.Enabled = true;
            imagemDeFundoToolStripMenuItem.Enabled = false;
            congelarImagensToolStripMenuItem.Enabled = true;
            tmTrocaImg.Enabled = true;
        }

        private void congelarImagensToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fundoFixoToolStripMenuItem.Enabled = true;
            imagemDeFundoToolStripMenuItem.Enabled = true;
            congelarImagensToolStripMenuItem.Enabled = false;
            tmTrocaImg.Enabled = false;
        }

        int num_img = 0;
        string fileImg = null;
        string pathImg = Application.StartupPath + @"\img";
        private void tmTrocaImg_Tick(object sender, EventArgs e)
        {
            num_img = (++CSharpUtil.Util.NumImg);
            if (num_img >= listaImg.Count)
            {
                num_img = CSharpUtil.Util.NumImg = 0;
            }
            fileImg = listaImg[num_img].ToString();
            // Garante que só vai Mostrar arquivos .jpg
            if (fileImg.ToLower().Substring(fileImg.Length - 3) == "jpg")
            {
                this.BackgroundImage = Image.FromFile(pathImg + "\\" + fileImg);
                lblNameImg.Text = ".: [ " + fileImg.ToUpper() + " ] :.";
            }
        }

        private void semBackGroundToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tmTrocaImg.Enabled = false;
            this.BackgroundImage = null;
        }


        private void toolBtnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void btnAplicaDebitoECredito_Click(object sender, EventArgs e)
        {
            frmControleDeAplicacao ctrl = new frmControleDeAplicacao(this.cn);
            ctrl.MdiParent = this;
            ctrl.Show();
        }



 





 


  }} // Fim da classe e do Namespace