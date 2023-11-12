using ProyectoCine.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CineBack.Entidades;

namespace CineBack.Datos.Interfaz
{
    public interface IDaoTicket
    {
        List<Pelicula> ObtenerPeliculas();
        int ObtenerProximoNro();
        bool Crear(Comprobante oComprobante);
    }
}
