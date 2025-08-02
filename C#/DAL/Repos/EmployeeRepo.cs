using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 

namespace DAL.Repos
{
     public class EmployeeRepo
    {
        static EmpContext empContext;
        static EmployeeRepo()
        {
            empContext = new EmpContext(); //initialize the context
        }

        public static List<Employee> Get()
        {
            return empContext.Employees.ToList(); //return all employees from the context
        }
        public static Employee Get(int id)
        {
            return empContext.Employees.Find(id); //return employee by i
        }

        public static bool Create(Employee employee)
        {
            try
            {
                empContext.Employees.Add(employee); //add employee to the context
                empContext.SaveChanges(); //save changes to the database
                return true; //return true if successful
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); //log the exception message
                return false; //return false if there is an error
            }
        }
        public static bool Update(Employee employee)
        {
            try
            {
                empContext.Entry(employee).State = System.Data.Entity.EntityState.Modified; //set the state of the employee to modified
                empContext.SaveChanges(); //save changes to the database
                return true; //return true if successful
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); //log the exception message
                return false; //return false if there is an error
            }
        }
        public static bool Delete(int id)
        {
            try
            {
                var employee = empContext.Employees.Find(id); //find the employee by id
                if (employee != null)
                {
                    empContext.Employees.Remove(employee); //remove the employee from the context
                    empContext.SaveChanges(); //save changes to the database
                    return true; //return true if successful
                }
                return false; //return false if employee not found
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); //log the exception message
                return false; //return false if there is an error
            }
        }
    }
}
