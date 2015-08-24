/***************************************************************
 * Name:      Player.swift
 * Purpose:
 *
 * Contains player data and various functions to extract useful
 * information about the contents stored
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
import java.util.Arrays;
public class Player
{
    private final String name;
    private final int age;
    private Card hand[] = new Card[40];
    private final Card emptyCard = new Card(CardType.NOT_USED);

    Player(final String name, final int age)
    {
        this.name = name;
        this.age = age;
        Arrays.fill(hand, emptyCard);
    }

    public final String getName()
    {
        return this.name;
    }

    public final int getAge()
    {
        return this.age;
    }

    public final int getPoints()
    {
        int points = 0;
        for(Card card: hand)
        {
            if(card.getType() == CardType.NOT_USED)
            {
                break;
            }
            points += card.getPoints();
        }
        return points;
    }

    public final String getCardVals()
    {
        String values = "";
        for(Card card: hand)
        {
            if(card.getType() == CardType.NOT_USED)
            {
                break;
            }
            //Why include the cards that are not worth any points?
            //This will exclude Cats and Scarecrows
            if(card.getPoints() != 0)
            {
                values += ""+card.getPoints()+", ";
            }
        }
        return values;
    }

    public void addCard(final Card card)
    {
        for(int i = 0; i < hand.length; i++)
        {
            if(hand[i].getType() == CardType.NOT_USED)
            {
                hand[i] = card;
                break;
            }
        }
    }

    public Card[] resetHand()
    {
        Card handOut[] = new Card[hand.length];
        for(int i = 0; i < hand.length; i++)
        {
            if(hand[i].getType() != CardType.NOT_USED)
            {
                handOut[i] = hand[i];
                hand[i] = this.emptyCard;
            }
            else
            {
                handOut[i] = this.emptyCard;
            }
        }
        return handOut;
    }
}
