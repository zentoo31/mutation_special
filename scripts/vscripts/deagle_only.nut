printl("DEAGLE_ONLY_VSCRIPT_LOADED");

local weaponsToReplace =
{
    weapon_pistol = true
    weapon_pistol_spawn = true
    weapon_smg = true
    weapon_smg_spawn = true
    weapon_smg_silenced = true
    weapon_smg_silenced_spawn = true
    weapon_smg_mp5 = true
    weapon_smg_mp5_spawn = true
    weapon_pumpshotgun = true
    weapon_pumpshotgun_spawn = true
    weapon_shotgun_chrome = true
    weapon_shotgun_chrome_spawn = true
    weapon_autoshotgun = true
    weapon_autoshotgun_spawn = true
    weapon_shotgun_spas = true
    weapon_shotgun_spas_spawn = true
    weapon_rifle = true
    weapon_rifle_spawn = true
    weapon_rifle_ak47 = true
    weapon_rifle_ak47_spawn = true
    weapon_rifle_desert = true
    weapon_rifle_desert_spawn = true
    weapon_rifle_sg552 = true
    weapon_rifle_sg552_spawn = true
    weapon_hunting_rifle = true
    weapon_hunting_rifle_spawn = true
    weapon_sniper_military = true
    weapon_sniper_military_spawn = true
    weapon_sniper_scout = true
    weapon_sniper_scout_spawn = true
    weapon_sniper_awp = true
    weapon_sniper_awp_spawn = true
    weapon_grenade_launcher = true
    weapon_grenade_launcher_spawn = true
    weapon_rifle_m60 = true
    weapon_rifle_m60_spawn = true
    weapon_chainsaw = true
    weapon_chainsaw_spawn = true
    weapon_melee = true
    weapon_melee_spawn = true
    weapon_molotov = true
    weapon_molotov_spawn = true
    weapon_pipe_bomb = true
    weapon_pipe_bomb_spawn = true
    weapon_vomitjar = true
    weapon_vomitjar_spawn = true
}

DirectorOptions <-
{
    ActiveChallenge = 1

    function ConvertWeaponSpawn( classname )
    {
        if ( classname in weaponsToReplace )
            return "weapon_pistol_magnum_spawn";

        return 0;
    }
}

function OnGameEvent_player_spawn( params )
{
    local player = GetPlayerFromUserID( params.userid );
    if ( player == null || NetProps.GetPropInt( player, "m_iTeamNum" ) != 2 )
        return;

    local inventory = {};
    GetInvTable( player, inventory );
    if ( inventory != null && ("slot1" in inventory) && inventory.slot1 != null )
    {
        if ( inventory.slot1.GetClassname() == "weapon_pistol_magnum" )
            return;

        inventory.slot1.Kill();
    }

    player.GiveItem( "weapon_pistol_magnum" );
}
