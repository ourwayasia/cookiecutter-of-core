using System;
using System.ServiceProcess;

namespace OF.WinService
{
    class Program
    {
        static void Main(string[] args)
        {
            ServiceBase[] ServicesToRun = new ServiceBase[] { new OFService() };
            ServiceBase.Run(ServicesToRun);
        }
    }
}
