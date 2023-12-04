
New-Item -ItemType Directory -Force -Path "build\$PLATFORM"
Set-Location "build\$PLATFORM"

$DIST = (Get-Location).Path

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $PSCommandPath

echo "DIST: $DIST"
echo "ScriptDir: $ScriptDir"

dir
Set-Location "$ScriptDir\..\external\rtmidi"
if (-not (Test-Path .patch.stamp)) {
    patch -i $ScriptDir\..\workaround-javacpp-code-generator-issue.patch -p1
    New-Item -ItemType File -Name .patch.stamp
}
cmake -B "build-$PLATFORM" -DCMAKE_BUILD_TYPE=Release
cmake --build "build-$PLATFORM"
cmake --install "build-$PLATFORM" --prefix $DIST

