﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ATPTennisStat.ConsoleClient.Core.Contracts;
using ATPTennisStat.Models.Enums;
using ATPTennisStat.PostgreSqlData;
using ATPTennisStat.ConsoleClient.Core.Utilities;

namespace ATPTennisStat.ConsoleClient.Core.Commands.TicketCommands
{
    public class ShowTicketsCommand : ICommand
    {
        private const string NoTicketsMessage = "Sorry, no tickets for this event!";
        protected readonly IPostgresDataProvider dp;
        private IWriter writer;

        public ShowTicketsCommand(IPostgresDataProvider dp, IWriter writer)
        {
            if (dp == null)
            {
                throw new ArgumentNullException("Data provider cannot be null!");
            }

            if (writer == null)
            {
                throw new ArgumentNullException("Writer cannot be null!");
            }

            this.dp = dp;
            this.writer = writer;
        }

        public string Execute()
        {
            this.writer.Clear();
            var result = new StringBuilder();
            var tevents = dp.TennisEvents.GetAll();

            foreach (var evt in tevents)
            {

                var tList = dp
                    .Tickets
                    .Find(t => t.TennisEvent.Id == evt.Id)
                    .Select(t => $"Id: {t.Id} | Price: {t.Price} | Sector(Sector): {t.Sector} | Remaining: {t.Number}")
                    .ToList();

                var tickets = String.Join("\n    ", tList);
                if (tickets.Length > 0)
                {
                    result.AppendLine($"* {evt.Name}");
                    result.AppendLine("    " + tickets);
                    result.AppendLine("");
                }

            }
            result.AppendLine("[menu] [alle] [allt] [buyt (id)]");
            return result.ToString();
        }

        public string Execute(IList<string> parameters)
        {

            if (parameters.Count == 0)
            {
                return this.Execute();
            }
            else
            {
                throw new ArgumentException(Messages.ParametersWarning);
            }
        }
    }
}