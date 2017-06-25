using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Projeem.Controller;

namespace View
{
    public partial class frmControleDeAplicacao : Form
    {
        SqlConnection cn = null;

        #region:: Variáveis da Classe
        string[,] aMapaCapi = new string[41, 8];
        #endregion :: Fim-Variáveis da Classe


        public frmControleDeAplicacao(SqlConnection cn)
        {
            InitializeComponent();
            this.cn = cn;
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
        }



        private void frmControleDeAplicacao_Load(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            Funcoes.MontaMapaCapi(txtNumSB, txtValorMedia, cboNumGP, ref aMapaCapi, lvMapaCapi);
            Funcoes.PreencheTabelaDeSeries(ref lvTodasAsSeries);

            lblUser.Text = CSharpUtil.Util.User;
            lblData.Text = CSharpUtil.Util.Date;
            lblReferencia.Text = CSharpUtil.Util.Referencia;

            LigaBtnGravar("Off");
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            LigaBtnGravar("On");
        }

        private void LigaBtnGravar(string OnOff) {
            if (OnOff.Equals("On")) {
                btnGravar.Enabled = true;
                btnCancelar.Enabled = true;
                btnNovo.Enabled = false;
                btnExcluir.Enabled = false;
                btnAlterar.Enabled = false;
            } else {
                btnGravar.Enabled = false;
                btnCancelar.Enabled = false;
                btnNovo.Enabled = true;
                btnExcluir.Enabled = true;
                btnAlterar.Enabled = true;
            }
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            LigaBtnGravar("On");
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            LigaBtnGravar("On");
        }

        private void btnGravar_Click(object sender, EventArgs e)
        {
            LigaBtnGravar("Off");
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            LigaBtnGravar("Off");
        }

        private void btnPlayPauseSeriesEmAplicacao1_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao1.Text.Equals("||")) {btnPlayPauseSeriesEmAplicacao1.Text = ">";} else {
                btnPlayPauseSeriesEmAplicacao1.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao2_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao2.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao2.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao2.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao3_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao3.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao3.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao3.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao4_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao4.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao4.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao4.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao5_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao5.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao5.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao5.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao6_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao6.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao6.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao6.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao7_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao7.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao7.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao7.Text = "||";
            }
        }

        private void btnPlayPauseSeriesEmAplicacao8_Click(object sender, EventArgs e)
        {
            if (btnPlayPauseSeriesEmAplicacao8.Text.Equals("||")) { btnPlayPauseSeriesEmAplicacao8.Text = ">"; } else {
                btnPlayPauseSeriesEmAplicacao8.Text = "||";
            }
        }

        private void btnDebitarCreditar_Click(object sender, EventArgs e)
        {
            if (btnDebitarCreditar.Text.Trim().Equals(".:::   Processar Débito   :::."))
            {
                btnDebitarCreditar.Text = ".:::   Processar Crédito   :::.";
                btnIgnorarCredito.Enabled = true;
            }
            else {
                btnDebitarCreditar.Text = ".:::   Processar Débito   :::.";
                btnIgnorarCredito.Enabled = false;
            }
        }



        int[] SR;
        private void btnRaioX_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cboCodigoSerie.Text) || string.IsNullOrEmpty(cboEmpresa.Text)) {
                CSharpUtil.Util.Msg("Código e Empresa são Campos Obrigatórios!");
            }
            else
            {

                switch (cboCodigoSerie.Text)
                {
                    case "A":
                        SR = new int[7] { 1, 2, 3, 4, 5, 6, 7 };
                        break;
                    case "B":
                        SR = new int[7] { 2, 3, 4, 5, 6, 7, 8 };
                        break;
                    case "C":
                        SR = new int[7] { 3, 4, 5, 6, 7, 8, 9 };
                        break;
                    case "D":
                        SR = new int[7] { 4, 5, 6, 7, 8, 9, 10 };
                        break;
                    case "E":
                        SR = new int[7] { 5, 6, 7, 8, 9, 10, 11 };
                        break;
                    case "F":
                        SR = new int[7] { 6, 7, 8, 9, 10, 11, 12 };
                        break;
                    case "G":
                        SR = new int[7] { 7, 8, 9, 10, 11, 12, 13 };
                        break;
                    case "H":
                        SR = new int[7] { 8, 9, 10, 11, 12, 13, 14 };
                        break;
                    case "I":
                        SR = new int[7] { 9, 10, 11, 12, 13, 14, 15 };
                        break;
                    case "J":
                        SR = new int[7] { 10, 11, 12, 13, 14, 15, 16 };
                        break;
                    case "K":
                        SR = new int[7] { 11, 12, 13, 14, 15, 16, 17 };
                        break;
                    case "L":
                        SR = new int[7] { 12, 13, 14, 15, 16, 17, 18 };
                        break;
                    case "M":
                        SR = new int[7] { 13, 14, 15, 16, 17, 18, 19 };
                        break;
                    case "N":
                        SR = new int[7] { 14, 15, 16, 17, 18, 19, 20 };
                        break;
                    case "O":
                        SR = new int[7] { 15, 16, 17, 18, 19, 20, 21 };
                        break;
                    case "P":
                        SR = new int[7] { 16, 17, 18, 19, 20, 21, 22 };
                        break;
                    case "Q":
                        SR = new int[7] { 17, 18, 19, 20, 21, 22, 23 };
                        break;
                    case "R":
                        SR = new int[7] { 18, 19, 20, 21, 22, 23, 24 };
                        break;
                    case "S":
                        SR = new int[7] { 19, 20, 21, 22, 23, 24, 25 };
                        break;
                }



                int[] empresa = new int[8] { 1, 2, 3, 4, 5, 6, 7, 8 };

                int numReg = 0;
                SqlConnection cn = new SqlConnection();
                cn.ConnectionString = "Data Source=DESKTOP-D3LJP8S\\COOPERCHIP2014;Initial Catalog=" + "PROJEEM2012" + ";Integrated Security=True;";
                cn.Open();

                SqlDataAdapter da = new SqlDataAdapter("select grupo from resultados where premio = " + cboEmpresa.Text + " order by data", cn);

                DataSet ds = new DataSet();
                da.Fill(ds, "RaioX");
                DataTable dt = new DataTable();
                dt = ds.Tables["RaioX"];
                numReg = dt.Rows.Count;
                int curReg = 0;
                int grupo = 0;
                int frequencia = 1;
                int MaiorAtraso = 0;
                int vTotal = 0;
                decimal media = 0.00M;
                decimal vNumPremio = 0M;
                decimal vQtdeCarenciaMaiorQue5 = 0.0M;
                decimal vQtdeCarenciaMaiorQue8 = 0.0M;

                DeletaFrequencia(cn);

                lvRaioXdeFrequencia.Items.Clear();

                if (numReg > 0)
                {
                    while (curReg < numReg)
                    {
                        grupo = int.Parse(dt.Rows[curReg]["grupo"].ToString());

                        lblSRRaioX1.Text = SR[0].ToString();
                        lblSRRaioX2.Text = SR[1].ToString();
                        lblSRRaioX3.Text = SR[2].ToString();
                        lblSRRaioX4.Text = SR[3].ToString();
                        lblSRRaioX5.Text = SR[4].ToString();
                        lblSRRaioX6.Text = SR[5].ToString();
                        lblSRRaioX7.Text = SR[6].ToString();

                        if (grupo == SR[0] || grupo == SR[1] || grupo == SR[2] || grupo == SR[3] || grupo == SR[4] || grupo == SR[5] || grupo == SR[6])
                        {
                            if (frequencia > MaiorAtraso) MaiorAtraso = frequencia;
                            if (frequencia > 5) vQtdeCarenciaMaiorQue5++;
                            if (frequencia > 8) vQtdeCarenciaMaiorQue8++;
                            vTotal += frequencia;
                            vNumPremio++;
                            InsereFrequencia(vNumPremio, frequencia, cn);

                            lvRaioXdeFrequencia.Items.Add(new ListViewItem(new string[] { vNumPremio.ToString(), frequencia.ToString() }));

                            frequencia = 1;
                        }
                        else
                        {
                            frequencia++;
                        }

                        curReg++;
                    }
                    media = vTotal / vNumPremio;
                }
                lblFrequencia.Text = vNumPremio.ToString();
                lblMaiorAtraso.Text = MaiorAtraso.ToString();
                lblMediaDeFrequencia.Text = media.ToString("0.0");
                lblUltimaCarencia.Text = frequencia.ToString();
                lblQtdeAtrasoMaior5.Text = vQtdeCarenciaMaiorQue5.ToString();
                lblPercentualMaiorQue5.Text = (vQtdeCarenciaMaiorQue5 * 100 / vNumPremio).ToString("0.0")+"%";
                lblQtdeAtrasoMaior8.Text = vQtdeCarenciaMaiorQue8.ToString();
                lblPercentualMaiorQue8.Text = (vQtdeCarenciaMaiorQue8 * 100 / vNumPremio).ToString("0.0") + "%";

                cn.Dispose();
                cn.Close();

               // CSharpUtil.Util.Msg("RaioX Gravado com Sucesso!");

            }
        }




        private void InsereFrequencia(decimal vNumPremio, int frequencia, SqlConnection cn)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into RaioX (id, frequencia) values ("+ vNumPremio +", '" + frequencia + "')", cn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
            }
        }

        private void DeletaFrequencia(SqlConnection cn)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("delete from RaioX", cn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
            }
        }

        private void btnMontaCapi_Click(object sender, EventArgs e)
        {
            Funcoes.MontaMapaCapi(txtNumSB, txtValorMedia, cboNumGP, ref aMapaCapi, lvMapaCapi);
        }




    }
}
