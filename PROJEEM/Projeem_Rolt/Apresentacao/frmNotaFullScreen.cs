using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using Controller;

namespace Apresentacao
{
    public partial class frmNotaFullScreen : Form
    {
        string assunto;
        string status;
        string descricao;
        Anotacao anotacao;
        int posicao = 0;
        public frmNotaFullScreen(string assunto, string status, string descricao, Anotacao anotacao , int posicao)
        {
            InitializeComponent();
            this.anotacao = anotacao;
            this.assunto = assunto;
            this.status = status;
            this.descricao = descricao;
            this.posicao = posicao;
            PreencheNavegador();
        }

        void PreencheNavegador(){
                anotacao.PosicionaRegistro(this.posicao.ToString());
                PreencheCampos();
        }

        private void PreencheCampos()
        {
            txtFullScreen.Text = anotacao.Descricao;
            cboAssunto.Text = anotacao.Assunto;
            cboStatus.Text = anotacao.Status;
            lblDisplayNumReg.Text = "Registro: [" + anotacao.Registro_atual + "] de: [" + anotacao.Num_registro + "]";
        }
                

        private void btnFechar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmNotaFullScreen_Load(object sender, EventArgs e)
        {
            cboAssunto.Text = this.assunto;
            cboStatus.Text = this.status;
            txtFullScreen.Text = this.descricao;
        }

        private void btnProximo_Click(object sender, EventArgs e)
        {
            anotacao.Proximo();
            PreencheCampos();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            anotacao.Anterior();
            PreencheCampos();
        }

        private void btnUltimo_Click(object sender, EventArgs e)
        {
            anotacao.Ultimo();
            PreencheCampos();
        }

        private void btnPrimeiro_Click(object sender, EventArgs e)
        {
            anotacao.Primeiro();
            PreencheCampos();
        }


    }
}
