using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;


namespace SanitaryCartControl.Core.Context
{
    public partial class SanitaryCartContext : DbContext
    {
        readonly string _con;
        public SanitaryCartContext()
        {
        }
        public SanitaryCartContext(string con)
        {
            _con = con;
        }

        public SanitaryCartContext(DbContextOptions<SanitaryCartContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AttributeType> AttributeTypes { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<Grade> Grades { get; set; }
        public virtual DbSet<GstRate> GstRates { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Kind> Kinds { get; set; }
        public virtual DbSet<Material> Materials { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductType> ProductTypes { get; set; }
        public virtual DbSet<SeriesBrand> SeriesBrands { get; set; }
        public virtual DbSet<SeriesHolderCategory> SeriesHolderCategories { get; set; }
        public virtual DbSet<Size> Sizes { get; set; }
        public virtual DbSet<TypeProductQuantity> TypeProductQuantities { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(_con);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AttributeType>(entity =>
            {
                entity.ToTable("AttributeType");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.ToTable("Brand");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.ImagePath)
                    .IsRequired()
                    .HasMaxLength(310)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.ImagePath)
                    .HasMaxLength(310)
                    .IsUnicode(false);

                entity.Property(e => e.Titlle)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Category_Category");
            });

            modelBuilder.Entity<Color>(entity =>
            {
                entity.ToTable("Color");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Colors)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Color_Category");
            });

            modelBuilder.Entity<Grade>(entity =>
            {
                entity.ToTable("Grade");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Grade1)
                    .IsRequired()
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .HasColumnName("Grade")
                    .IsFixedLength(true);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Grades)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SteelQuality_Category");
            });

            modelBuilder.Entity<GstRate>(entity =>
            {
                entity.ToTable("GstRate");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.ToTable("Image");

                entity.Property(e => e.Path)
                    .IsRequired()
                    .HasMaxLength(330)
                    .IsUnicode(false);

                entity.Property(e => e.ProductIdFk).HasColumnName("Product_Id_FK");

                entity.HasOne(d => d.ProductIdFkNavigation)
                    .WithMany(p => p.Images)
                    .HasForeignKey(d => d.ProductIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Image_Product");

                entity.HasOne(d => d.TypeNavigation)
                    .WithMany(p => p.Images)
                    .HasForeignKey(d => d.Type)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Image_AttributeType");
            });

            modelBuilder.Entity<Kind>(entity =>
            {
                entity.ToTable("Kind");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Kind1)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Kind");

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Kinds)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Kind_Category");
            });

            modelBuilder.Entity<Material>(entity =>
            {
                entity.ToTable("Material");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Materials)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Material_Category");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.BrandIdFk).HasColumnName("Brand_Id_FK");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.DateAdded).HasColumnType("datetime");

                entity.Property(e => e.DateUpdated).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(800)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(80)
                    .IsUnicode(false);

                entity.HasOne(d => d.BrandIdFkNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.BrandIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Brand");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Category");

                entity.HasOne(d => d.TypeNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Type)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_AttributeType");
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.HasKey(e => new { e.AttributeIdFk, e.CategoryIdFk });

                entity.ToTable("ProductType");

                entity.HasIndex(e => e.CategoryIdFk, "Unique_Category_Type")
                    .IsUnique();

                entity.Property(e => e.AttributeIdFk).HasColumnName("Attribute_Id_FK");

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.HasOne(d => d.AttributeIdFkNavigation)
                    .WithMany(p => p.ProductTypes)
                    .HasForeignKey(d => d.AttributeIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductType_AttributeType");

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithOne(p => p.ProductType)
                    .HasForeignKey<ProductType>(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductType_Category");
            });

            modelBuilder.Entity<SeriesBrand>(entity =>
            {
                entity.ToTable("Series.Brand");

                entity.HasIndex(e => e.CategoryIdFk, "IX_Series.Brand")
                    .IsUnique();

                entity.Property(e => e.BrandIdFk).HasColumnName("Brand_Id_FK");

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.HasOne(d => d.BrandIdFkNavigation)
                    .WithMany(p => p.SeriesBrands)
                    .HasForeignKey(d => d.BrandIdFk)
                    .HasConstraintName("FK_Series_Brand");

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithOne(p => p.SeriesBrand)
                    .HasForeignKey<SeriesBrand>(d => d.CategoryIdFk)
                    .HasConstraintName("FK_Series.Brand_Category");
            });

            modelBuilder.Entity<SeriesHolderCategory>(entity =>
            {
                entity.ToTable("SeriesHolder.Category");

                entity.Property(e => e.CategoryIdFk).HasColumnName("CategoryId_Fk");

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.SeriesHolderCategories)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SeriesHolder.Category_Category");
            });

            modelBuilder.Entity<Size>(entity =>
            {
                entity.ToTable("Size");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Size1)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("Size")
                    .IsFixedLength(true);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Sizes)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Size_Category");
            });

            modelBuilder.Entity<TypeProductQuantity>(entity =>
            {
                entity.ToTable("Type.Product.Quantity");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Price).HasColumnType("decimal(7, 2)");

                entity.Property(e => e.ProductIdFk).HasColumnName("Product_Id_FK");

                entity.Property(e => e.Value)
                    .HasMaxLength(20)
                    .IsUnicode(true);

                entity.HasOne(d => d.AtributeTypeNavigation)
                    .WithMany(p => p.TypeProductQuantities)
                    .HasForeignKey(d => d.AtributeType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Type.Product.Quantity_Table_1");

                entity.HasOne(d => d.ProductIdFkNavigation)
                    .WithMany(p => p.TypeProductQuantities)
                    .HasForeignKey(d => d.ProductIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Type.Product.Quantity_Product");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
