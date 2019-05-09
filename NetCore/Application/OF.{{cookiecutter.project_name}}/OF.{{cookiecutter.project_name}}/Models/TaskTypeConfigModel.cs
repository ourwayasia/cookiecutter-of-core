using System;

namespace OF.{{cookiecutter.project_name}}.Models
{
    /// <summary>
    /// 任务类型配置实体类
    /// </summary>
    [Serializable]
    public class TaskTypeConfigModel
    {
        /// <summary>
        /// 表单
        /// </summary>
        public TaskTypeFormModel Form { get; set; }
        /// <summary>
        /// 流程
        /// </summary>
        public TaskTypeFlowModel Flow { get; set; }
        /// <summary>
        /// 提醒规则
        /// </summary>
        public TaskTypeRemindRuleModel RemindRule { get; set; }

    }
}
