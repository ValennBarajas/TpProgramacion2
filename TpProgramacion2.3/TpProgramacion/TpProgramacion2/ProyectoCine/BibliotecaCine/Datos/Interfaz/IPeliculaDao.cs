using BibliotecaCine.Entidades.Peliculas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Interfaz
{
    public interface IPeliculaDao
    {
        List<Pelicula> GetPeliculas();
        List<Genero> GetGeneros();
        List<Guia> GetGuia();
        List<Reparto> GetReparto();
        bool CrearPelicula(Pelicula pelicula);
    }
}
