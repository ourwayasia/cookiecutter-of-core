using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_task_assist_departmentMaps : IEntityMap
    {
        public void RegistTo(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ts_task_assist_department>();
        }
    }
    /// <summary>
    /// 任务协办部门信息表
    /// </summary>
    public class ts_task_assist_department : EntityBase
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
        /// 协办部门ID
        /// </summary>
        public string AssistDepartmentId { get; set; }
        /// <summary>
        /// 协办部门名称
        /// </summary>
        public string AssistDepartmentName { get; set; }
    }
}
