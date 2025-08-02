using DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repos
{
    internal class RepoDB
    {
        protected JATContext db;

        public RepoDB()
        {
            db = new JATContext(); //Data base context initialization
        }
    }
}