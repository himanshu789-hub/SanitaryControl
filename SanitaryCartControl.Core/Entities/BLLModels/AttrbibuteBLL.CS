using System.ComponentModel.DataAnnotations.Schema;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class AttributeBLL
    {
        [Column("AttributeId")]
        public int Id { get; set; }
        [Column("AttributeType")]
        public byte AttributeId { get; set; }
        public string Value { get; set; }
        [NotMapped]
        public byte PeicesPerSet { get; set; }
        public bool IsPriceVisible{get;set;}
        public decimal Price { get; set; }
        [Column("AttributeIsActive")]
        public bool IsActive{get;set;}
    }
}