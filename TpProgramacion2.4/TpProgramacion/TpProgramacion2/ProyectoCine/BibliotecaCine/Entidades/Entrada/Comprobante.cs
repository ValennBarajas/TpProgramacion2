using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Entrada
{
    public class Comprobante
    {
        public int Nro_comprobante { get; set; }
        public DateTime Fecha { get; set; }
        public int Id_cliente { get; set; }
        public int Cod_forma_pago { get; set; }
        public string Reserva { get; set; }

        public List<DetalleComprobante> Detalles { get; set; }

        public Comprobante()
        {
            Detalles = new List<DetalleComprobante>();
        }

        public void AgregarDetalle(DetalleComprobante detalle)
        {
            Detalles.Add(detalle);
        }

        public void QuitarDetalle(int indice)
        {
            Detalles.RemoveAt(indice);
        }
    }
}
