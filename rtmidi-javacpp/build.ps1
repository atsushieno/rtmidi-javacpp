
New-Item -ItemType Directory -Force -Path "build\$Env:PLATFORM"
Set-Location "build\$Env:PLATFORM"

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
cmake -B "build-$PLATFORM" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=false -G "NMake Makefiles"
cmake --build "build-$PLATFORM"

#cmake --install "build-$PLATFORM" --prefix $DIST
New-Item -ItemType Directory -Path "$DIST\include\rtmidi" -Force
New-Item -ItemType Directory -Path "$DIST\lib" -Force
Copy "*.h" "$DIST\include\rtmidi"
Copy "build-$PLATFORM\Debug\rtmidi.*" "$DIST\lib"

