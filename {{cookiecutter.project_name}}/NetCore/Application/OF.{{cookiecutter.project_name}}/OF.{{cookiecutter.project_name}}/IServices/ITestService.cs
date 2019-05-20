using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.IServices
{
    /// <summary>
    /// 示例代码，包括IService，Service，Controller
    /// </summary>
    public interface IIoCTestService
    {
        string GetValue();
    }

    public interface ITestService
    {
        //配置使用示例
        string GetConfigValue(string key);

        //缓存使用示例
        string SetSession(string key, string value);
        string GetSession(string key);

        string SetCookies(string key, string value);
        string GetCookies(string key);

        string SetCache(string key, string value);
        string GetCache(string key);

        string Insert(bool success);
        string InsertUseDbContextTransaction(bool success);
        string InsertUseTransactionScope(bool success);
    }
}
