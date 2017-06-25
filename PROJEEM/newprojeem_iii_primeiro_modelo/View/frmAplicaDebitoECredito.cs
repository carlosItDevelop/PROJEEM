#region:: Diretivas Using's

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;
using Projeem.Controller;
using View;

#endregion: Diretivas Using's

namespace Projeem.View
{
    public partial class frmAplicaDebitoECredito : Form
    {

        #region:: Variáveis da Classe
        string[,] aMapaCapi = new string[41, 8];


        #region:: Arrays que controlam os debitos e créditos dos Gps até 15º SB

        static decimal[] CtrlGpID = new decimal[25];
        static decimal[] CtrlGpDebito = new decimal[25];
        static decimal[] CtrlGpDebitoDeduzido = new decimal[25];
        static decimal[] CtrlGpCredito = new decimal[25];

        static decimal vLucroIndividual = 0.00M;//  Novo - Estudar comportamento!!! 

        #endregion:: Arrays que controlam os debitos e créditos dos Gps até 15º SB


        static int[] vCountCarAtual = new int[15]; // Valores iniciados no Evento Click StartProcess;
        static int[] vCountCarDoPremio = new int[15]; // Valores iniciados no Load do Form;

        DateTime dt_ini;
        DateTime dt_aux;
        TimeSpan dt_duracao;

        int gr1, gr2, gr3, car;
        int qtdePremio = 0;
        int id_ser;
        int totalDeSerie;
        int regAtualSerie;
        string status = string.Empty;
        string vTipoDeProcessamento;

        ControleAplicacao ctrl = null;
        SqlConnection cn;
        Hashtable hashContabilidade = new Hashtable();
        Indices ind = null;

        string fileSoundDemora = "Demora.wav";
        string fileSoundGuardaCarta = "GuardaCarta.wav";
        string fileSoundRenuncia = "Renuncia.wav";
        //string fileSoundInicioJogo = "Inicio.wav"; // Mudar o arquivo!!!
        string appSoundPath = Application.StartupPath + @"\sounds\"; 

        #endregion:: Variáveis da Classe


        #region:: Contrutor do Form
        /// <summary>
        /// Construtor da Classe;
        /// </summary>
        /// <param name="cn"></param>
        public frmAplicaDebitoECredito(SqlConnection cn)
        {

            this.cn = cn;
            ind = new Indices(cn);
            ctrl = new ControleAplicacao(cn);

            hashContabilidade["DebitoContabil"] = 0.00M;
            hashContabilidade["DebitoReal"] = 0.00M;
            hashContabilidade["CreditoContabil"] = 0.00M;
            hashContabilidade["CreditoReal"] = 0.00M;
            hashContabilidade["SaldoSbContabil"] = 0.00M;
            hashContabilidade["SaldoSbReal"] = 0.00M;
            hashContabilidade["SaldoAcumuladoContabil"] = 0.00M;
            hashContabilidade["SaldoAcumuladoReal"] = 0.00M;

            InitializeComponent();

        }// Fim do Construtor da Classe;
        #endregion: Contrutor do Form


        /// <summary>
        /// Load do Form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmAplicaDebitoECredito_Load(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            Funcoes.MontaMapaCapi(txtNumSB, txtValorMedia, cboNumGP, ref aMapaCapi, lvMapaCapi);
            
            UtilAnotacao.PreencheComboComum(this.cn, cboGrupoAtual, "grupos", "grupo");
            barProgresso.Minimum = 0;
            barProgresso.Maximum = 100;
            barProgresso.Value = 0;

            lblIdContabilidade.Text = Indices.GetIdContabilidade(this.cn).ToString();

            lblUser.Text = CSharpUtil.Util.User;
            lblData.Text = CSharpUtil.Util.Date;
            lblReferencia.Text = CSharpUtil.Util.Referencia;

            lblMaximoCGContabil.Text = Indices.GetMaxCGContabil(this.cn);
            lblMaximoCGReal.Text = Indices.GetMaxCGReal(this.cn);


            btnStartProcess.Enabled = true;

            lblDbInUse.Text = "Empresa: ["+Indices.dbInUse+"]";

            Funcoes.PreencheCtrlDebito(ref lvControlGP, this.cn);


            #region:: Zera Labels de Recap
            lblRecap01_wait.Text = "0";
            lblRecap02_wait.Text = "0";
            lblRecap03_wait.Text = "0";
            lblRecap04_wait.Text = "0";
            lblRecap05_wait.Text = "0";
            lblRecap01_Proc.Text = "0";
            lblRecap02_Proc.Text = "0";
            lblRecap03_Proc.Text = "0";
            lblRecap04_Proc.Text = "0";
            lblRecap05_Proc.Text = "0";

            lblSerieProc_115_Qtde.Text = "0";

            lblSubsidioWaitCount.Text = "0";
            lblSubsidioReadyCount.Text = "0";

            lblRecap01_PValor.Text = "0.00";
            lblRecap02_PValor.Text = "0.00";
            lblRecap03_PValor.Text = "0.00";
            lblRecap04_PValor.Text = "0.00";
            lblRecap05_PValor.Text = "0.00";

            lblSerieProc_115_Valor.Text = "0.00";

            lblRecap01_WValor.Text = "0.00";
            lblRecap02_WValor.Text = "0.00";
            lblRecap03_WValor.Text = "0.00";
            lblRecap04_WValor.Text = "0.00";
            lblRecap05_WValor.Text = "0.00";
            #endregion

            #region:: Exibe e Seta os Hash de Contabilidades;
            ctrl.ExibeDadosContabilidade();
            if (ctrl.Num_registro > 0) {
                ctrl.Ultimo();
                PreencheCampos();

                hashContabilidade["DebitoContabil"] = Convert.ToDecimal(lblDebitoContabil.Text);
                hashContabilidade["DebitoReal"] = Convert.ToDecimal(lblDebitoReal.Text);
                hashContabilidade["CreditoContabil"] = Convert.ToDecimal(lblCreditoContabil.Text);
                hashContabilidade["CreditoReal"] = Convert.ToDecimal(lblCreditoReal.Text);
                hashContabilidade["SaldoSbContabil"] = Convert.ToDecimal(lblSaldoContabilSb.Text);
                hashContabilidade["SaldoSbReal"] = Convert.ToDecimal(lblSaldoRealSb.Text);
                hashContabilidade["SaldoAcumuladoContabil"] = Convert.ToDecimal(lblSaldoContabilAcumulado.Text);
                hashContabilidade["SaldoAcumuladoReal"] = Convert.ToDecimal(lblSaldoRealAcumulado.Text);

            }
            #endregion:: Exibe e Seta os Hash de Contabilidades;



            lblCapitalSubsidiario.Text = "0.00";
            
            
            vTipoDeProcessamento = Indices.GetStatusProcessamento(this.cn);
            if (vTipoDeProcessamento.Equals("DEBITO")){
                lblStatusDeProcessamento.Text = "--> DÉBITO!";
            } else { lblStatusDeProcessamento.Text = "--> CRÉDITO!"; }

          

            /* ------------------ */
        }// FIM DO LOAD DO FORM;


        /// <summary>
        /// Botão de Start dos Processos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnStartProcess_Click(object sender, EventArgs e)
        {
            if (vTipoDeProcessamento.Equals("DEBITO"))
            {
                try {
                    cboGrupoAtual.Text = "";
                    lblStatusDeProcessamento.Text = "PROCESSANDO DÉBITO!";
                    btnFecharCapitalizacao.Enabled = false; // Desabilita durante processamente das Séries
                    btnConsolidar.Enabled = false;
                    /**/
                    ProcessaDebito();
                    /**/

                    if (Convert.ToDecimal(lblSaldoContabilAcumulado.Text) < Convert.ToDecimal(lblMaximoCGContabil.Text))
                    {
                        lblMaximoCGContabil.Text = lblSaldoContabilAcumulado.Text;
                        Indices.SetMaxCGContabil(lblSaldoContabilAcumulado.Text, this.cn);
                    }
                    if (Convert.ToDecimal(lblSaldoRealAcumulado.Text) < Convert.ToDecimal(lblMaximoCGReal.Text))
                    {
                        lblMaximoCGReal.Text = lblSaldoRealAcumulado.Text;
                        Indices.SetMaxCGReal(lblSaldoRealAcumulado.Text, this.cn);
                    }
                    /**/

                    Indices.UpdateStatusProcessamento("CREDITO", this.cn);
                    btnFecharCapitalizacao.Enabled = true; // Habilita após processamente das Séries
                    btnConsolidar.Enabled = true;
                    vTipoDeProcessamento = "CREDITO";
                    lblStatusDeProcessamento.Text = "--> CRÉDITO!";
                } catch (Exception ex) {
                    CSharpUtil.Util.MsgErro(ex.Message);
                }
            } else {
                if (cboGrupoAtual.Text.Trim().Length <= 0) {
                    CSharpUtil.Util.MsgErro("Você precisa informar o grupo anterior");
                } else {
                    try {                        
                        lblStatusDeProcessamento.Text = "PROCESSANDO CRÉDITO!";
                        btnFecharCapitalizacao.Enabled = false; // Desabilita durante processamente das Séries
                        btnConsolidar.Enabled = false;

                        /**/
                        ProcessaCredito();
                        /**/
                        Indices.UpdateStatusProcessamento("DEBITO", this.cn);
                        btnFecharCapitalizacao.Enabled = true; // Habilita após processamente das Séries
                        btnConsolidar.Enabled = true;

                        btnSair.Enabled = true; // Habilita Botão sair, pois com Débito pendete podemos sair
                        vTipoDeProcessamento = "DEBITO";
                        lblStatusDeProcessamento.Text = "--> DÉBITO!";
                        
                    } catch (Exception ex) {
                        CSharpUtil.Util.MsgErro(ex.Message);
                    }
                }// cboNumGP.Text.Trim().Length > 0; 
            }
        
        // ---------------------------- //                                  
        }// Fim do Método btnStartProcess;



        /// <summary>
        ///  ProcessaDebito
        /// </summary>
        private void ProcessaDebito()
        {
            #region:: Área de Inicialização do Método

            #region:: Zera os Arrays para GridView
            for (int i = 0; i < 25; i++)
            {
                CtrlGpID[i] = i + 1;
                CtrlGpDebito[i] = 0;
                CtrlGpDebitoDeduzido[i] = 0;
            }
            #endregion


            Serie serie = new Serie(this.cn);
            serie.CarregaSeries(this.cn);
            serie.Primeiro();
            totalDeSerie = serie.Num_registro;

            serie.ContaStatusEAgrupa(ref lblRecap01_wait, ref lblRecap02_wait, ref lblRecap03_wait,
                                     ref lblRecap04_wait, ref lblRecap05_wait, ref lblRecap01_Proc,
                                     ref lblRecap02_Proc, ref lblRecap03_Proc,
                                     ref lblRecap04_Proc, ref lblRecap05_Proc,
                                     ref lblSerieProc_115_Qtde, ref lblSubsidioWaitCount, ref lblSubsidioReadyCount);

            serie.SomaValorRecapProc(ref vCountCarAtual, ref aMapaCapi, ref CtrlGpDebito, ref lblRecap01_PValor, 
                                     ref lblRecap02_PValor, ref lblRecap03_PValor, ref lblRecap04_PValor,
                                     ref lblRecap05_PValor, ref lblSerieProc_115_Valor);

            serie.SomaValorRecapWait(ref aMapaCapi, ref lblRecap01_WValor, ref lblRecap02_WValor, 
                                     ref lblRecap03_WValor, ref lblRecap04_WValor, ref lblRecap05_WValor);

            lblTotalRecapWaitCount.Text = (int.Parse(lblRecap01_wait.Text) +
                                           int.Parse(lblRecap02_wait.Text) +
                                           int.Parse(lblRecap03_wait.Text) +
                                           int.Parse(lblRecap04_wait.Text) +
                                           int.Parse(lblRecap05_wait.Text)).ToString();

            lblTotalRecapWaitValor.Text = (decimal.Parse(lblRecap01_WValor.Text) +
                                           decimal.Parse(lblRecap02_WValor.Text) +
                                           decimal.Parse(lblRecap03_WValor.Text) +
                                           decimal.Parse(lblRecap04_WValor.Text) +
                                           decimal.Parse(lblRecap05_WValor.Text)).ToString("0.00");

                
                // FALTAM ESTES!!!!!!
                //lblSubsidioWaitValor.Text = Convert.ToDecimal(hashRecapStatus["Subsidio_WValor"]).ToString("0.000");
                //lblSubsidioReadyValor.Text = Convert.ToDecimal(hashRecapStatus["Subsidio_RValor"]).ToString("0.000");


            btnStartProcess.Enabled = false;
            barProgresso.Value = 0;
            lblQtdeSeriesPremiadas.Text = "0";


            dt_ini = DateTime.Now;

            hashContabilidade["CreditoContabil"] = 0.00M;
            hashContabilidade["CreditoReal"] = 0.00M;
            lblCreditoContabil.Text = 0.00M.ToString("0.00");
            lblCreditoReal.Text = 0.00M.ToString("0.00");
            
            #endregion: Área de inicialização do Método

            #region:: While que processa o débito
            while (!serie.FinalDeArquivo)
            {

                #region:: Seta tempo, id_serie, Barra de Progresso, status e car
                dt_aux = DateTime.Now;
                dt_duracao = dt_aux.Subtract(dt_ini);
                lblTempoDecorrido.Text = dt_duracao.ToString();

                regAtualSerie = serie.Registro_atual;
                barProgresso.Value = regAtualSerie * 100 / totalDeSerie;

                id_ser = serie.Id_serie;

                status = serie.Status;
                car = serie.Carencia;
                #endregion

                #region:: Seta as Variáveis que representam os Grupos em cada Série
                gr1 = serie.Gr_01;
                gr2 = serie.Gr_02;
                gr3 = serie.Gr_03;
                #endregion



                serie.Proximo(); 

            }// Fim do while (!serie.FinalDeArquivo)
            #endregion: While que processa o débito

            #region:: Controle do Acumulo do Débito Contábil Total do SB;
            decimal vCount = 0.00M;
            for (int i = 0; i < 25; i++) {
                vCount += CtrlGpDebito[i];
            }
            hashContabilidade["DebitoContabil"] = vCount;
            lblDebitoContabil.Text = Convert.ToDecimal(hashContabilidade["DebitoContabil"]).ToString("0.00");
            #endregion

            #region:: Bloco (006)


                // Deduz débito através do Mvtc e retorna Mvtc
                decimal lmvtc = Funcoes.OtimizaDebito(ref CtrlGpDebitoDeduzido, CtrlGpDebito, this.cn);
               

                vCount = 0.00M;
                lvControlGP.Items.Clear();
                for (int j = 0; j < 25; j++)
                {
                    lvControlGP.Items.Add(new ListViewItem(new string[] { 
                                              CtrlGpID[j].ToString(),
                                              CtrlGpDebito[j].ToString("0.000"),
                                              CtrlGpDebitoDeduzido[j].ToString("0.000")}));
                                              vCount += CtrlGpDebitoDeduzido[j];
                }

                hashContabilidade["DebitoReal"] = vCount;
                lblDebitoReal.Text = ((decimal)hashContabilidade["DebitoReal"]).ToString("0.00");



            #endregion:: FIM Bloco (006)

            serie = null;

            #region:: uso das HashTable's para Controlar Contabilidade
            hashContabilidade["SaldoSbContabil"] = Convert.ToDecimal(hashContabilidade["CreditoContabil"]) 
                                                 - Convert.ToDecimal(hashContabilidade["DebitoContabil"]);
            hashContabilidade["SaldoSbReal"] = Convert.ToDecimal(hashContabilidade["CreditoReal"]) 
                                             - Convert.ToDecimal(hashContabilidade["DebitoReal"]);
            
            lblSaldoContabilSb.Text = Convert.ToDecimal(hashContabilidade["SaldoSbContabil"]).ToString("0.00");
            lblSaldoRealSb.Text = Convert.ToDecimal(hashContabilidade["SaldoSbReal"]).ToString("0.00");

            hashContabilidade["SaldoAcumuladoContabil"] = Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"]) 
                                                        - Convert.ToDecimal(hashContabilidade["DebitoContabil"]);
            hashContabilidade["SaldoAcumuladoReal"] = Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"]) 
                                                    - Convert.ToDecimal(hashContabilidade["DebitoReal"]);

            lblSaldoContabilAcumulado.Text =  Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"]).ToString("0.00");
            lblSaldoRealAcumulado.Text = Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"]).ToString("0.00");
            #endregion: uso das HashTable's para Controlar Contabilidade

           

            /**/
            GravaDados();
            /**/
            lblIdContabilidade.Text = Indices.GetIdContabilidade(this.cn).ToString();


            btnStartProcess.Enabled = true;
            Funcoes.TocaWav(appSoundPath + fileSoundRenuncia);

        }// FIM DO MÉTODO ProcessandoDebito;



        /// <summary>
        /// ProcessaCredito
        /// </summary>
        private void ProcessaCredito() 
        {
            #region:: Área de Inicialização do Método
            int gp_premiado = Convert.ToInt32(cboGrupoAtual.Text);
            
            btnStartProcess.Enabled = false;

            Serie serie = new Serie(this.cn);
            serie.CarregaSeries(this.cn);
            serie.Primeiro();
            totalDeSerie = serie.Num_registro;
            
            dt_ini = DateTime.Now;

            #endregion: Área de Inicialização do Método

            #region:: Zera o Array (Credito e CarPremio) -> GridView
            for (int i = 0; i < 25; i++)
            {
                CtrlGpCredito[i] = 0;
            }
            qtdePremio = 0;

            for (int i = 0; i < 15; i++)
            {
                vCountCarDoPremio[i] = 0;
            }

            #endregion: Zera o Array (Credito e CarPremio) -> GridView

            #region:: While que Seta tempo, id_serie, Barra de Progresso, status e car
           
            while (!serie.FinalDeArquivo)
            {

                dt_aux = DateTime.Now;
                dt_duracao = dt_aux.Subtract(dt_ini); // TimeSpan Variável
                lblTempoDecorrido.Text = dt_duracao.ToString();

                regAtualSerie = serie.Registro_atual;
                barProgresso.Value = regAtualSerie * 100 / totalDeSerie;

                id_ser = serie.Id_serie;

                // Seta Status da Serie Atual
                status = serie.Status;
                car = serie.Carencia;


        

                #region:: If que controla o fluxo em caso de Prêmio
               
                // Executar: Analisar todas as consequências e efeitos colaterais!
                if (((gp_premiado == serie.Gr_01) || (gp_premiado == serie.Gr_02) || (gp_premiado == serie.Gr_03)) && (serie.Status != "OUT" && serie.Status != "Subsidio_wait" && serie.Status != "Subsidio_Ready"))
                {                    
                    serie.ProcessaCredito(true, gp_premiado, id_ser, status, ref qtdePremio, ref lblQtdeSeriesPremiadas,
                                          ref vCountCarDoPremio, ref CtrlGpCredito, ref aMapaCapi, car, ref vLucroIndividual);
                }
                else
                {
                    serie.ProcessaCredito(false, gp_premiado, id_ser, status, ref qtdePremio, ref lblQtdeSeriesPremiadas,
                                          ref vCountCarDoPremio, ref CtrlGpCredito, ref aMapaCapi, car, ref vLucroIndividual);
                }

                #endregion: If que controla o fluxo em caso de Prêmio

                serie.Proximo();

            // ----------------------------------- //
            }// Fim do while (!serie.FinalDeArquivo);

            #endregion: While que Seta tempo, id_serie, Barra de Progresso, status e car

 

            #region:: Controle do Acumulo do Crédito Contábil Total do SB;
            decimal vCount = 0;
            for (int i = 0; i < 25; i++)
            {
                vCount += CtrlGpCredito[i];
            }
            hashContabilidade["CreditoContabil"] = vCount;            
            lblCreditoContabil.Text = Convert.ToDecimal(hashContabilidade["CreditoContabil"]).ToString("0.00yhy");
            #endregion

            #region:: Recupera da Tabela Grupos se o Premio foi Deduzido ou não e vCreditoReal!
            Grupos grp = new Grupos(this.cn);
            decimal vCreditoReal = decimal.MinValue;
            

            string DebitoDeduzido = grp.IsDebidoDeduzido(cboGrupoAtual.Text.Trim(), ref vCreditoReal);

            
            hashContabilidade["CreditoReal"] = vCreditoReal;
            lblCreditoReal.Text = vCreditoReal.ToString("0.00");
            grp = null;
            #endregion


            #region:: uso das HashTable's para Controlar Contabilidade
            hashContabilidade["SaldoSbContabil"] = Convert.ToDecimal(hashContabilidade["CreditoContabil"]) 
                                                 - Convert.ToDecimal(hashContabilidade["DebitoContabil"]);
            hashContabilidade["SaldoSbReal"] =  Convert.ToDecimal(hashContabilidade["CreditoReal"]) 
                                                 - Convert.ToDecimal(hashContabilidade["DebitoReal"]);
            
            lblSaldoContabilSb.Text = ((decimal)hashContabilidade["SaldoSbContabil"]).ToString("0.000");
            lblSaldoRealSb.Text = ((decimal)hashContabilidade["SaldoSbReal"]).ToString("0.000");

            hashContabilidade["SaldoAcumuladoContabil"] = Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"]) 
                                                        + Convert.ToDecimal(hashContabilidade["CreditoContabil"]);
            hashContabilidade["SaldoAcumuladoReal"] = Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"]) 
                                                        + Convert.ToDecimal(hashContabilidade["CreditoReal"]);

            lblSaldoContabilAcumulado.Text = ((decimal)hashContabilidade["SaldoAcumuladoContabil"]).ToString("0.00");
            lblSaldoRealAcumulado.Text = ((decimal)hashContabilidade["SaldoAcumuladoReal"]).ToString("0.00");
            #endregion

            #region:: Capital Subsidiário e Pseudo[...] DE CICLO COMPLETO; Após Crédito!
            // Transformar em Função (na Classe Funcao) via Método Static.
            /* -------------------------------------------------------- */
            // Capital Subsidiário, após todos os cálculos. Válido, pois está após crédito, que marca um SB completo!
            /* ------------------------------------------------------------------------------------------------------------ */
            lblCapitalSubsidiario.Text = (Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"])
                                         - Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"])).ToString("0.00");
            
            #endregion

            #region:: Conjugado entre GravaDados, Carrega e PreencheCampo

            // Inserir nestes contextos abaixo;
            lblLucroIndividualContabil.Text = vLucroIndividual.ToString("0.00");

            /**/
            //GravaDados();
            EditaDados();
            /**/

            ctrl.ExibeDadosContabilidade();
            ctrl.Ultimo();
            PreencheCampos();
            #endregion


            serie = null;

            btnStartProcess.Enabled = true;
            Funcoes.TocaWav(appSoundPath + fileSoundDemora);

        // ---------------------------- //
        }// Fim do Método ProcessaCredito;



        #region :: Método VerificaCampos
        bool VerificaCampos()
        {
            string msgInconsistencia = "RELATÓRIO DE INCONSISTÊNCIA:\r\n=======================\r\n\n";
            int k = 0;
            if (cboGrupoAtual.Text.Trim().Equals("") && (vTipoDeProcessamento.Equals("CREDITO")))
            {
                k++;
                msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Prêmio é Obrigatório!\r\n" : k.ToString() +
                    " - Campo Prêmio é Obrigatório!\r\n");
            }
            if (lblCreditoReal.Text.Trim().Length == 0)
            {
                k++;
                msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Crédito Real é Obrigatório!\r\n" : k.ToString() +
                    " - Campo Crédito Real é Obrigatório!\r\n");
            }

            if (lblCapitalSubsidiario.Text.Trim().Length == 0)
            {
                k++;
                msgInconsistencia += (k < 10 ? "0" + k.ToString() + " - Campo Capital Subsidiario é Obrigatório!\r\n" : k.ToString() +
                    " - Campo Capital Subsidiario é Obrigatório!\r\n");
            }
     

            if (k > 0)
            {
                CSharpUtil.Util.MsgErro(msgInconsistencia);
                return false;
            }
            return true;
        }// Fim do Método VerificaCampos;
        #endregion


        void PreencheCampos()
        {
            lblResult_gp.Text = ctrl.Grupo.ToString();
            lblDebitoContabil.Text = ctrl.Debito_contabil.ToString("0.00");
            lblDebitoReal.Text = ctrl.Debito_real.ToString("0.00");
            lblCreditoContabil.Text = ctrl.Credito_contabil.ToString("0.00");
            lblCreditoReal.Text = ctrl.Credito_real.ToString("0.00");
            lblSaldoContabilSb.Text = ctrl.Saldo_sb_contabil.ToString("0.00");
            lblSaldoRealSb.Text = ctrl.Saldo_sb_real.ToString("0.00");
            lblCapitalSubsidiario.Text = ctrl.Capital_subsidiario.ToString("0.00");
     
            lblSaldoContabilAcumulado.Text = ctrl.Saldo_contabil_acumulado.ToString("0.00");
            lblSaldoRealAcumulado.Text = ctrl.Saldo_real_acumulado.ToString("0.00");
            lblCtrlNavegacao.Text = "Reg.: " + ctrl.Registro_atual.ToString() + " de: " + ctrl.Num_registro.ToString();

            vCountCarDoPremio[0] = ctrl.Vpre1;
            vCountCarDoPremio[1] = ctrl.Vpre2;
            vCountCarDoPremio[2] = ctrl.Vpre3;
            vCountCarDoPremio[3] = ctrl.Vpre4;
            vCountCarDoPremio[4] = ctrl.Vpre5;
            vCountCarDoPremio[5] = ctrl.Vpre6;
            vCountCarDoPremio[6] = ctrl.Vpre7;
            vCountCarDoPremio[7] = ctrl.Vpre8;
            vCountCarDoPremio[8] = ctrl.Vpre9;
            vCountCarDoPremio[9] = ctrl.Vpre10;
            vCountCarDoPremio[10] = ctrl.Vpre11;
            vCountCarDoPremio[11] = ctrl.Vpre12;            
            vCountCarDoPremio[12] = ctrl.Vpre13;
            vCountCarDoPremio[13] = ctrl.Vpre14;
            vCountCarDoPremio[14] = ctrl.Vpre15;




            lblSerieProc_115_Qtde.Text = ctrl.Proc115_qtde.ToString();
            lblSerieProc_115_Valor.Text = ctrl.Proc115_valor.ToString("0.00");

        }// FIM DO MÉTODO PREENCHECAMPOS;


        #region:: Método GravaDados
        /// <summary>
        /// GravaDados
        /// </summary>
        void GravaDados()
        {
            // transação que é levada para 
            // dentro dos métodos de adição 
            // abaixo, juntamente com o objeto Connection;
            SqlTransaction trans = null;
            try
            {
                if (VerificaCampos()) // Mudar para (CamposConfere -> Conferri campo por campo);
                {
                    ControleAplicacao ctrl_app = new ControleAplicacao(this.cn);
                    int id = int.Parse(CSharpUtil.Util.GerarID(this.cn, "id_contabilidade"));
                    int gp = (cboGrupoAtual.Text.Trim() != ""  ? int.Parse(cboGrupoAtual.Text) : 0) ;
                    int sb = Indices.GetSubperiodo(this.cn);

                    trans = this.cn.BeginTransaction("GravaDados");

                    ctrl_app.Add_Contabilidade(this.cn, trans, id, gp, sb,                                 
                                Convert.ToDecimal(hashContabilidade["DebitoContabil"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["DebitoReal"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["CreditoContabil"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["CreditoReal"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["SaldoSbContabil"]).ToString(),                                                                         Convert.ToDecimal(hashContabilidade["SaldoSbReal"]).ToString(),                                                                             lblCapitalSubsidiario.Text,
                                Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"]).ToString(),                                
                                Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"]).ToString());      



                    ctrl_app.AddEstatistica_Carencia(this.cn, trans, id,
                                                        ctrl.Vcar1,
                                                        ctrl.Vcar2,
                                                        ctrl.Vcar3,
                                                        ctrl.Vcar4,
                                                        ctrl.Vcar5,
                                                        ctrl.Vcar6,
                                                        ctrl.Vcar7,
                                                        ctrl.Vcar8,
                                                        ctrl.Vcar9,
                                                        ctrl.Vcar10,
                                                        ctrl.Vcar11,
                                                        ctrl.Vcar12,
                                                        ctrl.Vcar13,
                                                        ctrl.Vcar14,
                                                        ctrl.Vcar15,
                                                        int.Parse(lblSerieProc_115_Qtde.Text),
                                                        (lblSerieProc_115_Valor.Text.Trim().Equals("") ? 0.00M : Convert.ToDecimal(lblSerieProc_115_Valor.Text)));

                    ctrl_app.AddEstatistica_Premio(this.cn, trans, id, 
                                                    vCountCarDoPremio[0] ,
                                                    vCountCarDoPremio[1],
                                                    vCountCarDoPremio[2],
                                                    vCountCarDoPremio[3],
                                                    vCountCarDoPremio[4],
                                                    vCountCarDoPremio[5],
                                                    vCountCarDoPremio[6],
                                                    vCountCarDoPremio[7],
                                                    vCountCarDoPremio[8],
                                                    vCountCarDoPremio[9],
                                                    vCountCarDoPremio[10],
                                                    vCountCarDoPremio[11],
                                                    vCountCarDoPremio[12],
                                                    vCountCarDoPremio[13],
                                                    vCountCarDoPremio[14]);


                    Indices.AddSubperiodo(this.cn, trans);
                    Indices.SetIdContabilidade(id.ToString(), this.cn, trans);


                   trans.Commit();

                }
            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
                trans.Rollback("GravaDados");
            }

            Funcoes.TocaWav(appSoundPath + fileSoundGuardaCarta);

        /* ----------------------- */
        }// Fim do Método GravaDados;

        #endregion: Método GravaDados


        #region:: Método EditaDados
        /// <summary>
        /// GravaDados
        /// </summary>
        void EditaDados()
        {
            // transação que é levada para 
            // dentro dos métodos de adição 
            // abaixo, juntamente com o objeto Connection;
            SqlTransaction trans = null;
            try
            {
                if (VerificaCampos()) // Mudar para (CamposConfere -> Conferri campo por campo);
                {
                    ControleAplicacao ctrl_app = new ControleAplicacao(this.cn);
                                        
                    // Como estou editando não gero id e sim recupero de Indices;
                    int id = int.Parse(lblIdContabilidade.Text);
                    int gp = int.Parse(cboGrupoAtual.Text);

                    trans = this.cn.BeginTransaction("EditaDados");

                    ctrl_app.Upd_Contabilidade(this.cn, trans, id, gp, 
                                Convert.ToDecimal(hashContabilidade["DebitoContabil"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["DebitoReal"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["CreditoContabil"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["CreditoReal"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["SaldoSbContabil"]).ToString(), 
                                Convert.ToDecimal(hashContabilidade["SaldoSbReal"]).ToString(), 
                                lblCapitalSubsidiario.Text,
                                Convert.ToDecimal(hashContabilidade["SaldoAcumuladoContabil"]).ToString(),
                                Convert.ToDecimal(hashContabilidade["SaldoAcumuladoReal"]).ToString());



                    ctrl_app.UpdEstatistica_Carencia(this.cn, trans, id,
                                                        ctrl.Vcar1,
                                                        ctrl.Vcar2,
                                                        ctrl.Vcar3,
                                                        ctrl.Vcar4,
                                                        ctrl.Vcar5,
                                                        ctrl.Vcar6,
                                                        ctrl.Vcar7,
                                                        ctrl.Vcar8,
                                                        ctrl.Vcar9,
                                                        ctrl.Vcar10,
                                                        ctrl.Vcar11,
                                                        ctrl.Vcar12,
                                                        ctrl.Vcar13,
                                                        ctrl.Vcar14,
                                                        ctrl.Vcar15,
                                                        int.Parse(lblSerieProc_115_Qtde.Text),
                                                        (lblSerieProc_115_Valor.Text.Trim().Equals("") ? 0.00M : Convert.ToDecimal(lblSerieProc_115_Valor.Text)));


                    ctrl_app.UpdEstatistica_Premio(this.cn, trans, id,
                                                    vCountCarDoPremio[0],
                                                    vCountCarDoPremio[1],
                                                    vCountCarDoPremio[2],
                                                    vCountCarDoPremio[3],
                                                    vCountCarDoPremio[4],
                                                    vCountCarDoPremio[5],
                                                    vCountCarDoPremio[6],
                                                    vCountCarDoPremio[7],
                                                    vCountCarDoPremio[8],
                                                    vCountCarDoPremio[9],
                                                    vCountCarDoPremio[10],
                                                    vCountCarDoPremio[11],
                                                    vCountCarDoPremio[12],
                                                    vCountCarDoPremio[13],
                                                    vCountCarDoPremio[14]);


               
                    trans.Commit();

                }
            }
            catch (Exception ex)
            {
                CSharpUtil.Util.MsgErro(ex.Message);
                trans.Rollback("EditaDados");
            }

            Funcoes.TocaWav(appSoundPath + fileSoundGuardaCarta);

            /* ----------------------- */
        }// Fim do Método EditaDados;

        #endregion: Método EditaDados


        #region:: Métodos de Navegação - Contabilidade
        private void btnProximo_Click(object sender, EventArgs e)
        {
            ctrl.Proximo();
            PreencheCampos();
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            ctrl.Anterior();
            PreencheCampos();
        }
        private void btnPrimeiro_Click(object sender, EventArgs e)
        {
            ctrl.Primeiro();
            PreencheCampos();
        }
        private void btnUltimo_Click(object sender, EventArgs e)
        {
            ctrl.Ultimo();
            PreencheCampos();
        }
        #endregion: Métodos de Navegação - Contabilidade
 

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
        }

        private void btnMontaCapi_Click(object sender, EventArgs e)
        {
            Funcoes.MontaMapaCapi(txtNumSB, txtValorMedia, cboNumGP, ref aMapaCapi, lvMapaCapi);
        }

        private void btnPremiosCarencias_Click(object sender, EventArgs e)
        {
            frmDiplayPremiosCarencias f = new frmDiplayPremiosCarencias(ctrl.Vcar1,
                                                                        ctrl.Vcar2,
                                                                        ctrl.Vcar3,
                                                                        ctrl.Vcar4,
                                                                        ctrl.Vcar5,
                                                                        ctrl.Vcar6,
                                                                        ctrl.Vcar7,
                                                                        ctrl.Vcar8,
                                                                        ctrl.Vcar9,
                                                                        ctrl.Vcar10,
                                                                        ctrl.Vcar11,
                                                                        ctrl.Vcar12,
                                                                        ctrl.Vcar13,
                                                                        ctrl.Vcar14,
                                                                        ctrl.Vcar15,
                                                                        vCountCarDoPremio[0],
                                                                        vCountCarDoPremio[1],
                                                                        vCountCarDoPremio[2],
                                                                        vCountCarDoPremio[3],
                                                                        vCountCarDoPremio[4],
                                                                        vCountCarDoPremio[5],
                                                                        vCountCarDoPremio[6],
                                                                        vCountCarDoPremio[7],
                                                                        vCountCarDoPremio[8],
                                                                        vCountCarDoPremio[9],
                                                                        vCountCarDoPremio[10],
                                                                        vCountCarDoPremio[11],
                                                                        vCountCarDoPremio[12],
                                                                        vCountCarDoPremio[13],
                                                                        vCountCarDoPremio[14]);
            f.ShowDialog();
        }

        private void btnFecharCapitalizacao_Click(object sender, EventArgs e)
        {
            try{
                Serie.ZeraContadores(this.cn);
                Indices.ZeraContadores(this.cn);
                Indices.UpdateStatusProcessamento("DEBITO", this.cn);
                ControleAplicacao.DeleteAll_WithSProc(this.cn);
                Grupos.ZeraDebitosEDeducoes(this.cn);
                lblSaldoContabilAcumulado.Text = "0.00";
                lblSaldoRealAcumulado.Text = "0.00";

                this.Dispose();
                this.Close();
                CSharpUtil.Util.Msg("Dados Zerados com Sucesso!");
            }
            catch (Exception ex) {
                CSharpUtil.Util.Msg(ex.Message);
            }

        }

        private void btnConsolidar_Click(object sender, EventArgs e)
        {
            SqlConnection cnE = null;
            SqlDataAdapter da;
            DataSet ds;
            DataTable dt;
            int vCountEmpresa = 0;
            string[] aSb = new string[8] { "0", "0", "0", "0", "0", "0", "0", "0"};
            decimal[] SdRealAcumulado = new decimal[8] { 0.00M, 0.00M, 0.00M, 0.00M, 0.00M, 0.00M, 0.00M, 0.00M};
            string[] catalogo = new string[8] {"newprojeem_iii_1", "newprojeem_iii_2", "newprojeem_iii_3", "newprojeem_iii_4", 
                                                   "newprojeem_iii_5", "newprojeem_iii_6", "newprojeem_iii_7", "newprojeem_iii_8"};
            while (vCountEmpresa < 8)
            {

                cnE = new SqlConnection("Data Source=COOPERCHIP-PC;Initial Catalog=" + catalogo[vCountEmpresa] + ";Integrated Security=True;");
                try
                {
                    cnE.Open();

                    string InstrucaoSql = "Select * from contabilidade";

                    da = new SqlDataAdapter(InstrucaoSql, cnE);
                    ds = new DataSet();
                    da.Fill(ds, "ctbl01");
                    dt = ds.Tables["ctbl01"];

                    int UltimoReg = dt.Rows.Count - 1;

                    if (UltimoReg >= 0)
                    {
                        aSb[vCountEmpresa] = dt.Rows[UltimoReg]["subperiodo"].ToString();
                        SdRealAcumulado[vCountEmpresa] = Convert.ToDecimal(dt.Rows[UltimoReg]["saldo_real_acumulado"].ToString());
                    }


                }
                catch (Exception ex1)
                {
                    CSharpUtil.Util.Msg(ex1.Message);
                }
                finally
                {
                    cnE.Dispose();
                    cnE.Close();
                }

                vCountEmpresa++;

            }// Fim do while

            frmConsolidado frm = new frmConsolidado(this.cn, aSb, SdRealAcumulado);
            frm.ShowDialog();

        }




    // -------------------------- //
    }// FIM DA CLASSE GERAL DO FORM;
}// FIM DO NAMESPACE;
