using OF.{{cookiecutter.project_name}}.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Models
{
    [Serializable]
    public class TaskJsTreeNode
    {
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
        /// 任务开始时间
        /// </summary>
        public DateTime? BeginDate { get; set; }
        /// <summary>
        /// 任务完成期限
        /// </summary>
        public DateTime? EndDate { get; set; }
        /// <summary>
        /// 主办人名称
        /// </summary>
        public string HostName { get; set; }
        /// <summary>
        /// 主办部门名称
        /// </summary>
        public string HostDepartmentName { get; set; }
        /// <summary>
        /// 任务进展
        /// </summary>
        public string TaskProgress { get; set; }
        /// <summary>
        /// 任务进展
        /// </summary>
        public List<ts_task_progress> ProgressList { get; set; }
        /// <summary>
        /// 子任务
        /// </summary>
        public List<TaskJsTreeNode> Children { get; set; }
    }
}
