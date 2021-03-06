﻿using ATPTennisStat.ConsoleClient.Core.Contracts;
using ATPTennisStat.Factories.Contracts;
using ATPTennisStat.Importers.Contracts;
using ATPTennisStat.SQLServerData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ATPTennisStat.ConsoleClient.Core.Commands.ImportCommands
{
    public class ImportPlayersCommand : ICommand
    {
        private ISqlServerDataProvider dataProvider;
        private IModelsFactory modelsFactory;
        private IExcelImporter excelImporter;
        private IWriter writer;
        private ILogger logger;

        public ImportPlayersCommand(ISqlServerDataProvider dataProvider,
                                    IModelsFactory modelsFactory,
                                    IExcelImporter excelImporter,
                                    IWriter writer,
                                    ILogger logger)
        {
            this.dataProvider = dataProvider;
            this.modelsFactory = modelsFactory;
            this.excelImporter = excelImporter;
            this.writer = writer;
            this.logger = logger;

        }

        public string Execute()
        {
            return $@"Not enough parameters!
Use this template [importp FILE_PATH] and try again!";
        }

        public string Execute(IList<string> parameters)
        {

            if (parameters.Count == 0)
            {
                return this.Execute();
            }
            else
            {
                var players = excelImporter.ImportPlayers(parameters[0]);

                writer.WriteLine("Total records in dataset: " + players.Count);

                var counterAdded = 0;
                var counterDuplicates = 0;

                writer.Write("Importing players' data...");

                var newLog = logger.CreateNewLog("Players import: ");

                foreach (var p in players)
                {
                    try
                    {
                        var newPlayer = modelsFactory.CreatePlayer(
                         p.FirstName,
                         p.LastName,
                         p.Ranking,
                         p.Birthdate,
                         p.Height,
                         p.Weight,
                         p.City,
                         p.Country);

                        this.dataProvider.Players.Add(newPlayer);
                        counterAdded++;
                    }
                    catch (ArgumentException ex)
                    {
                        var logDetail = logger.CreateNewLogDetail(
                            "Excel import problem: " + ex.Message,
                            newLog);

                        counterDuplicates++;
                    }

                }

                this.dataProvider.UnitOfWork.Finished();
                writer.Write(Environment.NewLine);

                newLog.TimeStamp = DateTime.Now;
                newLog.Message = newLog.Message + String.Format("Records added: {0}, Duplicated records: {1}", counterAdded, counterDuplicates);
                logger.Log(newLog);
                return String.Format("Records added: {0}{1}Duplicated records: {2}", counterAdded, Environment.NewLine, counterDuplicates);
            }
        }
    }
}
