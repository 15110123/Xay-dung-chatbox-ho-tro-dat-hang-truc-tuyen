﻿//Participants: F4 members
//web: https://cutieshop.azurewebsites.net/

using CutieShop.Models.JSONEntities.Settings;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CutieShop
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddSession(options =>
            //{
            //    // Set a short timeout for easy testing.
            //    options.IdleTimeout = TimeSpan.FromDays(1);
            //    options.Cookie.HttpOnly = true;
            //});
            //services.Configure<APISettings>(Configuration.GetSection("APISettings"));
            //services.Configure<AzureSettings>(Configuration.GetSection("AzureSettings"));
            services.Configure<MailContent>(Configuration.GetSection("MailContent"));
            services.AddMvc();
            services.AddCors();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            //if (env.IsDevelopment())
            //{
            //    app.UseDeveloperExceptionPage();
            //    app.UseWebpackDevMiddleware(new WebpackDevMiddlewareOptions
            //    {
            //        HotModuleReplacement = true,
            //        ReactHotModuleReplacement = true
            //    });
            //}
            //else
            //{
            //    //Redirect all HTTP request to HTTPS: https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl
            //    //var options = new RewriteOptions().AddRedirectToHttps();
            //    // app.UseRewriter(options);

            //    app.UseExceptionHandler("/Home/Error");
            //}

            //app.UseExceptionHandler("/Home/Error");

            app.UseCors(builder =>
            {
                builder.AllowAnyHeader()
                        .AllowAnyMethod()
                        .AllowAnyOrigin()
                        .AllowCredentials();
            });

            //app.UseStaticFiles();

            //app.UseSession();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");

                //routes.MapSpaFallbackRoute(
                //    name: "spa-fallback",
                //    defaults: new { controller = "Home", action = "Index" });
            });
        }
    }
}
