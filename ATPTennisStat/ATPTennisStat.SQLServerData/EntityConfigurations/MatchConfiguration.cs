﻿using ATPTennisStat.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ATPTennisStat.SQLServerData.EntityConfigurations
{
    public class MatchConfiguration : EntityTypeConfiguration<Match>
    {
        public MatchConfiguration()
        {
            this.HasRequired(m => m.Winner)
                    .WithMany(p => p.WonMatches)
                    .HasForeignKey(m => m.WinnerId)
                    .WillCascadeOnDelete(false);

            this.HasRequired(m => m.Loser)
                   .WithMany(p => p.LostMatches)
                   .HasForeignKey(m => m.LoserId)
                   .WillCascadeOnDelete(false);
        }
    }
}
