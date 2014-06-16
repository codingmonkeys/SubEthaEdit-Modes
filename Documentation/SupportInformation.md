[Documentation][ModeExample]:
# Mode Developer Support Information

* Syntax Definition: _SyntaxDefinition.xml_
	* [Style Related `<default>`, `<states>`, `<keywords>` attribute values: Deprecation](#DeprecatedStyleAttributes)


* Mode Scripts: _Scripts/_
	* [Toolbar related `seescriptsettings()` keys: No longer supported](#DeprecatedScriptSettings)



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
