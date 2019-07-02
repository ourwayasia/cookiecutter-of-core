using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities.SSO
{
    public class ISSOEntity
    {
        /// <summary>
        /// 主键
        /// </summary>
        [Key]
        public string Id { get; set; }
    }
}
