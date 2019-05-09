using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_task_infoMaps : IEntityMap
    {
        public void RegistTo(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ts_task_info>();
        }
    }
    /// <summary>
    /// 任务基本信息表
    /// </summary>
    public class ts_task_info :  EntityBase
    {
        /// <summary>
        /// 租户Id
        /// </summary>
        public string TenantId { get; set; }
        /// <summary>
        /// 父任务Id
        /// </summary>
        public string ParentId { get; set; }
        /// <summary>
        /// 任务类型Id
        /// </summary>
        public string TaskTypeId { get; set; }
        /// <summary>
        /// 任务类型名称
        /// </summary>
        public string TaskTypeName { get; set; }
        /// <summary>
        /// 任务标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 详细内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 任务来源
        /// </summary>
        public string Source { get; set; }
        /// <summary>
        /// 任务来源文件编号
        /// </summary>
        public string SourceFileNo { get; set; }
        /// <summary>
        /// 任务开始时间
        /// </summary>
        public DateTime? BeginDate { get; set; }
        /// <summary>
        /// 任务完成期限
        /// </summary>
        public DateTime? EndDate { get; set; }
        /// <summary>
        /// 任务布置人Id
        /// </summary>
        public string AssignorId { get; set; }
        /// <summary>
        /// 任务布置人名称
        /// </summary>
        public string AssignorName { get; set; }
        /// <summary>
        /// 主办人Id
        /// </summary>
        public string HostId { get; set; }
        /// <summary>
        /// 主办人名称
        /// </summary>
        public string HostName { get; set; }
        /// <summary>
        /// 主办部门Id
        /// </summary>
        public string HostDepartmentId { get; set; }
        /// <summary>
        /// 主办部门名称
        /// </summary>
        public string HostDepartmentName { get; set; }
        /// <summary>
        /// 任务审批人Id
        /// </summary>
        public string ApproverId { get; set; }
        /// <summary>
        /// 任务审批人名称
        /// </summary>
        public string ApproverName { get; set; }
        /// <summary>
        /// 审批完成时间
        /// </summary>
        public DateTime? ApproverDate { get; set; }
        /// <summary>
        /// 督办协调员Id
        /// </summary>
        public string CoordinatorId { get; set; }
        /// <summary>
        /// 督办协调员名称
        /// </summary>
        public string CoordinatorName { get; set; }
        /// <summary>
        /// 主办分管领导Id
        /// </summary>
        public string HostLeaderId { get; set; }
        /// <summary>
        /// 主办分管领导名称
        /// </summary>
        public string HostLeaderName { get; set; }
        /// <summary>
        /// 督办分管领导Id
        /// </summary>
        public string SuperviseLeaderId { get; set; }
        /// <summary>
        /// 督办分管领导名称
        /// </summary>
        public string SuperviseLeaderName { get; set; }
        /// <summary>
        /// 任务附件
        /// </summary>
        public string AttachFiles { get; set; }
        /// <summary>
        /// 任务进展
        /// </summary>
        public string TaskProgress { get; set; }
        /// <summary>
        /// 权重
        /// </summary>
        public string Weight { get; set; }
        /// <summary>
        /// 是否需要验证(1是;0:否)
        /// </summary>
        public int IsVerification { get; set; }
        /// <summary>
        /// 验证人Id
        /// </summary>
        public string VerifierId { get; set; }
        /// <summary>
        /// 验证人名称
        /// </summary>
        public string VerifierName { get; set; }
        /// <summary>
        /// 当前状态(0:草稿1:下达审批中; 2:正在执行;4:延期申请;5:关闭申请;6:取消申请;8:已关闭,10:已取消)
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 排序号
        /// </summary>
        public int SortNum { get; set; }
        /// <summary>
        /// 关闭原因
        /// </summary>
        public string CloseReson { get; set; }
        /// <summary>
        /// 关闭时间
        /// </summary>
        public DateTime? CloseDate { get; set; }
        /// <summary>
        /// 关闭操作人Id
        /// </summary>
        public string ClosePersonId { get; set; }
        /// <summary>
        /// 关闭操作人名称
        /// </summary>
        public string ClosePersionName { get; set; }
        /// <summary>
        /// 取消原因
        /// </summary>
        public string CancelReson { get; set; }
        /// <summary>
        /// 取消操作人Id
        /// </summary>
        public string CancelPersonId { get; set; }
        /// <summary>
        /// 取消操作人名称
        /// </summary>
        public string CancelPersionName { get; set; }
        /// <summary>
        /// 取消时间
        /// </summary>
        public DateTime? CancelDate { get; set; }
        /// <summary>
        /// 创建人Id
        /// </summary>
        public string CreatorId { get; set; }
        /// <summary>
        /// 创建人姓名
        /// </summary>
        public string CreatorName { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
        /// <summary>
        /// 最后修改操作人Id
        /// </summary>
        public string ModifyPersionId { get; set; }
        /// <summary>
        /// 最后修改操作人名称
        /// </summary>
        public string LastModifierName { get; set; }
        /// <summary>
        /// 最后修改时间
        /// </summary>
        public DateTime? LastModifyDate { get; set; }
        /// <summary>
        /// 删除操作人Id
        /// </summary>
        public string DeletePersionId { get; set; }
        /// <summary>
        /// 删除操作人名称
        /// </summary>
        public string DeletePersionName { get; set; }
        /// <summary>
        /// 删除操作时间
        /// </summary>
        public DateTime? DeleteDate { get; set; }
        /// <summary>
        /// 删除标记(0-正常 1-已删除)
        /// </summary>
        public int IsDeleted { get; set; }

    }
}
