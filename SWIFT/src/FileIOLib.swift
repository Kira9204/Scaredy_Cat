/***************************************************************
* Name:      FileIOLib.swift
* Purpose:
*
* Easy file to string implementation
*
* Author:    Erik Welander (mail@erikwelander.se)
* Version:   2015-07-29
* Copyright: Erik Welander (https://www.facebook.com/erik.welander)
* License:   Creative Commons "by-nc-nd"
**************************************************************/

import Foundation

public class FileIOLib
{
    public enum FileIOException: ErrorType
    {
        case readError(cause: String)
    }
    
    public static func loadFile(filePath: String) throws ->String
    {
        let content: String?
        do
        {
            try content = String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
        }
        catch let error as NSError
        {
            throw FileIOException.readError(cause: "Could not open '\(filePath)': \(error.localizedDescription)")
        }
        return content!
    }
}