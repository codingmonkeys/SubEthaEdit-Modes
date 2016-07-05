--$Id: RunMake.applescript,v 1.1 2007/07/08 19:58:26 mjb Exp $

tell application "SubEthaEdit"
	if exists file of front document then
		if modified of front document then
			try
				save front document
			end try
		end if
		set MacfrontFilePath to file of front document
		set frontFilePath to POSIX path of MacfrontFilePath
		set modeResources to resource path of mode of front document
	else
		error "You have to save the document first"
	end if
end tell

set shellScript to quote & modeResources & "/Scripts/shell/runmake.sh" & quote & space & quote & frontFilePath & quote

-- debug: display alert "Make command" message shellScript as informational buttons {"OK"} default button "OK"

set makeResponse to do shell script shellScript

display alert "Make Response" message makeResponse as informational buttons {"OK"} default button "OK"

on seescriptsettings()
	return {displayName:"Run make", keyboardShortcut:"@b", inContextMenu:"no"}
end seescriptsettings
