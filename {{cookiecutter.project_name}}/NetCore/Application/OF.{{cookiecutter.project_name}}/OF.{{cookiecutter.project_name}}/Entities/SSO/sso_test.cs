using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities.SSO
{
    public class sso_test: ISSOEntity
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
        public DateTime? CreateDate { get; set; }

        /// <summary>
        /// 时间戳
        /// </summary>
        /// <value>The timestamp.</value>
        public string Timestamp { get; set; }
    }
}
