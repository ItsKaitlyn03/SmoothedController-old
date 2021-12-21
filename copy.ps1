& $PSScriptRoot/build.ps1
if ($?) {
    adb push obj/local/arm64-v8a/libsmoothedcontroller.so /sdcard/Android/data/com.beatgames.beatsaber/files/mods/libsmoothedcontroller.so
    if ($?) {
        & $PSScriptRoot/restart-game.ps1
        if ($args[0] -eq "--log") {
            & $PSScriptRoot/start-logging.ps1
        }
    }
}
