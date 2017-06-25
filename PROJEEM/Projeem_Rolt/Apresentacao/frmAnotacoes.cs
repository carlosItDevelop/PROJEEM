using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using Controller;

namespace Apresentacao
{
    public partial class frmAnotacoes : Form
    {
        private Anotacao anotacao;
        private SqlConnection cn;
        public frmAnotacoes(SqlConnection cn)
        {
            InitializeComponent();
            this.cn = cn;
            anotacao = new Anotacao(cn);
        }

        private void anotacoes_Load(object sender, EventArgs e)
        {
            ControlaBtn(false);
            btnBuscar.Enabled = true;
            lblUser.Text = Util.User;
            lblData.Text = Util.Date;
            lblReferencia.Text = Util.Referencia;

            lvAnotacao.Columns[0].Width = 43;
            lvAnotacao.Columns[1].Width = 175;
            lvAnotacao.Columns[2].Width = 296;
            lvAnotacao.Columns[3].Width = 60;

         //   Util.PreencheCombo(this.cn, cboStatus, "status_anotacao", "descricao", "Todos");
            Util.PreencheCombo(this.cn, cboStatus, "status_anotacao", "descricao");

            cboStatus.Text = "Anotação";
            anotacao.LocalizaPorTab(lvAnotacao, "Anotação");
            if (anotacao.Num_registro > 0)
            {
                anotacao.PosicionaRegistro("1");
                PreencheCampos();
            }
            cboAssunto.Focus();


            txtWord1.Focus();
            HabilitaTxt(false);
            lblAcao.Text = "";

            Util.PreencheCombo(this.cn, cboAssunto, "anotacao", "assunto");

        }

        void HabilitaTxt(bool Editavel)
        {
            //txtDescricao.Enabled = Editavel;
            //cboAssunto.Enabled = Editavel;
        }

        private void ControlaBtn(bool Editando)
        {
            btnFechar.Enabled = !Editando;
            btnNovo.Enabled = !Editando;
            btnExcluir.Enabled = !Editando;
            btnAlterar.Enabled = !Editando;
            btnArquivar.Enabled = !Editando;

            btnGravar.Enabled = Editando;
            btnCancelar.Enabled = Editando;
        }


        private void lvAnotacao_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvAnotacao.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            try
            {
                LimpaTxt();
                lblID.Text = Util.GerarID(cn, "id_anotacao");
                lblAcao.Text = "Incluindo...";
                ControlaBtn(true);
                HabilitaTxt(true);
                btnBuscar.Enabled = false;
                //ControlaCampos(true);
            }
            catch (Exception ex)
            {
                Util.MsgErro(ex.Message);
            }

        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            if (lblID.Text.Trim().Equals(""))
            {
                Util.MsgErro("É necessário que Haja um Registro para a Edição!");
            }
            else
            {
                lblAcao.Text = "Alterando...";
                ControlaBtn(true);
                HabilitaTxt(true);
                btnBuscar.Enabled = false;
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            //LimpaTxt();
            lblAcao.Text = "";
            ControlaBtn(false);
            HabilitaTxt(false);
            btnBuscar.Enabled = true;
        }

        private void btnGravar_Click(object sender, EventArgs e)
        {
            try
            {
                if (VerificaCampos(tabAnotacao.SelectedTab.Name.ToString()))
                {
                    if (lblAcao.Text == "Incluindo...")
                    {
                        switch (tabAnotacao.SelectedTab.Name.ToString())
                        {
                            case "tabCadastro":
                                anotacao.Incluir(lblID.Text, txtDescricao.Text, cboAssunto.Text, cboStatus.Text);
                                cboAssunto.Items.Add(cboAssunto.Text);
                                break;
                            case "tabPendencias":
                                anotacao.Incluir(lblID.Text, txtDescricaoPendencia.Text, 
                                                cboAssuntoPendencia.Text, cboStatusPendencia.Text);
                                cboAssunto.Items.Add(cboAssuntoPendencia.Text);
                                break;
                            case "tabUrgencias":
                                anotacao.Incluir(lblID.Text, txtDescricaoUrgencia.Text, 
                                                cboAssuntoUrgencia.Text, cboStatusUrgencia.Text);
                                cboAssunto.Items.Add(cboAssuntoUrgencia.Text);
                                break;
                            case "tabProjetos":
                                anotacao.Incluir(lblID.Text, txtDescricaoProjetos.Text, 
                                                cboAssuntoProjetos.Text, cboStatusProjetos.Text);
                                cboAssunto.Items.Add(cboAssuntoProjetos.Text);
                                break;
                            case "tabPesquisar":
                                anotacao.Incluir(lblID.Text, txtDescricaoPesquisar.Text, 
                                                cboAssuntoPesquisar.Text, cboStatusPesquisar.Text);
                                cboAssunto.Items.Add(cboAssuntoPesquisar.Text);
                                break;
                            case "tabAgenda":
                                anotacao.Incluir(lblID.Text, txtDescricaoAgenda.Text, 
                                                cboAssuntoAgenda.Text, cboStatusAgenda.Text);
                                cboAssunto.Items.Add(cboAssuntoAgenda.Text);
                                break;
                            default:
                                /* NÃO FAZ NADA */
                                break;

                        }
                    } else if (lblAcao.Text == "Alterando...") {
                        switch (tabAnotacao.SelectedTab.Name.ToString())
                        {
                            case "tabCadastro":
                                anotacao.Alterar(lblID.Text, txtDescricao.Text, cboAssunto.Text, cboStatus.Text);
                                
                                break;
                            case "tabPendencias":
                                anotacao.Alterar(lblID.Text, txtDescricaoPendencia.Text,
                                                cboAssuntoPendencia.Text, cboStatusPendencia.Text);

                                break;
                            case "tabUrgencias":
                                anotacao.Alterar(lblID.Text, txtDescricaoUrgencia.Text,
                                                cboAssuntoUrgencia.Text, cboStatusUrgencia.Text);
                                break;
                            case "tabProjetos":
                                anotacao.Alterar(lblID.Text, txtDescricaoProjetos.Text,
                                                cboAssuntoProjetos.Text, cboStatusProjetos.Text);
                                break;
                            case "tabPesquisar":
                                anotacao.Alterar(lblID.Text, txtDescricaoPesquisar.Text,
                                                cboAssuntoPesquisar.Text, cboStatusPesquisar.Text);
                                break;
                            case "tabAgenda":
                                anotacao.Alterar(lblID.Text, txtDescricaoAgenda.Text,
                                                cboAssuntoAgenda.Text, cboStatusAgenda.Text);
                                break;
                            default:
                                /* NÃO FAZ NADA */
                                break;

                        }
                    } else if (lblAcao.Text == "Excluindo...") {
                                anotacao.Excluir(lblID.Text, this.cboAssunto);
                                cboAssunto.Text = "";
                                cboAssuntoAgenda.Text = "";
                                cboAssuntoPendencia.Text = "";
                                cboAssuntoPesquisar.Text = "";
                                cboAssuntoProjetos.Text = "";
                                cboAssuntoUrgencia.Text = "";
                    }
                    else if (lblAcao.Text == "Arquivando...")
                    {
                                anotacao.Arquivar(lblID.Text, this.cboAssunto);
                                cboAssunto.Text = "";
                                cboAssuntoAgenda.Text = "";
                                cboAssuntoPendencia.Text = "";
                                cboAssuntoPesquisar.Text = "";
                                cboAssuntoProjetos.Text = "";
                                cboAssuntoUrgencia.Text = "";
                    }
                    tabAnotacao_Click(this, e);
                    ControlaBtn(false);
                    btnBuscar.Enabled = true;
                    HabilitaTxt(false);
                    lblAcao.Text = "";
                } // VerificaCampos;
            }
            catch (Exception ex)
            {
                Util.MsgErro(ex.Message);
            }
            finally
            {
                btnBuscar.Enabled = true;
                lblAcao.Text = "";
            }
        }

        private void LimpaTxt()
        {
            txtDescricao.Text = ""; cboAssunto.Text = ""; txtWord1.Text = ""; 
            txtWord2.Text = "";
            txtWord3.Text = "";
            lblID.Text = "";
            lvAnotacao.Items.Clear();

            txtDescricaoPendencia.Text = "";
            cboAssuntoPendencia.Text = "";
            lvPendencia.Items.Clear();

            txtDescricaoPesquisar.Text = "";
            cboAssuntoPesquisar.Text = "";
            lvPesquisar.Items.Clear();

            txtDescricaoAgenda.Text = "";
            cboAssuntoAgenda.Text = "";
            lvAgenda.Items.Clear();

            txtDescricaoUrgencia.Text = "";
            cboAssuntoUrgencia.Text = "";
            lvUrgencias.Items.Clear();

            txtDescricaoProjetos.Text = "";
            cboAssuntoProjetos.Text = "";
            lvProjetos.Items.Clear();

        
        }


        private void btnFechar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        #region :: Método VerificaCampos [Tratamento de Campos bem interessante!]
        bool VerificaCampos( string tab )
        {            
            string msgInconsistencia = "RELATÓRIO DE INCONSISTÊNCIA:\r\n=======================\r\n\n";
            int k = 0;
            if (lblID.Text.Trim().Equals("")) {
                k++;
                msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo ID é Obrigatório!\r\n" : k.ToString() +
                    " - Campo ID é Obrigatório!\r\n");
            }
            switch (tab)
            {
                case "tabCadastro":
                    if (txtDescricao.Text.Trim().Equals("")) {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssunto.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatus.Text.Trim().Equals(""))    {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    } 
                    break;
                case "tabPendencias":
                    if (txtDescricaoPendencia.Text.Trim().Equals("")) {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssuntoPendencia.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatusPendencia.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    } 
                    break;
                case "tabUrgencias":
                    if (txtDescricaoUrgencia.Text.Trim().Equals("")) {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssuntoUrgencia.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatusUrgencia.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    }
                    break;
                case "tabProjetos":
                    if (txtDescricaoProjetos.Text.Trim().Equals("")) {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssuntoProjetos.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatusProjetos.Text.Trim().Equals(""))   {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    }
                    break;
                case "tabPesquisar":
                    if (txtDescricaoPesquisar.Text.Trim().Equals("")) {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssuntoPesquisar.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatusPesquisar.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    }
                    break;
                case "tabAgenda":
                    if (txtDescricaoAgenda.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Descrição é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Descrição é Obrigatório!\r\n");
                    } if (cboAssuntoAgenda.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Assunto é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Assunto é Obrigatório!\r\n");
                    } if (cboStatusAgenda.Text.Trim().Equals(""))  {
                        k++;
                        msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Status é Obrigatório!\r\n" : k.ToString() +
                            " - Campo Status é Obrigatório!\r\n");
                    }
                    break;
                default:
                    /* NÃO FAZ NADA */
                    break;
            }            
            
            if (k > 0) {
                Util.MsgErro(msgInconsistencia);
                return false;
            }
            return true;
        }
        #endregion


        private void btnBuscar_Click(object sender, EventArgs e)
        {
            // =-=-=-=-=-=-==-=-===-=-=-=-=-=-=-=//
            txtDescricao.Text = "";
            lblID.Text = "";
            cboAssunto.Text = "";
            cboStatus.Text = "";
            anotacao.LocalizaNota(txtWord1.Text, txtWord2.Text, txtWord3.Text, lvAnotacao);
            if (anotacao.Num_registro > 0) {
                anotacao.PosicionaRegistro("1");
                PreencheCampos();
            }
        }

        private void btnBuscarStatus_Click_1(object sender, EventArgs e)
        {
            // =-=-=-=-=-=-==-=-===-=-=-=-=-=-=-=//
            txtDescricao.Text = "";
            lblID.Text = "";
            cboAssunto.Text = "";
            anotacao.LocalizaStatus(lvAnotacao, cboStatus.Text.Trim());
            if (anotacao.Num_registro > 0) {
                anotacao.PosicionaRegistro("1");
                PreencheCampos();
            }
        }

        private void btnBuscaAssunto_Click_1(object sender, EventArgs e)
        {
            // =-=-=-=-=-=-==-=-===-=-=-=-=-=-=-=//
            txtDescricao.Text = "";
            lblID.Text = "";
            cboStatus.Text = "";
            anotacao.LocalizaAssunto(lvAnotacao, cboAssunto.Text.Trim());
            if (anotacao.Num_registro > 0) {
                anotacao.PosicionaRegistro("1");
                PreencheCampos();
            }
        }

        private void picLogo_DoubleClick(object sender, EventArgs e)
        {
            if (anotacao.Num_registro > 0)
            {
                frmNotaFullScreen f = new frmNotaFullScreen(cboAssunto.Text, cboStatus.Text, txtDescricao.Text, anotacao, anotacao.Registro_atual);
                f.ShowDialog();
            } else {
                Util.MsgErro("Não Há Registro Selecionado!");
            }
        }

        private void btnProximo_Click(object sender, EventArgs e)
        {
            string desc = "";
            switch (tabAnotacao.SelectedTab.Name.ToString())
            {
                case "tabCadastro":
                    desc = txtDescricao.Text;
                    break;
                case "tabPendencias":
                    desc = txtDescricaoPendencia.Text;
                    break;
                case "tabUrgencias":
                    desc = txtDescricaoUrgencia.Text;
                    break;
                case "tabProjetos":
                    desc = txtDescricaoProjetos.Text;
                    break;
                case "tabPesquisar":
                    desc = txtDescricaoPesquisar.Text;
                    break;
                case "tabAgenda":
                    desc = txtDescricaoAgenda.Text;
                    break;
            }

            if ( desc.Length > 0)
            {
                anotacao.Proximo();
                PreencheCampos();
            } else {
                Util.MsgErro("Campo chave inválido!");
            }
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            string desc = "";
            switch (tabAnotacao.SelectedTab.Name.ToString())
            {
                case "tabCadastro":
                    desc = txtDescricao.Text;
                    break;
                case "tabPendencias":
                    desc = txtDescricaoPendencia.Text;
                    break;
                case "tabUrgencias":
                    desc = txtDescricaoUrgencia.Text;
                    break;
                case "tabProjetos":
                    desc = txtDescricaoProjetos.Text;
                    break;
                case "tabPesquisar":
                    desc = txtDescricaoPesquisar.Text;
                    break;
                case "tabAgenda":
                    desc = txtDescricaoAgenda.Text;
                    break;
            }
            if ( desc.Length > 0) {
                anotacao.Anterior();
                PreencheCampos();
            } else {
                Util.MsgErro("Campo chave inválido!");
            }
        }

        private void PreencheCampos()
        {
            lblID.Text = anotacao.Id_anotacao.ToString();
            switch (tabAnotacao.SelectedTab.Name.ToString())
            {
                case "tabCadastro":
                    txtDescricao.Text = anotacao.Descricao;
                    cboAssunto.Text = anotacao.Assunto;
                    cboStatus.Text = anotacao.Status;
                    break;
                case "tabPendencias":
                    txtDescricaoPendencia.Text = anotacao.Descricao;
                    cboAssuntoPendencia.Text = anotacao.Assunto;
                    cboStatusPendencia.Text = anotacao.Status;
                    break;
                case "tabUrgencias":
                    txtDescricaoUrgencia.Text = anotacao.Descricao;
                    cboAssuntoUrgencia.Text = anotacao.Assunto;
                    cboStatusUrgencia.Text = anotacao.Status;
                    break;
                case "tabProjetos":
                    txtDescricaoProjetos.Text = anotacao.Descricao;
                    cboAssuntoProjetos.Text = anotacao.Assunto;
                    cboStatusProjetos.Text = anotacao.Status;
                    break;
                case "tabPesquisar":
                    txtDescricaoPesquisar.Text = anotacao.Descricao;
                    cboAssuntoPesquisar.Text = anotacao.Assunto;
                    cboStatusPesquisar.Text = anotacao.Status;
                    break;
                case "tabAgenda":
                    txtDescricaoAgenda.Text = anotacao.Descricao;
                    cboAssuntoAgenda.Text = anotacao.Assunto;
                    cboStatusAgenda.Text = anotacao.Status;
                    break;
            }
            lblDisplayNumReg.Text = "Registro: [" + anotacao.Registro_atual + "] de: [" + anotacao.Num_registro + "]";
        }

        private void btnUltimo_Click(object sender, EventArgs e)
        {
            if (anotacao.Num_registro > 0) {
                anotacao.Ultimo();
                PreencheCampos();
            }
        }

        private void btnPrimeiro_Click(object sender, EventArgs e)
        {
            if (anotacao.Num_registro > 0) {
                anotacao.Primeiro();
                PreencheCampos();
            }
        }

        private void tabAnotacao_Click(object sender, EventArgs e)
        {
            txtDescricao.Text = "";
            txtDescricaoPendencia.Text = "";
            txtDescricaoUrgencia.Text = "";
            txtDescricaoProjetos.Text = "";
            txtDescricaoPesquisar.Text = "";
            txtDescricaoAgenda.Text = "";
            lblID.Text = "";
            cboStatus.Text = "";
            cboAssunto.Text = "";
            anotacao.Num_registro = 0;
            switch (tabAnotacao.SelectedTab.Name.ToString())
            { 
                case "tabCadastro":
                    cboStatus.Text = "Anotação";
                    anotacao.LocalizaPorTab(lvAnotacao, "Anotação");
                    if (anotacao.Num_registro > 0)
                    {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    } break;
                case "tabPendencias":
                    cboStatusPendencia.Text = "Pendência";
                    anotacao.LocalizaPorTab(lvPendencia, "Pendência");
                    if (anotacao.Num_registro > 0) {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    }  break;
                case "tabUrgencias":
                    cboStatusUrgencia.Text = "Urgente";
                    anotacao.LocalizaPorTab(lvUrgencias, "Urgente");
                    if (anotacao.Num_registro > 0)
                    {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    } break;
                case "tabProjetos":
                    cboStatusProjetos.Text = "Projeto";
                    anotacao.LocalizaPorTab(lvProjetos, "Projeto");
                    if (anotacao.Num_registro > 0)
                    {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    } break;
                case "tabPesquisar":
                    cboStatusPesquisar.Text = "Pesquisar";
                    anotacao.LocalizaPorTab(lvPesquisar, "Pesquisar");
                    if (anotacao.Num_registro > 0)
                    {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    } break;
                case "tabAgenda":
                    cboStatusAgenda.Text = "Agenda";
                    anotacao.LocalizaPorTab(lvAgenda, "Agenda");
                    if (anotacao.Num_registro > 0)
                    {
                        anotacao.PosicionaRegistro("1");
                        PreencheCampos();
                    } break;
                default:
                    /* NÃO FAZ NADA */
                    break;
                
            }
        }

        private void lvPendencia_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvPendencia.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void lvUrgencias_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvUrgencias.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void lvProjetos_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvProjetos.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void lvPesquisar_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvPesquisar.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void lvAgenda_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (e.IsSelected)
            {
                anotacao.PosicionaRegistro(lvAgenda.SelectedItems[0].SubItems[3].Text);
                PreencheCampos();
            }
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            if (lblID.Text.Trim().Equals(""))
            {
                Util.MsgErro("É necessário que Haja um Registro para a Edição!");
            }
            else
            {
                lblAcao.Text = "Excluindo...";
                ControlaBtn(true);
                HabilitaTxt(true);
                btnBuscar.Enabled = false;
            }
        }


        private void btnArquivar_Click_1(object sender, EventArgs e)
        {
            if (lblID.Text.Trim().Equals(""))
            {
                Util.MsgErro("É necessário que Haja um Registro para a Edição!");
            }
            else
            {
                lblAcao.Text = "Arquivando...";
                ControlaBtn(true);
                HabilitaTxt(true);
                btnBuscar.Enabled = false;
            }
        }


    }} // Fim do Namespace;
