namespace SanitaryCartControl.Miscellaneous.Struct
{
  public struct BreadcrumbInfo
   {
       public  string Name{get;set;}
        public string Link{get;set;}

         public BreadcrumbInfo(string Name,string Link)
         {
            this.Name = Name;
            this.Link=Link;
         }
   }    
}