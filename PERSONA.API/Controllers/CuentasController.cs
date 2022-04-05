using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PERSONA.API.Comun;
using PERSONA.API.Entidades.Consultas;
using PERSONA.API.Entidades.Operaciones;
using PERSONA.API.Interfaces;
using System;
using System.Threading.Tasks;

namespace PERSONA.API.Controllers
{
    [Route("api/cuentas")]
    [ApiController]
    public class CuentasController : ControllerBase
    {
        #region Miembros privados del controlador

        private readonly ICuentas cuentas;
        private readonly IConfiguration configuration;
        #endregion

        #region Constructores del controlador

        public CuentasController(ICuentas _cuentas, IConfiguration config=null)
        {
            cuentas = _cuentas;
            configuration = config;
        }

        #endregion

        #region Operaciones del controlador       

        [HttpGet("listar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<PagedCollection<ListarCuentasResponse>>> Listar([FromQuery] ListarCuentasRequest request)
        {
            try
            {
                var response = await cuentas.Listar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Ok(response);
            }
            catch (Exception e)
            {
                return ResponseFaultListar(e);
            }
        }

        private ActionResult<PagedCollection<ListarCuentasResponse>> ResponseFaultListar(Exception e)
        {
            throw new Exception(e.Message);
        }

        [HttpPost("grabar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarCuentasResponse>> Grabar([FromBody] GrabarCuentasRequest request)
        {
            try
            {
                request.IsValid();
                var response = await cuentas.Grabar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Created(string.Empty, response);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }

        [HttpPut("eliminar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarCuentasResponse>> Eliminar([FromBody] EliminarCuentasRequest request)
        {
            try
            {
                request.IsValid();
                var response = await cuentas.Eliminar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Accepted(response);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }

        private ActionResult<GrabarCuentasResponse> ResponseFault(Exception e)
        {
            throw new Exception(e.Message);
        }

        #endregion
    }
}
