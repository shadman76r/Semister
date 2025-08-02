using DAL.Models;
using DAL.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Service
{
     public class EmployeeService
    {
        public static object Get()
        {
            return EmployeeRepo.Get(); // Call the repository method to get all employees
        }
        /*public static List<Employee> Get()
        {
            return EmployeeRepo.Get(); // Call the repository method to get all employees
        }*/
        public static List<Employee> GetByName(string name)
        {
            return EmployeeRepo.Get().Where(e => e.FirstName.Contains(name) || e.LastName.Contains(name)).ToList(); // Call the repository method to get employees by name
        }
        public static List<Employee> Get10()
        {
            var data = from e in EmployeeRepo.Get()
                       where e.EmployeeId < 10 // Use LINQ to filter employees with EmployeeId less than 10
                       select e; // Use LINQ to select all employees
            return data.ToList(); // Convert the result to a list and return it
        }
        public static Employee Get(int id)
        {
            return EmployeeRepo.Get(id); // Call the repository method to get an employee by id
        }
        public static bool Create(Employee employee)
        {
            return EmployeeRepo.Create(employee); // Call the repository method to create a new employee
        }
        public static bool Update(Employee employee)
        {
            return EmployeeRepo.Update(employee); // Call the repository method to update an existing employee
        }
        public static bool Delete(int id)
        {
            return EmployeeRepo.Delete(id); // Call the repository method to delete an employee by id
        }
    }
}
