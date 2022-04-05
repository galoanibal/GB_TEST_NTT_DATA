using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using PERSONA.API.Comun;
using PERSONA.API.Controllers;
using PERSONA.API.Datos;
using PERSONA.API.Entidades.Consultas;
using PERSONA.API.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PERSONA.API.TEST
{
    [TestClass]
    public class ClienteTesting
    {
        [TestMethod]
        public void ClienteListar()
        {
            string connectionString = "";
            IClientes obj = new DatosCliente();
           
            ListarClienteRequest request = new ListarClienteRequest() {
            OffSet=1,
            Limit=2
            };
            List<ListarClienteResponse> response = new List<ListarClienteResponse>() { new ListarClienteResponse() {
            IdCliente=1,
            IdPersona=2,
            Contraseña="1234"
            },
            new ListarClienteResponse() {
            IdCliente=2,
            IdPersona=3,
            Contraseña="abcd"
            }};
            PagedCollection<ListarClienteResponse> valorEsperado = new PagedCollection<ListarClienteResponse>(response, request.Limit, 1);
            var mockRepo = new Mock<IClientes>();
            mockRepo.Setup(repo => repo.Listar(request, connectionString)).Returns(Task.FromResult(valorEsperado));

            ClienteController controller = new ClienteController(mockRepo.Object);
            ObjectResult valorRespondido = controller.Listar(request).Result.Result as ObjectResult;

            //Assert - Verificacion
            var result = valorRespondido;
            Assert.IsTrue(result.StatusCode == 200);
        }
    }
}
