using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(brickFTPreports.Startup))]
namespace brickFTPreports
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
