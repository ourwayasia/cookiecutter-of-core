using OF.Core.Data;
using OF.Core.DbContextCore;
using OF.Core.Models;
using OF.Sys.IServices;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.IServices;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using OF.Core.Extensions;
using OF.Sys.Models;
using OF.Core;
using System.Linq;

namespace OF.{{cookiecutter.project_name}}.BLL
{
    public class TaskIntoService : CRUDServiceBase<ts_task_info>, ITaskInfoService
    {
        private IFileService _IFileService;
        private ITaskAssistorService _ITaskAssistorService;
        private ITaskAssistDepartmentService _ITaskAssistDepartmentService;
        public TaskIntoService(IDbContextCore dbContext, IServiceProvider serviceProvider) : base(dbContext)
        {
            _IFileService = serviceProvider.GetService<IFileService>();
            _ITaskAssistorService = serviceProvider.GetService<ITaskAssistorService>();
            _ITaskAssistDepartmentService = serviceProvider.GetService<ITaskAssistDepartmentService>();
        }
        /// <summary>
        /// 软件删除任务，支持批量，只能删除草稿状态
        /// </summary>
        public int DeleteTask(string id, OperatorModel CurrentOperator)
        {
            string[] ids = id.Split(',');
            return this.Update(where: x => x.Status == 0 && ids.Any(a => a.Equals(x.Id)), updateExp: x2 => new ts_task_info
            {
                IsDeleted = 1,
                DeleteDate = DateTime.Now,
                DeletePersionId = CurrentOperator.Id,
                DeletePersionName = CurrentOperator.RealName
            });
        }

        /// <summary>
        /// 获得任务基本信息
        /// </summary>
        public CallResult GetTaskInfo(string id)
        {
            return CallResult.Create(new
            {
                TaskInfo = this.GetById(id),
                TaskAssistor = _ITaskAssistorService.Entities.Where(x => x.TaskInfoId.Equals(id)).ToList(),
                TaskAssistDepartment = _ITaskAssistDepartmentService.Entities.Where(x => x.TaskInfoId.Equals(id)).ToList()
            });
        }
        /// <summary>
        /// 获得任务总数数据
        /// </summary>
        public CallResult GetTaskTotalCount(string TenantId,string OperatorId)
        {
            var iqueryable = this.Entities.Where(x => x.IsDeleted == 0 && x.CreatorId.Equals(OperatorId)&& x.TenantId.Equals(TenantId));
            return CallResult.Create(new
            {
                TaskInputCount = iqueryable.Where(x => x.Status != 0).Count(),
                TaskDraftCount = iqueryable.Where(x => x.Status == 0).Count()
            });
        }

        /// <summary>
        /// 保存任务
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Save(ts_task_info entity, OperatorModel CurrentOperator
             , List<ts_task_assistor> AssistorList
            , List<ts_task_assist_department> AssistDepartmentList
           )
        {
            var rows = 0;
            if (string.IsNullOrEmpty(entity.Id))
            {
                entity.Id = GuidExtensions.NewComb().ToString();
                entity.ParentId = "";
                entity.TaskProgress = "";
                entity.Weight = "";
                entity.SortNum = 0;
                entity.CloseReson = "";
                entity.CloseDate = null;
                entity.ClosePersonId = "";
                entity.ClosePersionName = "";
                entity.CancelReson = "";
                entity.CancelPersonId = "";
                entity.CancelPersionName = "";
                entity.CancelDate = null;
                entity.CreateDate = DateTime.Now;
                entity.CreatorId = CurrentOperator.Id;
                entity.CreatorName = CurrentOperator.RealName;

                //entity.ModifyPersionId = CurrentOperator.Id;
                //entity.LastModifierName = CurrentOperator.RealName;
                //entity.LastModifyDate = DateTime.Now;

                entity.DeletePersionId = "";
                entity.DeletePersionName = "";
                entity.DeleteDate = null;
                entity.ApproverDate = null;


                entity.IsDeleted = 0;

                rows = this.Insert(entity);
            }
            else
            {
                var oldEntity = this.GetById(entity.Id);

                // 非草稿状态禁止修改
                if (oldEntity == null || oldEntity.Status != 0) return 0;

                oldEntity.Title = entity.Title;

                // 类型不修改
                //oldEntity.TaskTypeId = entity.TaskTypeId;
                //oldEntity.TaskTypeName = entity.TaskTypeName;

                oldEntity.Status = entity.Status;
                oldEntity.Content = entity.Content;
                oldEntity.Source = entity.Source;
                oldEntity.BeginDate = entity.BeginDate;
                oldEntity.EndDate = entity.EndDate;
                oldEntity.AssignorId = entity.AssignorId;
                oldEntity.AssignorName = entity.AssignorName;
                oldEntity.HostId = entity.HostId;
                oldEntity.HostName = entity.HostName;
                oldEntity.HostDepartmentId = entity.HostDepartmentId;
                oldEntity.HostDepartmentName = entity.HostDepartmentName;
                oldEntity.ApproverId = entity.ApproverId;
                oldEntity.ApproverName = entity.ApproverName;
                oldEntity.ApproverDate = entity.ApproverDate;
                oldEntity.CoordinatorId = entity.CoordinatorId;
                oldEntity.CoordinatorName = entity.CoordinatorName;
                oldEntity.HostLeaderId = entity.HostLeaderId;
                oldEntity.HostLeaderName = entity.HostLeaderName;
                oldEntity.SuperviseLeaderId = entity.SuperviseLeaderId;
                oldEntity.SuperviseLeaderName = entity.SuperviseLeaderName;
                oldEntity.AttachFiles = entity.AttachFiles;
                oldEntity.IsVerification = entity.IsVerification;
                oldEntity.VerifierId = entity.VerifierId;
                oldEntity.VerifierName = entity.VerifierName;
                oldEntity.ModifyPersionId = CurrentOperator.Id;
                oldEntity.LastModifierName = CurrentOperator.RealName;
                oldEntity.LastModifyDate = DateTime.Now;

                rows = this.Update(oldEntity);

                entity.Id = oldEntity.Id;
                entity.TenantId = oldEntity.TenantId;

                // 删除旧协办人及协办部门
                _ITaskAssistorService.Delete(x => x.TaskInfoId.Equals(entity.Id) && x.TenantId.Equals(oldEntity.TenantId));
                _ITaskAssistDepartmentService.Delete(x => x.TaskInfoId.Equals(entity.Id) && x.TenantId.Equals(oldEntity.TenantId));

            }

            if (rows > 0)
            {
                // 文件有效化
                if (!string.IsNullOrEmpty(entity.AttachFiles))
                {
                    List<UploadFileModel> attachFiles = entity.AttachFiles.ToObject<List<UploadFileModel>>();
                    _IFileService.Effect(string.Join(',', attachFiles.ConvertAll(x => x.FileId)));
                }

                // 保存协办人及协办部门
                if (AssistDepartmentList != null && AssistDepartmentList.Count > 0)
                {
                    AssistDepartmentList.ForEach(x =>
                    {
                        x.Id = GuidExtensions.NewComb().ToString();
                        x.TenantId = entity.TenantId;
                        x.TaskInfoId = entity.Id;
                    });
                    _ITaskAssistDepartmentService.Insert(AssistDepartmentList);
                }

                if (AssistorList != null && AssistorList.Count > 0)
                {
                    AssistorList.ForEach(x =>
                    {
                        x.Id = GuidExtensions.NewComb().ToString();
                        x.TenantId = entity.TenantId;
                        x.TaskInfoId = entity.Id;
                    });

                    _ITaskAssistorService.Insert(AssistorList);
                }

            }

            return rows;

        }


    }
}
