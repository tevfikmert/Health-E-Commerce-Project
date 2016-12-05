using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace web_SaglikProjesi.Models
{
    class cEnum
    {
        public enum SatisDurumu : byte
        {
            siparis = 1,
            odemeonay = 2,
            hazirlama = 3,
            kargo = 4,
            teslim = 5
        }
    }
}
