/***************************************************************
* Name:      Console.swift
* Purpose:
*
* Contains information about a specific card.
* This class has memory optimization in mind as it
* refters to one common instance of artwork and name.
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/
import Foundation

public class Card
{
    private var type: CardType = CardType.NOT_USED
    private var points: Int = 0
    init(type: CardType)
    {
        self.type = type
        self.points = 0
    }
    init(type: CardType, points: Int)
    {
        self.type = type
        self.points = points
    }
    public func getType() -> CardType
    {
        return self.type
    }
    public func getPoints() -> Int
    {
        return self.points
    }
    public func getArt() -> String
    {
        return CardArt.getCardArt(type)
    }
    public func getName() -> String
    {
        return CardManager.cardName[type.rawValue]
    }
}
