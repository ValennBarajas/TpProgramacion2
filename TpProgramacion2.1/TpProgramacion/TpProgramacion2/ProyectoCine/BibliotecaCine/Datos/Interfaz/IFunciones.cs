using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BibliotecaCine.Entidades.Peliculas;

namespace BibliotecaCine.Datos.Interfaz
{
    internal interface IFunciones
    {
        bool crearFuncion(Funciones funcion);
        List<Pelicula> ObtenerPeli();
        List<Genero> ObtenerGenero();
        List<Guia> ObtenerGuia();
        List<Reparto> ObtenerReparto();

        List<Funciones> ObtenerFunc();
    }
}
