package se.kth.decompiler;

import java.io.File;

public class JADXTest {

    JADX jadx;

    //@Before
    public void setUp() throws Exception {
        jadx = new JADX();
    }

    //@Test
    public void decompile() {

        File in = new File("src/test/resources/DiffImpl.class");
        File out = new File("src/test/resources/");

        jadx.decompile(in, out, "", new String[0]);
    }
}