﻿using System;
using ATPTennisStat.Models.SqliteModels;
using ATPTennisStat.Repositories.Contracts;

namespace ATPTennisStat.SQLiteData
{
    public class SqliteDataProvider
    {
        private IRepository<Log> logs;
        private IUnitOfWork unitOfWork;

        public SqliteDataProvider(IUnitOfWork uow, IRepository<Log> logs)
        {
            this.logs = logs;
            this.UnitOfWork = uow;
        }

        public IRepository<Log> Logs
        {
            get
            {
                return this.logs;
            }

            set
            {
                if (value == null)
                {
                    throw new ArgumentNullException("Logs");
                }

                this.logs = value;
            }
        }
        
        public IUnitOfWork UnitOfWork
        {
            get
            {
                return this.unitOfWork;
            }

            set
            {
                if (value == null)
                {
                    throw new ArgumentNullException("Unit of work");
                }

                this.unitOfWork = value;
            }
        }
    }
}