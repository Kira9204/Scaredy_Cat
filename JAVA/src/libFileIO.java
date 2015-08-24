/***************************************************************
 * Name:      FileIOLib.java
 * Purpose:
 *
 * Simple file I/O methods
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class libFileIO
{
    public static String loadFile(String filePath) throws IOException
    {
        String contents = "";
        File file = new File(filePath);
        FileReader fr = new FileReader(file);
        char[] charContents = new char[ (int) file.length() ];
        fr.read(charContents);
        fr.close();
        contents = new String(charContents);

        return contents;
    }
}
