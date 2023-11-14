using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace BibliotecaCine.Datos
{
    class HelperDB
    {
        private static HelperDB instancia;
        private SqlConnection conexion;

        private HelperDB()
        {
            conexion = new SqlConnection("");
        }


        public static HelperDB ObtenerInstancia()
        {
            if (instancia == null)
            {
                instancia = new HelperDB();
            }
            return instancia;
        }

        public DataTable ConsultaSQL(string sp, List<Parametro> values)
        {
            DataTable tabla = new DataTable();

            conexion.Open();
            SqlCommand cmd = new SqlCommand(sp, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            if (values != null)
            {
                foreach (Parametro oParametro in values) 
                {
                    cmd.Parameters.AddWithValue(oParametro.Clave, oParametro.Valor);
                }
            }
            tabla.Load(cmd.ExecuteReader());
            conexion.Close();

            return tabla;
        }

        public int ConsultaEscalarSQL(string sp, string pOutNombre)
        {
            conexion.Open();
            SqlCommand cmd = new SqlCommand(sp, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter pOut = new SqlParameter();
            pOut.ParameterName = pOutNombre;
            pOut.DbType = DbType.Int32;
            pOut.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(pOut);
            cmd.ExecuteNonQuery();
            conexion.Close();

            return (int)pOut.Value;
        }


        public int EjecutarSQL(string strSql, List<Parametro> values)
        {
            int afectadas = 0;
            SqlTransaction t = null;

            try
            {
                SqlCommand cmd = new SqlCommand();
                conexion.Open();
                t = conexion.BeginTransaction();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = strSql;
                cmd.Transaction = t;

                if (values != null)
                {
                    foreach (Parametro param in values)
                    {
                        cmd.Parameters.AddWithValue(param.Clave, param.Valor);
                    }
                }

                afectadas = cmd.ExecuteNonQuery();
                t.Commit();
            }
            catch (SqlException)
            {
                if (t != null) { t.Rollback(); }
            }
            finally
            {
                if (conexion != null && conexion.State == ConnectionState.Open)
                    conexion.Close();

            }

            return afectadas;
        }

        public SqlConnection ObtenerConexion()
        {
            return this.conexion;
        }

    }
}
