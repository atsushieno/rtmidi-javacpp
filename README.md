# rtmidi-javacpp README

It is an attempt tp bind rtmidi for Kotlin (and Java) using JavaCPP.

I have atsushieno/rtmidi-jna, but it is getting impossible to maintain it without maintained JNAerator, especially on Apple Silicon. So I'm thinking to replace it with something else. It is such an alternative attempt.

## Current status

Currently we have binary releases for Linux x64 and Mac arm64/x64. Once Windows build is unf*cked, we can publish Windows binary too (but do not expect any work from @atsushieno, I'm tired of it - I leave it to whoever loves Windows). It's not about cross compiling Kotlin code.

So far it builds and usable IF there is a corresponding platform library package available somewhere on a Maven repository (such as `mavenCentral()`).

Otherwise it fails to resolve those platform jars (e.g. `rtmidi-javacpp-linux_arm64.jar`, even on Linux, Windows or Intel Mac). I'm not quite sure if javacpp or gradle-javacpp can resolve this kind of hard dependency issue and/or whether they think it is a problem.

## Licenses

The binding is released under the MIT license. Dependencies have their
respective licenses.
