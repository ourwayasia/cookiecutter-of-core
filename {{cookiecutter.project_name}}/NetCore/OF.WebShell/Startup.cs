using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using OF.Core;
using OF.Core.DbContextCore;
using OF.Core.Extensions;
using OF.Core.Filters;
using OF.Core.Helpers;
using OF.Core.IoC;
using OF.Core.Jwt;
using OF.Core.Middleware;
using OF.Core.Web;
using System;
using System.Threading.Tasks;

namespace OF.WebShell
{
    /// <summary>
    /// 启动入口
    /// </summary>
    public class Startup
    {
        #region 参数注入
        /// <summary>
        /// 注入IConfiguration
        /// </summary>
        public IConfiguration Configuration { get; }
        #endregion

        #region 初始化
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="configuration"></param>
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            // 初始化log4net
            var Repository = log4net.LogManager.CreateRepository("NETCoreRepository");
            LogHelper.SetConfig(Repository, "log4net.config");
        }
        #endregion

        #region 使用AspectCore注册服务
        /// <summary>
        /// 使用AspectCore注册服务
        /// </summary>
        /// <param name="services"></param>
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services
                .AddOFServices()
                .Configure<DbContextOption>(options => options.ConnectionString = Configuration.GetConnectionString("connectionString"))
                .AddDistributedRedisCache(option => option.Configuration = Configuration.GetConnectionString("redisconnectionString"))
                .AddSingleton(Configuration)
                .AddTransient<IDbContextCore, SqlServerDbContext>()
                .AddJwt(Configuration)
                .AddMvc(options =>
                {
                    options.Filters.Add(new GlobalExceptionFilter());
                })
                .AddJsonOptions(options =>
                {
                    // 忽略循环引用
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    // 不使用驼峰
                    options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                    // 设置时间格式
                    options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                    // 如字段为null值，该字段不会返回到前端
                    // options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                });

            return AspectCoreContainer.BuildServiceProvider(services);
        }
        #endregion

        #region Configure
        /// <summary>
        /// Configure
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            OFHttpContext.Configure(app);

            app.UseExceptionHandler(builder => builder.Run(async context => await ErrorEvent(context)));
            app.UseSession();
            app.UseMiddleware<RequestMiddleware>();
            app.UseMiddleware<JwtMiddleware>();
            app.UseMvc();
        }
        #endregion

        #region 当MVC拦截不到 ，由中间件处理全局未处理的异常
        /// <summary>
        /// 当MVC拦截不到 ，由中间件处理全局未处理的异常
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private Task ErrorEvent(HttpContext context)
        {
            var feature = context.Features.Get<IExceptionHandlerFeature>();
            var error = feature?.Error;
            LogHelper.WriteError<Startup>(error);
            context.Response.Clear();
            context.Response.ContentType = "application/json; charset=utf-8";
            var result = CallResult.Create();
            result.Code = CallResultCode.Error;
            result.Message = "系统异常：" + error.Message;
            return context.Response.WriteAsync(result.ToJson());
        }
        #endregion
    }
}
