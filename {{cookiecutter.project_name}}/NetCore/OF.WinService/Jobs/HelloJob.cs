using Quartz;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace OF.WinService.Jobs
{
    /*Interval单位为秒*/
    [Invoke(Name = "HelloJob", Remark = "HelloJob示例服务", StartTime = "2018-05-01 12:00:00", Interval = 10)]
    public class HelloJob : IJob
    {
        public Task Execute(IJobExecutionContext context)
        {
            LogHelper.SaveLog("HelloJob", "execute");
            Thread.Sleep(5000);
            return null;
        }
    }

    [Invoke(Name = "OFJob", Remark = "OFJob示例服务", StartTime = "2018-05-01 12:00:00", Interval = 18)]
    public class BitAdminJob : IJob
    {
        public Task Execute(IJobExecutionContext context)
        {
            LogHelper.SaveLog("OFJob", "execute");
            Thread.Sleep(10000);
            return null;
        }
    }
}
