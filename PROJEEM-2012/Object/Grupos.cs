using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;
using System.Windows.Forms;

namespace Projeem.Controller
{
    public class Grupos
    {
        #region:: Variáveis de Classe
        SqlConnection cn;
        int id_grupo;
        int grupo;
        int carencia;
        int qtde_premio;
        decimal debito_previsto;

        decimal credito;

        int curReg;
        int registro_atual;
        int totalReg;
        int num_registro;
        bool finalDeArquivo = false;

        #endregion

        /// <summary>
        /// Construtor da Classe
        /// </summary>
        /// <param name="cn">Objeto Conection herdado</param>
        public Grupos(SqlConnection cn) {
            this.cn = cn;
        }


        SqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        public void CarregaGrupos()
        {
            try
            {
                da = new SqlDataAdapter("Carrega_Grupos", this.cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                ds = new DataSet();
                da.Fill(ds, "Carrega_Grupos");
                dt = ds.Tables["Carrega_Grupos"];
                curReg = 0;
                registro_atual = curReg + 1;
                totalReg = dt.Rows.Count;
                num_registro = totalReg;

                ds.Dispose();

                if (num_registro > 0) SetRst();

            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
            }
        }


        void SetRst()
        {
            id_grupo = Convert.ToInt32(dt.Rows[curReg]["id_grupo"].ToString());
            grupo = Convert.ToInt32(dt.Rows[curReg]["grupo"].ToString());
            carencia = Convert.ToInt32(dt.Rows[curReg]["carencia"].ToString());
            qtde_premio = Convert.ToInt32(dt.Rows[curReg]["qtde_premio"].ToString());
            debito_previsto = Convert.ToDecimal(dt.Rows[curReg]["debito_previsto"].ToString());

            credito = Convert.ToDecimal(dt.Rows[curReg]["credito"].ToString());            
        }

        public static void ZeraDebitosEDeducoes(SqlConnection cn) {
            SqlCommand cmd = new SqlCommand("ZeraDebitosEDeducoes_Grupos", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            CSharpUtil.Util.Msg("Débito Zerado da tabela de grupos!");
        }

 



     

        #region:: Métodos de Navegação
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
        #endregion

        #region:: Propriedades do Objeto

        public SqlConnection Cn
        {
            get { return cn; }
            set { cn = value; }
        }        
        public int Id_grupo {
            get { return id_grupo; }
            set { id_grupo = value; }
        }
        public int Grupo
        {
            get { return grupo; }
            set { grupo = value; }
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
        public decimal Debito_previsto
        {
            get { return debito_previsto; }
            set { debito_previsto = value; }
        }

        public decimal Credito
        {
            get { return credito; }
            set { credito = value; }
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

        public bool FinalDeArquivo
        {
            get { return finalDeArquivo; }
            set { finalDeArquivo = value; }
        }


        #endregion


        // ------------ //


    }// Fim da Classe;
}//Fim do Namespace;
