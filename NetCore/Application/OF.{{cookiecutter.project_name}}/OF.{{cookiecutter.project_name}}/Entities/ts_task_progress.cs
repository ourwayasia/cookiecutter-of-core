using OF.Core;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    /// <summary>
    /// 任务进展表
    /// </summary>
    public class ts_task_progress : EntityBase
    {
        /// <summary>
        /// 租户编号
        /// </summary>
        public string TenantId { get; set; }
        /// <summary>
        /// 任务信息编号
        /// </summary>
        public string TaskInfoId { get; set; }
        /// <summary>
        /// 内容类型(1:进展;2:录入意见;3:批示意见...)
        /// </summary>
        public int ProgressType { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 逻辑删除
        /// </summary>
        public int IsDeleted { get; set; }
        /// <summary>
        /// 创建人
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

    }
}
