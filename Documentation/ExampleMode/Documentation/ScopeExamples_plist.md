[Documentation][ModeExample]:
## Style Scope Examples: _ScopeExamples.plist_

The file called `ScopeExamples.plist` is located in the mode's `Resources` folder.  
It is a dictionary with scope names as keys and an example string for the scope as value.  

We use it to automatically generate scope documentation that includes examples for scopes from multiple modes.


### <a name="ExampleFile"></a>Example File:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

<plist version="1.0">
	<dict>
		<key>support.constant</key>
		<string>COLOR TEXT</string>
		<key>comment.block</key>
		<string>/* a block comment */</string>
		<key>comment.single</key>
		<string># a single line comment</string>
		<key>string.double</key>
		<string>"This is a string in double quotes"</string>
		<key>meta.important</key>
		<string>foobar %Warning: This is a warning %TODO: and this a TODO</string>
		<key>language.constant.numeric</key>
		<string>9.0 6942</string>
	</dict>
</plist>
```



<!-- Referenced Paths -->
[ModeExample]: .. "SubEthaEdit 4 Example Mode Documentation"
