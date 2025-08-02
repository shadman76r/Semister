using System.Collections.Generic;

namespace DAL.Interfaces
{
    public interface IRepo<Type, ID, RET> where Type : class
    {
        // Create a new entity
        RET Create(Type obj);

        // Read all entities
        List<Type> Read();

        // Read a single entity by ID
        Type Read(ID id);

        // Update an existing entity
        RET Update(Type obj);

        // Delete an entity by ID
        bool Delete(ID id);
    }
}