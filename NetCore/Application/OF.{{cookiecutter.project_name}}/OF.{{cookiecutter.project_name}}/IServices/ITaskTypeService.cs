using OF.Core.Data;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.IServices
{
    public interface ITaskTypeService : ICRUDServiceBase<ts_task_type>
    {
        /// <summary>
        /// 获得最顶级任务类型
        /// </summary>
        /// <returns></returns>
        List<ts_task_type> GetTaskTypeByParentId(string ParentId, string TenantId);
        /// <summary>
        /// 加载任务类型树状结构
        /// </summary>
        /// <param name="TenantId">租户ID</param>
        /// <param name="Status">状态（1-启用，0-禁用，-1-所有）</param>
        /// <returns></returns>
        List<JsTreeNode> LoadTaskTypeTree(string TenantId, int Status = -1);


    }
}
