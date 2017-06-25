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
using Controller;

namespace Apresentacao
{
    public partial class frmMDIForm : Form
    {
        private const MessageBoxButtons cOk = MessageBoxButtons.OK;
        private const MessageBoxIcon cInfo = MessageBoxIcon.Information;
        private const MessageBoxIcon cErro = MessageBoxIcon.Error;
        public const String appTitle = "CooperVídeo - A sua Locadora Virtual"; // AINDA NÃO USEI
        SqlConnection cn;
        ArrayList listaImg = new ArrayList();
        public frmMDIForm()
        {
            cn = new SqlConnection();
            InitializeComponent();
            sbLblTitle.Text  = "   PROJEEM - Projeto de Engenharia Estatística e Matemática.";
            sbLblVersao.Text = "   Versão: " + Application.ProductVersion;
            frmLogin fl = new frmLogin(this.cn);
            fl.ShowDialog();
        }


        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void smnuCadSocios_Click(object sender, EventArgs e)
        {
            frmBancas f = new frmBancas();
            f.MdiParent = this;
            f.Show();
        }

 


        private void smnuLocExpedicao_Click(object sender, EventArgs e)
        {
            //frmExpedicao expedicao = new frmExpedicao(this.cn);
            //expedicao.MdiParent = this;
            //expedicao.Show();
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
            tmTrocaImg.Enabled = true;
            this.MaximizeBox = false;
        }



        private void fundoFixoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fundoFixoToolStripMenuItem.Enabled = false;
            imagemDeFundoToolStripMenuItem.Enabled = true;
            congelarImagensToolStripMenuItem.Enabled = false;
            tmTrocaImg.Enabled = false;
            this.BackgroundImage = Image.FromFile(Application.StartupPath + @"\img\logo.jpg");
            lblNameImg.Text = "::: [ " + "LOGO.JPG" + " ] :::";
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
            num_img = (++Util.NumImg);
            if (num_img >= listaImg.Count)
            {
                num_img = Util.NumImg = 0;
            }
            fileImg = listaImg[num_img].ToString();
            // Garante que só vai Mostrar arquivos .jpg
            if (fileImg.ToLower().Substring(fileImg.Length - 3) == "jpg")
            {
                this.BackgroundImage = Image.FromFile(pathImg + "\\" + fileImg);
                lblNameImg.Text = "::: [ " + fileImg.ToUpper() + " ] :::";
            }
        }

        private void semBackGroundToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tmTrocaImg.Enabled = false;
            this.BackgroundImage = null;
        }

        private void toolsBtnAnotacao_Click(object sender, EventArgs e)
        {
            frmAnotacoes f = new frmAnotacoes(cn);
            f.MdiParent = this;
            f.Show();
        }

        private void toolBtnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tooSendMail_Click(object sender, EventArgs e)
        {
            //frmMailList email = new frmMailList();
            //email.MdiParent = this;
            //email.Show();
        }


        private void subMnuEstatistica_Click(object sender, EventArgs e)
        {
            frmEstatistica f = new frmEstatistica();
            f.MdiParent = this;
            f.Show();
        }

        private void resultadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmResults f = new frmResults();
            f.MdiParent = this;
            f.Show();
        }

        private void subMnuSobre_Click(object sender, EventArgs e)
        {
            frmSobre f = new frmSobre();
            f.MdiParent = this;
            f.Show();
        }

        private void subMnuAVertical_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }

        private void subMnuAHorizontal_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void subMnuACascata_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void subMnuFecharTodasAsJanelas_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        private void tooBtnGerarCarencias_Click(object sender, EventArgs e)
        {
            frmCadCarencia f = new frmCadCarencia();
            f.MdiParent = this;
            f.Show();
        }

        private void subMnuApostar_Click(object sender, EventArgs e)
        {
            frmApostar f = new frmApostar();
            f.MdiParent = this;
            f.Show();
        }

        private void tooBtnApostar_Click(object sender, EventArgs e)
        {
            frmApostar f = new frmApostar();
            f.MdiParent = this;
            f.Show();
        }


        private void subMnuAnotacoes_Click(object sender, EventArgs e)
        {
            frmAnotacoes f = new frmAnotacoes(cn);
            f.MdiParent = this;
            f.Show();
        }

        private void toolBtnBancas_Click(object sender, EventArgs e)
        {
            frmBancas f = new frmBancas();
            f.MdiParent = this;
            f.Show();
        }

        private void subMnuCarencia_Click(object sender, EventArgs e)
        {
            frmCadCarencia f = new frmCadCarencia();
            f.MdiParent = this;
            f.Show();
        }



  }} // Fim do Namespace