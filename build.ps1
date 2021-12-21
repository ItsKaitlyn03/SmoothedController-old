$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt
$BuildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $BuildScript += ".cmd"
}

$CFlags = ""
if (-not ($args[0] -eq "--release")) {
    $CFlags = "-D_DEBUG"
}

& $BuildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk -j4 USER_CFLAGS=$CFlags
Exit $LASTEXITCODE
