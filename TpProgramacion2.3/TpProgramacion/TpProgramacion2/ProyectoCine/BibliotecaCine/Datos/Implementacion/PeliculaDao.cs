using BibliotecaCine.Datos;
using BibliotecaCine.Entidades.Peliculas;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Implementacion
{
    public class PeliculaDao
    {
        public List<Pelicula> GetPeliculas()
        {
            List<Pelicula> lstPeliculas = new List<Pelicula>();

            string sp = "SP_CONSULTAR_PELICULAS";
            DataTable table = HelperDB.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in table.Rows)
            {
                int nro = int.Parse(dr["cod_pelicula"].ToString());
                string nombre = dr["pelicula"].ToString();
                string sinopsis = dr["sinopsis"].ToString();
                int id_pg = int.Parse(dr["id_PG"].ToString());
                int id_genero = int.Parse(dr["id_genero"].ToString());
                int id_director = int.Parse(dr["id_director"].ToString());
                DateTime fecha = DateTime.Parse(dr["fecha_orden"].ToString());

                Pelicula aux = new Pelicula(nro, nombre, sinopsis, id_pg, id_genero, id_director, fecha);
                lstPeliculas.Add(aux);
            }
            return lstPeliculas;
        }

        public bool CrearPelicula(Pelicula oPelicula)
        {
            bool ok = true;
            SqlConnection con = null;
            SqlTransaction tran = null;

            try
            {
                con = HelperDB.ObtenerInstancia().ObtenerConexion();
                con.Open();
                tran = con.BeginTransaction();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Transaction = tran;

                cmd.CommandText = "SP_INSERTAR_PELICULAS";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@titulo", oPelicula.Titulo);
                cmd.Parameters.AddWithValue("@sinopsis", oPelicula.Sinopsis);
                cmd.Parameters.AddWithValue("@pg", oPelicula.IdPg);
                cmd.Parameters.AddWithValue("@genero", oPelicula.IdGenero);
                cmd.Parameters.AddWithValue("@director", oPelicula.IdDirector);

                SqlParameter pOut = new SqlParameter();
                pOut.ParameterName = "@presupuesto_nro";
                pOut.DbType = DbType.Int32;
                pOut.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pOut);
                cmd.ExecuteNonQuery();

                int nroPelicula = (int)pOut.Value;

                SqlCommand cmdReparto;
                int repartoNro = 1;
                foreach (Reparto item in oPelicula.Repartos)
                {
                    cmdReparto = new SqlCommand("SP_INSERTAR_REPARTO", con, tran);
                    cmdReparto.CommandType = CommandType.StoredProcedure;
                    cmdReparto.Parameters.AddWithValue("@reparto", item.Id);
                    cmdReparto.Parameters.AddWithValue("@actor", item.Id_Actor);
                    cmdReparto.Parameters.AddWithValue("@cod_pelicula", item.Cod_Pelicula);
                    cmdReparto.Parameters.AddWithValue("@puesto", item.Puesto);
                    cmdReparto.ExecuteNonQuery();

                    repartoNro++;
                }
                tran.Commit();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al crear la función: " + ex.Message);
                if (tran != null)
                    tran.Rollback();
                ok = false;
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
            }

            return ok;
        }
        public List<Reparto> GetReparto()
        {
            List<Reparto> listaRepartos = new List<Reparto>();

            SqlConnection conexion = null;
            SqlCommand cmdActores = null;
            SqlCommand cmdDirectores = null;

            try
            {
                conexion = HelperDB.ObtenerInstancia().ObtenerConexion();
                conexion.Open();
                cmdActores = new SqlCommand();
                cmdActores.Connection = conexion;
                cmdActores.CommandText = "SELECT * FROM Actores";
                SqlDataReader readerActores = cmdActores.ExecuteReader();

                List<Actor> listaActores = new List<Actor>();

                while (readerActores.Read())
                {
                    Actor actor = new Actor
                    {
                    };
                    listaActores.Add(actor);
                }
                readerActores.Close();

                cmdDirectores = new SqlCommand();
                cmdDirectores.Connection = conexion;
                cmdDirectores.CommandText = "SELECT * FROM Directores";
                SqlDataReader readerDirectores = cmdDirectores.ExecuteReader();

                List<Director> listaDirectores = new List<Director>();

                while (readerDirectores.Read())
                {
                    Director director = new Director
                    {
                    };
                    listaDirectores.Add(director);
                }
                readerDirectores.Close();


                Reparto reparto = new Reparto();
                foreach (Actor actor in listaActores)
                {
                    reparto.AgregarActor(actor);
                }

                foreach (Director director in listaDirectores)
                {
                    reparto.AgregarDirector(director);
                }

                listaRepartos.Add(reparto);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener el reparto: " + ex.Message);

            }
            finally
            {

                if (conexion != null && conexion.State == ConnectionState.Open)
                    conexion.Close();

                if (cmdActores != null)
                    cmdActores.Dispose();

                if (cmdDirectores != null)
                    cmdDirectores.Dispose();
            }

            return listaRepartos;
        }

        public List<Genero> GetGenero()
        {
            throw new NotImplementedException();
        }

        public List<Guia> GetGuia()
        {
            throw new NotImplementedException();
        }
    }
}
