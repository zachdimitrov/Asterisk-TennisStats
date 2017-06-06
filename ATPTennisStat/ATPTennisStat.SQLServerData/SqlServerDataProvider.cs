﻿using ATPTennisStat.Models;
using ATPTennisStat.Repositories.Contracts;

namespace ATPTennisStat.SQLServerData
{
    public class SqlServerDataProvider
    {
        //Properties?
        public IRepository<City> cities;
        public IRepository<Country> countries;
        public IUnitOfWork unitOfWork;

        public SqlServerDataProvider(
            IUnitOfWork unitOfWork,
            IRepository<City> cities,
             IRepository<Country> countries)
        {
            this.cities = cities;
            this.countries = countries;
            this.unitOfWork = unitOfWork;
        }
    }
}