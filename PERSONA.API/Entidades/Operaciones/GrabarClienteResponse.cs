using Newtonsoft.Json;

namespace PERSONA.API.Entidades.Operaciones
{
    public class GrabarClienteResponse
    {
        [JsonProperty("idCliente")]
        public int IdCliente { get; set; }
        [JsonProperty("mensajeOk")]
        public string MensajeOk { get; set; }
        [JsonProperty("mensajeError")]
        public string MensajeError { get; set; }
    }
}
