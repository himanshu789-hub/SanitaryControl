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

        public virtual DbSet<Brand> Brand { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Color> Color { get; set; }
        public virtual DbSet<ColorProductQuantity> ColorProductQuantity { get; set; }
        public virtual DbSet<GstRate> GstRate { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<Properties> Properties { get; set; }
        public virtual DbSet<SeriesBrand> SeriesBrand { get; set; }
        public virtual DbSet<SizeProductQuantity> SizeProductQuantity { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=USER-PC;Database=sanitarycart;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Brand>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.ImagePath)
                    .IsRequired()
                    .HasMaxLength(310)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

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

            modelBuilder.Entity<ColorProductQuantity>(entity =>
            {
                entity.HasKey(e => new { e.ProductIdFk, e.Type })
                    .HasName("PK_Color.Product.Quantity_1");

                entity.ToTable("Color.Product.Quantity");

                entity.Property(e => e.ProductIdFk)
                    .HasColumnName("Product_Id_FK")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Color)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Product)
                    .WithOne(p => p.ColorProductQuantity)
                    .HasForeignKey<ColorProductQuantity>(d => new { d.ProductIdFk, d.Type })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Color.Product.Quantity_Product.Type");
            });

            modelBuilder.Entity<GstRate>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Path)
                    .IsRequired()
                    .HasMaxLength(110)
                    .IsUnicode(false);

                entity.Property(e => e.ProductIdFk).HasColumnName("Product_Id_FK");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Image)
                    .HasForeignKey(d => new { d.ProductIdFk, d.Type })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Image_Image");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => new { e.Id, e.Type });

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

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

                entity.Property(e => e.Price).HasColumnType("decimal(7, 2)");

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
                    .HasConstraintName("FK_Product_ProductType");
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Properties>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SeriesBrand>(entity =>
            {
                entity.ToTable("Series.Brand");

                entity.Property(e => e.BrandIdFk).HasColumnName("Brand_Id_FK");

                entity.Property(e => e.CategoryIdFk).HasColumnName("Category_Id_FK");

                entity.HasOne(d => d.BrandIdFkNavigation)
                    .WithMany(p => p.SeriesBrand)
                    .HasForeignKey(d => d.BrandIdFk)
                    .HasConstraintName("FK_Series_Brand");

                entity.HasOne(d => d.CategoryIdFkNavigation)
                    .WithMany(p => p.SeriesBrand)
                    .HasForeignKey(d => d.CategoryIdFk)
                    .HasConstraintName("FK_Series.Brand_Category");
            });

            modelBuilder.Entity<SizeProductQuantity>(entity =>
            {
                entity.HasKey(e => new { e.ProductIdFk, e.Type })
                    .HasName("PK_Size.Product_Type");

                entity.ToTable("Size.Product.Quantity");

                entity.Property(e => e.ProductIdFk).HasColumnName("Product_Id_FK");

                entity.Property(e => e.Size)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Product)
                    .WithOne(p => p.SizeProductQuantity)
                    .HasForeignKey<SizeProductQuantity>(d => new { d.ProductIdFk, d.Type })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Size.Product.Quantity_Product");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
