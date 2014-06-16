[Documentation][ModeExample]:
## Info.plist: _Info.plist_

The file called `Info.plist` is located in the mode's Contents folder.  
It contains a collection of keys and values (dictionaries, arrays, strings…) that descripes your mode. 


### <a name="ExampleFile"></a>Example File:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleIdentifier</key>
	<string>SEEMode.Example</string>
	<key>CFBundleName</key>
	<string>Example</string>
	<key>NSHumanReadableCopyright</key>
	<string>© 2014 TheCodingMonkeys http://www.codingmonkeys.de</string>
	<key>CFBundleGetInfoString</key>
	<string>1.0, Copyright TheCodingMonkeys 2014</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>SEEMinimumEngineVersion</key>
	<string>4.0</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
</dict>
</plist>
```


<!-- Referenced Paths -->
[ModeExample]: .. "SubEthaEdit 4 Example Mode Documentation"
