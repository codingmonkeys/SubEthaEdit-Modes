[Documentation][ModeExample]:
# Mode Developer Support Information


* Mode Settings: Template and Trigger: ModeSettings.xml
	* [Fallback for supported file extensions: `TCMModeExtensions`-array in the `Info.plist`](#TCMModeExtensions)
	* [Mode Triggers: Disable or Re-order in Preferences](#ModeTriggers)
	* [Template files: When are they used](#TemplateFile)

* Symbol Definitions: Function Popup: _RegexSymbols.xml_
	* [Unused: `<blocks>`, `<beginregex>`, `<endregex>` and &lt;symbol&gt;-attribute `ignoreblocks`](#BlockTag)
	* [No longer supported `image`-attribute values](#DeprecatedImageValues)
	* [Unknown behavior if the `symbol`-attribute is an empty string](#EmptySymbolString)
	* [BUG in SEE 4.0.1: resolution specific images are ignored even if available](#ResolutionBug)

* Syntax Definition: _SyntaxDefinition.xml_
	* [Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation](#DeprecatedStyleAttributes)


* Mode Scripts: _Scripts/_
	* [Toolbar related `seescriptsettings()` keys: No longer supported](#DeprecatedScriptSettings)



## <a name ="ModeSettings_xml"></a>Mode Settings: _ModeSettings.xml_


### <a name="TCMModeExtensions"></a>Fallback for supported file extensions: `TCMModeExtensions` array in the `Info.plist`

This is used as a fallback for the `<recognition>` tags of the `ModeSettings.xml` if there is an issue with the file.  

Entry in the mode's `Info.plist` -   
expects a string array containing file extensions that mode feels responsible for.

Example:

```xml
<key>TCMModeExtensions</key>
<array>
	<string>example</string>
	<string>exmpl</string>
</array>
```

_It is kind of deprecated, though still supported._


### <a name="ModeTriggers"></a>Mode Triggers: Disable or Re-order in Preferences

Mode triggers defined in the `<recognition>` tags of the `ModeSettings.xml` can be influenced via the "**Triggers**"-_Preference Pane_:

* can be turned on or off  
* precedence can be set by rearranging the mode order  


### <a name="TemplateFile"></a>Template files: When are they used

There are multiple ways to generate a file that has its mode already set and gets the template content:

* Menu:File->New->_Example_
* Menu:File->New Tab->_Example_
* Document Hub:File->New->_Example_ _(right click)_
* Document Hub:File->New->_Example_ _(right alt click)_
* Document Hub:File->New _(if the mode is set as the default mode for new files in the Preferences)_

The following cases however do not fill in the template content:

* changing the mode on a file that already exists
* creating a file via the command line tool with the mode set


## <a name ="RegexSymbols_xml"></a>Symbol Definitions: _RegexSymbols.xml_


### <a name="BlockTag"></a>Unused: `<blocks>`, `<beginregex>`, `<endregex>` and &lt;symbol&gt; attribute `ignoreblocks`

**! Has no effect**

`ignoreblocks` : possible values `yes` and `no` _(no default behavior, is ignored)_

Example:

```xml
<blocks>
	<beginregex>{</beginregex>
	<endregex>}</endregex>
</blocks>
<symbol id="id3" ignoreblocks="yes">[…]</symbol>
```

### <a name="DeprecatedImageValues"></a>No longer supported `image`-attribute values
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
	

### <a name="EmptySymbolString"></a>Unknown behavior if the `symbol`-attribute is an empty string
To be tested.


### <a name="ResolutionBug"></a>BUG in SEE 4.0.1: resolution specific images are ignored even if available
Is fixed in SEE 4.0.2.


## <a name ="SyntaxDefinition_xml"></a>Syntax Definition: _SyntaxDefinition.xml_

### <a name="DeprecatedStyleAttributes"></a>Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation

The following attributes, that where part of the `<default>`, `<states>`, `<keywords>` tags, are now replaced with the `scope` attribute and the use of Style Sheets.

* color
* inverted-color
* font-weight
* font-style



## <a name ="ModeScripts"></a>Mode Scripts: _Scripts/_

### <a name="DeprecatedScriptSettings"></a>Toolbar related `seescriptsettings()` keys: No longer supported

The following keys are no longer supported by SubEthaEdit 4.0 and up: 

* shortdisplayname
* toolbartooltip
* toolbaricon
* indefaulttoolbar
* incontextmenu


<!-- Referenced Paths -->
[ModeExample]: . "SubEthaEdit 4 Example Mode Documentation"
