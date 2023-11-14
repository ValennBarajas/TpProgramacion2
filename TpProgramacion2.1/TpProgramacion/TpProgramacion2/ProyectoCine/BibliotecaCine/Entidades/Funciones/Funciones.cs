using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Peliculas
{
    public class Funciones
    {
        public int nroFuncion { get; set; }
        public int codSala { get; set; }
        public DateTime fechaHorario { get; set; }
        public int codPelicula { get; set; }

        public Pelicula peli1 { get; set; }
        public Funciones(Pelicula pelicula)
        {
            peli1 = pelicula;
        }
        public Funciones()
        {
        }
    }
}
