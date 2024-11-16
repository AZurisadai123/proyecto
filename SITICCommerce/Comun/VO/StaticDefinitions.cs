using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    public enum eStockStatus
    {
        IN_STOCK = 1,
        OUT_STOCK,
        LOW_STOCK
    }

    public enum eDbAction
    {
        Inser = 1,
        Update = 2,
        Delete
    }
}
