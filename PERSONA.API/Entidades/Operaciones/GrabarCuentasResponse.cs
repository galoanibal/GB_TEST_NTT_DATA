﻿using Newtonsoft.Json;

namespace PERSONA.API.Entidades.Operaciones
{
    public class GrabarCuentasResponse
    {
        [JsonProperty("idCuenta")]
        public int IdCuenta { get; set; }
        [JsonProperty("mensajeOk")]
        public string MensajeOk { get; set; }
        [JsonProperty("mensajeError")]
        public string MensajeError { get; set; }
    }
}
