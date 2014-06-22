# Swift Mode Tutorial Step 5
## Recognition and Scripts

Now since the swift mode is in a good shape, let's make sure it is fired up whenever a swift file is opened up. So far only the `swift` extension is recognized. Which is good, so the mode is always triggered when we open a file ending in `.swift`. However, __SubEthaEdit__ is capable of more. It can recognize a mode on content to, you may have used or noticed that in the __Triggers__ preference pane. The content recognition is especially nice since it also triggers when you paste some text into an empty document, or when dragging text onto the __SubEthaEdit__ Dock icon to temporarily show it.

Swift can also be used as a scripting language if you put a so called __hashbang__ or __shebang__ in the first line. The one that is recommended is the following:

	#!/usr/bin/env xcrun swift -i 
 
However, people will stick in there probably anything that might start swift, so it's probably safe to just search for `#!` at the start of the file, followed by `swift` somwhere before the line break. The Regex for this looks like this:

	\A#![^\n]+swift
 
To make this work, we edit the `ModeSettings.xml` file and add a regex line

```xml
<settings>
	<template>NewTemplate.swift</template>
	<recognition>
		<extension>swift</extension>
		<regex>\A#![^\n]+swift</regex>
	</recognition>
</settings>
```

The mode recognition now triggers when the regex returns a match. So if we have some unique strings that only appear in swift files, we can add them as well (e.g. override class func or import cocoa, etc). Very nice.


## Scripts

So what do we want to have. Since Swift supports running interactively as script, let's add the two scripts that support this. Insert Shebang and chmod ug+x so users can easily make their Swift files executable. Lets take them from the bash mode and just adjust the values. The chmod ug+x we can just add directly, the Insert Shebang needs a slight alteration.

```AppleScript
on seescriptsettings()	return {displayName:"Insert Shebang"}end seescriptsettingstell application "SubEthaEdit"	if not (exists front document) then make new document with properties {mode:"Swift"}	set contents of insertion point 1 of front document to "#!/usr/bin/env xcrun swift -i
"end tell
```

The Numbers in front of the script are just there to give the Mode menu some order. The name is tken from the `seescriptsettings()`  method.

And of course we'd like to have a build check. Let's have a look at the swift command line tool if it supports it. And it turns out it does. To be most helpful, we need to add the macosx sdk as well, which is this command line:

	xcrun swift -parse -sdk $(xcrun --show-sdk-path --sdk macosx) <filename> 

Since in the script we pipe in the content of the file we need to use `-` as the parameter for the filename, as with most command line tools. Sadly after adding it we have to learn that

	xcrun: error: cannot be used within an App Sandbox.

So our users have to resort to switching to Terminal (shift-cmd-T) and running the script there on their own for now. 

Not so quickly - `xcode-select -p` seems to work in the sandbox. That also means we depend on the paths not changing below the developer directory, but for now that seems sane enough.



<!-- Tutorial Navigation -->
[Step 4: All the nice things](../SwiftModeStep4) - [Overview](..)
