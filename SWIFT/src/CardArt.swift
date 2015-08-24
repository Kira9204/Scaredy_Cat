/***************************************************************
* Name:      CardArt.swift
* Purpose:
*
* This class is a static container of cards artwork,
* it enables cards to easily access common data so it won't
* have to get repeated.
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/
import Foundation

public class CardArt
{
    private static var cardArt = [String](count: CardType.SCARECROW.rawValue, repeatedValue: "")
    init(path: String)
    {
        do
        {
            try CardArt.cardArt.insert(FileIOLib.loadFile("\(path)/txt/cat.txt"), atIndex: CardType.CAT.rawValue)
            try CardArt.cardArt.insert(FileIOLib.loadFile("\(path)/txt/bird.txt"), atIndex: CardType.BIRD.rawValue)
            try CardArt.cardArt.insert(FileIOLib.loadFile("\(path)/txt/scarecrow.txt"), atIndex: CardType.SCARECROW.rawValue)
        }
        catch let error as FileIOLib.FileIOException
        {
            Console.write(error)
        }
        catch{}
    }

    public static func getCardArt(cardType: CardType) -> String
    {
        return CardArt.cardArt[cardType.rawValue]
    }
}
