﻿namespace ATPTennisStat.ConsoleClient.Core.Utilities
{
    public static class Messages
    {
        internal static string GenerateWelcomeMessage()
        {
            return @" < WELCOME TO ASTERISK - TENNIS STATS >
----------------------------------------
   Please input the command from the 
   options below and press <enter>
----------------------------------------";
        }

        internal static string GenerateMainMenu()
        {
            return @"
 [r] Tennis reporters
 [s] Tennis statistics menu
 [t] Ticket store menu
 [l] Show all logs
 [i] Team Asterisk info
 [exit]";
        }

        internal static string GenerateReportersMenu()
        {
            return @"
 [pdfm] Create PDF report for matches
 [pdfr] Create PDF report for ranking";
        }

        internal static string GenerateTicketMenu()
        {
            return @"
 [allt] Show all tickets
 [alle] Show all events
 [buyt (id)] buy a ticket with (id)
 [menu] Back to main menu";
        }

        internal static string GenerateDataMenu()
        {
            return @"
 [show] Show tennis data menu
 [add] Add tennis data menu
 [menu] Back to main menu";
        }

        internal static string GenerateDataAddMenu()
        {
            return @"
 [addco (name)] Add new country
 [addct (name) (country)] Add new city
 [addp (2 - 7 arguments)] Add new player
 [updatep (id)] Update Player with id
 [addt (4 - 10 arguments)] Add new tournament
 [addm (6 arguments)] Add new match
 [delm (id)] Delete Match with id
 [menu] [show]";
        }

        internal static string GenerateDataShowMenu()
        {
            return @"
 [showp (id)] Show all players of filter by id
 [showt (id)] Show all tournaments of filter by id
 [showm (id)] Show all mathes of filter by id
 [menu] [add]";
        }
    }
}
