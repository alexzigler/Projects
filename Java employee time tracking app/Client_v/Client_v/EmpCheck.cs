using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Client_v
{
    internal class EmpCheck
    {
        public int id { set; get; }
        public Employee employee { set; get; }
        public DateTime? check_in { set; get; }
        public DateTime? check_out { set; get;}
        public DateTime timeCheck { set; get; }

    }
}
