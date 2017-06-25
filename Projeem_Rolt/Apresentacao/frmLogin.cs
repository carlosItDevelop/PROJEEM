using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Controller;
using Models;


namespace Apresentacao
{
    public partial class frmLogin : Form
    {

        public delegate void LostFocusThis(object produtor, EventArgs args);
        public event LostFocusThis OnLostFocusThis; // Ainda nem foi Lançado!

        public const MessageBoxButtons cOk = MessageBoxButtons.OK;
        public const MessageBoxIcon cInfo = MessageBoxIcon.Information;
        SqlConnection cn;
        public frmLogin(SqlConnection cn)
        {
            InitializeComponent();
            this.cn = cn;
        }

        private void frmLogin_Closed(object sender, System.EventArgs e)
        {
            if (this.cn.State != ConnectionState.Open) Application.Exit();
        }

        [Obsolete("Este Método Necessita de Tratamento para [ano e mes].")]
        private void btnOK_Click(object sender, EventArgs e)
        {
            if (txtNome.Text.Trim() != "")
            {
                try
                {
                    // ------------------------------------------------------
                    Conexao conexao = new Conexao(this.cn);
                    conexao.Database = txtCatalog.Text;
                    conexao.Server = txtDataSource.Text;
                    conexao.Open();
                    //  ------------------------------------------------
                    if (conexao.State != "Opened") Application.Exit();
                    //  ----------------------------------------------------------------------
                    // Autenticar usuário -------------------------------------------------------
                    Usuario usuario = new Usuario(cn, txtNome.Text.ToUpper(), txtSenha.Text.ToUpper());
                    if (usuario.IsLogado() != true)
                    {
                        throw new Exception("Erro ao tentar logar usuário!");
                    }
                    else
                    {

#if debug
                        Util.Msg("Referência: " + Util.Referencia + ",  Ano: " + Util.Date.Substring(6) + ", Mês: " + Util.Date.Substring(3, 2));
#endif
                        ///<summary>
                        ///  Testar Referência!
                        ///</summary>                        
                        string ref_atua = Util.Referencia;
                        string ano = Util.Date.Substring(6, 4);
                        string mes = Util.Date.Substring(3, 2);
                        string new_ref = ano + mes;
                        if (ref_atua != new_ref)
                        {
                            DialogResult result = MessageBox.Show("Referência não confere!\r\nDeseja Alterá-la?",
                                                                                                  "ATENÇÃO", MessageBoxButtons.YesNo,
                                                                                                  MessageBoxIcon.Question);
                            if (result == DialogResult.Yes)
                            {
                                Util.MudaReferencia(new_ref, this.cn);
                            }
                            else
                            {
                                Application.Exit();
                            }
                        }

                        // Testar Atomicidade de Login por Usuário. Pode-se usar a tabela Logados!!!
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Erro", cOk, cInfo);
                    Application.Exit();
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Você precisa informar o Login!", "Erro!!!", cOk, cInfo);
            }
        }

        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

    }
}
