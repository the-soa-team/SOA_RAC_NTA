using System;
using System.Collections.Generic;
using Interfaces.AbstractModels;
using RentACar.Dal.Abstraction;
using RentACar.Dal.Concretes.Repo;
using RentACar.Model.EntityModels;

namespace RentACar.Bll.Concretes
{
    public class CustomerManager : ICustomerService
    {
        ICustomerDal _customerDal;

        public CustomerManager()
        {
            this._customerDal = new CustomerRepository();
        }

        public bool Delete(Customers entity)
        {
            return _customerDal.Delete(entity);
        }

        public bool DeletedById(int id)
        {
            return _customerDal.DeletedById(id);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                _customerDal.Dispose();
        }

        public Customers Insert(Customers entity)
        {
            return _customerDal.Insert(entity);
        }

        public List<Customers> SelectAll()
        {
            return _customerDal.SelectAll();
        }

        public Customers SelectById(int id)
        {
            return _customerDal.SelectById(id);
        }

        public int Update(Customers entity)
        {
            return _customerDal.Update(entity);
        }
    }
}
