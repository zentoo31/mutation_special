Msg("Activating Tank Versus base test\n");
printl("MAIN_MUTATION_VSCRIPT_LOADED");

local MainMutationClownModel = "models/infected/common_male_clown.mdl";

local MainMutationDefaultItems =
[
    "weapon_melee",
    "weapon_pain_pills",
    "weapon_adrenaline"
];

local MainMutationWeaponConversions =
{
    weapon_first_aid_kit = "weapon_pain_pills_spawn"
};

local MainMutationFirearmSpawns =
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

local function IsMainMutationFirearm( classname )
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
        if ( classname in MainMutationWeaponConversions )
            return MainMutationWeaponConversions[classname];

        return 0;
    }

    function GetDefaultItem( idx )
    {
        if ( idx < MainMutationDefaultItems.len() )
            return MainMutationDefaultItems[idx];

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
        return !IsMainMutationFirearm(classname);
    }

    function ConvertZombieClass( infectedClass )
    {
        return 8;
    }
}

function ApplyMainMutationClownModels()
{
    local infected = null;
    while ( infected = Entities.FindByClassname(infected, "infected") )
    {
        if ( infected.GetModelName() != MainMutationClownModel )
            infected.SetModel(MainMutationClownModel);
    }

    EntFire("worldspawn", "CallScriptFunction", "ApplyMainMutationClownModels", 1.0);
}

function OnGameEvent_round_start_post_nav( params )
{
    PrecacheModel(MainMutationClownModel);

    foreach ( classname in MainMutationFirearmSpawns )
    {
        local weaponSpawn = null;
        while ( weaponSpawn = Entities.FindByClassname(weaponSpawn, classname) )
            weaponSpawn.Kill();
    }

    EntFire("worldspawn", "CallScriptFunction", "ApplyMainMutationClownModels", 0.1);
}
