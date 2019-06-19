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
using OF.Core.Helpers;
using Microsoft.AspNetCore.Authorization;

namespace OF.{{cookiecutter.project_name}}.Web.Controllers
{

    /// <summary>
    /// 测试用，可以删除，包括IService，Service，Controller
    /// </summary>
    [AllowAnonymous]
    [Route("{{cookiecutter.project_name}}/[controller]/[action]")]
    public class TestController : ApiCtrlBase
    {
        private ITestService _ITestService = IoCHelper.Resolve<ITestService>();
        private IIoCTestService _IIoCTestService = IoCHelper.Resolve<IIoCTestService>();

        //示例地址列表
        public ActionResult<string> Index()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            string url = $"{Request.Scheme}://{Request.Host.Value}/";
            //服务列表
            result.Add("Services", url + "Sys/System/Services");
            //服务注入示例
            result.Add("GetIoCService", url + "{{cookiecutter.project_name}}/Test/GetIoCService");
            //配置命名用示例
            result.Add("GetConfigValue", url + "{{cookiecutter.project_name}}/Test/GetConfigValue?key=keyone");
            //缓存使用示例
            result.Add("SetSession", url + "{{cookiecutter.project_name}}/Test/SetSession?key=keyone");
            result.Add("GetSession", url + "{{cookiecutter.project_name}}/Test/GetSession?key=keyone");
            result.Add("SetCookies", url + "{{cookiecutter.project_name}}/Test/SetCookies?key=keyone");
            result.Add("GetCookies", url + "{{cookiecutter.project_name}}/Test/GetCookies?key=keyone");
            result.Add("SetCache", url + "{{cookiecutter.project_name}}/Test/SetCache?key=keyone");
            result.Add("GetCache", url + "{{cookiecutter.project_name}}/Test/GetCache?key=keyone");
            //增删改查示例
            result.Add("CRUDSimple", url + "{{cookiecutter.project_name}}/Test/CRUDSimple");
            //数据库事务示例
            result.Add("InsertTrue", url + "{{cookiecutter.project_name}}/Test/Insert?success=true");
            result.Add("InsertFalse", url + "{{cookiecutter.project_name}}/Test/Insert?success=false");
            result.Add("InsertUseDbContextTransactionTrue", url + "{{cookiecutter.project_name}}/Test/InsertUseDbContextTransaction?success=true");
            result.Add("InsertUseDbContextTransactionFalse", url + "{{cookiecutter.project_name}}/Test/InsertUseDbContextTransaction?success=false");
            result.Add("InsertUseTransactionScopeTrue", url + "{{cookiecutter.project_name}}/Test/InsertUseTransactionScope?success=true");
            result.Add("InsertUseTransactionScopeFalse", url + "{{cookiecutter.project_name}}/Test/InsertUseTransactionScope?success=false");

            StringBuilder stringBuilder = new StringBuilder();
            foreach(var item in result)
            {
                stringBuilder.AppendLine($"{item.Key} : {item.Value}");
            }

            stringBuilder.AppendLine(User.Identity.Name);
            stringBuilder.AppendLine(User.Identity.IsAuthenticated.ToString());

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

        #region 增删改查示例
        [HttpGet]
        public ActionResult<CallResult> CRUDSimple()
        {
            return CallResult.Create(_ITestService.CRUDSimple());
        }
        #endregion

        #region 数据库事务示例
        [HttpGet]
        public ActionResult<CallResult> Insert(bool success)
        {
            return CallResult.Create(_ITestService.Insert(success));
        }

        [HttpGet]
        public ActionResult<CallResult> InsertUseDbContextTransaction(bool success)
        {
            return CallResult.Create(_ITestService.InsertUseDbContextTransaction(success));
        }

        [HttpGet]
        public ActionResult<CallResult> InsertUseTransactionScope(bool success)
        {
            return CallResult.Create(_ITestService.InsertUseTransactionScope(success));
        } 
        #endregion
    }
}
