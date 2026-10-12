Msg("Activating Tank Versus\n");

DirectorOptions <-
{
    ActiveChallenge = 1
    cm_TankRun = 1
    cm_ShouldHurry = 1
    PreferredSpecialDirection = SPAWN_BEHIND_SURVIVORS
    BehindSurvivorsSpawnDistance = 2000
    TankRunSpawnDelay = 15

    cm_CommonLimit = 0
    CommonLimit = 0
    MegaMobSize = 0
    MobMaxPending = 0
    WanderingZombieDensityModifier = 0
    WitchLimit = 0

    // Tank is zombie class 8; this callback converts player infected spawns.
    function ConvertZombieClass( iClass )
    {
        return 8;
    }
}
