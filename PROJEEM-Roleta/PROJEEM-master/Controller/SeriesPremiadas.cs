using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Projeem.Controller
{
    public class SeriesPremiadas
    {

        #region::: Variáveis de Classe
        SqlConnection cn;
        int curReg = 0;
        int totalReg = 0;
        int registro_atual;
        int num_registro;

        int id_serie;
        int gr_01;
        int gr_02;
        int gr_03;
        int gr_04;
        int carencia;
        int qtde_premio;
        int mor_carencia;
        int pr_aplicacao;
        int num_aplicacao;
        int carencia_recap;
        string status;
        DataTable dt;

        bool finalDeArquivo = false;

        #endregion        
        
        private SqlConnection sqlConnection;
        public SeriesPremiadas(SqlConnection cn) { this.cn = cn; }


        public void CarregaSeries(int grPremiado)
        {
            SqlDataAdapter da = new SqlDataAdapter("Carrega_Series_Premiadas", this.cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@gr_premiado", grPremiado));
            DataSet ds = new DataSet();
            da.Fill(ds, "SRPremiadas");
            dt = ds.Tables["SRPremiadas"];
            curReg = 0;
            registro_atual = curReg + 1;
            totalReg = dt.Rows.Count;
            num_registro = totalReg;

            ds.Dispose();

            if (num_registro > 0) SetRst();

        } // Fim de CarregaSeries;



        #region:: Serie Filtrada
        public void AumentaCarencia(int vSorteado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Aumenta_Carencia_Filtrada", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@gr_Sorteado", vSorteado));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
            }
        }

        #endregion



        public void Proximo()
        {
            curReg++;
            registro_atual = curReg + 1;
            if (curReg > totalReg - 1)
            {
                curReg = totalReg - 1;
                finalDeArquivo = true;
                //CSharpUtil.Util.MsgInfo("Final de Arquivo!");
            }
            else
            {
                SetRst();
            }
        } // Fim de ProximoRegistro;

        public void Anterior()
        {
            finalDeArquivo = false;
            curReg--;
            registro_atual = curReg + 1;
            if (curReg < 0)
            {
                curReg = 0;
                CSharpUtil.Util.MsgInfo("Início de Arquivo!");
            }
            else
            {
                SetRst();
            }
        } // Fim de Anterior;

        public void Primeiro()
        {
            curReg = 0;
            registro_atual = curReg + 1;
            finalDeArquivo = false;
            SetRst();
        } // Fim de Primeiro;

        void SetRst()
        {
            id_serie = Convert.ToInt32(dt.Rows[curReg]["id_serie"].ToString());
            gr_01 = Convert.ToInt32(dt.Rows[curReg]["gr_01"].ToString());
            gr_02 = Convert.ToInt32(dt.Rows[curReg]["gr_02"].ToString());
            gr_03 = Convert.ToInt32(dt.Rows[curReg]["gr_03"].ToString());
            gr_04 = Convert.ToInt32(dt.Rows[curReg]["gr_04"].ToString());
            carencia = Convert.ToInt32(dt.Rows[curReg]["carencia"].ToString());
            carencia_recap = Convert.ToInt32(dt.Rows[curReg]["carencia_recap"].ToString());
            qtde_premio = Convert.ToInt32(dt.Rows[curReg]["qtde_premio"].ToString());
            mor_carencia = Convert.ToInt32(dt.Rows[curReg]["mor_carencia"].ToString());
            pr_aplicacao = Convert.ToInt32(dt.Rows[curReg]["pr_aplicacao"].ToString());
            status = dt.Rows[curReg]["status"].ToString();
        }


        #region::: Propriedades do Objeto

        public bool FinalDeArquivo
        {
            get { return finalDeArquivo; }
            set { finalDeArquivo = value; }
        }

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

        public int Id_serie
        {
            get { return id_serie; }
            set { id_serie = value; }
        }

        public int Gr_01
        {
            get { return gr_01; }
            set { gr_01 = value; }
        }
        public int Gr_02
        {
            get { return gr_02; }
            set { gr_02 = value; }
        }

        public int Gr_03
        {
            get { return gr_03; }
            set { gr_03 = value; }
        }
        public int Gr_04
        {
            get { return gr_04; }
            set { gr_04 = value; }
        }

        public int Carencia
        {
            get { return carencia; }
            set { carencia = value; }
        }
        public int Qtde_premio
        {
            get { return qtde_premio; }
            set { qtde_premio = value; }
        }
        public int Mor_carencia
        {
            get { return mor_carencia; }
            set { mor_carencia = value; }
        }
        public int Pr_aplicacao
        {
            get { return pr_aplicacao; }
            set { pr_aplicacao = value; }
        }
        public int Num_aplicacao
        {
            get { return num_aplicacao; }
            set { num_aplicacao = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        public int Carencia_recap
        {
            get { return carencia_recap; }
            set { carencia_recap = value; }
        }


        #endregion


    }
}
