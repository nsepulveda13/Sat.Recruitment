using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using Bussines.Services;
using Data.Access;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;

namespace Sat.Recruitment.Test
{
    public class TestFixture<TStartup> : IDisposable where TStartup : class
    {
        public readonly TestServer Server;
        private readonly HttpClient _client;


        public TestFixture()
        {
            var builder = new WebHostBuilder()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseStartup<TStartup>();

            Server = new TestServer(builder);
            _client = new HttpClient();


            


        }
      
        public void Dispose()
        {
            _client.Dispose();
            Server.Dispose();
        }
    }
}
