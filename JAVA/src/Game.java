/***************************************************************
 * Name:      Game.swift
 * Purpose:
 *
 * The main game file, create an instance of this class to start the game
 *
 * Author:    Erik Welander (mail@erikwelander.se)
 * Version:   2015-07-30
 * Copyright: Erik Welander (https://www.facebook.com/erik.welander)
 * License:   Creative Commons "by-nc-nd"
 **************************************************************/
import java.io.IOException;
public class Game
{
    static final String path = ".";
    private CardManager cardManager = new CardManager();
    private Player player[] = new Player[2];

    Game()
    {
        start();
    }

    private void start()
    {
        String titleScreen = "";
        try
        {
            titleScreen = libFileIO.loadFile(path+"/txt/title.txt");
            titleScreen += "\nThis game requires 2 players.\n";
        }
        catch(final IOException ex)
        {
            Console.out("ERROR: Could not load titlescreen artwork from file!\nCause: "+ex.getCause()+"\n");
        }
        Console.out(titleScreen);

        for(int i = 0; i < player.length; i++)
        {
            Console.out("Player " + (i + 1) + ", what is yout name? ");
            final String name = Console.in();
            int age = 0;
            while(age == 0)
            {
                Console.out(name+", how old are you? ");
                try
                {
                    age = Console.readInt();
                }
                catch(final NumberFormatException ex)
                {
                    Console.out("That is not a valid number!\n");
                    Console.out("Try again: ");
                }
            }
            player[i] = new Player(name, age);
        }
        Console.out("Great! Let's get stated!\n");
        mainLoop();
    }

    private void mainLoop()
    {
        final int maxScarecrows = 6;
        for(int scarecrows = 0, turn = 0; scarecrows < maxScarecrows; turn++)
        {
            int pt = turn%2;
            if(turn < 1)
            {
                if(player[0].getAge() > player[1].getAge())
                {
                    pt = 1;
                    ++turn;
                }
            }

            Console.out(player[pt].getName() + ", pick a card[enter]");
            Console.in();
            final Card picked = cardManager.pickCard();
            Console.out(picked.getArt()+"\n");
            Console.out(player[pt].getName() + " have picked up a " + picked.getName() + "\n");
            player[pt].addCard(picked);

            if(picked.getType() == CardType.SCARECROW)
            {
                ++scarecrows;
                Console.out(""+scarecrows+" out of "+maxScarecrows+" are at the table\n");
            }
            else if(picked.getType() == CardType.CAT)
            {
                Console.out(player[pt].getName()+" must return all of his cards to the deck!\n");
                cardManager.resetPlayerCards(player[pt].resetHand());
            }
            else
            {
                Console.out("The card is worth "+picked.getPoints()+" points\n\n");
                final String playerName = player[pt].getName();
                Console.out(playerName+" have a total of "+player[pt].getPoints()+" points\n");
                Console.out(playerName+"'s hand has card values "+player[pt].getCardVals()+"\n\n");
            }
        }
        end();
    }

    private void end()
    {
        int pw = 0;
        int p1p = player[0].getPoints();
        int p2p = player[1].getPoints();
        if(p1p < p2p)
        {
            pw = 1;
        }
        else if(p1p == p2p)
        {
            Console.out("\n\n"+player[0].getName()+" and "+player[1].getName()+" has the same score!\n");
            Console.out("It's a draw!\n");
            listPlayerScores();
            System.exit(0);
        }
        Console.out("\n\n"+player[pw].getName()+" wins with a score of "+player[pw].getPoints()+" points!\n");
        listPlayerScores();
        System.exit(0);
    }

    private void listPlayerScores()
    {
        for(Player pl: player)
        {
            Console.out(pl.getName()+" scored "+pl.getPoints()+" points\n");
        }
    }
}
