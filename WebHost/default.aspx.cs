using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using System.ServiceModel;

namespace WebHost
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var factory = new ChannelFactory<WorkerHost.ICalculator>(new NetTcpBinding(SecurityMode.None));
            var channel = factory.CreateChannel(GetRandomEndpoint());
            Label3.Text =channel.Add (Convert.ToInt32(TextBox1.Text) , Convert.ToInt32(TextBox2.Text)).ToString();
            
        }

        private EndpointAddress GetRandomEndpoint()
        {
            var endpoints= RoleEnvironment.Roles["WorkerHost"].Instances.Select(i=>i.InstanceEndpoints["CalculatorService"].IPEndpoint).ToArray();
            var r = new Random(DateTime.Now.Millisecond);
            return new EndpointAddress(string.Format("net.tcp://{0}/Calculate", endpoints[r.Next(endpoints.Count() - 1)]));
        }
    }
}