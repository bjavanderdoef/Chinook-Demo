using Chinook.Framework.DAL.Security;
using Chinook.Framework.Entities.Security;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace Chinook.Framework.BLL.Security
{
    [DataObject]
    public class RoleManager : RoleManager<IdentityRole>
    {
        public RoleManager()
            : base(new RoleStore<IdentityRole>(new ApplicationDbContext()))
        {
        }

        public void AddDefaultRoles()
        {
            foreach (string roleName in SecurityRoles.DefaultSecurityRoles)
            {
                // check if it exists
                if (!Roles.Any(r => r.Name == roleName))
                    this.Create(new IdentityRole(roleName));
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<RoleProfile> ListAllRoles()
        {
            var um = new UserManager();
            var result = from data in Roles.ToList() // force the query of data first, and then get the results in memory
                         select new RoleProfile()
                         {
                             RoleId = data.Id,
                             RoleName = data.Name,
                             UserNames = data.Users.Select(u => um.FindById(u.UserId).UserName)
                         };
            return result.ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddRole(RoleProfile role)
        {

        }

        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public void RemoveRole(RoleProfile role)
        {

        }
    }
}