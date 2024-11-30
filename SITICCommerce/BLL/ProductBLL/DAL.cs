using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductBLL
{
    internal class DAL
    {
        #region Variables y Properties
        private readonly DAO.DAOClass dAOClass = null;

        internal DAO.DAOClass Dao { get {  return _dao; } }
        #endregion

        #region Constructores
        internal ProductDAL(DAO.DAOClass dao)
        {
            _dao = dao;
        }
        #endregion

        #region Methods
        internal DataTable GetById(int id) { 
            using(SqlCommand sqlCommand = new ())
            {
                SqlParameterCollection parameter = sqlCommand.Parameters;
                parameter.Add("@Id", SqlDbType.Int).Value = id;
                return _dao.QueryInformation($"{Schema.Products}.{Procedures.GetById}", parameter);
            }
        }

        internal DataTable GetAll()
        {
            return _dao.QueryInformation($"{Schema.Products}.{Procedures.GetById}", parameter);
        }

        internal DataTable Insert(Product product)
        {
            using (SqlCommand sqlCommand = new())
            {
                SqlParameterCollection parameters = Utilities.CommonUtils.AddParametersFromObject<Product> (product);
                parameters["@Id"].Direction = ParameterDirection.Output;

                return
                    (_dao.ExecuteProdcedureWithIdentity($"{Schema.Products}.{Procedures.Insert}"))
            }
        }
        #endregion
    }
}
