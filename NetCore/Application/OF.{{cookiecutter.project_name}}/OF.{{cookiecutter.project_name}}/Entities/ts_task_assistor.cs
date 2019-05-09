using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_task_assistorMaps : IEntityMap
    {
        public void RegistTo(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ts_task_assistor>();
        }
    }
    /// <summary>
    /// 任务协办人信息表
    /// </summary>
    public class ts_task_assistor : EntityBase
    {
        /// <summary>
        /// 租户ID
        /// </summary>
        public string TenantId { get; set; }
        /// <summary>
        /// 任务基本信息表ID
        /// </summary>
        public string TaskInfoId { get; set; }
        /// <summary>
        /// 协办人ID
        /// </summary>
        public string AssistorId { get; set; }
        /// <summary>
        /// 协办人姓名
        /// </summary>
        public string AssistorName { get; set; }

    }
}
