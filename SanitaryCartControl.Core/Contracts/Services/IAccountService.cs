using SanitaryCartControl.Core.Entities.BLLModels;
using System;

namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface IAccountService
    {
        bool Register(ApplicationUserBLL userBLL);
        bool Delete(Guid Id);
        bool Update(ApplicationUserBLL userBLL);
        
    }
}