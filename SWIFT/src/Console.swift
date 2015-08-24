/***************************************************************
* Name:      Console.swift
* Purpose:
*
* Console I/O
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-23
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/

import Foundation

public class Console
{
    public enum IOException: ErrorType
    {
        case readInt(cause: String)
    }
    
    public static func write<T>(value: T)
    {
        print(value)
    }
    
    public static func read() ->String
    {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let result = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
        
        return result.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    }
    
    public static func readInt() throws ->Int
    {
        
        let input = read()
        let num: Int?
        num = Int(input)
        if(nil == num)
        {
            throw IOException.readInt(cause: "Input in not a number!")
        }
        return num!
    }
}