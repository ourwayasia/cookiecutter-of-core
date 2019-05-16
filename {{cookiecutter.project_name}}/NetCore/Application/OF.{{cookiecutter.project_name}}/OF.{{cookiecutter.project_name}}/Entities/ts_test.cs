using Microsoft.EntityFrameworkCore;
using OF.Core;
using OF.Core.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace OF.{{cookiecutter.project_name}}.Entities
{
    public class ts_testMaps : IEntityMap
    {
        public void RegistTo(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ts_test>();
        }
    }
    public class ts_test : EntityBase
    {
    }
}
