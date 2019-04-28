using Interfaces.AbstractModels;
using RentACar.Dal.Abstraction;
using RentACar.Dal.Concretes.Repo;
using RentACar.Model.EntityModels;
using System;
using System.Collections.Generic;

namespace RentACar.Bll.Concretes
{
    public class CarManager : ICarService
    {
        //Interface yardımı ile ADO,entity vs istenilen tarafa çevirme kolaylaşıyor
        ICarDal _carDal;
     
        public CarManager()
        {
            this._carDal = new CarRepository();
        }

        public bool Delete(Cars entity)
        {
            try
            {
                var deger =_carDal.Delete(entity);
                if (deger == false)
                {
                     throw new Exception("Araç silinemedi" );
                }
                else
                {
                    ICompanyDal compDal = new CompanyRepository();
                    Company _company = compDal.SelectById(1);
                    _company.NumCars--;
                    compDal.Update(_company);
                    return true;
                }              
            }
            catch (Exception err)
            {
                throw new Exception("Araç silinemedi" + err.Message);
            }
           
        }

        public bool DeletedById(int id)
        {
            var car = SelectById(id);//var ise nesne döndürür
            if(car==null)
                throw new Exception("Araç silinemedi");
            else
            {
                Delete(car);
                return true;
            }
           // return _carDal.DeletedById(id);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                _carDal.Dispose();
        }

        public Cars Insert(Cars entity)
        {           
             var deger=  _carDal.Insert(entity);
            if(deger==null)
            {
                return null;
            }
            else
            {
                ICompanyDal compDal = new CompanyRepository();
                Company _company = compDal.SelectById(1);
                _company.NumCars++;
                compDal.Update(_company);
                return deger;
            }           
        }

        public List<Cars> SelectAll()
        {
            return _carDal.SelectAll();
        }

        public Cars SelectById(int id)
        {
            return _carDal.SelectById(id);
        }

        public int Update(Cars entity)
        {
            return _carDal.Update(entity);
        }

        public bool Rent(Cars entity)
        {
            return true;
        }
        
    }
}
