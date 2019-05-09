using OF.Core.Data;
using OF.Core.DbContextCore;
using OF.{{cookiecutter.project_name}}.Entities;
using OF.{{cookiecutter.project_name}}.IServices;
using OF.{{cookiecutter.project_name}}.Models;
using System;
using System.Linq;
using System.Collections.Generic;

namespace OF.{{cookiecutter.project_name}}.BLL
{
    public class TaskTypeService : CRUDServiceBase<ts_task_type>, ITaskTypeService
    {
        public TaskTypeService(IDbContextCore dbContext) : base(dbContext)
        {

        }

        public List<ts_task_type> GetTaskTypeByParentId(string ParentId, string TenantId)
        {
            return this.Entities.Where(x => (x.ParentId.Equals(ParentId) || (string.IsNullOrEmpty(x.ParentId) && string.IsNullOrEmpty(ParentId))) && x.IsDeleted == 0 && x.TenantId.Equals(TenantId)).OrderBy(x => x.SortNum).ToList();
        }

        /// <summary>
        /// 加载任务类型树状结构
        /// </summary>
        /// <param name="TenantId">租户ID</param>
        /// <param name="Status">状态（1-启用，0-禁用，-1-所有）</param>
        /// <returns></returns>
        public List<JsTreeNode> LoadTaskTypeTree(string TenantId, int Status = -1)
        {
            var taskType = this.Entities.Where(o => o.IsDeleted == 0 && (Status == -1 || o.Status == Status) && o.TenantId.Equals(TenantId)).OrderBy(d => d.SortNum).ToList();
            return LoadJsTreeNodes(taskType, null);
        }

        private List<JsTreeNode> LoadJsTreeNodes(List<ts_task_type> allTaskType, ts_task_type taskType)
        {
            var result = new List<JsTreeNode>();
            var childrenList = new List<ts_task_type>();
            if (taskType == null)
            {
                childrenList = allTaskType.Where(o => string.IsNullOrEmpty(o.ParentId)).OrderBy(o => o.SortNum).ToList();
            }
            else
            {
                childrenList = allTaskType.Where(o => o.ParentId == taskType.Id).OrderBy(o => o.SortNum).ToList();
            }
            foreach (var childred in childrenList)
            {
                var node = new JsTreeNode();
                node.id = childred.Id;
                node.text = childred.Name;
                node.icon = "";
                if (allTaskType.Any(o => o.ParentId == childred.Id))
                {
                    node.children = LoadJsTreeNodes(allTaskType, childred);
                }
                result.Add(node);
            }
            return result;
        }

    }
}
