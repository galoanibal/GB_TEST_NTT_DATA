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
    public class CuentasTesting
    {
        [TestMethod]
        public void ListarCuentas() {
            string connectionString = "";
            ICuentas obj = new DatosCuentas();

            ListarCuentasRequest request = new ListarCuentasRequest()
            {
                OffSet = 1,
                Limit = 2
            };
            List<ListarCuentasResponse> response = new List<ListarCuentasResponse>() { new ListarCuentasResponse() {
                IdCliente=1,
               IdCuenta=1,
               NumeroCuenta="001",
               TipoCuenta="ahorro",
               SaldoInicial=1000,
               ValorTope=500
            },
            new ListarCuentasResponse() {
            IdCliente=2,
           IdCuenta=2,
           NumeroCuenta="002",
           TipoCuenta="ahorro",
           SaldoInicial=10000,
           ValorTope=5000
            } };
            PagedCollection<ListarCuentasResponse> valorEsperado = new PagedCollection<ListarCuentasResponse>(response, request.Limit, 1);
            var mockRepo = new Mock<ICuentas>();
            mockRepo.Setup(repo => repo.Listar(request, connectionString)).Returns(Task.FromResult(valorEsperado));

            CuentasController controller = new CuentasController(mockRepo.Object);
            ObjectResult valorRespondido = controller.Listar(request).Result.Result as ObjectResult;

            //Assert - Verificacion
            var result = valorRespondido;
            Assert.IsTrue(result.StatusCode == 200);
        }
    }
}
