## Mode Scripts: _Scripts/_


The folder called `Scripts` is located in the modes Resources folder.  
It can contain mode specific apple scripts to enhance the mode experience in some way or another.

1. [Example File](#ExampleFile)
2. [Script Settings](#ScriptSettings)


### [Example File:](id:ExampleFile)
	-- see settings
	on seescriptsettings()
		return {displayName:"Say Hello", inContextMenu:"yes", keyboardShortcut:"^@h"}
	end seescriptsettings


	-- the actual script
	display alert "Sorry!" message "We are closed." giving up after 1
	say "We are closed." using "Zarvox"

### [Script Settings](id:ScriptSettings)


You can add 

	on seescriptsettings()
		return {displayName:"Say Hello", inContextMenu:"yes", keyboardShortcut:"^@h"}
	end seescriptsettings


to your custom Apple script to costumize the appearance of the script in the script submenus.

The possible keys are

* `displayName` _(optional)_ - string that is used as the name of your script in the mode menu

* `inContextMenu` _(optional)_ - wheter or not your script appears in the right click menu
	* "yes"
	* "no" (default)
	
* `keyboardShortcut` _(optional)_
	* no shortcut (default) 
	* a shortcut string - modifier key(s) plus character
		* **~** is option
		* **^** is control
		* **$** is shift
		* **@** would be commmand but is mandatory
