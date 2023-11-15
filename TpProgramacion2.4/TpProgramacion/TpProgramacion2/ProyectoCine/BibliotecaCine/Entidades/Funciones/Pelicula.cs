﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Peliculas
{
    public class Pelicula
    {
        private int nro;
        private string? nombre;
        private int id_pg;
        private int id_genero;
        private int id_director;
        private DateTime fecha;
        private int id_tipo;
        private Reparto repartos;

        public int CodPelicula { get; set; }
        public string Titulo { get; set; }
        public string Sinopsis { get; set; }
        public int IdPg { get; set; }
        public int IdGenero { get; set; }
        public int IdActor { get; set; }
        public int IdDirector { get; set; }
        public DateTime FechaEstreno { get; set; }
        public int Id_Tipo { get; set; }
        public Reparto Repartos { get; set; }


        public Pelicula(int codPeli, string titu, string sinop, int idPg, int idGen, int idAct, int idDire, DateTime fec, int id_tipo, Reparto rep)
        {
            CodPelicula = codPeli;
            Titulo = titu;
            Sinopsis = sinop;
            IdPg = idPg;
            IdGenero = idGen;
            IdActor = idAct;
            IdDirector = idDire;
            FechaEstreno = fec;
            Id_Tipo = id_tipo;
            Repartos = rep;
        }

        public Pelicula(int nro, string nombre, string sinopsis, int id_pg, int id_genero, int id_director, DateTime fecha, Reparto rep)
        {
            this.nro = nro;
            this.nombre = nombre;
            Sinopsis = sinopsis;
            this.id_pg = id_pg;
            this.id_genero = id_genero;
            this.id_director = id_director;
            this.fecha = fecha;
            this.repartos = rep;
        }

        public Pelicula(int nro, string? nombre, string? sinopsis, int id_pg, int id_genero, int id_director, DateTime fecha)
        {
            this.nro = nro;
            this.nombre = nombre;
            Sinopsis = sinopsis;
            this.id_pg = id_pg;
            this.id_genero = id_genero;
            this.id_director = id_director;
            this.fecha = fecha;
        }
    }
}
