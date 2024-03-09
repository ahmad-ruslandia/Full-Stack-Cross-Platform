using FullStack.Core.Interfaces;
using FullStack.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FullStack.Infrastructure.Repositories
{
    public class AppUserRepository : GenericRepository<AppUser>, IAppUserRepository
    {
        public AppUserRepository(ApplicationDbContext dbContext) : base(dbContext)
        {

        }

    }
}
