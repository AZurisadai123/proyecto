using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductBLL
{
    class BLL
    {
        #region Variables & Propieties
        ProductDAL _dal;

        private DAO.DAOClass Dao { get {  return _dal?.Dao; } }
        #endregion

        #region Constructors
        public ProductBLL(DAO.DAOClass dao) : base()
        {  _dal = new(dao); }
        #endregion

        #region Methods
        public Product GetById(int id) {
            Product product = null;

            using(DataTable dt = new _dal.GetById(id)
            {
                if (dt?.Rows?.Count > 0)
                {
                   product = CollectionUtilities.CommonUtilitis.ConvertDateTableToList<Product>(dt);
                }
            }
        }
        #endregion

        #region Private Methods
        private bool Insert(Product product)
        {
            DAO.DAOClass dao = Dao;
            return CollectionUtilities.TransactionUtils.ExecuteWithTransaction(ref dao, () =>
            {
                return _dal.Insert(product);
            });
        }

        private bool Update(Product product)
        {
            DAO.DAOClass dao = Dao;
            return CollectionUtilities.TransactionUtils.ExecuteWithTransaction(ref dao, () =>
            {
                return _dal.Update(product);
            });
        }

        private bool Delete (Product product)
        {
            DAO.DAOClass dao = Dao;
            return CollectionUtilities.TransactionUtils.ExecuteWithTransaction(ref dao, () =>
            {
                return _dal.Delete(product);
            });
        }
    #endregion
}
}
