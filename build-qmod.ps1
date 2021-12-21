$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt
$BuildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $BuildScript += ".cmd"
}

$CFlags = ""
$ArchiveVersion = "1.2.0"
$SOPath = "./libs/arm64-v8a/libsmoothedcontroller.so"
if (-not ($args[0] -eq "--release")) {
    $CFlags = "-D_DEBUG"
    $ArchiveVersion += "_debug"
    $SOPath = "./obj/local/arm64-v8a/libsmoothedcontroller.so"
}

$ArchiveName = "smoothedcontroller_v" + $ArchiveVersion + ".qmod"
$TempArchiveName = $ArchiveName + ".zip"

& $BuildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk -j4 USER_CFLAGS=$CFlags
Compress-Archive -Path $SOPath, "./mod.json" -DestinationPath $TempArchiveName -Force
Move-Item $TempArchiveName $ArchiveName -Force
