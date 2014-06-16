# Mode Developer Support Information


* [Mode Settings: Template and Trigger: ModeSettings.xml](#ModeSettings_xml)
	* Fallback for supported file extensions: `TCMModeExtensions`-array in the `Info.plist`
	* Mode Triggers: Disable or Re-order in Preferences
	* Template files: When are they used

* [Symbol Definitions: Function Popup: _RegexSymbols.xml_](#RegexSymbols_xml)
	* Unused: `<blocks>`, `<beginregex>`, `<endregex>` and &lt;symbol&gt;-attribute `ignoreblocks`
	* No longer supported `image`-attribute values
	* Unknown behavior if the `symbol`-attribute is an empty string
	* BUG in SEE 4.0.1: resolution specific images are ignored even if available

* [Syntax Definition: _SyntaxDefinition.xml_](#SyntaxDefinition_xml)
	* Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation


* [Mode Scripts: _Scripts/_](#ModeScripts)
	* Toolbar related `seescriptsettings()` keys: No longer supported



## [Mode Settings: _ModeSettings.xml_](id:ModeSettings_xml)


### Fallback for supported file extensions: `TCMModeExtensions` array in the `Info.plist`

This is used as a fallback for the `<recognition>` tags of the `ModeSettings.xml` if there is an issue with the file.  

Entry in the mode's `Info.plist` -   
expects a string array containing file extensions that mode feels responsible for.

Example:

	<key>TCMModeExtensions</key>
	<array>
		<string>example</string>
		<string>exmpl</string>
	</array>

_It is kind of deprecated, though still supported._


### Mode Triggers: Disable or Re-order in Preferences

Mode triggers defined in the `<recognition>` tags of the `ModeSettings.xml` can be influenced via the "**Triggers**"-_Preference Pane_:

* can be turned on or off  
* precedence can be set by rearranging the mode order  


### Template files: When are they used

There are multiple ways to generate a file that has its mode already set and gets the template content:

* Menu:File->New->_Example_
* Menu:File->New Tab->_Example_
* Document Hub:File->New->_Example_ _(right click)_
* Document Hub:File->New->_Example_ _(right alt click)_
* Document Hub:File->New _(if the mode is set as the default mode for new files in the Preferences)_

The following cases however do not fill in the template content:

* changing the mode on a file that already exists
* creating a file via the command line tool with the mode set


## [Symbol Definitions: _RegexSymbols.xml_](id:RegexSymbols_xml)


### Unused: `<blocks>`, `<beginregex>`, `<endregex>` and &lt;symbol&gt; attribute `ignoreblocks`

**! Has no effect**

`ignoreblocks` : possible values `yes` and `no` _(no default behavior, is ignored)_

Example:

	<blocks>
		<beginregex>{</beginregex>
		<endregex>}</endregex>
	</blocks>
	<symbol id="id3" ignoreblocks="yes">[…]</symbo#l>


### No longer supported `image`-attribute values
* Symbol#
* SymbolC
* SymbolE
* SymbolF
* SymbolF()
* SymbolG
* SymbolK
* SymbolL
* SymbolM
* SymbolP
* SymbolS
* SymbolT
* Symbol#V
	

### Unknown behavior if the `symbol`-attribute is an empty string
To be tested.


### BUG in SEE 4.0.1: resolution specific images are ignored even if available
Is fixed in SEE 4.0.2.


## [Syntax Definition: _SyntaxDefinition.xml_](id:SyntaxDefinition_xml)

### Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation

The following attributes, that where part of the `<default>`, `<states>`, `<keywords>` tags, are now replaced with the `scope` attribute and the use of Style Sheets.

* color
* inverted-color
* font-weight
* font-style



## [Mode Scripts: _Scripts/_](id:ModeScripts)

### Toolbar related `seescriptsettings()` keys: No longer supported

The following keys are no longer supported by SubEthaEdit 4.0 and up: 
* shortdisplayname
* toolbartooltip
* toolbaricon
* indefaulttoolbar
* incontextmenu
