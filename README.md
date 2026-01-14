# Hebrew-English Keyboard Converter

A lightweight automation tool built with **AutoHotkey v2** that allows you to instantly fix text typed in the wrong keyboard layout. No more deleting and re-typing when you realize you wrote an entire sentence in English instead of Hebrew (or vice versa).

## How It Works
The script captures your selected text, maps each character to its physical equivalent on the opposite keyboard layout, and replaces it instantly.

### Shortcuts:
* **`Ctrl + Shift + H`**: Converts English characters to Hebrew (e.g., `akmu` ➔ `שלום`).
* **`Ctrl + Shift + E`**: Converts Hebrew characters to English (e.g., `אמךךם` ➔ `hello`).

---

## How to Use
1.  **Highlight** the text you typed incorrectly.
2.  Press the relevant **Keyboard Shortcut** (`Ctrl+Shift+H` or `Ctrl+Shift+E`).
3.  The script will automatically replace the text for you!

---

## Installation & Setup

### Prerequisites:
* Windows OS.
* [AutoHotkey v2.0+](https://www.autohotkey.com/) installed on your machine.

### Running the Script:
1.  Download the `Hebrew-English-Converter.ahk` file.
2.  **Important:** Ensure the file is saved with **UTF-8 with BOM** encoding to support Hebrew characters.
3.  Double-click the file to run it. You will see a green **H** icon in your system tray.

---

## Technical Details
* **Language:** AutoHotkey v2 (AHK).
* **Mechanism:** Uses `A_Clipboard` to process text and `Map()` objects for high-performance character translation.
* **Safety:** The script restores your original clipboard content immediately after the conversion.

## License
MIT License - Feel free to use and modify!
