Msg("Activating Tank Versus\n");
printl("TANK_VERSUS_SCRIPT_LOADED");

local TankVersusClownModel = "models/infected/common_male_clown.mdl";

local TankVersusDefaultItems =
[
    "weapon_melee",
    "weapon_pain_pills",
    "weapon_adrenaline"
];

local TankVersusWeaponConversions =
{
    weapon_first_aid_kit = "weapon_pain_pills_spawn"
};

local TankVersusFirearmSpawns =
[
    "weapon_pistol_spawn",
    "weapon_pistol_magnum_spawn",
    "weapon_smg_spawn",
    "weapon_smg_silenced_spawn",
    "weapon_smg_mp5_spawn",
    "weapon_pumpshotgun_spawn",
    "weapon_shotgun_chrome_spawn",
    "weapon_autoshotgun_spawn",
    "weapon_shotgun_spas_spawn",
    "weapon_rifle_spawn",
    "weapon_rifle_ak47_spawn",
    "weapon_rifle_desert_spawn",
    "weapon_rifle_sg552_spawn",
    "weapon_hunting_rifle_spawn",
    "weapon_sniper_military_spawn",
    "weapon_sniper_scout_spawn",
    "weapon_sniper_awp_spawn",
    "weapon_grenade_launcher_spawn",
    "weapon_rifle_m60_spawn",
    "weapon_chainsaw_spawn"
];

local function IsFirearmSpawn( classname )
{
    return classname.find("weapon_pistol") != null ||
           classname.find("weapon_rifle") != null ||
           classname.find("weapon_shotgun") != null ||
           classname.find("weapon_smg") != null ||
           classname.find("weapon_sniper") != null ||
           classname.find("weapon_hunting_rifle") != null ||
           classname.find("weapon_grenade_launcher") != null ||
           classname.find("weapon_chainsaw") != null;
}

MutationOptions <-
{
    NoMobSpawns = false
    CommonLimit = 15
    cm_CommonLimit = 15
    MegaMobSize = 15
    MobMaxPending = 15
    WanderingZombieDensityModifier = 1

    function ConvertWeaponSpawn( classname )
    {
        if ( classname in TankVersusWeaponConversions )
            return TankVersusWeaponConversions[classname];

        return 0;
    }

    function GetDefaultItem( idx )
    {
        if ( idx < TankVersusDefaultItems.len() )
            return TankVersusDefaultItems[idx];

        return 0;
    }
}

DirectorOptions <-
{
    ActiveChallenge = 1
    cm_TankRun = 1
    cm_ShouldHurry = 1
    CommonLimit = 15
    cm_CommonLimit = 15
    NoMobSpawns = false
    MegaMobSize = 15
    MobMaxPending = 15
    WanderingZombieDensityModifier = 1
    WitchLimit = 1
    TankLimit = 4
    cm_TankLimit = 4

    function AllowWeaponSpawn( classname )
    {
        return !IsFirearmSpawn(classname);
    }

    function ConvertZombieClass( infectedClass )
    {
        return 8;
    }
}

function ApplyTankVersusClownModels()
{
    local infected = null;
    while ( infected = Entities.FindByClassname(infected, "infected") )
    {
        if ( infected.GetModelName() != TankVersusClownModel )
            infected.SetModel(TankVersusClownModel);
    }

    EntFire("worldspawn", "CallScriptFunction", "ApplyTankVersusClownModels", 1.0);
}

function OnGameEvent_round_start_post_nav( params )
{
    PrecacheModel(TankVersusClownModel);

    foreach ( classname in TankVersusFirearmSpawns )
    {
        local weaponSpawn = null;
        while ( weaponSpawn = Entities.FindByClassname(weaponSpawn, classname) )
            weaponSpawn.Kill();
    }

    EntFire("worldspawn", "CallScriptFunction", "ApplyTankVersusClownModels", 0.1);
}
