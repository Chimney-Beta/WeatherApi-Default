
using Microsoft.AspNetCore.Mvc;

namespace WeatherApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NamesController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(
                new[] { "Brenda", "Jason", "Sean", "Cory" }
            ); 
        }
    }
}