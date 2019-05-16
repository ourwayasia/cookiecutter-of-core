using OF.Core.Config;
using OF.Core.Helpers;
using OF.Core.Web;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.BLL
{
    /// <summary>
    /// 测试用，可以删除，包括IService，Service，Controller
    /// </summary>
    public class IoCTestOneService : IIoCTestService
    {
        public string GetValue()
        {
            return "one";
        }
    }
    public class IoCTestTwoService : IIoCTestService
    {
        public string GetValue()
        {
            return "two";
        }
    }

    public class TestService : ITestService
    {

        #region 配置使用示例
        /// <summary>
        /// 配置使用示例
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetConfigValue(string key)
        {

            //取配置值，空值返回string.Empty
            var value1 = Config.Instance.Get(key);

            //取配置值，空值返回自定义值
            var value2 = Config.Instance.Get(key, "null value");


            return $"value1:{value1};value2:{value2}";
        }
        #endregion

        #region 缓存使用示例
        public string SetSession(string key, string value)
        {
            //设置Session值
            SessionHelper.Set(key, value);

            return $"key:{key};value:{value};sessionId:{OFHttpContext.Current.Session.Id}";
        }

        public string GetSession(string key)
        {
            //读取Session值
            var value = SessionHelper.Get(key);

            return $"key:{key};value:{value};sessionId:{OFHttpContext.Current.Session.Id}";
        }

        public string SetCookies(string key, string value)
        {
            //设置Cookie值
            CookieHelper.Set(key, value);

            return $"key:{key};value:{value}";
        }

        public string GetCookies(string key)
        {
            //读取Cookie值
            var value = CookieHelper.Get(key);

            return $"key:{key};value:{value}";
        }

        public string SetCache(string key, string value)
        {
            //设置Cache值
            CacheHelper.Set(key, value);

            return $"key:{key};value:{value}";
        }
        public string GetCache(string key)
        {
            //读取Cache值
            var value = CacheHelper.Get(key);

            return $"key:{key};value:{value}";
        }
        #endregion

    }
}
