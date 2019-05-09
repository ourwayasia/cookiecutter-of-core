using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OF.{{cookiecutter.project_name}}.Models
{
    /// <summary>
    /// JsTree Node数据契约
    /// </summary>
    public class JsTreeNode
    {
        /// <summary>
        /// id
        /// </summary>
        public string id { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string text { get; set; }
        /// <summary>
        /// 图标样式
        /// </summary>
        public string icon { get; set; }

        /// <summary>
        /// 数据
        /// </summary>
        public object data { get; set; }
        /// <summary>
        /// 子节点
        /// </summary>
        public List<JsTreeNode> children { get; set; }

    }
}
