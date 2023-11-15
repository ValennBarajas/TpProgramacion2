using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Peliculas
{
    public class Reparto
    {
        public int Id { get; set; }
        public int Id_Actor { get; set; }
        public int Cod_Pelicula { get; set; }
        public string Puesto { get; set; }
        public List<Pelicula> Peliculas { get; set; }
        public Reparto(int id, int act, int peli, string puesto, List<Pelicula> peliculas)
        {
            this.Id = id;
            this.Id_Actor = act;
            this.Cod_Pelicula = peli;
            this.Puesto = puesto;
            this.Peliculas = peliculas;

        }
        public List<Actor> actores { get; set; }
        public List<Director> directors { get; set; }
        public Reparto()
        {
            actores = new List<Actor>();
            directors = new List<Director>();
        }

        public void AgregarActor(Actor actor)
        {
            actores.Add(actor);
        }

        public void AgregarDirector(Director director)
        {
            directors.Add(director);
        }


        public void QuitarTodo(int id)
        {
            actores.RemoveAt(id);
        }

    }
}
