/***************************************************************
* Name:      CardManager.swift
* Purpose:
*
* Contains and manages all the logic related to the card pile
* in the game.
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/

import Foundation

public enum CardType: Int
{
    case NOT_USED = 0, CAT, BIRD, SCARECROW
    static var count: Int {return CardType.SCARECROW.rawValue}
}

public class CardManager
{
    public enum Exceptions: ErrorType
    {
        case MalformedDeckException(cause: String)
    }
    static let cardName: Array<String> = ["NOT_USED","CAT","BIRD","SCARECROW"]
    
    private var deck = [Card](count: 49, repeatedValue: Card(type: CardType.NOT_USED))
    private let emptyCard = Card(type: CardType.NOT_USED)
    
    init()
    {
        initCards()
    }
    
    private func initCards()
    {
        CardArt(path: Game.path)
        
        var numUsedCards = 0
        let numCats = 3
        let numScarecrows = 6
        //This represents the number of birds (represented as points) each bird card has.
        //There are 6 different kind of bird card's with points ranging from 1-6.
        //Each index here represents the number of cards and points.
        let numBirds: Array<Int> = [12,10,8,4,4,2]
        
        //We want the lower part of the pile to have non-bird cards, since its easier to reset
        //the deck when a player picks up a cat.
        for _ in 0...numCats-1
        {
            deck[numUsedCards] = Card(type: CardType.CAT)
            ++numUsedCards
        }
        for _ in 0...numScarecrows-1
        {
            deck[numUsedCards] = Card(type: CardType.SCARECROW)
            ++numUsedCards
        }
        //Creates all the various bird cards
        // "i" represents the points the card is worth (use +1!)
        //"i2" represents the number of cards with the value of "i" that we should create
        for i in 0...numBirds.count-1
        {
            for _ in 0...numBirds[i]-1
            {
                deck[numUsedCards] = Card(type: CardType.BIRD, points: i+1)
                ++numUsedCards
            }
        }
        shuffleCards()
    }
    
    private func shuffleCards()
    {
        for _ in 0...4
        {
            for i2 in 0...deck.count-1
            {
                let rIndex = Int(arc4random_uniform(UInt32(deck.count)))
                let temp = deck[i2]
                deck[i2] = deck[rIndex]
                deck[rIndex] = temp
            }
        }
    }
    
    public func pickCard() ->Card
    {
        var picked = emptyCard
        for i in 0...deck.count-1
        {
            if deck[i].getType() != CardType.NOT_USED
            {
                picked = deck[i]
                deck[i] = emptyCard
                break
            }
        }
        return picked
    }
    
    public func resetPlayerCards(playerCards: Array<Card>)
    {
        deck[0] = Card(type: CardType.CAT)
        for i in 0...playerCards.count-1
        {
            //The player has no more cards
            if playerCards[i].getPoints() == CardType.NOT_USED.rawValue
            {
                break
            }
            for i2 in 1...deck.count-1
            {
                //We can only add a card to an empty card slot
                if deck[i2].getType() == CardType.NOT_USED
                {
                    deck[i2] = playerCards[i]
                    break
                }
            }
        }
        shuffleCards()
    }
}