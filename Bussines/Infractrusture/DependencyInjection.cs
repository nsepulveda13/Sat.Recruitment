using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using Bussines.Services;
using Microsoft.Extensions.DependencyInjection;

namespace Bussines.Infractrusture
{
  public static class DependencyInjection
    {

        public static void AddMappers(this IServiceCollection services)
        {
            var config = new MapperConfiguration(m =>
            {
                m.AddProfile(typeof(MappingProfile));

            });
            services.AddSingleton(config.CreateMapper());
            services.AddSingleton<IUserService, User>();
        }
    }
}
