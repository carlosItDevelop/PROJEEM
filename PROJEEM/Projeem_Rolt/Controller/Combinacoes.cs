using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class Combinacoes
    {
        int universo = 0;
        int numSeries = 0;
        public Combinacoes(int universo, int numSeries) {
            this.universo = universo;
            this.numSeries = numSeries;
        }

//public Object GetCombinacoes() { }

        public int Universo { get; set; }
        public int NumSeries { get; set;}

    }
}
