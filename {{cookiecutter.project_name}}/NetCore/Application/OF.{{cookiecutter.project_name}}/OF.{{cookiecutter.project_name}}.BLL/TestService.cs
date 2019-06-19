using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using OF.Core;
using OF.Core.Config;
using OF.Core.Data;
using OF.Core.DbContextCore;
using OF.Core.Extensions;
using OF.Core.Helpers;
using OF.Core.IoC;
using OF.Core.Web;
using OF.Sys.Entities;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Transactions;

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

            return $"key:{key};value:{value};sessionId:{HttpHelper.HttpContext.Session.Id}";
        }

        public string GetSession(string key)
        {
            //读取Session值
            var value = SessionHelper.Get(key);

            return $"key:{key};value:{value};sessionId:{HttpHelper.HttpContext.Session.Id}";
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

        #region 简单增删改查示例
        public string CRUDSimple()
        {
            //增删改查服务
            var service = IoCHelper.Resolve<ICRUDService<ts_test>>();

            //构建实体，从前端或根据业务逻辑构建获得
            ts_test one = new ts_test()
            {
                Id = GuidHelper.NewGuid().ToString(),

                TestName = "单个名称" + DateTime.Now.Millisecond,

                CreatorId = GuidHelper.NewGuid().ToString(),
                CreatorName = "创建人",
                CreateDate = DateTime.Now
            };

            //新增单个实体
            service.Insert(one);

            //更新单个实体
            one.TestName += "update";
            service.Update(one);

            //查询分页
            var pagelist = service.PageQuery(new PageInfo() { PageIndex = 1, PageSize = 10 });

            //删除单个实体
            service.Delete(one.Id);



            //新增多个实体
            var list = new List<ts_test>() { new ts_test()
            {
                Id = GuidHelper.NewGuid().ToString(),

                TestName = "批量名称" + DateTime.Now.Millisecond,

                CreatorId = GuidHelper.NewGuid().ToString(),
                CreatorName = "创建人",
                CreateDate = DateTime.Now
            }, new ts_test()
            {
                Id = GuidHelper.NewGuid().ToString(),

                TestName = "批量名称" + DateTime.Now.Millisecond,

                CreatorId = GuidHelper.NewGuid().ToString(),
                CreatorName = "创建人",
                CreateDate = DateTime.Now
            } };
            service.Insert(list);

            //更新方式二
            service.Update(x => x.CreatorName == list[0].CreatorName, y => new ts_test { TestName = y.TestName + "UpdateForExpression" });

            //查询分页
            pagelist = service.PageQuery(new PageInfo() { PageIndex = 1, PageSize = 10 });

            //删除方式二
            service.Delete(x => x.CreatorName == list[0].CreatorName);

            return pagelist.ToJson();
        }
        #endregion

        #region 数据库理务使用示例
        public string Insert(bool success)
        {
            //插入数据
            var service1 = IoCHelper.Resolve<ICRUDService<sys_log>>();
            sys_log e1 = new sys_log()
            {
                Id = GuidHelper.NewGuid().ToString(),
                CreateDate = DateTime.Now
            };
            int i1 = service1.Insert(e1);

            var service2 = IoCHelper.Resolve<ICRUDService<sys_file>>();
            string id = success ? GuidHelper.NewGuid().ToString() : GuidHelper.NewGuid().ToString().PadRight(100, '0');
            sys_file e2 = new sys_file()
            {
                Id = id,
                CreateDate = DateTime.Now
            };
            int i2 = service2.Insert(e2);

            return $"成功{i1},{i2}";
        }

        public string InsertUseDbContextTransaction(bool success)
        {
            //插入数据，使用数据库事务，不支持多连接。
            var dbContext = IoCHelper.Resolve<IDbContextCore>();
            using (IDbContextTransaction trans = dbContext.BeginTransaction())
            {
                try
                {
                    var service1 = IoCHelper.Resolve<ICRUDService<sys_log>>();
                    service1.Use(dbContext);
                    sys_log e1 = new sys_log()
                    {
                        Id = GuidHelper.NewGuid().ToString(),
                        CreateDate = DateTime.Now
                    };
                    int i1 = service1.Insert(e1);

                    var service2 = IoCHelper.Resolve<ICRUDService<sys_file>>();
                    service2.Use(dbContext);
                    string id = success ? GuidHelper.NewGuid().ToString() : GuidHelper.NewGuid().ToString().PadRight(100, '0');
                    sys_file e2 = new sys_file()
                    {
                        Id = id,
                        CreateDate = DateTime.Now
                    };
                    int i2 = service2.Insert(e2);

                    trans.Commit();

                    return $"成功{i1},{i2}";
                }
                catch (Exception)
                {
                    trans.Rollback();
                    throw;
                }
            }
        }

        public string InsertUseTransactionScope(bool success)
        {
            //插入数据，使用数据库事务，多连接时会命名用到MSDTC
            using (TransactionScope trans = new TransactionScope())
            {
                try
                {
                    var service1 = IoCHelper.Resolve<ICRUDService<sys_log>>();
                    sys_log e1 = new sys_log()
                    {
                        Id = GuidHelper.NewGuid().ToString(),
                        CreateDate = DateTime.Now
                    };
                    int i1 = service1.Insert(e1);

                    var service2 = IoCHelper.Resolve<ICRUDService<sys_file>>();
                    string id = success ? GuidHelper.NewGuid().ToString() : GuidHelper.NewGuid().ToString().PadRight(100, '0');
                    sys_file e2 = new sys_file()
                    {
                        Id = id,
                        CreateDate = DateTime.Now
                    };
                    int i2 = service2.Insert(e2);

                    trans.Complete();

                    return $"成功{i1},{i2}";
                }
                catch (Exception)
                {
                    Transaction.Current.Rollback();
                    throw;
                }
            }
        } 
        #endregion
    }
}
