using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DTDD.Startup))]
namespace DTDD
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ///ConfigureAuth(app);
        }
    }
}
