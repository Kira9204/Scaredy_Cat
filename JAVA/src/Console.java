/***************************************************************
 * Name:      Console.java
 * Purpose:
 *
 * Console I/O
 * (std::cout C++ inspired)
 *
 * Author:    Erik Welander (erik.welander@hotmail.com)
 *
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Console
{
    private static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    Console(){}

    public static void out(String str)
    {
        System.out.print(str);
    }

    public static void endl()
    {
        System.out.println();
    }

    public static String in()
    {
        String line = "";
        try
        {
            line = br.readLine();
        }
        catch (IOException e)
        {
            new IOException("Console.java: in(): "+e);
        }
        return line;
    }

    public static int readInt() throws NumberFormatException
    {
        String input = in();
        return Integer.parseInt(input);
    }
}
