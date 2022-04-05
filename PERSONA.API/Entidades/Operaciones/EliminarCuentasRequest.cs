using Newtonsoft.Json;
using PERSONA.API.Utils;
using System.ComponentModel.DataAnnotations;

namespace PERSONA.API.Entidades.Operaciones
{
    public class EliminarCuentasRequest
    {
        [JsonProperty("idCuenta")]
        public int IdCuenta { get; set; }
        [JsonProperty("estado")]
        public bool Estado { get; set; }
        public void IsValid()
        {
            if (IdCuenta <= 0)
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "IdCuenta"));
            }
            if (Estado)
            {
                throw new ValidationException(string.Format("{0}, no es el correcto", "Estado"));
            }
        }
    }
}
