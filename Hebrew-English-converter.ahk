#Requires AutoHotkey v2.0

/**
 * Hebrew-English Keyboard Layout Converter
 * * Description: Fixes text typed in the wrong keyboard layout.
 * Shortcut 1: Ctrl + Shift + H (Converts English to Hebrew)
 * Shortcut 2: Ctrl + Shift + E (Converts Hebrew to English)
 * * Author: matanegel
 * Version: 1.0
 */



; --- HOTKEY 1: English to Hebrew (Ctrl + Shift + H) ---
^+h::
{
    ; 1. Backup the current clipboard content (images, files, or formatted text)
    OldClipboard := ClipboardAll()
    
    ; 2. Clear the clipboard to ensure ClipWait works correctly
    A_Clipboard := "" 
    
    ; 3. Trigger the Copy command
    Send "^c"
    
    ; 4. Wait up to 1 second for the clipboard to receive the text
    if !ClipWait(1)
    {
        return ; Exit if no text was selected or copy failed
    }

    ; 5. Process the captured text through the conversion function
    ConvertedText := ConvertEnglishToHebrew(A_Clipboard)
    
    ; 6. Put the converted text into the clipboard and paste it
    A_Clipboard := ConvertedText
    Send "^v"
    
    ; 7. Brief pause to ensure the paste command finishes before restoring old data
    Sleep 150
    
    ; 8. Restore the original clipboard content
    A_Clipboard := OldClipboard
}

; --- HOTKEY 2: Hebrew to English (Ctrl + Shift + E) ---
^+e::
{
    ; 1. Backup the current clipboard content (images, files, or formatted text)
    OldClipboard := ClipboardAll()
    
    ; 2. Clear the clipboard to ensure ClipWait works correctly
    A_Clipboard := "" 
    
    ; 3. Trigger the Copy command
    Send "^c"
    
    ; 4. Wait up to 1 second for the clipboard to receive the text
    if !ClipWait(1)
    {
        return ; Exit if no text was selected or copy failed
    }

    ; 5. Process the captured text through the conversion function
    ConvertedText := ConvertHebrewToEnglish(A_Clipboard)
    
    ; 6. Put the converted text into the clipboard and paste it
    A_Clipboard := ConvertedText
    Send "^v"
    
    ; 7. Brief pause to ensure the paste command finishes before restoring old data
    Sleep 150
    
    ; 8. Restore the original clipboard content
    A_Clipboard := OldClipboard
}



/**
 * Maps English keyboard characters to their Hebrew equivalents based on physical position.
 * @param input The string of text to convert.
 * @returns {String} The converted Hebrew text.
 */
ConvertEnglishToHebrew(input)
{
    ; Create a Map of key-value pairs (EnglishChar, HebrewChar)
    mapObj := Map(
        "q", "/", "w", "'", "e", "ק", "r", "ר", "t", "א", "y", "ט", "u", "ו", "i", "ן", "o", "ם", "p", "פ",
        "a", "ש", "s", "ד", "d", "ג", "f", "כ", "g", "ע", "h", "י", "j", "ח", "k", "ל", "l", "ך", ";", "ף", "'", ",",
        "z", "ז", "x", "ס", "c", "ב", "v", "ה", "b", "נ", "n", "מ", "m", "צ", ",", "ת", ".", "ץ", "/", ".",
        "[", "]", "]", "[", "{", "}", "}", "{"
    )

    result := ""
    
    ; Loop through each character in the input string
    Loop Parse, input
    {
        ; Convert character to lowercase to match the Map keys
        char := StrLower(A_LoopField)
        
        ; If the character exists in our map, add the Hebrew version to the result
        if mapObj.Has(char)
            result .= mapObj[char]
        else
            ; If it's a space, number, or unknown symbol, keep it as is
            result .= A_LoopField 
    }
    return result
}


ConvertHebrewToEnglish(input)
{
    ; This map is the inverse of the one above
    mapObj := Map(
        "/", "q", "'", "w", "ק", "e", "ר", "r", "א", "t", "ט", "y", "ו", "u", "ן", "i", "ם", "o", "פ", "p",
        "ש", "a", "ד", "s", "ג", "d", "כ", "f", "ע", "g", "י", "h", "ח", "j", "ל", "k", "ך", "l", "ף", ";", ",", "'",
        "ז", "z", "ס", "x", "ב", "c", "ה", "v", "נ", "b", "מ", "n", "צ", "m", "ת", ",", "ץ", ".", ".", "/"
    )

    result := ""
    Loop Parse, input
    {
        if mapObj.Has(A_LoopField)
            result .= mapObj[A_LoopField]
        else
            result .= A_LoopField 
    }
    return result
}




