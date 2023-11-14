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
        public decimal Descuento { get; set; }

        public int Id_Funcion { get; set; }


        public Butacas butac1 { get; set; }
        public DetalleComprobante(int deta, int nro, decimal precio, Butacas butaca1, decimal descuento, int id_Funcion)
        {
            Id_detalle = deta;
            Nro_comprobante = nro;
            Precio = precio;
            butac1 = butaca1;
            Descuento = descuento;
            Id_Funcion = id_Funcion;
        }



    }
}
