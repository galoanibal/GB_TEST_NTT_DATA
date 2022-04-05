using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace PERSONA.API.Entidades.Consultas
{
    public class ListarClienteRequest
    {
        [JsonProperty("offset")]
        [Required]
        public int OffSet { get; set; }
        [JsonProperty("limit")]
        [Required]
        public int Limit { get; set; }
    }
}
