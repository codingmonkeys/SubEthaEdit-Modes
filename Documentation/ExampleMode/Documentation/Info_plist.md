[Documentation][ModeExample]:
## Info.plist: _Info.plist_

The file called `Info.plist` is located in the mode's `Contents` folder.  
It contains a collection of keys and values that describes your mode. 

1. [Example File](#ExampleFile)
2. [Supported Keys](#SupportedKeys)
3. [Deprecated Keys](#DeprecatedKeys)


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


### <a name="SupportedKeys"></a>Supported Keys

* `CFBundleIdentifier` - Bundle identifier - uniquely identifies the bundle - starts with _SEEMode._ followed by the choosen name; for example _SEEMode.MyMode_
	> must be a uniform type identifier (UTI) that contains only alphanumeric (A-Z,a-z,0-9), hyphen (-), and period (.) characters.
	
* `CFBundleName` - Bundle name - identifies the short name of the bundle - should match the _name_ part of the identifier; for example _MyMode_

* `NSHumanReadableCopyright`_(optional)_ - contains a string with the copyright notice for the bundle; for example, _© 2014, My Company_

* `CFBundleShortVersionString` - Bundle versions string, short - specifies the release version number of the bundle - **update for new releases**!
* `CFBundleVersion` - Bundle version - specifies the build version number of the bundle, which identifies an iteration (released or unreleased) of the bundle - **update for new releases**!	
* `SEEMinimumEngineVersion` - specifies which engine version of SubEthaEdit is needed to be able to read the mode file - the lowest version needed to read _.seemode_ files is 4.0; the current version is 4.0

* `CFBundlePackageType` - Bundle OS Type code - use _BNDL_
* `CFBundleInfoDictionaryVersion` - InfoDictionary version - use _6.0_


### <a name="DeprecatedKeys"></a>Deprecated Keys

* `CFBundleGetInfoString` _(deprecated)_ - replaced by `NSHumanReadableCopyright`
* `TCMModeExtensions` _(deprecated)_ - replaced by the [Mode Settings `extension` tag][ModeSettings_extension] - was used to specify the extensions the mode supports
* `TCMModeNewFileTemplate` _(deprecated)_ - replaced by the [Mode Settings `template` tag][ModeSettings_template] - was used to specify the template file name



<!-- Referenced Files -->
[ModeSettings_extension]: ModeSettings_xml.md#tag_extension "ModeSettings - extension tag"
[ModeSettings_template]: ModeSettings_xml.md#tag_template "ModeSettings - template tag"

<!-- Referenced Paths -->
[ModeExample]: .. "SubEthaEdit 4 Example Mode Documentation"


