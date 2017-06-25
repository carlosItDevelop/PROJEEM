using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms; 

namespace Controller
{
    public class Conexao
    {
        private String strConn;
        private SqlConnection cn;
        private String state;
        private String server;
        private String database;

        public Conexao(SqlConnection cn) { 
            InitializeComponents();
            this.cn = cn;
        }

        private void InitializeComponents() { 
            // TODO: Implementar!!!!
            // Tentei escrever as linha Cn = cn; aqui e deu erro > cn=null
            // ????
        }

        public void Open() {
            try {
            

                strConn = "Data Source=" + this.server + ";Initial Catalog=" + this.database + ";" + "Integrated Security=True;";

                cn.ConnectionString = strConn;
                cn.Open();
                State = "Opened";
                Util.SetaValGlobal(cn);
            } catch (Exception e) {
                Util.MsgErro(e.Message);
            }
        }
        public void Close() {
            try
            {
                if (cn.State != ConnectionState.Closed)
                {
                    cn.Close();
                    State = "Closed";
                }
            } catch (Exception e) {
                Util.MsgErro(e.Message);
            }
        }


        #region Properties do Objeto Conexao;
        public SqlConnection Cn
        {
            get { return cn; }
            set { this.cn = value; }
        }
        public String State
        {
            get { return state; }
            set { this.state = value; }
        }
        public String Server
        {
            get { return server; }
            set { this.server = value; }
        }
        public String Database
        {
            get { return database; }
            set { this.database = value; }
        }
        #endregion
    }
}
