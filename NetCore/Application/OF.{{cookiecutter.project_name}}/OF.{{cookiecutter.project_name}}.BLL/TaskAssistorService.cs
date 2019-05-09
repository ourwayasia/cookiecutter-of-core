using OF.Core.Data;
using OF.Core.DbContextCore;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.IServices;
using OF.{{cookiecutter.project_name}}.Models;
using System;
using System.Linq;
using System.Collections.Generic;

namespace OF.{{cookiecutter.project_name}}.BLL
{
    /// <summary>
    /// 任务协办人接口实现类
    /// </summary>
    public class TaskAssistorService : CRUDServiceBase<ts_task_assistor>, ITaskAssistorService
    {
        public TaskAssistorService(IDbContextCore dbContext) : base(dbContext)
        {

        }

    }
}
