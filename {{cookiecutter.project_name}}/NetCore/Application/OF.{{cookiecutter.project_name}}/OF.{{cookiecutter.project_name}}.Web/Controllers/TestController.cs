using Microsoft.AspNetCore.Mvc;
using OF.Core.Web;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using System.Text;
using OF.Core;
using OF.Core.Extensions;
using OF.Core.Models;
using Microsoft.Extensions.Caching.Distributed;

namespace OF.{{cookiecutter.project_name}}.Web.Controllers
{

    /// <summary>
    /// 测试用，可以删除，包括IService，Service，Controller
    /// </summary>
    [Route("Ts/[controller]/[action]")]
    public class TestController : ApiCtrlBase
    {
        private ITestService _ITestService;
        private IIoCTestService _IIoCTestService;

        public TestController(IServiceProvider serviceProvider)
        {
            _ITestService = serviceProvider.GetService<ITestService>();
            _IIoCTestService = serviceProvider.GetService<IIoCTestService>();
        }

        //示例地址列表
        public ActionResult<string> UrlList()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            string url = $"{Request.Scheme}://{Request.Host.Value}/";
            
            result.Add("GetIoCService", url + "Ts/Test/GetIoCService");

            result.Add("GetConfigValue", url + "Ts/Test/GetConfigValue?key=keyone");

            result.Add("SetSession", url + "Ts/Test/SetSession?key=keyone");
            result.Add("GetSession", url + "Ts/Test/GetSession?key=keyone");
            result.Add("SetCookies", url + "Ts/Test/SetCookies?key=keyone");
            result.Add("GetCookies", url + "Ts/Test/GetCookies?key=keyone");
            result.Add("SetCache", url + "Ts/Test/SetCache?key=keyone");
            result.Add("GetCache", url + "Ts/Test/GetCache?key=keyone");

            StringBuilder stringBuilder = new StringBuilder();
            foreach(var item in result)
            {
                stringBuilder.AppendLine($"{item.Key} : {item.Value}");
            }

            return stringBuilder.ToString() ;
        }

        #region 服务注入示例
        [HttpGet]
        public ActionResult<CallResult> GetIoCService()
        {
            return CallResult.Create(_IIoCTestService.GetValue());
        } 
        #endregion

        #region 配置使用示例
        [HttpGet]
        public ActionResult<CallResult> GetConfigValue(string key)
        {
            key = string.IsNullOrEmpty(key) ? "OF.IgnoredUrl" : key;

            return CallResult.Create(_ITestService.GetConfigValue(key));
        } 
        #endregion

        #region 缓存使用示例
        [HttpGet]
        public ActionResult<CallResult> SetSession(string key, string value)
        {
            return CallResult.Create(_ITestService.SetSession(key, Guid.NewGuid().ToString()));
        }
        [HttpGet]
        public ActionResult<CallResult> GetSession(string key)
        {
            return CallResult.Create(_ITestService.GetSession(key));
        }
        [HttpGet]
        public ActionResult<CallResult> SetCookies(string key)
        {
            return CallResult.Create(_ITestService.SetCookies(key, Guid.NewGuid().ToString()));
        }
        [HttpGet]
        public ActionResult<CallResult> GetCookies(string key)
        {
            return CallResult.Create(_ITestService.GetCookies(key));
        }
        [HttpGet]
        public ActionResult<CallResult> SetCache(string key)
        {
            return CallResult.Create(_ITestService.SetCache(key, Guid.NewGuid().ToString()));
        }
        [HttpGet]
        public ActionResult<CallResult> GetCache(string key)
        {
            return CallResult.Create(_ITestService.GetCache(key));
        } 
        #endregion
    }
}
