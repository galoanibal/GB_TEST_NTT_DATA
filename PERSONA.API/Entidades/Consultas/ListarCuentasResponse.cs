
using Newtonsoft.Json;

namespace PERSONA.API.Entidades.Consultas
{
    public class ListarCuentasResponse
    {
        [JsonProperty("idCuenta")]
        public int IdCuenta { get; set; }
        [JsonProperty("idCliente")]
        public int IdCliente { get; set; }
        [JsonProperty("numeroCuenta")]
        public string NumeroCuenta { get; set; }
        [JsonProperty("tipoCuenta")]
        public string TipoCuenta { get; set; }
        [JsonProperty("valorTope")]
        public decimal ValorTope { get; set; }
        [JsonProperty("saldoInicial")]
        public decimal SaldoInicial { get; set; }
        [JsonProperty("estado")]
        public bool Estado { get; set; }
    }
}
