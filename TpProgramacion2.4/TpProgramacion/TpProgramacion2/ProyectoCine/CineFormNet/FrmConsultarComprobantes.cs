using CineFormNet.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BibliotecaCine.Entidades.Entrada;

namespace CineFormNet
{
    public partial class FrmConsultarComprobantes : Form
    {
        public FrmConsultarComprobantes()
        {
            InitializeComponent();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            if (dtpDesde.Value > dtpHasta.Value)
            {
                MessageBox.Show("Periodo incorrecto", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            String fecDesde, fecHasta, cliente;
            fecDesde = Uri.EscapeDataString(dtpDesde.Value.ToString("yyyy/MM/dd"));
            fecHasta = Uri.EscapeDataString(dtpHasta.Value.ToString("yyyy/MM/dd"));
            cliente = Uri.EscapeDataString(txtCliente.Text);
            CargarComprobantes(fecDesde, fecHasta, cliente);
        }

        private async void CargarComprobantes(string desde, string hasta, string cliente)
        {
            string url = string.Format("http://localhost:5031/comprobantes?desde={0}&hasta={1}", desde, hasta);
            if (!String.IsNullOrEmpty(cliente))
                url = String.Format(url + "&cliente={0}", cliente);

            var result = await ClientSingleton.GetInstance().GetAsync(url);
            var lst = JsonConvert.DeserializeObject<List<Comprobante>>(result);
            dgvComprobantes.Rows.Clear();
            if (lst != null)
            {
                foreach (Comprobante presupuesto in lst)
                {
                    dgvComprobantes.Rows.Add(new object[] {
                    presupuesto.PresupuestoNro,
                    presupuesto.Fecha.ToString("dd/MM/yyyy"),
                    presupuesto.Cliente,
                    });
                }
            }
            else
            {
                MessageBox.Show("Sin datos de comprobantes para los filtros ingresados", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Está seguro que desea salir?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
