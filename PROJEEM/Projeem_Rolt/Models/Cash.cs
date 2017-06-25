using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Cash
    {
        public int id { get; set; }
        public DateTime dateTM { get; set; }
        public decimal debit { get; set; }
        public decimal credit { get; set; }
        public decimal bonus { get; set; }
    }
}
