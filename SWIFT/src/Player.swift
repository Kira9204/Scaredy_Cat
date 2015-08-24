/***************************************************************
* Name:      Player.swift
* Purpose:
*
* Contains player data and various functions to extract useful
* information about the contents stored
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/
import Foundation
public class Player
{
    private var name = ""
    private var age = 0
    private var hand = [Card](count: 40, repeatedValue: Card(type: CardType.NOT_USED))
    private let emptyCard = Card(type: CardType.NOT_USED)
    
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    
    public func getName() -> String
    {
        return self.name
    }
    
    public func getAge() -> Int
    {
        return self.age
    }
    
    public func getPoints() -> Int
    {
        var points = 0
        for card: Card in hand
        {
            if card.getType() == CardType.NOT_USED
            {
                break
            }
            points += card.getPoints()
        }
        return points
    }
    
    public func getCardVals() -> String
    {
        var values = ""
        for card: Card in hand
        {
            if card.getType() == CardType.NOT_USED
            {
                break
            }
            //Why include the cards that are not worth any points?
            //This will exclude Cats and Scarecrows
            if card.getPoints() != 0
            {
                values += "\(card.getPoints()), "
            }
        }
        return values

    }
    
    public func addCard(card: Card)
    {
        for i in 0...hand.count-1
        {
            if hand[i].getType() == CardType.NOT_USED
            {
                hand[i] = card
                break
            }
        }
    }
    
    public func resetHand() -> Array<Card>
    {
        var handOut = [Card](count: hand.count, repeatedValue: Card(type: CardType.NOT_USED))
        for i in 0...hand.count-1
        {
            if hand[i].getType() != CardType.NOT_USED
            {
                handOut[i] = hand[i]
                hand[i] = self.emptyCard
            }
            else
            {
                handOut[i] = self.emptyCard
            }
        }
        return handOut
    }
}