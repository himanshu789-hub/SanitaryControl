using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc;

namespace SanitaryCartControl.DTOModels
{
    public class SeriesNameRemoteValidate
    {
        [Required]
        [BindProperty(Name="Series.Id")]
        public int? Id{get;set;}

        [Required]
        [BindProperty(Name="Series.Name")]
        public string name{get;set;}
        
        [BindRequired]
        [BindProperty(Name="Series.Brand_Id_Fk")]
        public int BrandId{get;set;}

        [BindRequired]
        [BindProperty(Name="Series.ParentId")]
        public int ParentId{get;set;}       
    }
}