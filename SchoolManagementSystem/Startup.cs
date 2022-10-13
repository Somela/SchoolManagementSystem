using System;
using Owin;
using Microsoft.Owin.Security.OAuth;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Http;
using System.Net;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Services;

namespace SchoolManagementSystem
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(Configuration.GetSection("Secret").Value))
                };
            });
            // In production, the React files will be served from this directory
            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/build";
            });
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
                {
                    Title = "School Management System API",
                    Version = "v1",
                    Description = "Information On School Management System",
                });
            });
            RegisterServices(services);
        }

        public void RegisterServices(IServiceCollection services)
        {
            services.AddScoped<ILoginService, LoginService>();
            services.AddScoped<IActivatedModulesService, ActivatedModulesService>();
            services.AddScoped<IDormitoryService, DormitoryService>();
            services.AddScoped<IAdministratorService, AdministratorService>();
            services.AddScoped<IBookLibraryService, BookLibraryService>();
            services.AddScoped<IClassService, ClassService>();
            services.AddScoped<IPaymentsService, PaymentsService>();
            services.AddScoped<ISubjectService, SubjectService>();
            services.AddScoped<ITransportationService, TransportationService>();
            services.AddScoped<IAssignmentServices, AssignmentServices>();
            services.AddScoped<IEventsService, EventsService>();
            services.AddScoped<INewsService, NewsService>();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSpaStaticFiles();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "School Management System API");
            });

            app.UseRouting();

            app.UseCors(x => x.AllowAnyMethod().AllowAnyHeader().AllowAnyOrigin().SetIsOriginAllowed(or => true));
            app.UseAuthentication();
            app.UseAuthorization();
            app.Use(async (context, next) =>
            {
                await next();

                if (context.Response.StatusCode == (int)HttpStatusCode.Unauthorized) // 401
                {
                    context.Response.ContentType = "application/json";
                    await context.Response.WriteAsync(new ErrorDto()
                    {
                        StatusCode = 401,
                        Message = "Token is not valid"
                    }.ToString());
                }
            });
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });
        }
    }
}
