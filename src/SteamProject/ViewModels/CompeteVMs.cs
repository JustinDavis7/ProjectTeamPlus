
using SteamProject.Models;
using SteamProject.Models.DTO;

namespace SteamProject.ViewModels;


public class CompeteIndexVM
{
    public List<Competition> Competitions { get; set; }

    public CompeteIndexVM(){}

}

public class CompeteDetailsVM
{
    public Competition CurrentComp { get; set; } = null;
    public Game Game { get; set; } = null;
    public List<CompetitionPlayer> CompPlayers { get; set; } = null;
    public List<User> Players { get; set; } = null;
    public List<CompetitionGameAchievement> CompGameAchList { get; set; } = null;
    public List<GameAchievement> GameAchList { get; set; } = null;
    public List<KeyValuePair<UserAchievement, User>> Tracking { get; set; }
}


public class CompeteInitiateVM
{
    public List<UserAchievement> UsersAchievements { get; set; } = null!;
    public List<UserAchievement> FriendsAchievements { get; set; } = null!;
    public Competition CurrentCompetition { get; set; } = null!;
    public Game ChosenGame { get; set; } = null!;
    public string MySteamId { get; set; }

    public CompeteInitiateVM(){}

    public CompeteInitiateVM( List<UserAchievement> users, List<UserAchievement> friends ) 
    {
        UsersAchievements = users;
        FriendsAchievements = friends;
    }
}


public class CompeteCreateVM
{
    public string SteamId { get; set; }
    public int SinId { get; set; }

    public string OpponentId { get; set; }
    public List<string> OpponentIds { get; set; }

    public int GameAppId { get; set; }

    public string MinDate { get; set; } = DateTime.Now.ToString("yyyy'-'MM'-'dd'T'HH:mm");


    public List<string> AchievementApiNames { get; set; }
    
    public DateTime CompStartTime { get; set; }
    public DateTime CompEndTime { get; set; }

}