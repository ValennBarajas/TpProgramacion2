using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Entidades
{
    public class DetalleComprobante
    {
        public int Id_detalle { get; set; }
        public int Nro_comprobandte { get; set; }
        public decimal Precio { get; set; }
        public int Id_butaca { get; set; }
        public decimal Descuento { get; set; }

        public DetalleComprobante(int deta, int nro, decimal precio, int butaca, decimal descuento) 
        { 
            Id_detalle = deta;
            Nro_comprobandte = nro;
            Precio = precio;
            Id_butaca = butaca;
            Descuento = descuento;
        }

        p

    }
}
