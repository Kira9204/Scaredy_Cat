/***************************************************************
 * Name:      Card.swift
 * Purpose:
 *
 * Contains information about a specific card.
 * This class has memory optimization in mind as it
 * refers to one common instance of artwork and name.
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
public class Card
{
    private CardType cType = CardType.NOT_USED;
    private int points = 0;

    Card(final CardType cType)
    {
        this.cType = cType;
        this.points = 0;
    }

    Card(final CardType cType, final int points)
    {
        this.cType = cType;
        this.points = points;
    }

    public final CardType getType()
    {
        return this.cType;
    }

    public final int getPoints()
    {
        return this.points;
    }

    public final String getArt()
    {
        return CardArt.getCardArt(this.cType);
    }

    public final String getName()
    {
        return this.cType.toString();
    }
}
