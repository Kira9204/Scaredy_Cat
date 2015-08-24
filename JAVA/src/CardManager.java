/***************************************************************
 * Name:      CardManager.swift
 * Purpose:
 *
 * Contains and manages all the logic related to the card pile
 * in the game.
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
public class CardManager
{
    private Card deck[] = new Card[49];
    private Card emptyCard = new Card(CardType.NOT_USED);

    CardManager()
    {
        initCards();
    }

    private void initCards()
    {
        Arrays.fill(deck, emptyCard);
        try
        {
            new CardArt(Game.path);
        } catch (final IOException ex)
        {
            Console.out("ERROR: Could not load card artwork!\nCause: "+ex.getCause()+"\n");
        }

        int numUsedCards = 0;
        final int numCats = 3;
        final int numScareCrows = 6;

        //This represents the number of birds (represented as points) each bird card has.
        //There are 6 different kind of bird card's with points ranging from 1-6.
        //Each index here represents the number of cards and points.
        final int numBirds[] = {12,10,8,4,4,2};

        //We want the lower part of the pile to have non-bird cards, since its easier to reset
        //the deck when a player picks up a cat.
        for(int i = 0; i < numCats; i++)
        {
            deck[numUsedCards] = new Card(CardType.CAT);
            ++numUsedCards;
        }
        for(int i = 0; i < numScareCrows; i++)
        {
            deck[numUsedCards] = new Card(CardType.SCARECROW);
            ++numUsedCards;
        }

        //Creates all the various bird cards
        // "i" represents the points the card is worth (use +1!)
        //"i2" represents the number of cards with the value of "i" that we should create
        for(int i = 0; i < numBirds.length; i++)
        {
            for(int i2 = 0; i2 < numBirds[i]; i2++)
            {
                deck[numUsedCards] = new Card(CardType.BIRD, (i+1));
                ++numUsedCards;
            }
        }
        shuffleCards();
    }

    private void shuffleCards()
    {
        Random r = new Random();
        for(int i = 0; i < 4; i++)
        {
            for(int i2 = 0; i2 < deck.length; i2++)
            {
                final int rIndex = r.nextInt(deck.length-1);
                final Card temp = deck[i2];
                deck[i2] = deck[rIndex];
                deck[rIndex] = temp;
            }
        }
    }

    public final Card pickCard()
    {
        Card picked = emptyCard;
        for(int i = 0; i < deck.length; i++)
        {
            if(deck[i].getType() != CardType.NOT_USED)
            {
                picked = deck[i];
                deck[i] = emptyCard;
                break;
            }
        }
        return picked;
    }

    public void resetPlayerCards(final Card[] playerCards)
    {
        deck[0] = new Card(CardType.CAT);
        for(int i = 0; i < playerCards.length; i++)
        {
            //The player has no more cards
            if(playerCards[i].getPoints() == 0)
            {
                break;
            }
            for(int i2 = 1; i2 < deck.length; i2++)
            {
                //We can only add a card to an empty card slot
                if(deck[i2].getType() == CardType.NOT_USED)
                {
                    deck[i2] = playerCards[i];
                    break;
                }
            }
        }
        shuffleCards();
    }
}