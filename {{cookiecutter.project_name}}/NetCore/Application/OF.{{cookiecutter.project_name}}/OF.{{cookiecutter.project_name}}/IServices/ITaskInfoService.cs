using OF.Core;
using OF.Core.Data;
using OF.Core.Models;
using OF.{{cookiecutter.project_name}}.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.IServices
{
    public interface ITaskInfoService : ICRUDServiceBase<ts_task_info>
    {
        /// <summary>
        /// 保存任务
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        int Save(ts_task_info entity, OperatorModel CurrentOperator, List<ts_task_assistor> AssistorList, List<ts_task_assist_department> AssistDepartmentList);
        /// <summary>
        /// 软件删除任务，支持批量，只能删除草稿状态
        /// </summary>
        int DeleteTask(string id, OperatorModel CurrentOperator);

        /// <summary>
        /// 获得任务基本信息
        /// </summary>
        CallResult GetTaskInfo(string id);

        /// <summary>
        /// 获得任务总数数据
        /// </summary>
        CallResult GetTaskTotalCount(string TenantId, string OperatorId);


    }
}
