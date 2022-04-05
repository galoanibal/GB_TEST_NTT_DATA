using Newtonsoft.Json;

namespace PERSONA.API.Entidades.Consultas
{
    public class ListarClienteResponse
    {
        [JsonProperty("idCliente")]
        public int IdCliente { get; set; }
        [JsonProperty("idPersona")]
        public int IdPersona { get; set; }
        [JsonProperty("contraseña")]
        public string Contraseña { get; set; }
        [JsonProperty("estado")]
        public bool Estado { get; set; }
    }
}
