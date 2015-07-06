on open location theURL
	set AppleScript's text item delimiters to {"pastetoterm://"}
	set txt_items to text items of theURL
	set AppleScript's text item delimiters to {""}
	set command to txt_items as Unicode text
	set c to do shell script "ruby -e 'require \"uri\"; puts URI.unescape(\"" & command & "\")'"

	writeOnTerm(c)
end open location

-- iterm
on writeOnTerm(command)
	tell application "iTerm"
		activate
		
		tell current session of current terminal
			write text command & " " -- 最後に半角スペースを加えないと実行してしまう
		end tell
	end tell
end writeOnTerm

--文字置換ルーチン
on repChar(origText, targStr, repStr)
	set {txdl, AppleScript's text item delimiters} to {AppleScript's text item delimiters, targStr}
	set temp to text items of origText
	set AppleScript's text item delimiters to repStr
	set res to temp as text
	set AppleScript's text item delimiters to txdl
	return res
end repChar

