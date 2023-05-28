
New-Item -ItemType Directory -Force -Path "build\$PLATFORM"
Set-Location "build\$PLATFORM"

$DIST = (Get-Location).Path

$ErrorActionPreference = "Stop"

$PWD = (Get-Location).Path

Set-Location "$PWD\..\..\..\external\rtmidi"
if (-not (Test-Path .patch.stamp)) {
    patch -i $PWD\..\..\workaround-javacpp-code-generator-issue.patch -p1
    New-Item -ItemType File -Name .patch.stamp
}
cmake -B "build-$PLATFORM"
cmake --build "build-$PLATFORM"
cmake --install "build-$PLATFORM" --prefix $DIST

