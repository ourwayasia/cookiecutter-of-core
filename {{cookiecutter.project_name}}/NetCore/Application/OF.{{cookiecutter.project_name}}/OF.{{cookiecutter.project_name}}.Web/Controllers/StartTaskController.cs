using Microsoft.AspNetCore.Mvc;
using OF.Core;
using OF.Core.Web;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.Core.Extensions;
using System.Linq;
using OF.Core.Models;


namespace OF.{{cookiecutter.project_name}}.Web.Controllers
{
    [Route("ts/[controller]/[action]")]
    public class StartTaskController : ApiCtrlBase
    {
        private ITaskTypeService _ITaskTypeService;
        private ITaskInfoService _ITaskInfoService;

        public StartTaskController(IServiceProvider serviceProvider)
        {
            _ITaskTypeService = serviceProvider.GetService<ITaskTypeService>();
            _ITaskInfoService = serviceProvider.GetService<ITaskInfoService>();
        }

        public ActionResult<CallResult> LoadTaskTypeTree()
        {
            return CallResult.Create(_ITaskTypeService.LoadTaskTypeTree(this.CurrentTenantId, 1));
        }
        /// <summary>
        /// 保存任务
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public ActionResult<CallResult> SaveTaskInfo(ts_task_info entity)
        {
            if (string.IsNullOrEmpty(entity.Title))
                return CallResult.Create(CallResultCode.ParamError, "请输入任务标题");
            if (string.IsNullOrEmpty(entity.Content))
                return CallResult.Create(CallResultCode.ParamError, "请输入任务描述内容");
            if (string.IsNullOrEmpty(entity.Source))
                return CallResult.Create(CallResultCode.ParamError, "请输入任务来源描述");
            if (entity.BeginDate == null)
                return CallResult.Create(CallResultCode.ParamError, "请选择任务开始时间");
            if (entity.EndDate == null)
                return CallResult.Create(CallResultCode.ParamError, "请选择任务结束时间");
            if (string.IsNullOrEmpty(entity.SourceFileNo))
                return CallResult.Create(CallResultCode.ParamError, "请输入任务来源文件编号");
            if (string.IsNullOrEmpty(entity.AssignorId))
                return CallResult.Create(CallResultCode.ParamError, "请选择任务布置人");
            if (string.IsNullOrEmpty(entity.HostId))
                return CallResult.Create(CallResultCode.ParamError, "请选择主办人");
            if (string.IsNullOrEmpty(entity.HostDepartmentId))
                return CallResult.Create(CallResultCode.ParamError, "请选择主办部门");
            if (string.IsNullOrEmpty(entity.ApproverId))
                return CallResult.Create(CallResultCode.ParamError, "请选择任务审批人");
            if (string.IsNullOrEmpty(entity.CoordinatorId))
                return CallResult.Create(CallResultCode.ParamError, "请选择督办协调员");
            if (string.IsNullOrEmpty(entity.HostLeaderId))
                return CallResult.Create(CallResultCode.ParamError, "请选择主办分管领导");
            if (string.IsNullOrEmpty(entity.SuperviseLeaderId))
                return CallResult.Create(CallResultCode.ParamError, "请选择督办分管领导");

            // 任务类型不修改
            if (string.IsNullOrEmpty(entity.Id))
            {
                var taskTypeInfo = _ITaskTypeService.GetById(entity.TaskTypeId);
                if (taskTypeInfo == null)
                {
                    return CallResult.Create(CallResultCode.ParamError, "任务类型不存在");
                }
                entity.TenantId = this.CurrentTenantId;
                entity.TaskTypeName = taskTypeInfo.Name;
            }
            var result = CallResult.Create();

            List<ts_task_assist_department> AssistDepartmentList = Request.Params<List<ts_task_assist_department>>("AssistDepartmentList");
            List<ts_task_assistor> AssistorList = Request.Params<List<ts_task_assistor>>("AssistorList");

            if (_ITaskInfoService.Save(entity, this.CurrentOperator, AssistorList, AssistDepartmentList) <= 0)
            {
                result.Code = CallResultCode.NoChanged;
                result.Message = "保存失败";
            }
            return result;
        }


        /// <summary>
        /// 分页查询任务信息
        /// </summary>
        /// <returns></returns>
        public ActionResult<CallResult> QueryTaskInfo()
        {
            int isDraft = Request.Params<int>("isDraft");
            string taskTypeId = Request.Params("taskTypeId");

            var iqueryable = _ITaskInfoService.Entities.Where(x =>
              x.CreatorId.Equals(this.CurrentOperator.Id)&&
              x.IsDeleted == 0 &&
              x.TenantId.Equals(this.CurrentTenantId) &&
             (x.TaskTypeId.Equals(taskTypeId) || string.IsNullOrEmpty(taskTypeId)) &&
            ((x.Status == 0 && isDraft == 1) || (x.Status != 0 && isDraft == 0))
            );
            return CallResult.Create(_ITaskInfoService.PageQuery(iqueryable, this.ThisPageInfo));
        }

        /// <summary>
        /// 软件删除任务，支持批量，只能删除草稿状态
        /// </summary>
        public ActionResult<CallResult> DeleteTaskInfo(IdVM param)
        {
            var ret = CallResult.Create();
            if (_ITaskInfoService.DeleteTask(param.Id, this.CurrentOperator) <= 0)
            {
                ret.Code = CallResultCode.NoChanged;
                ret.Message = "删除失败";
            }
            return ret;
        }

        /// <summary>
        /// 获得任务基本信息
        /// </summary>
        public ActionResult<CallResult> GetTaskInfo(IdVM param)
        {
            return _ITaskInfoService.GetTaskInfo(param.Id);
        }

        /// <summary>
        /// 获得任务总数数据
        /// </summary>
        public ActionResult<CallResult> GetTaskTotalCount()
        {
            return _ITaskInfoService.GetTaskTotalCount(this.CurrentTenantId,this.CurrentOperator.Id);
        }
    }
}
