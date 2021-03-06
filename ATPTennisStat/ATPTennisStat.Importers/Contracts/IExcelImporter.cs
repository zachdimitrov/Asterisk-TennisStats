﻿using ATPTennisStat.Importers.Contracts.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ATPTennisStat.Importers.Contracts
{
    public interface IExcelImporter
    {
        IList<IPointDistributionExcelImportModel> ImportPointDistributions(string filePath);

        IList<IPlayerExcelImportModel> ImportPlayers(string filePath);

        IList<ITournamentExcelImportModel> ImportTournaments(string filePath);

        IList<IMatchExcelImportModel> ImportMatches(string filePath);

    }
}
