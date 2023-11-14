using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Entrada
{
    public class Butacas
    {
        public int Id { get; set; }
        public int Fila { get; set; }
        public int Columna { get; set; }
        public int Nro_Funcion { get; set; }
        public int Id_Estado { get; set; }
        public Butacas(int id, int fila, int col, int func, int est)
        {
            this.Id = id;
            this.Fila = fila;
            this.Columna = col;
            this.Nro_Funcion = func;
            this.Id_Estado = est;
        }

        public Butacas()
        {

        }
    }
}
