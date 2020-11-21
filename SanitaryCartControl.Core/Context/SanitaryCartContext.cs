using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SanitaryCartControl.Core.Entities.DALModels;

namespace SanitaryCartControl.Core.Context
{
    public partial class SanitaryCartContext : DbContext
    {
        public SanitaryCartContext()
        {
        }

        public SanitaryCartContext(DbContextOptions<SanitaryCartContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AttributeType> AttributeType { get; set; }
        public virtual DbSet<Brand> Brand { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Color> Color { get; set; }
        public virtual DbSet<GstRate> GstRate { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Kind> Kind { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<SeriesBrand> SeriesBrand { get; set; }
        public virtual DbSet<SeriesHolderCategory> SeriesHolderCategory { get; set; }
        public virtual DbSet<Size> Size { get; set; }
        public virtual DbSet<TypeProductQuantity> TypeProductQuantity { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=USER-PC;Database=sanitarycart;Trusted_Connection=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AttributeType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .IsFixedLength();
            });

            modelBuilder.Entity<Brand>(entity =>
            {
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
                entity.Property(e => e.ImagePath)
                    .HasMaxLength(310)
                    .IsUnicode(false);

                entity.Property(e => e.Titlle)
                    .IsRequired()
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Category_Category");
            });

            modelBuilder.Entity<Color>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Color)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Color_Category");
            });

            modelBuilder.Entity<GstRate>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.Property(e => e.Path)
                    .IsRequired()
                    .HasMaxLength(330)
                    .IsUnicode(false);

                entity.Property(e => e.ProductIdFk).HasColumnName("Product_Id_FK");

                entity.HasOne(d => d.ProductIdFkNavigation)
                    .WithMany(p => p.Image)
                    .HasForeignKey(d => d.ProductIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Image_Product");

                entity.HasOne(d => d.TypeNavigation)
                    .WithMany(p => p.Image)
                    .HasForeignKey(d => d.Type)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Image_AttributeType");
            });

            modelBuilder.Entity<Kind>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Kind1)
                    .IsRequired()
                    .HasColumnName("Kind")
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Kind)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Kind_Category");
            });

            modelBuilder.Entity<Product>(entity =>
            {
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
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.BrandIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Brand");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Category");

                entity.HasOne(d => d.TypeNavigation)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.Type)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_AttributeType");
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.HasKey(e => new { e.AttributeIdFk, e.CategoryIdFk });

                entity.HasIndex(e => e.CategoryIdFk)
                    .HasName("Unique_Category_Type")
                    .IsUnique();

                entity.Property(e => e.AttributeIdFk).HasColumnName("Attribute_Id_FK");

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.HasOne(d => d.AttributeIdFkNavigation)
                    .WithMany(p => p.ProductType)
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

                entity.HasIndex(e => e.CategoryIdFk)
                    .HasName("IX_Series.Brand")
                    .IsUnique();

                entity.Property(e => e.BrandIdFk).HasColumnName("Brand_Id_FK");

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.HasOne(d => d.BrandIdFkNavigation)
                    .WithMany(p => p.SeriesBrand)
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
                    .WithMany(p => p.SeriesHolderCategory)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SeriesHolder.Category_Category");
            });

            modelBuilder.Entity<Size>(entity =>
            {
                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.Property(e => e.Size1)
                    .IsRequired()
                    .HasColumnName("Size")
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.Size)
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
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.AtributeTypeNavigation)
                    .WithMany(p => p.TypeProductQuantity)
                    .HasForeignKey(d => d.AtributeType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Type.Product.Quantity_Table_1");

                entity.HasOne(d => d.ProductIdFkNavigation)
                    .WithMany(p => p.TypeProductQuantity)
                    .HasForeignKey(d => d.ProductIdFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Type.Product.Quantity_Product");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
