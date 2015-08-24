/***************************************************************
* Name:      Game.swift
* Purpose:
*
* The main game file, create an instance of this class to start the game
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/

import Foundation
public class Game
{
    static let path = "/Users/erik/Documents/Programming/Scarecrow/Scarecrow"
    private var cardManager = CardManager()
    private var player = [Player](count: 2, repeatedValue: Player(name: "", age: 0))
    
    init()
    {
        start()
    }
    
    private func start()
    {
        var titleScreen = ""
        do
        {
            try titleScreen = FileIOLib.loadFile("\(Game.path)/txt/title.txt")
            titleScreen += "\nThis game requires 2 players.\n"
        }
        catch let error as FileIOLib.FileIOException
        {
            Console.write(error)
        }
        catch{}
        Console.write(titleScreen)
        
        for i in 0...player.count-1
        {
            Console.write("Player \(i+1), what is your name?")
            let name = Console.read()
            var age = 0
            while age == 0
            {
                Console.write("\(name), how old are you?")
                do
                {
                    try age = Console.readInt()
                }
                catch Console.IOException.readInt(cause: "")
                {
                    Console.write("That is not a valid number!")
                    Console.write("Try again: ")
                }
                catch{}
            }
            player[i] = Player(name: name, age: age)
        }
        Console.write("Great! Lets get started")
        mainLoop()
    }
    
    private func mainLoop()
    {
        let maxScarecrows = 6
        for var scarecrows = 0, turn = 0; scarecrows<maxScarecrows; turn++
        {
            var pt = turn%2
            if turn<1
            {
                if player[0].getAge() > player[1].getAge()
                {
                    pt = 1
                    ++turn
                }
            }
            
            Console.write("\(player[pt].getName()), pick a card[enter]")
            Console.read()
            let picked = cardManager.pickCard()
            Console.write(picked.getArt())
            Console.write("\(player[pt].getName()) have picked up a \(picked.getName())")
            player[pt].addCard(picked)
            
            if picked.getType() == CardType.SCARECROW
            {
                ++scarecrows
                Console.write("\(scarecrows) out of \(maxScarecrows) scarecrows are at the table!")
            }
            else if picked.getType() == CardType.CAT
            {
                Console.write("\(player[pt].getName()) must return all of his cards to the deck!")
                cardManager.resetPlayerCards(player[pt].resetHand())
            }
            else
            {
                Console.write("The card is worth \(picked.getPoints()) of points")
                Console.write("\(player[pt].getName()) have a total of \(player[pt].getPoints()) points")
                Console.write("\(player[pt].getName())'s hand has card values \(player[pt].getCardVals())\n\n")
            }
        }
        end()
    }
    
    private func end()
    {
        var pw = 0
        if player[0].getPoints()<player[1].getPoints()
        {
            pw = 1
        }
        else if player[0].getPoints() == player[1].getPoints()
        {
            Console.write("\n\n\(player[0].getName()) and \(player[1].getName()) has the same score!")
            Console.write("It's a draw!")
            listPlayerScores()
            exit(0)
        }
        Console.write("\n\n\(player[pw].getName()) wins with a score of \(player[pw].getPoints()) points!\n")
        listPlayerScores()
        exit(0)
    }
    
    private func listPlayerScores()
    {
        for plo: Player in player
        {
            Console.write("\(plo.getName()) scored \(plo.getPoints()) points")
        }
    }
}