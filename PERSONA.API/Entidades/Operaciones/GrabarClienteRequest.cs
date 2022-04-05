using Microsoft.IdentityModel.SecurityTokenService;
using Newtonsoft.Json;
using PERSONA.API.Utils;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PERSONA.API.Entidades.Operaciones
{
    public class GrabarClienteRequest
    {
        [JsonProperty("idCliente")]
        [Column("IdCliente")]
        public int IdCliente { get; set; }
        [JsonProperty("idPersona")]
        [Column("IdPersona")]
        public int IdPersona { get; set; }
        [JsonProperty("contraseña")]
        [Column("Contraseña")]
        public string Contraseña { get; set; }
        [JsonProperty("estado")]
        [Column("Estado")]
        public bool Estado { get; set; }
        public void IsValid()
        {
            if (IdPersona <= 0)
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "IdPersona"));
            }
            if (string.IsNullOrEmpty(Contraseña))
            {
                throw new ValidationException(string.Format(MensajesOperaciones.ERROR_VAL_02, "Contraseña"));
            }           
        }
    }
}
