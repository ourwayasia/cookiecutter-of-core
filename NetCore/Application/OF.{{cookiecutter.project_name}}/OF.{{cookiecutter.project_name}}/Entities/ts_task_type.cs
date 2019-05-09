using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_task_typeMaps : IEntityMap
    {
        public void RegistTo(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ts_task_type>();
        }
    }

    /// <summary>
    /// 任务类型表
    /// </summary>
    public class ts_task_type : EntityBase
    {
        /// <summary>
        /// 租户编号
        /// </summary>
        public string TenantId { get; set; }
        /// <summary>
        /// 父级编号
        /// </summary>
        public string ParentId { get; set; }
        /// <summary>
        /// 代码 
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 排序号
        /// </summary>
        public int SortNum { get; set; }
        /// <summary>
        /// 任务类型配置
        /// </summary>
        public string ExtendConfig { get; set; }
        /// <summary>
        /// 状态(0-禁用1-启用)
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 创建人ID
        /// </summary>
        public string CreatorId { get; set; }
        /// <summary>
        /// 创建人名称
        /// </summary>
        public string CreatorName { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
        /// <summary>
        /// 逻辑删除状态(0-正常 1-已删除)
        /// </summary>
        public int IsDeleted { get; set; }


    }
}
