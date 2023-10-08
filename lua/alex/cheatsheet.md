### Base


# Modes
 - 'v' >> enter visual mode
 - 'V' >> enter lines only visual mode
 - 'i' >> enter editing mode (current position - 'insert)
 - 'a' >> enter editing mode after the cursor (next position - 'append')   
 - 'A' >> enter editing mode in the end of a line (next position - 'append')  
 - 'o' >> enter editing mode on new line ()

# Commands
 - ':w' >> save current document
 - ':q' >> quit current document
 - ':wq' >> save and quit current document
 - ':q!' >> force quit (discard any changes)

 - ':$s/old/new/g' >> replace old with new in a document
 - ':$s/old/new/gc' >> replace old with new in a document with confirmations

 - '/' + <anychar> >> find and highlight something in the current doc
 - 'g' + 'x' >> open a link in browser
 - 'g' + 'd' >> go to definition
 
 - ':noh' >> remove highlighting
 
# Editing
 - 'J' >> join the line below to the current line with a space in between
 - '>>' >> move right one shiftwidth
 - '<<' >> move left one shiftwidth
 - '>%' >>
 - '<%' >> 
 - 'CTRL' + 'w' >> delete word before the cursor in insert mode
 - 'CTRL' + 'h' >> delete a char before the cursor in insert mode
 - 'CTRL' + 't' >> indent right a shiftwidth in insert mode 
 - 'CTRL' + 'd' >> indent left a shiftwidth in insert mode
 - 'CTRL' + 'o' + <anycommand> >> perform a single command in normal mode while in editing mode

# Selection (in visual mode)
 - '2jd' >> delete 2 lines down starting from current
 - '2kd' >> delete 2 lines up starting from current
 - '2jy' >> copy 2 lines down starting from current
 - '2ky' >> copy 2 lines up starting from current
 - 'a' + 'w' >> select word
 - 'a' + 'b' >> select a block with () (or 'a' + '(' )
 - 'a' + 'B' >> select a block with {} (or 'a' + '{' )
 - 'i' + 'b' >> select inner content of block with () (or 'i' + '(' )
 - 'i' + 'B' >> select inner content of block with {} (or 'i' + '{' )

# Copy/Paste
 - 'y' >> copy selection (yank)
 - '2yy' >> copy 2 lines
 - 'p' >> paste selection after cursor (from current buffer)
 - 'P' >> paste selection before cursor (from current buffer)
 - '"' + '+' + 'p' >> paste from system buffer ('DoubleQuote' + 'plus sign' + 'p')

# Undo/Redo
 - 'u' >> undo
 - 'CTRL' + 'r' >> redo what has been undone

# Moving around
 - 'CTRL' + 'i' >> move forward in action stack
 - 'CTRL' + 'o' >> move backward in action stack

### Movements

# Cursor movements
 - 'j' >> go up a line
 - 'k' >> go up a line
 - 'h' >> go left a char
 - 'l' >> go right a char

 - 'H' >> jump to top of screen
 - 'M' >> jump to middle of screen
 - 'L' >> jump to bottom of screen

 - 'w' >> jump to next word
 - 'W' >> jump to next space
 - 'b' >> jump to previous word
 - 'B' >> jump to previous space
 - 'e' >> jump forwards to the end of the word
 - 'E' >> jump forwards to the end of the word (word can contain punctuation)

 - '$' >> jump to the end of the line
 - '0' (zero) >> jump to the start of the line 

 - 'f' + '<anychar>' >> jump forward to the first occurance of <anychar>
 - 'F' + '<anychar>' >> jump backwards to the first occurance of <anychar>
 - '{' >> jump to previous paragraph (or function/block, when editing code)
 - '}' >> jump to next paragraph (or function/block, when editing code)

# Screen sliding
 - 'CTRL' + 'y' >> move screen up one line
 - 'CTRL' + 'e' >> move screen down one line

 - 'CTRL' + 'f' >> move screen down one page
 - 'CTRL' + 'b' >> move screen up one page

 - 'CTRL' + 'u' >> move half screen up (u = up)
 - 'CTRL' + 'd' >> move half screen down (d = down)

### Windows

# Basic operations
 - 'CTRL' + 'w' + 'q' >> close window
 - 'CTRL' + 'w' + 'o' >> close all windows except current | ':only' - does the same

# Split
 - 'CTRL' + 'w' + 's' >> split window horizontally
 - 'CTRL' + 'w' + 'v' >> split window vertically

# Tabs
 - 'CTRL' + 'w' + 'T' >> move current window to a new tab
 - 'CTRL' + 'w' + 'q' >> close current tab
 - 'g' + 't' >> switch to next tab

# Move between split windows
 - 'CTRL' + 'w' + 'h,j,k,l' >> move between split windows (left, down, up, right)
 - 'CTRL' + 'w' + 'w' >> move to the next windows

### LSP
 - 'g' + 'd' >> list definitions in telescope (if many) | go to definition (if one)
 - 'g' + 'r' >> list references in telescope (if many) | jump to a place of reference (if one)
 - 'g' + 'i' >> list implementation in telescope (if many) | go to implemenation (if one)
 - 'K' >> display information about an object (capital K)
 - 'g' + 'l' >> display diagnostic window 
 - '[' | ']' + 'd' >> jump between diagnostic messages

### Git

 - '<leader>' + 'g' + 'f' + 'c' >> show commits history for current file
 - '<leader>' + 'g' + 'c' >> show commits for git repo
 - '<leader>' + 'g' + 'b' >> show git branches
 - '<leader>' + 'g' + 's' >> show git status
 - '<leader>' + 'h' + 's' >> stage hunk (works in normal and visual modes)
 - '<leader>' + 'h' + 'r' >> reset hunk (works in normal and visual modes)
 - '<leader>' + 'h' + 'S' >> stage buffer (file)
 - '<leader>' + 'h' + 'u' >> undo stage hunk
 - '<leader>' + 'h' + 'R' >> reset buffer
 - '<leader>' + 'h' + 'p' >> preview hunk
 - '<leader>' + 'h' + 'b' >> git blame for a hunk the line belongs to
 - '<leader>' + 't' + 'b' >> toggle current line git blame
 - '<leader>' + 'g' + 'd' >> toggle merge tool
 - '<leader>' + 'h' + 'D' >> diff
 - '<leader>' + 't' + 'd' >> show deleted lines
 - '[' | ']' + 'c' >> next/prev hunk
