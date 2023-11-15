using BibliotecaCine.Datos;
using BibliotecaCine.Datos.Implementacion;
using BibliotecaCine.Datos.Interfaz;
using Microsoft.AspNetCore.Mvc;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiCine.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComprobanteController : ControllerBase
    {   
        private IDaoTicket ticket;

        public ComprobanteController()
        {
            ticket = new TicketDAO();
        }

        // GET: api/<ComprobanteController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<ComprobanteController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ComprobanteController>
        [HttpPost("Consultar")]
        public IActionResult ObtenerPeliculas(List<Parametro> lst)
        {
            if (lst == null|| lst.Count == 0)
            
                return BadRequest("Se requiere una lista de peliculas");
            
            return Ok((lst));
        }

        // PUT api/<ComprobanteController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ComprobanteController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
