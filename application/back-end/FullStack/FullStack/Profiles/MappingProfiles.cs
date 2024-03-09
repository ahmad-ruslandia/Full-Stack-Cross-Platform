using AutoMapper;
using FullStack.Core.Models;
using FullStack.Core.ViewModels;

namespace FullStack.Profiles
{
    public class MappingProfiles: Profile
    {
        public MappingProfiles()
        {
            CreateMap<AppUser, SaveAppUserViewModel>().ReverseMap();
            CreateMap<AppUser, AppUserViewModel>().ReverseMap();
        }
    }
}
