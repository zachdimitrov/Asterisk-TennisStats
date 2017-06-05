﻿using System;
using System.Collections.Generic;

namespace ATPTennisStat.Models
{
    public class Player
    {
        private ICollection<Match> wonMatches;
        private ICollection<Match> lostMatches;


        public Player()
        {
            this.wonMatches = new HashSet<Match>();
            this.lostMatches = new HashSet<Match>();

        }

        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public float Height { get; set; }

        public float Weight { get; set; }

        public DateTime BirthDate { get; set; }

        public int Ranking { get; set; }

        public virtual City City { get; set; }

        public virtual Coach Coach { get; set; }


        public virtual ICollection<Match> WonMatches { get; set; }
        public virtual ICollection<Match> LostMatches { get; set; }


    }
}
