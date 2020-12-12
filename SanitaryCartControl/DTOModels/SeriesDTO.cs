using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc;

namespace SanitaryCartControl.DTOModels
{
    public class SeriesDTO
    {
        [BindRequired]
         public int Id{get;set;}
         [Required(ErrorMessage="Name Required")]
         [Remote("CheckNameExistsUnderParentIdAndBrandId","Series",AdditionalFields="ParentId,Brand_Id_Fk,Id",HttpMethod="POST",ErrorMessage="Name Already Exists")]
         [MaxLength(25,ErrorMessage="Must Be Atmost 25 Character")]
         public string Name{get;set;}
         [Required(ErrorMessage="Please Select A Category")]
         public int? ParentId{get;set;}
         [Required]
         public string ImagePath{get;set;}
         
         [BindRequired]
         public int Category_Id_FK{get;set;}
         
         [Required(ErrorMessage="Please Select A Brand")]
         public byte? Brand_Id_Fk{get;set;}
    }
}