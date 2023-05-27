package dev.atsushieno.rtmidi_javacpp_app;
import dev.atsushieno.rtmidi_javacpp.RtMidiWrapper;
import dev.atsushieno.rtmidi_javacpp.global.rtmidi;
import org.bytedeco.javacpp.IntPointer;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        try (var w = new RtMidiWrapper()) {
            var api = rtmidi.rtmidi_out_create_default();
            var ptr = new IntPointer(0);
            for (int i = 0, n = rtmidi.rtmidi_get_port_count(api); i < n; i++) {
                System.out.println(rtmidi.rtmidi_get_port_name(api, i, null, ptr));
                int strLen = ptr.get();
                var buf = ByteBuffer.allocate(strLen);
                rtmidi.rtmidi_get_port_name(api, i, buf, ptr.asBuffer());
                var portName = new String(buf.array(), Charset.defaultCharset());
                System.out.println(portName);
            }
        }
    }
}