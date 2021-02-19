using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;
using System;
using System.Reflection;

namespace SanitaryCartControl.Core.Helpher
{
    public class Mapper
    {
        //  IEnumerable<T> CreateList<T>()
        // {
        //     ICollection<T> lists = new List<T>();
        //     if (_reader.HasRows)
        //     {
        //         while (_reader.Read())
        //         {
        //             this.MapType<T>(lists);
        //         }
        //     }
        //     return lists;
        // }
        // ICollection<T> GetEmptyCollection<T>()
        // {
        //     return new List<T>();
        // }
        // void GetMapCollection<ParentType>(ParentType parent, PropertyInfo propertyInfo)
        // {
        //     if (propertyInfo.PropertyType.IsGenericType && propertyInfo.PropertyType.Namespace == "System.Collections.Generic")
        //     {
        //         object collectionElement = this.GetType().GetMethod("MapType", BindingFlags.Instance | BindingFlags.NonPublic)
        //         .MakeGenericMethod(propertyInfo.PropertyType.GenericTypeArguments.First()).Invoke(this, null);

        //         var constructorType = typeof(List<>).GetGenericTypeDefinition().MakeGenericType(new Type[] { propertyInfo.PropertyType.GetGenericArguments().First() });
        //         var previousValue = propertyInfo.GetValue(parent);

        //         if (previousValue == null)
        //         {
        //             var newInstance = Activator.CreateInstance(constructorType);
        //             propertyInfo.SetValue(parent, newInstance);

        //         }
        //         var instance = Activator.CreateInstance(constructorType);

        //         instance.GetType().GetMethod("AddRange").Invoke(instance, new object[] { propertyInfo.GetValue(parent) });
        //         instance.GetType().GetMethod("Add").Invoke(instance, new object[] { collectionElement });
        //         propertyInfo.SetValue(parent, instance);
        //     }
        //     else
        //         throw new System.ArgumentException("Non Enumerable PropertyInfo Argument");
        // }
        public T MapType<T>(SqlDataReader reader)
        {
            if (reader != null)
            {
                T item = Activator.CreateInstance<T>();
                PropertyInfo[] fields = typeof(T).GetProperties();
                foreach (PropertyInfo propertyInfo in fields)
                {
                    Type type = propertyInfo.PropertyType;
                    var attributeNotMapped = propertyInfo.GetCustomAttribute<NotMappedAttribute>();
                    if (attributeNotMapped != null)
                    {
                        continue;
                    }
                    if (propertyInfo.PropertyType.IsClass && propertyInfo.PropertyType.Namespace.StartsWith("SanitaryCartControl.Core.Entities.BLLModels"))
                    {
                        Object nestedInstance = this.GetType().GetMethod("MapType",BindingFlags.Public | BindingFlags.Instance).MakeGenericMethod(type).Invoke(this, new object[]{reader});
                        propertyInfo.SetValue(item, nestedInstance);
                    }
                    else if (propertyInfo.PropertyType.Namespace == "System.Collections.Generic")
                    {
                        continue;
                    }
                    else
                    {
                        var attribute = propertyInfo.GetCustomAttributes<ColumnAttribute>();
                        string mappedProperty = propertyInfo.Name;

                        if (attribute != null && attribute.Count() > 0)
                        {
                            mappedProperty = attribute.First().Name;
                        }
                        try
                        {
                            object value = reader[mappedProperty];
                            value = Convert.ChangeType(value, propertyInfo.PropertyType);
                            propertyInfo.SetValue(item, value);

                        }
                        catch (System.IndexOutOfRangeException)
                        {

                        }
                        
                    }

                }
                return item;
            }
            else
                throw new System.ArgumentNullException();

        }
    }

}