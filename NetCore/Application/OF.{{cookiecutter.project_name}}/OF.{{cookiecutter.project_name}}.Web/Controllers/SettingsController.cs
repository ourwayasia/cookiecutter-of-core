using Microsoft.AspNetCore.Mvc;
using OF.Core.Web;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using OF.Core;
using OF.Core.Extensions;
using OF.Core.Models;
using System.Linq;

namespace OF.{{cookiecutter.project_name}}.Web.Controllers
{
    [Route("ts/[controller]/[action]")]
    public class SettingsController : ApiCtrlBase
    {
        private ITaskTypeService _ITaskTypeService;
        public SettingsController(IServiceProvider serviceProvider)
        {
            _ITaskTypeService = serviceProvider.GetService<ITaskTypeService>();
        }

        [HttpGet]
        public ActionResult<CallResult> Test()
        {
            return CallResult.Create(GuidExtensions.NewComb());
        }

        #region 任务类型相关设置

        /// <summary>
        /// 获得一个任务类型
        /// </summary>
        public ActionResult<CallResult> GetTaskType(IdVM param)
        {
            return CallResult.Create(_ITaskTypeService.GetById(param.Id));
        }

        /// <summary>
        /// 保存任务类型
        /// </summary>
        public ActionResult<CallResult> SaveTaskType(ts_task_type entity)
        {
            if (string.IsNullOrEmpty(entity.Name))
            {
                return CallResult.Create(CallResultCode.ParamError, "任务类型名称不可为空");
            }
            if (string.IsNullOrEmpty(entity.Code))
            {
                return CallResult.Create(CallResultCode.ParamError, "任务类型代码不可为空");
            }
            int rows = 0;
            var ret = CallResult.Create();
            if (string.IsNullOrEmpty(entity.Id))
            {
                entity.TenantId = this.CurrentTenantId;
                entity.IsDeleted = 0;
                entity.CreateDate = DateTime.Now;
                entity.CreatorName = this.CurrentOperator.RealName;
                entity.CreatorId = this.CurrentOperator.Id;

                // entity.SortNum = ThisServiceBase.Entities.Where(x => (x.ParentId.Equals(entity.ParentId) || (string.IsNullOrEmpty(x.ParentId) && string.IsNullOrEmpty(entity.ParentId))) && x.IsDeleted == 0 && x.TenantId.Equals(this.CurrentTenantId)).Max(x => x.SortNum) + 1;

                rows = _ITaskTypeService.Insert(entity);
            }
            else
            {
                var oldEntity = _ITaskTypeService.GetById(entity.Id);
                if (oldEntity == null)
                {
                    return CallResult.Create(CallResultCode.NoChanged, "保存失败，记录不存在");
                }
                oldEntity.Name = entity.Name;
                oldEntity.Code = entity.Code;
                oldEntity.ExtendConfig = entity.ExtendConfig;
                oldEntity.SortNum = entity.SortNum;
                oldEntity.Status = entity.Status;
                oldEntity.ParentId = entity.ParentId;
                rows = _ITaskTypeService.Update(oldEntity);
            }
            if (rows <= 0)
            {
                ret.Message = "保存失败";
                ret.Code = CallResultCode.NoChanged;
            }
            return ret;
        }

        /// <summary>
        /// 根据父级ID获得任务类型
        /// </summary>
        /// <returns></returns>
        public ActionResult<CallResult> GetTaskTypeByParentId()
        {
            return CallResult.Create(_ITaskTypeService.GetTaskTypeByParentId(Request.Params("pid"), this.CurrentTenantId));
        }

        /// <summary>
        /// 加载任务类型树型数据
        /// </summary>
        /// <returns></returns>
        public ActionResult<CallResult> LoadTaskTypeTree()
        {
            return CallResult.Create(_ITaskTypeService.LoadTaskTypeTree(this.CurrentTenantId));
        } 
        
        #endregion

    }
}
