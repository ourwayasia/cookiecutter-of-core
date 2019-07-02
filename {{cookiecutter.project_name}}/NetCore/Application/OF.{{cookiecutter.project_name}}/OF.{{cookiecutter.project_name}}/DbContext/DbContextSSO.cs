using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using OF.Core.DbContextCore;
using OF.Core.Helpers;
using OF.{{cookiecutter.project_name}}.Entities.SSO;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.DbContext
{
    public class DbContextSSO: DbContextNewBase<ISSOEntity>
    {
        public override string ConnectionString => SettingsHelper.Configuration.GetConnectionString("SSOConnectionString");
    }
}
