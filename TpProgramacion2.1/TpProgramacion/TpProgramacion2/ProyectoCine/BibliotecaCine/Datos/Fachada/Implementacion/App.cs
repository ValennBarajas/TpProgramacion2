﻿using BibliotecaCine.Datos.Fachada.Interfaz;
using BibliotecaCine.Datos.Implementacion;
using BibliotecaCine.Datos.Interfaz;
using BibliotecaCine.Entidades.Entrada;
using BibliotecaCine.Entidades.Peliculas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Datos.Fachada.Implementacion
{
    internal class App : IApp
    {
        private IDaoTicket dt;
        private IFunciones ipl;

        public App()
        {
            dt = new TicketDAO();
            ipl = new FuncionesDAO();
        }
        public List<Funciones> GetFuncion()
        {
            List<Funciones> lst = ipl.ObtenerFunc();
            return lst;
        }

        public List<Comprobante> GetComprobantes()
        {
            throw new NotImplementedException();
        }

        public List<Reparto> GetRepartos()
        {
            throw new NotImplementedException();
        }


    }
}
