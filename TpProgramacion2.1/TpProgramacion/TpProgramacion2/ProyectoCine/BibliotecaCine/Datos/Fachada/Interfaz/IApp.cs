using BibliotecaCine.Entidades.Entrada;
using BibliotecaCine.Entidades.Peliculas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Datos.Fachada.Interfaz
{
    internal interface IApp
    {
        public List<Funciones> GetFuncion();
        public List<Comprobante> GetComprobantes();

        public List<Reparto> GetRepartos();
    }
}
