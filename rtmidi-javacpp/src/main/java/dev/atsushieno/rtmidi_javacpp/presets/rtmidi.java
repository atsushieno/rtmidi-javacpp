package dev.atsushieno.rtmidi_javacpp.presets;

import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.annotation.*;
import org.bytedeco.javacpp.tools.*;

@Properties(
    value = {
        @Platform(value = "linux", include = "<rtmidi/rtmidi_c.h>", link = "rtmidi#"),
        @Platform(value = "macosx", include = "<rtmidi/rtmidi_c.h>", link = "rtmidi.7#"),
        @Platform(value = "windows", include = "<rtmidi/rtmidi_c.h>", link = "rtmidi#")
    },
    target = "dev.atsushieno.rtmidi_javacpp",
    global = "dev.atsushieno.rtmidi_javacpp.global.RtMidi"
)
public class rtmidi implements InfoMapper {
    static { Loader.checkVersion("dev.atsushieno", "rtmidi_javacpp"); }

    public void map(InfoMap infoMap) {
       infoMap
               .put(new Info("RTMIDIAPI").cppText("#define RTMIDIAPI"))
               .put(new Info("RtMidiPtr").pointerTypes("@Cast(\"RtMidiPtr*\") Pointer"))
               .put(new Info("RtMidiInPtr").pointerTypes("@Cast(\"RtMidiInPtr*\") Pointer"))
               .put(new Info("RtMidiOutPtr").pointerTypes("@Cast(\"RtMidiOutPtr*\") Pointer"))
               .put(new Info("rtmidi_error").skip())
       ;
    }
}
