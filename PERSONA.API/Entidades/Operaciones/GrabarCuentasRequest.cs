using Newtonsoft.Json;
using PERSONA.API.Utils;
using System.ComponentModel.DataAnnotations;

namespace PERSONA.API.Entidades.Operaciones
{
    public class GrabarCuentasRequest
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
        public void IsValid()
        {
            if (IdCliente <= 0)
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "IdCliente"));
            }
            if (string.IsNullOrEmpty(NumeroCuenta))
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "NumeroCuenta"));
            }
            if (string.IsNullOrEmpty(TipoCuenta))
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "TipoCuenta"));
            }
            if (ValorTope <= 0)
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "NumeroCuenta"));
            }
            if (SaldoInicial <= 0)
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "SaldoInicial"));
            }

        }
    }
}
