using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaCine.Entidades.Peliculas
{
    internal class Reparto
    {
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
