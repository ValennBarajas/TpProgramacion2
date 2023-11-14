using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Entrada
{
    public class DetalleComprobante
    {
        public int Id_detalle { get; set; }
        public int Nro_comprobante { get; set; }
        public decimal Precio { get; set; }
        public int Id_butaca { get; set; }
        public decimal Descuento { get; set; }

        public int Id_Funcion { get; set; }

        public DetalleComprobante(int deta, int nro, decimal precio, int butaca, decimal descuento, int id_Funcion)
        {
            Id_detalle = deta;
            Nro_comprobante = nro;
            Precio = precio;
            Id_butaca = butaca;
            Descuento = descuento;
            Id_Funcion = id_Funcion;
        }



    }
}
