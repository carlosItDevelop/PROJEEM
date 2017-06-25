using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Media;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace Projeem.Controller
{
    public class Funcoes
    {
        public Funcoes() { }


        /// <summary>
        /// Método para tocar um .wav pequeno
        /// em situações específicas, como por exemplo, RENÚCIA!
        /// </summary>
        /// <param name="path"></param>
        public static void TocaWav(string path)
        {
            try
            {
                SoundPlayer player = new SoundPlayer();
                player.SoundLocation = path;

                // Load the .wav file.
                player.Load();
                player.Play();
                player.Dispose();

            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
            }

        }// Fim do Método TocaWav;


        public static string GerarIDAnotacao(SqlConnection cn, string banco, string tabela)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            string Resultado;
            SqlDataReader Leitor;
            if (banco == "Oracle")
            {
                cmd.CommandText = "SELECT " + tabela + ".NEXTVAL FROM DUAL";
                Leitor = cmd.ExecuteReader();
                Leitor.Read();
                Resultado = Leitor[0].ToString();
                Leitor.Close();
                // No Oracle, não precisa haver exclusão
            }
            else
            {
                // No Sql Server
                cmd.CommandText = "INSERT INTO " + tabela + " ( Inutil ) VALUES( 'X' )";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "SELECT @@identity";
                Leitor = cmd.ExecuteReader();
                // É comum usar um while mas, no nosso caso,
                // temos certeza absoluta de que só há um
                // único registro a ser lido
                Leitor.Read();
                Resultado = Leitor[0].ToString();
                Leitor.Close();
                cmd.CommandText = "DELETE FROM " + tabela + " WHERE ID = " + Resultado;
                cmd.ExecuteNonQuery();
            }
            return Resultado;
        }


        public static void PreencheComboComTodos(SqlConnection cn, ComboBox cbo, String tabela, String campo, string Todos)
        {
            String cmdString = "select distinct " + campo + " from " + tabela + " order by " + campo;
            SqlCommand cmd = new SqlCommand(cmdString, cn);
            SqlDataReader dr = cmd.ExecuteReader();
            cbo.Items.Clear();
            if (dr.Read()) { cbo.Items.Add("Todos"); cbo.Items.Add(dr[campo]); }
            while (dr.Read())
            {
                cbo.Items.Add(dr[campo]);
            }
            dr.Close();
        }

        public static void PreencheComboComum(SqlConnection cn, ComboBox cbo, String tabela, String campo)
        {
            String cmdString = "select distinct " + campo + " from " + tabela + " order by " + campo;
            SqlCommand cmd = new SqlCommand(cmdString, cn);
            SqlDataReader dr = cmd.ExecuteReader();
            cbo.Items.Clear();
            if (dr.Read()) { cbo.Items.Add(dr[campo]); }
            while (dr.Read())
            {
                cbo.Items.Add(dr[campo]);
            }
            dr.Close();
        }










        /// <summary>
        ///  Método que popula o array bidimencional (aMapaCapi), 
        /// </summary>
        /// <param name="txtValorMedia">Valor pretendido de lucro por subperíodo</param>
        /// <param name="txtNumSB">Número de SB na tabela</param>
        /// <param name="cboNumGP">Número de grupos na série</param>
        /// <param name="aMapaCapi">Array bidimencional com a tabela final pronta no Load do Form</param>
        /// <param name="lvMapaCapi">ListView que serve como Display para o array acima e usado, também, 
        /// como alternativa à uma tabela de Banco de Dados</param>
        /// ----------------------------------------------------------------------------------------- ///
        public static void MontaMapaCapi(TextBox txtNumSB, TextBox txtValorMedia, ComboBox cboNumGP,
                                         ref string[,] aMapaCapi, ListView lvMapaCapi)
        {
            decimal vIndice = 0.00M;
            decimal vDebito = 0.00M;
            decimal vCredito = 0.00M;
            decimal vSaldo = 0.00M;
            decimal vSoma = 0.00M;
            int vNumSB = Convert.ToInt32(txtNumSB.Text);
            int vNumDigito = Convert.ToInt32(cboNumGP.Text);
            decimal vMedia = Convert.ToDecimal(txtValorMedia.Text);
            //decimal vPerc;

            if (String.IsNullOrEmpty(txtNumSB.Text) || String.IsNullOrEmpty(txtValorMedia.Text) || String.IsNullOrEmpty(cboNumGP.Text))
            {
                CSharpUtil.Util.MsgErro("CAMPOS MÉDIA e NÚMERO de DÍGITOS SÃO OBRIGATÓRIOS!");
                Application.Exit();
            }
            else
            {
                lvMapaCapi.Items.Clear();

                int k = 0;
                for (int i = 0; i < vNumSB; i++)
                {
                    k++;
                    vIndice = ((vMedia * k) + vSoma) / (18 - vNumDigito);
                    vDebito = vIndice * vNumDigito;
                    vSoma = vSoma + vDebito;
                    vCredito = vIndice * 18;
                    vSaldo = vCredito - vSoma;
                    vMedia = vSaldo / k;

                    // Aumentar gradativamente a média por Sb até a metade do numero total de aplicação!
                    if (i > 0 && i <= (vNumSB / 2)) vMedia *= 1.1M;

                    // vPerc = (vSaldo*100)/vCG

                    aMapaCapi[i, 0] = k.ToString();
                    aMapaCapi[i, 1] = k.ToString();
                    aMapaCapi[i, 2] = vIndice.ToString();
                    aMapaCapi[i, 3] = vDebito.ToString();
                    aMapaCapi[i, 4] = vSoma.ToString();
                    aMapaCapi[i, 5] = vCredito.ToString();
                    aMapaCapi[i, 6] = vSaldo.ToString();
                    aMapaCapi[i, 7] = vMedia.ToString();


                    // Este ListView serve apenas como Display, pois o 
                    // Array aMapaCapi tem os mesmos dados e está em mémória
                    // de onde são utilizados durante a execução do projeto.
                    // Na otimização eliminar o Array e utilizar apenas a ListView!
                    lvMapaCapi.Items.Add(new ListViewItem(new string[] { 
								         k.ToString(),
								         vIndice.ToString("0.00"),
								         vDebito.ToString("0.00"),
								         vSoma.ToString("0.00"),
								         vCredito.ToString("0.00"),
								         vSaldo.ToString("0.00"),
								         vMedia.ToString("0.00"),
								         (k-1).ToString()}));
                                         /* -------------- */
                   
                } // Fim do For;   
            } // Fim do IF;            
        }//Fim do Método MontaMapaCapi;


        public static void PreencheTabelaDeSeries(ref ListView lvControlGP)
        {

            int curReg = 0;
            int numReg = 0;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = "Data Source=DESKTOP-D3LJP8S\\COOPERCHIP2014;Initial Catalog=" + "PROJEEM2012" + ";Integrated Security=True;";
            cn.Open();

            SqlDataAdapter da = new SqlDataAdapter("GetSeries", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            da.Fill(ds, "series");
            DataTable dt = new DataTable();
            dt = ds.Tables["series"];
            numReg = dt.Rows.Count;

            string codigo, g1,g2,g3,g4,g5,g6,g7;
            string pr_aplicacao, qtde_premio, status, carencia, ultima_carencia, maior_carencia, wait_carencia, media_carencia;


            if (numReg > 0)
            {
                lvControlGP.Items.Clear();
                while (curReg < numReg)
                {
                    codigo = dt.Rows[curReg]["codigo"].ToString();
                    g1 = dt.Rows[curReg]["gr_01"].ToString();
                    g2 = dt.Rows[curReg]["gr_02"].ToString();
                    g3 = dt.Rows[curReg]["gr_03"].ToString();
                    g4 = dt.Rows[curReg]["gr_04"].ToString();
                    g5 = dt.Rows[curReg]["gr_05"].ToString();
                    g6 = dt.Rows[curReg]["gr_06"].ToString();
                    g7 = dt.Rows[curReg]["gr_07"].ToString();

                    pr_aplicacao = dt.Rows[curReg]["pr_aplicacao"].ToString();
                    qtde_premio = dt.Rows[curReg]["qtde_premio"].ToString();
                    status = dt.Rows[curReg]["status"].ToString();
                    carencia = dt.Rows[curReg]["carencia"].ToString();
                    ultima_carencia = dt.Rows[curReg]["ultima_carencia"].ToString();
                    maior_carencia = dt.Rows[curReg]["maior_carencia"].ToString();
                    wait_carencia = dt.Rows[curReg]["wait_carencia"].ToString();
                    media_carencia = dt.Rows[curReg]["media_carencia"].ToString();



                    lvControlGP.Items.Add(new ListViewItem(new string[] { 
                                                           codigo.ToString(),
                                                           g1.ToString(),
                                                           g2.ToString(),
                                                           g3.ToString(),
                                                           g4.ToString(),
                                                           g5.ToString(),
                                                           g6.ToString(),
                                                           g7.ToString(),
                                                           pr_aplicacao.ToString(),
                                                           qtde_premio.ToString(),
                                                           status.ToString(),
                                                           carencia.ToString(),
                                                           ultima_carencia.ToString(),
                                                           maior_carencia.ToString(),
                                                           wait_carencia.ToString(),
                                                           media_carencia.ToString()}));
                    curReg++;
                }
            }
            ds.Dispose();
            cn.Dispose();
            cn.Close();
        }



        // -------------------- //
    }// Fim da Classe Fuñcoes;
}// Fim do NameSpace;
