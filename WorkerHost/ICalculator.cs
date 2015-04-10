using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
namespace WorkerHost
{
    [ServiceContract]
    public interface ICalculator
    {
        [OperationContract]
        int Add(int a, int b);
    }
}
