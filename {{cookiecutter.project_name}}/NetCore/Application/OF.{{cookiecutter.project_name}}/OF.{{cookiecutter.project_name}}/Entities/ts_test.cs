using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_test : EntityBase
    {
        /// <summary>
        /// 测试名称
        /// </summary>
        public string TestName { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        public string CreatorId { get; set; }

        /// <summary>
        /// 创建用户姓名
        /// </summary>
        public string CreatorName { get; set; }

        /// <summary>
        /// 创建用户时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}
