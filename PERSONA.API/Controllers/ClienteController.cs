using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PERSONA.API.Comun;
using PERSONA.API.Entidades.Consultas;
using PERSONA.API.Entidades.Operaciones;
using PERSONA.API.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PERSONA.API.Controllers
{
    [Route("api/clientes")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        #region Miembros privados del controlador

        private readonly IClientes clientes;
        private readonly IConfiguration configuration;
        #endregion

        #region Constructores del controlador

        public ClienteController(IClientes _clientes, IConfiguration config=null)           
        {
            clientes = _clientes;
            configuration = config;
        }
        #endregion

        #region Operaciones del controlador
        [HttpGet("listar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<PagedCollection<ListarClienteResponse>>> Listar([FromQuery] ListarClienteRequest request)
        {
            try
            {
                var response = await clientes.Listar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Ok(response);
            }
            catch (Exception e)
            {
                return ResponseFaultListar(e);
            }
        }

        private ActionResult<PagedCollection<ListarClienteResponse>> ResponseFaultListar(Exception e)
        {
            throw new Exception(e.Message);
        }

        [HttpPost("grabar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarClienteResponse>> Grabar([FromBody] GrabarClienteRequest request)
        {
            try
            {
                request.IsValid();
                var response = await clientes.Grabar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Created(string.Empty, response);
            }
            catch (Exception e)
            {
                return ResponseFault (e);
            }
        }

        [HttpPut("eliminar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<GrabarClienteResponse>> Eliminar([FromBody] EliminarClienteRequest request)
        {
            try
            {
                request.IsValid();
                var response = await clientes.Eliminar(request, configuration.GetConnectionString("ConecctionDbTest"));

                return Accepted(response);
            }
            catch (Exception e)
            {
                return ResponseFault(e);
            }
        }

        private ActionResult<GrabarClienteResponse> ResponseFault(Exception e)
        {
            throw new Exception(e.Message);
        }

        #endregion
    }
}
