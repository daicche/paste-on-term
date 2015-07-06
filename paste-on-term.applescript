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
