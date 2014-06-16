[Documentation][ModeExample]:
# Mode Developer Support Information

* Symbol Definitions: Function Popup: _RegexSymbols.xml_
	* [Unused: `<blocks>`, `<beginregex>`, `<endregex>` and &lt;symbol&gt;-attribute `ignoreblocks`](#BlockTag)
	* [No longer supported `image`-attribute values](#DeprecatedImageValues)
	* [Unknown behavior if the `symbol`-attribute is an empty string](#EmptySymbolString)
	* [BUG in SEE 4.0.1: resolution specific images are ignored even if available](#ResolutionBug)

* Syntax Definition: _SyntaxDefinition.xml_
	* [Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation](#DeprecatedStyleAttributes)


* Mode Scripts: _Scripts/_
	* [Toolbar related `seescriptsettings()` keys: No longer supported](#DeprecatedScriptSettings)



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
