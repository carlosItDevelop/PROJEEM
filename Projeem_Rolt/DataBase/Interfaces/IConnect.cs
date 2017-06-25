using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Interfaces
{
    public interface IConnect
    {
        bool Conectar();
        bool Desconectar();
        DataTable RetornaDataTable(string p_strConn, List<SqlParameter> p_lstParam, string P_NomeDaTabela);
        bool ExecutaComando(string strSql, List<SqlParameter> p_lstParam);
    }
}
