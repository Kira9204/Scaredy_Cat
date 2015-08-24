/***************************************************************
 * Name:      CardArt.swift
 * Purpose:
 *
 * This class is a static container of cards artwork,
 * it enables cards to easily access common data so it won't
 * have to get repeated.
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
import java.io.IOException;
public class CardArt
{
    private static String cardArt[] = new String[CardType.NUM_ITEMS.ordinal()];

    CardArt(final String path) throws IOException
    {
        this.cardArt[CardType.NOT_USED.ordinal()] = "";
        this.cardArt[CardType.CAT.ordinal()] = libFileIO.loadFile(path+"/txt/cat.txt");
        this.cardArt[CardType.BIRD.ordinal()] = libFileIO.loadFile(path+"/txt/bird.txt");
        this.cardArt[CardType.SCARECROW.ordinal()] = libFileIO.loadFile(path+"/txt/scarecrow.txt");
    }

    public static final String getCardArt(final CardType cType)
    {
        return cardArt[cType.ordinal()];
    }
}