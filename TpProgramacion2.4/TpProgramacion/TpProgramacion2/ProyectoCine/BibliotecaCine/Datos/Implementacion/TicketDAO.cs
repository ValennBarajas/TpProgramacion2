using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BibliotecaCine.Datos.Interfaz;
using BibliotecaCine.Entidades.Entrada;
using BibliotecaCine.Entidades.Peliculas;

namespace BibliotecaCine.Datos.Implementacion
{
    public class TicketDAO : IDaoTicket
    {
        public int ObtenerProximoNro()
        {
            string sp = "SP_PROXIMO ID";
            return HelperDB.ObtenerInstancia().ConsultaEscalarSQL(sp, "@next");
        }

        public List<Pelicula> ObtenerPeliculas()
        {
            List<Pelicula> lst = new List<Pelicula> ();

            string sp = "SP_CONSULTAR_PELICULAS";
            DataTable t = HelperDB.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in t.Rows) 
            {
                int nro = int.Parse(dr["cod_pelicula"].ToString());
                string nombre = dr["pelicula"].ToString();
                string sinopsis = dr["sinopsis"].ToString();
                int id_pg = int.Parse(dr["id_PG"].ToString());
                int id_genero = int.Parse(dr["id_genero"].ToString());
                int id_director = int.Parse(dr["id_director"].ToString());
                DateTime fecha = DateTime.Parse(dr["fecha_orden"].ToString());
                id_genero = int.Parse(dr["id_genero"].ToString());

                Pelicula aux = new Pelicula(nro, nombre, sinopsis, id_pg, id_genero, id_director, fecha);
                lst.Add(aux);
            }
            return lst;
        }

        public List<FormaPago> ObtenerFormasPago()
        {
            List<FormaPago> lst = new List<FormaPago>();

            string sp = "SP_GET_FORMAS_PAGO";
            DataTable t = HelperDB.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow fila in t.Rows)
            {
                int Id = Convert.ToInt32(fila[0].ToString());
                string Descripcion = fila[1].ToString();
                FormaPago f = new FormaPago(Id, Descripcion);
                lst.Add(f);
            }
            return lst;
        }

        public bool Crear(Comprobante oComprobante)
        {
            bool ok = true;
            SqlConnection conexion = HelperDB.ObtenerInstancia().ObtenerConexion();
            SqlTransaction t = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                conexion.Open();
                t = conexion.BeginTransaction();
                cmd.Connection = conexion;
                cmd.Transaction = t;
                cmd.CommandText = "SP_INSERTAR_MAESTRO";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_cliente", oComprobante.Id_cliente);
                cmd.Parameters.AddWithValue("@cod_forma_pago", oComprobante.Cod_forma_pago);
                cmd.Parameters.AddWithValue("@reserva", oComprobante.Reserva);

                SqlParameter pOut = new SqlParameter();
                pOut.ParameterName = "@nro_comprobante";
                pOut.DbType = DbType.Int32;
                pOut.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pOut);
                cmd.ExecuteNonQuery();

                int comprobanteNro = (int)pOut.Value;
                int nroButaca = 1;
                int detalleNro = 1;
                foreach (DetalleComprobante item in oComprobante.Detalles)
                {
                    SqlCommand cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", conexion, t);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@nro_comprobante", comprobanteNro);
                    cmdDetalle.Parameters.AddWithValue("@precio", item.Precio);
                    cmdDetalle.Parameters.AddWithValue("@id_butaca", item.butaca.Id);
                    cmdDetalle.Parameters.AddWithValue("@descuento", item.Descuento);
                    cmdDetalle.ExecuteNonQuery();

                    foreach (Butacas item in oComprobante.Butaca)
                    {
                        SqlCommand cmdButaca = new SqlCommand("SP_INSERTAR_BUTACA", conexion, t);
                        cmdButaca.CommandType = CommandType.StoredProcedure;
                        cmdButaca.Parameters.AddWithValue("@id_butaca", nroButaca);
                        cmdButaca.Parameters.AddWithValue("@nro_funcion", item.Nro_Funcion);
                        cmdButaca.Parameters.AddWithValue("@", item.);
                        cmdButaca.ExecuteNonQuery();

                        detalleNro++;
                    }
                }
                t.Commit();
            }
            catch (Exception)
            {
                if (t != null)
                    t.Rollback();
                ok = false;
            }

            finally
            {
                if (conexion != null && conexion.State == ConnectionState.Open)
                    conexion.Close();
            }

            return ok;
        }

        public List<Comprobante> ObtenerPresupuestosPorFiltros(DateTime desde, DateTime hasta, string cliente)
        {
            List<Comprobante> comprobantes = new List<Comprobante>();
            string sp = "SP_CONSULTAR_COMPROBANTES";
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@fecha_desde", desde));
            lst.Add(new Parametro("@fecha_hasta", hasta));
            lst.Add(new Parametro("@cliente", cliente));
            DataTable dt = HelperDB.ObtenerInstancia().ConsultaSQL(sp, lst);

            foreach (DataRow row in dt.Rows)
            {
                Comprobante c = new Comprobante();
                c.Id_cliente = int.Parse(row["id_cliente"].ToString());
                c.Nro_comprobante = int.Parse(row["nro_comprobante"].ToString());
                c.Fecha = DateTime.Parse(row["fecha"].ToString());
                c.Cod_forma_pago = int.Parse(row["cod_forma_pago"].ToString());

                comprobantes.Add(c);
            }

            return comprobantes;
        }
    }
}
