using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;


namespace Controller
{
    public class Util
    {
        public const MessageBoxButtons icoOk = MessageBoxButtons.OK;
        public const MessageBoxIcon icoErro = MessageBoxIcon.Error;
        public const MessageBoxIcon icoInfo = MessageBoxIcon.Information;

        private static int numImg = 0;
        private static String user;
        private static String date;
        private static String referencia;

        public Util()
        {
        }

        public static void MsgErro(string mensagem)
        {
            MessageBox.Show(mensagem, Application.ProductName + " - " +
                            Application.ProductVersion,
                            icoOk,
                            icoErro);
        }

        public static void MsgInfo(string mensagem)
        {
            MessageBox.Show(mensagem, Application.ProductName + " - " +
                            Application.ProductVersion,
                            icoOk,
                            icoInfo);
        }

        public static void Msg(string mensagem)
        {
            MessageBox.Show(mensagem, Application.ProductName + " - " +
                            Application.ProductVersion,
                            icoOk,
                            icoInfo);
        }

        public static void MudaReferencia(string NewReferencia, SqlConnection cn)
        {
            try
            {
                string InstrucaoSql = "update indice set referencia = '" + NewReferencia + "'";
                SqlCommand cmd = new SqlCommand(InstrucaoSql, cn);
                cmd.ExecuteNonQuery();
                Util.Referencia = NewReferencia;
                Msg("Referência Atualizada!!!");
            }
            catch (Exception ex)
            {
                Util.MsgErro(ex.Message);
            }
        }

        public static string FormataData(string data)
        {
            string strdata = "";
            return strdata;
        }

        public static string GerarID(SqlConnection cn, string tabela)
        {
            // Versão para SQLServer!!!!
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            string Resultado;
            SqlDataReader Leitor;

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

            return Resultado;
        }

        public static void PreencheCombo(SqlConnection cn, ComboBox cbo, String tabela, String campo)
        {
            String cmdString = "select distinct " + campo + " from " + tabela + " order by " + campo;
            SqlCommand cmd = new SqlCommand(cmdString, cn);
            SqlDataReader dr = cmd.ExecuteReader();
            cbo.Items.Clear();
            while (dr.Read())
            {
                cbo.Items.Add(dr[campo]);
            }
            dr.Close();
        }


        //public static void PreencheCombo(SqlConnection cn, ComboBox cbo, String tabela, String campo)
        //{
        //    String cmdString = "select distinct " + campo + " from " + tabela + " order by " + campo;
        //    SqlCommand cmd = new SqlCommand(cmdString, cn);
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    cbo.Items.Clear();
        //    while (dr.Read())
        //    {
        //        cbo.Items.Add(dr[campo]);
        //    }
        //    dr.Close();
        //}
        
        
     //   Util.PreencheCombo(this.cn, cboStatus, "status_anotacao", "descricao", "Todos");


        public static void SetaValGlobal(SqlConnection cn)
        {
            String strconn = "select referencia from indice";
            SqlCommand cmd = new SqlCommand(strconn, cn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Referencia = dr["referencia"].ToString();
            }
            dr.Close();
            // Setar data global;
            Date = System.DateTime.Now.ToShortDateString();
        }

        [Obsolete("Este método está sendo desativado. Favor não utilizá-lo!")]
        public static bool CnpjValido(String str_cnpj)
        {
            int soma = 0, dig;
            String cnpj_calc = str_cnpj.Substring(0, 12);

            if (str_cnpj.Length != 14)
                return false;

            char[] chr_cnpj = str_cnpj.ToCharArray();

            /* Primeira parte */
            for (int i = 0; i < 4; i++)
                if (chr_cnpj[i] - 48 >= 0 && chr_cnpj[i] - 48 <= 9)
                    soma += (chr_cnpj[i] - 48) * (6 - (i + 1));
            for (int i = 0; i < 8; i++)
                if (chr_cnpj[i + 4] - 48 >= 0 && chr_cnpj[i + 4] - 48 <= 9)
                    soma += (chr_cnpj[i + 4] - 48) * (10 - (i + 1));
            dig = 11 - (soma % 11);

            cnpj_calc += (dig == 10 || dig == 11) ?
                           "0" : dig.ToString();

            /* Segunda parte */
            soma = 0;
            for (int i = 0; i < 5; i++)
                if (chr_cnpj[i] - 48 >= 0 && chr_cnpj[i] - 48 <= 9)
                    soma += (chr_cnpj[i] - 48) * (7 - (i + 1));
            for (int i = 0; i < 8; i++)
                if (chr_cnpj[i + 5] - 48 >= 0 && chr_cnpj[i + 5] - 48 <= 9)
                    soma += (chr_cnpj[i + 5] - 48) * (10 - (i + 1));
            dig = 11 - (soma % 11);
            cnpj_calc += (dig == 10 || dig == 11) ?
                           "0" : dig.ToString();

            return str_cnpj.Equals(cnpj_calc);
        }

        /** Realiza a validação do CPF.
         * @param   strCPF número de CPF a ser validado
         * @return  true se o CPF é válido e false se não é válido
         */
        [Obsolete("Este método está sob avaliação!")]
        public static bool CpfValido(String strCpf)
        {
            int d1, d2;
            int digito1, digito2, resto;
            int digitoCPF;
            String nDigResult;

            d1 = d2 = 0;
            digito1 = digito2 = resto = 0;
            for (int nCount = 1; nCount < (strCpf.Length - 1); nCount++)
            {
                //digitoCPF = 0;
                digitoCPF = Convert.ToInt32(strCpf.Substring(nCount - 1, nCount));

                //multiplique a ultima casa por 2 a seguinte por 3 a seguinte por 4 e assim por diante.
                d1 = d1 + (11 - nCount) * digitoCPF;

                //para o segundo digito repita o procedimento incluindo o primeiro digito calculado no passo anterior.
                d2 = d2 + (12 - nCount) * digitoCPF;
            }

            //Primeiro resto da divisão por 11.
            resto = (d1 % 11);

            //Se o resultado for 0 ou 1 o digito é 0 caso contrário o digito é 11 menos o resultado anterior.
            if (resto < 2)
                digito1 = 0;
            else
                digito1 = 11 - resto;

            d2 += 2 * digito1;

            //Segundo resto da divisão por 11.
            resto = (d2 % 11);

            //Se o resultado for 0 ou 1 o digito é 0 caso contrário o digito é 11 menos o resultado anterior.
            if (resto < 2)
                digito2 = 0;
            else
                digito2 = 11 - resto;

            //Digito verificador do CPF que está sendo validado.
            String nDigVerific = strCpf.Substring(strCpf.Length - 2, strCpf.Length);

            //Concatenando o primeiro resto com o segundo.
            nDigResult = digito1.ToString() + digito2.ToString();

            //comparar o digito verificador do cpf com o primeiro resto + o segundo resto.
            return nDigVerific.Equals(nDigResult);

        } // Fim do Método CpfValido


        #region ::: Método Estático: isCpfValido

        public static bool IsCpfValido(string CPF)
        {
            String[] dadosArray = {"111.111.111-11", "222.222.222-22", "333.333.333-33", "444.444.444-44", 
                                   "555.555.555-55", "666.666.666-66", "777.777.777-77", "888.888.888-88", "999.999.999-99"};
            int n1, n2, flagX;

            CPF = CPF.Trim();

            for (int k = 0; k <= dadosArray.Length - 1; k++)
            {
                if (CPF.Length != 14 || dadosArray[k].Equals(CPF)) return false;
            }

            //remove a maskara
            CPF = CPF.Substring(0, 3) + CPF.Substring(4, 3) + CPF.Substring(8, 3) + CPF.Substring(12);
            for (int x = 0; x < 2; x++)
            {
                n1 = 0;

                flagX = 8 + x;
                for (int i = 0; i <= flagX; i++)
                {
                    n1 = n1 + Convert.ToInt32(CPF.Substring(i, 1)) * (10 + x - i);
                }

                n2 = 11 - (n1 - ((Convert.ToInt32(n1 / 11)) * 11));

                if (n2 == 10 || n2 == 11) n2 = 0;

                if (n2 != Convert.ToInt32(CPF.Substring(9 + x, 1))) return false;
            }
            return true;
        }
        #endregion

        #region ::: Método Estático: isCnpjValido
        public static bool IsCnpjValido(string CNPJ)
        {
            String[] dadosArray = {"11.111.111/1111-11", "22.222.222/2222-22", "33.333.333/3333-33", "44.444.444/4444-44", 
                                                "55.555.555/5555-55", "66.666.666/6666-66", "77.777.777/7777-77", "88.888.888/8888-88", 
                                                "99.999.999/9999-99"};
            bool valida;
            CNPJ = CNPJ.Trim();
            for (int i = 0; i < dadosArray.Length; i++)
            {
                if (CNPJ.Length != 18 || dadosArray[i].Equals(CNPJ))
                {
                    return false;
                }
            }
            // Remove a Mácara!
            CNPJ = CNPJ.Substring(0, 2) + CNPJ.Substring(3, 3) + CNPJ.Substring(7, 3) + CNPJ.Substring(11, 4) + CNPJ.Substring(16);
            valida = EfetivaValidacao(CNPJ);
            if (valida)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        /*
         *  Método que serve de apoio ao método
         *  Static IsCnpjValido logo aí em cima.
         *  Talvez seja uma boa idéia unificá-los
         *  tornando-os um único método, muito embora
         *  este método seja privado, ou seja, com 
         *  visibilidade apenas para este objeto!
         */

        #region ::: Método Estático EfetivaValidacao (Apoio para IsCnpjValido)
        private static bool EfetivaValidacao(string cnpj)
        {
            int[] numero = new int[14];
            int soma, resultado1, resultado2;
            for (int i = 0; i < numero.Length; i++)
            {
                numero[i] = Convert.ToInt32(cnpj.Substring(i, 1));
            }
            soma = numero[0] * 5 + numero[1] * 4 + numero[2] * 3 + numero[3] * 2 + numero[4] * 9 + numero[5] * 8 + numero[6] * 7 +
                        numero[7] * 6 + numero[8] * 5 + numero[9] * 4 + numero[10] * 3 + numero[11] * 2;
            soma -= (11 * (Convert.ToInt32(soma / 11)));
            if (soma == 0 || soma == 1)
            {
                resultado1 = 0;
            }
            else
            {
                resultado1 = 11 - soma;
            }
            if (resultado1 == numero[12])
            {
                soma = numero[0] * 6 + numero[1] * 5 + numero[2] * 4 + numero[3] * 3 + numero[4] * 2 + numero[5] * 9 +
                       numero[6] * 8 + numero[7] * 7 + numero[8] * 6 + numero[9] * 5 + numero[10] * 4 + numero[11] * 3 + numero[12] * 2;

                soma -= (11 * (Convert.ToInt32(soma / 11)));
                if (soma == 0 || soma == 1)
                {
                    resultado2 = 0;
                }
                else
                {
                    resultado2 = 11 - soma;
                }
                if (resultado2 == numero[13])
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        #endregion


        public static void FormataCpf(TextBox cpf)
        {
            try
            {
                if (cpf.Text.Length == 3 || cpf.Text.Length == 7)
                {
                    cpf.Text += ".";
                    cpf.SelectionStart = cpf.Text.Length + 1;
                }
                else if (cpf.Text.Length == 11)
                {
                    cpf.Text += "-";
                    cpf.SelectionStart = cpf.Text.Length + 1;
                }
            }
            catch (Exception ex)
            {
                MsgErro(ex.Message);
            }
        }

        public static void FormataCnpj(TextBox cnpj)
        {
            if (cnpj.Text.Length == 2 || cnpj.Text.Length == 6)
            {
                cnpj.Text += ".";
                cnpj.SelectionStart = cnpj.Text.Length + 1;
            }
            else if (cnpj.Text.Length == 10)
            {
                cnpj.Text += "/";
                cnpj.SelectionStart = cnpj.Text.Length + 1;
            }
            else if (cnpj.Text.Length == 15)
            {
                cnpj.Text += "-";
                cnpj.SelectionStart = cnpj.Text.Length + 1;
            }
        }

        #region ::: Rotina TeclaDigitada
        /*
         * Rotina para verificar se um dado digitado
         * é numérico. Esta rotina é chamada no evento
         * KeyDown de um TextBox e é útil ao evento
         * KeyPress do mesmo.
         */
        public static string TeclaDigitada(KeyEventArgs e)
        {
            // Determina se foi pressionada uma tecla numérica de cima do
            // do teclado ou se foi pressionada uma tecla do NumPad!
            if ((e.KeyCode >= Keys.D0 && e.KeyCode <= Keys.D9)
                           || (e.KeyCode >= Keys.NumPad0 && e.KeyCode <= Keys.NumPad9))
            {
                return "numero";
            }
            else if (e.KeyCode == Keys.Back)
            {
                return "back";
            }
            else
            {
                return "";
            }
        }
        #endregion


        public static String Referencia
        {
            get { return Util.referencia; }
            set { Util.referencia = value; }
        }
        public static String User
        {
            get { return Util.user; }
            set { Util.user = value; }
        }
        public static String Date
        {
            get { return Util.date; }
            set { Util.date = value; }
        }
        public static int NumImg
        {
            get { return Util.numImg; }
            set { Util.numImg = value; }
        }


    } // Fim da Classe;
} // Fim do namespace;
