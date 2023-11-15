﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BibliotecaCine.Datos.Interfaz;
using BibliotecaCine.Entidades.Peliculas;

namespace BibliotecaCine.Datos.Implementacion
{
    internal class FuncionesDAO : IFunciones
    {
        public List<Pelicula> ObtenerPeli()
        {
            List<Pelicula> lst = new List<Pelicula>();

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

  

        public bool crearFuncion(Funciones oFuncion)
        {
            bool ok = true;
            SqlConnection conexion = null;
            SqlTransaction t = null;

            try
            {
                conexion = HelperDB.ObtenerInstancia().ObtenerConexion();
                conexion.Open();
                t = conexion.BeginTransaction();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conexion;
                cmd.Transaction = t;

                cmd.CommandText = "SP_INSERTAR_FUNCION";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_sala", oFuncion.codSala);
                cmd.Parameters.AddWithValue("@fecha_horario", oFuncion.fechaHorario);
                cmd.Parameters.AddWithValue("@cod_pelicula", oFuncion.codPelicula);

                SqlParameter pOut = new SqlParameter();
                pOut.ParameterName = "@nro_funcion";
                pOut.DbType = DbType.Int32;
                pOut.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pOut);
                cmd.ExecuteNonQuery();

                int nroFuncion = (int)pOut.Value;

                cmd.CommandText = "SP_INSERTAR_DETALLE_FUNCION";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nro_funcion", nroFuncion);
                cmd.Parameters.AddWithValue("@titulo", oFuncion.peli1.Titulo); 
                cmd.Parameters.AddWithValue("@sinopsis", oFuncion.peli1.Sinopsis);
                cmd.Parameters.AddWithValue("@id_pg", oFuncion.peli1.IdPg);
                cmd.Parameters.AddWithValue("@id_genero", oFuncion.peli1.IdGenero);
                cmd.Parameters.AddWithValue("@id_actor", oFuncion.peli1.IdActor);
                cmd.Parameters.AddWithValue("@id_director", oFuncion.peli1.IdDirector);
                cmd.Parameters.AddWithValue("@fecha_estreno", oFuncion.peli1.FechaEstreno);
                cmd.ExecuteNonQuery();

                t.Commit();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al crear la función: " + ex.Message);
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
        public List<Reparto> ObtenerReparto()
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
              
                Reparto reparto = new Reparto();
                foreach (Actor actor in listaActores)
                {
                    reparto.AgregarActor(actor);
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

        public List<Genero> ObtenerGenero()
        {
            List<Genero>lstGenero = new List<Genero>();

            string sp = "SP_CONSULTAR_GENERO";
            DataTable t = HelperDB.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in t.Rows)
            {

                int id_genero = int.Parse(dr["id_genero"].ToString());
                string genero = "genero".ToString();
                

                Genero genero1 = new Genero
                {
                    id_genero = id_genero,
                    genero = genero,

                };

                lstGenero.Add(genero1);
            }

            return lstGenero;
        }

        public List<Guia> ObtenerGuia()
        {
            List<Guia> lstGuia = new List<Guia>();

            string sp = "SP_CONSULTAR_GENERO";
            DataTable t = HelperDB.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in t.Rows)
            {

                int idPG = int.Parse(dr["idPG"].ToString());
                int EdadMinima = int.Parse(dr["Edad_Minima"].ToString());


                Guia Guia = new Guia
                {
                    idPG = idPG,
                    EdadMinima = EdadMinima,

                };

                lstGuia.Add(Guia);
            }

            return lstGuia;
        }
    }
}
