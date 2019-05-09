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
    /// 任务协办部门业务接口实现类
    /// </summary>
    public class TaskAssistDepartmentService : CRUDServiceBase<ts_task_assist_department>, ITaskAssistDepartmentService
    {
        public TaskAssistDepartmentService(IDbContextCore dbContext) : base(dbContext)
        {

        }
         
    }
}
