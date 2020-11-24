namespace SanitaryCartControl.Core.Entities.Enums
{
    public static class ApplicationRoles
    {
        public const  string Administration = "Administration";
        public const string Manager = "Manager";

        public const string Both = Administration+","+Manager;
    }
}