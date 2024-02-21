It is the topdir for samples. In other words, the project is independent of
rtmidi-javacpp library itself. It is because we cannot resolve `api project("rtmidi-javacpp")`
as `api "(...):rtmidi-javacpp-platform:+"`.
