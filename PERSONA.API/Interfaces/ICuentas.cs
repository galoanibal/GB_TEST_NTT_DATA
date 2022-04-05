using PERSONA.API.Comun;
using PERSONA.API.Entidades.Consultas;
using PERSONA.API.Entidades.Operaciones;
using System.Threading.Tasks;

namespace PERSONA.API.Interfaces
{
    public interface ICuentas
    {
        Task<PagedCollection<ListarCuentasResponse>> Listar(ListarCuentasRequest request, string connectionString);
        Task<GrabarCuentasResponse> Grabar(GrabarCuentasRequest request, string connectionString);
        Task<GrabarCuentasResponse> Eliminar(EliminarCuentasRequest request, string connectionString);
    }
}
