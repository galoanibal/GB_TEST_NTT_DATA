using System.Collections.Generic;

namespace PERSONA.API.Comun
{
    public class PagedCollection<T> where T : class
    {
        public PagedCollection(IList<T> data, int totalRegistros, int registrosPorPagina) {
            Data = data;
            TotalRegistros = totalRegistros;
            double pag= ((double)totalRegistros / (double)registrosPorPagina);
            int ent = (totalRegistros / registrosPorPagina);
            int tot = pag > ent ? ent + 1 : ent;
            TotalPaginas = tot;
        }
        public IList<T> Data { get; set; }       
        public int TotalRegistros { get; set; }       
        public int TotalPaginas { get; }
    }
}
