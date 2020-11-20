namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class AttributeBLL
    {
        public int Id { get; set; }
        public byte AttributeId { get; set; }
        public string Value { get; set; }
        public byte Quantity { get; set; }
        public decimal Price { get; set; }
        public bool IsActive{get;set;}
    }
}