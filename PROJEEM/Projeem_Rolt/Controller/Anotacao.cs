using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Controller
{
    public class Anotacao
    {
        #region // Variáveis de classe;
        SqlConnection cn;
        int curReg = 0;
        int TotalReg = 0;
        int registro_atual;
        int num_registro;
        DataTable dt = new DataTable();
        private string id_anotacao;
        private string descricao;
        private string assunto;
        private string status;
        #endregion

        #region // Construtor: Initialize
        public Anotacao(SqlConnection cn)
        {
            //throw new System.NotImplementedException();
            this.cn = cn;
        }
        #endregion

        #region //TODO: Métodos da classe:

        public void Incluir(string id_anotacao, string descricao, string ass, string st)
        {
            try
            {
                string InstrucaoSql = "insert into anotacao (id_anotacao, assunto, descricao, status) " +
                                " values " +
                                "(" + id_anotacao + ", '" + ass.Replace("'","") + "', '" + descricao.Replace("'","") + "', '" + st.Replace("'","") + "')";
                SqlCommand cmd = new SqlCommand(InstrucaoSql, cn);
                cmd.ExecuteNonQuery();
                Util.MsgInfo("Registro Adicionado com Sucesso!");
            }
            catch (Exception ex)
            {
                Util.MsgErro(ex.Message);
            }
        }

        /*public void Alterar(string id_anotacao, string descricao, string ass, string st, ComboBox cbo)*/
        public void Alterar(string id_anotacao, string descricao, string ass, string st)
        {
            try
            {
                string InstrucaoSql = "update anotacao set descricao = '" + descricao.Replace("'","") + 
                                      "', assunto = '" + ass.Replace("'","") + "', status = '" + st.Replace("'","") + "' where id_anotacao = " + id_anotacao;
                SqlCommand cmd = new SqlCommand(InstrucaoSql, cn);
                cmd.ExecuteNonQuery();
                //Util.PreencheCombo(this.cn, cbo, "anotacao", "assunto");
                Util.MsgInfo("Registro Atualizado com Sucesso!");
            } catch (Exception ex) {
                Util.MsgErro(ex.Message);
            }
        }

        public void Excluir(string id_anotacao, ComboBox cbo)
        {
            try {
                string InstrucaoSql = "delete from anotacao where id_anotacao = " + id_anotacao;
                SqlCommand cmd = new SqlCommand(InstrucaoSql, cn);
                cmd.ExecuteNonQuery();
                Util.PreencheCombo(this.cn, cbo, "anotacao", "assunto");
                Util.MsgInfo("Registro Excluído com Sucesso!");
            } catch (Exception ex) {
                Util.MsgErro(ex.Message);
            }
        }

        public void Arquivar(string id_anotacao, ComboBox cbo)
        {
            try {
                string InstrucaoSql = "update anotacao set status = '" + "Arquivar" + "' where id_anotacao = " + id_anotacao;
                SqlCommand cmd = new SqlCommand(InstrucaoSql, cn);
                cmd.ExecuteNonQuery();
                Util.PreencheCombo(this.cn, cbo, "anotacao", "assunto");
                Util.MsgInfo("Registro Arquivado com Sucesso!");
            } catch (Exception ex) {
                Util.MsgErro(ex.Message);
            }
        }

        public void LocalizaNota(string vWord1, string vWord2, string vWord3, ListView lvAnotacao)
        {
            string vChave = "";
            if (vWord1.Trim().Length >= 3)
            {
                vChave += " descricao LIKE '%" + vWord1 + "%' or assunto LIKE '%" + vWord1 + "%' ";

                if (vWord2.Trim().Length >= 3)
                {
                    vChave += " or descricao LIKE '%" + vWord2 + "%' or assunto LIKE '%" + vWord2 + "%' ";
                }
                if (vWord3.Trim().Length >= 3)
                {
                    vChave += " or descricao LIKE '%" + vWord3 + "%' or assunto LIKE '%" + vWord3 + "%' ";
                }
                string InstrucaoSql = "select * from anotacao where " + vChave + " order by id_anotacao";
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(InstrucaoSql, this.cn);
                    DataSet ds = new DataSet();

                    da.Fill(ds, "nota");
                    dt = ds.Tables["nota"];
                    curReg = 0;
                    TotalReg = dt.Rows.Count;
                    lvAnotacao.Items.Clear();
                    if (TotalReg > 0)
                    {
                        int k = 1;
                        foreach (DataRow lvdr in ds.Tables["nota"].Rows)
                        {
                            lvAnotacao.Items.Add(new ListViewItem(new string[] { lvdr["id_anotacao"].ToString(),
                                                                   lvdr["assunto"].ToString(),
                                                                   lvdr["descricao"].ToString(),
                                                                   k.ToString()}));
                            k++;
                        }

                        SetNota();
                    } else {
                        Util.Msg("Não há Registro com esse Assunto!");
                    }
                } catch (Exception ex) {
                    Util.MsgErro(ex.Message);
                }
            } else {
                Util.MsgErro("O primeiro campo da pesquisa tem de ter tamanho >= 3!");
            }

        }

        public void LocalizaStatus(ListView lvAnotacao, string cboStatus)
        {
            string vChave = "";
            string InstrucaoSql="";
            if (cboStatus.Trim().Length >= 3)
            {
                if (cboStatus.Trim().ToUpper().Equals("TODOS"))
                {
                    InstrucaoSql = "select * from anotacao order by id_anotacao";
                } else {
                    vChave += " status = '" + cboStatus.Trim() + "' order by id_anotacao";
                    InstrucaoSql = "select * from anotacao where " + vChave;
                }
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(InstrucaoSql, this.cn);
                    DataSet ds = new DataSet();

                    da.Fill(ds, "nota");
                    dt = ds.Tables["nota"];
                    curReg = 0;
                    TotalReg = dt.Rows.Count;
                    lvAnotacao.Items.Clear();
                    if (TotalReg > 0)
                    {
                        int k = 1;
                        foreach (DataRow lvdr in ds.Tables["nota"].Rows)
                        {
                            lvAnotacao.Items.Add(new ListViewItem(new string[] { lvdr["id_anotacao"].ToString(),
                                                                   lvdr["assunto"].ToString(),
                                                                   lvdr["descricao"].ToString(),
                                                                   k.ToString()}));
                            k++;
                        }
                        SetNota();
                    }
                } catch (Exception ex) {
                    Util.MsgErro(ex.Message);
                }
            } else {
                Util.MsgErro("O Campo Status é Inválido!");
            }
        }


        public void LocalizaAssunto(ListView lvAnotacao, string cboAssunto)
        {
            string vChave = "";
            if (cboAssunto.Trim().Length >= 3)
            {
                vChave += " assunto = '" + cboAssunto.Trim() + "' order by id_anotacao";
                string InstrucaoSql = "select * from anotacao where " + vChave;
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(InstrucaoSql, this.cn);
                    DataSet ds = new DataSet();

                    da.Fill(ds, "nota");
                    dt = ds.Tables["nota"];
                    curReg = 0;
                    TotalReg = dt.Rows.Count;
                        lvAnotacao.Items.Clear();
                    if (TotalReg > 0)
                    {
                        int k = 1;
                        foreach (DataRow lvdr in ds.Tables["nota"].Rows)
                        {
                            lvAnotacao.Items.Add(new ListViewItem(new string[] { lvdr["id_anotacao"].ToString(),
                                                                   lvdr["assunto"].ToString(),
                                                                   lvdr["descricao"].ToString(),
                                                                   k.ToString()}));
                            k++;
                        }
                        SetNota();
                    } else {
                        Util.Msg("Não há Registro com esse Assunto!");
                    }
                }
                catch (Exception ex)
                {
                    Util.MsgErro(ex.Message);
                }

            }
            else
            {
                Util.MsgErro("O Campo Status é Inválido!");
            }
        } // Fim de LocalizaAssunto

        
        /// <summary>
        ///  Método que tem como objetivo preencher os listviews
        ///  de cada tab, selecionada de acordo com o status pretendido!
        /// </summary>
        /// <param name="lv">ListView da Tab Acionada</param>
        /// <param name="strTab">Parâmetro string, que será o filtro específico de cada Tab</param>
        /// ------------------------------------------------- /
        public void LocalizaPorTab(ListView lv, string strTab){
            string InstrucaoSql = "";
            InstrucaoSql = "select * from anotacao where status = '" + strTab + "'";
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(InstrucaoSql, this.cn);
                DataSet ds = new DataSet();

                da.Fill(ds, "nota");
                dt = ds.Tables["nota"];
                curReg = 0;
                TotalReg = dt.Rows.Count;
                lv.Items.Clear();
                if (TotalReg > 0)
                {
                    int k = 1;
                    foreach (DataRow lvdr in ds.Tables["nota"].Rows)
                    {
                        lv.Items.Add(new ListViewItem(new string[] { lvdr["id_anotacao"].ToString(),
                                                                   lvdr["assunto"].ToString(),
                                                                   lvdr["descricao"].ToString(),
                                                                   k.ToString()}));
                        k++;
                    }
                        SetNota();
                }
            } catch (Exception ex) {
                Util.MsgErro(ex.Message);
            }
        }

        private void SetNota() {
            try
            {
                if (TotalReg > 0) {
                    this.id_anotacao = dt.Rows[curReg]["id_anotacao"].ToString();
                    this.descricao = dt.Rows[curReg]["descricao"].ToString();
                    this.assunto = dt.Rows[curReg]["assunto"].ToString();
                    this.status = dt.Rows[curReg]["status"].ToString();


                    Registro_atual = curReg + 1;
                    Num_registro = TotalReg;

                } else {
                    Util.MsgInfo("Não há registro que atenda a este critério!");
                    Registro_atual = 0;
                    Num_registro = 0;
                } } catch (Exception ex) {
                    Util.MsgErro(ex.Message);
            } }

        public void PosicionaRegistro(string reg){
            curReg = Int32.Parse(reg) -1;
            if (curReg > TotalReg - 1) {
                curReg = TotalReg - 1;
                Util.MsgInfo("Fim de Arquivo");
            } else {
                SetNota(); }
        }


        public void Proximo()
        {
            curReg++;
            if (curReg > TotalReg - 1) {
                curReg = TotalReg - 1;
                Util.MsgInfo("Fim de Arquivo");
            } else {
                SetNota(); }
        }

        public void Anterior()
        {
            curReg--;
            if (curReg < 0) {
                curReg = 0;
                Util.MsgInfo("Início de Arquivo");
            } else {
                SetNota();
            }
        }

        public void Ultimo()
        {
            if ( this.num_registro > 0 ){
                curReg = this.num_registro - 1;
                SetNota();
            }
        }

        public void Primeiro()
        {
            if (this.num_registro > 0)
            {
                curReg = 0;
                SetNota();
            }
        }

        #endregion

        #region // Propriedades da Classe;
        public int Registro_atual
        {
            get { return registro_atual; }
            set { registro_atual = value; }
        }
        public int Num_registro
        {
            get { return num_registro; }
            set { num_registro = value; }
        }
        public string Id_anotacao
        {
            get { return id_anotacao; }
            set { id_anotacao = value; }
        }
        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }
        public string Assunto
        {
            get { return assunto; }
            set { assunto = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        #endregion


    }
}
