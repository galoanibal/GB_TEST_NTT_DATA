using PERSONA.API.Comun;
using PERSONA.API.Entidades.Consultas;
using PERSONA.API.Entidades.Operaciones;
using System.Threading.Tasks;

namespace PERSONA.API.Interfaces
{
    public interface IClientes
    {
        Task<PagedCollection<ListarClienteResponse>> Listar(ListarClienteRequest request, string connectionString);
        Task<GrabarClienteResponse> Grabar(GrabarClienteRequest request, string connectionString);
        Task<GrabarClienteResponse> Eliminar(EliminarClienteRequest request, string connectionString);
    }
}
