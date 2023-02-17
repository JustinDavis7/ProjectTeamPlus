using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SteamProject.DAL.Abstract;
using SteamProject.Models;
using Microsoft.AspNetCore.Identity;
using SteamProject.Services;

namespace SteamProject.Controllers;

public class LibraryController: Controller
{
    private readonly UserManager<IdentityUser> _userManager;
    private readonly IUserRepository _userRepostory;
    private readonly IGameRepository _gameRepository;
    private readonly ISteamServices _steamServices;

    public LibraryController(UserManager<IdentityUser> userManager, IUserRepository userRepository, IGameRepository gameRepository, ISteamServices steamServices)
    {
        _userManager = userManager;
        _userRepostory = userRepository;
        _gameRepository = gameRepository;
        _steamServices = steamServices;
    }

    public IActionResult Index()
    {
        if(_userManager.GetUserId(User) is null)
        {
            return View();
        }
        else
        {
            var id = _userManager.GetUserId(User);
            var user = _userRepostory.GetUser(id);
            var tempGames = _steamServices.GetGames(user.SteamId, user.Id, user);
            var games = _steamServices.GetGameDescriptions(tempGames);
            foreach(var game in games)
            {
                user.Games.Add(game);
            }
            return View(user);
        }
    }
}