using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Entrada
{
    public class FormaPago
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }

        public FormaPago(int id, string descripcion)
        {
            Id = id;
            Descripcion = descripcion;
        }

        public FormaPago() 
        {
            Id = 0;
            Descripcion = "";
        }
    }
}
