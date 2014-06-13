## The SubEthaEdit Mode File Format: _Example.seemode_

The bundle called `Example.seemode` is a mode that can be used as a starting point for mode developement.  
It contains files that define the properties of a language that should be recognized for syntax highlighting, additional information for autocompletion support and symbol recognition to fill the function popup. It can also contain release notes, custom scripts especially for that mode, an example file and information on the file extensions that are relevant for the mode's language or file type.


SubEthaEdit's mode files are bundles, like e.g. Keynote presentations or rich text with images (rtfd). This enables you to include custom images, a license or other files you want to within the mode. It also ensures extensibility for further mode specific features, like plugins and the like.


_RegEx Tips_

* test your expressions with SubEthaEdit's "Find All" command  
* case sensitivity can be set to ignore by including (?i) in your expression 
* if you get stuck somewhere with a regular expression, have a look at the modes included with SubEthaEdit


_SEEMode Tips_

* hold option and click in the Menu "Mode → Show In Finder" to reveal modes that are already in SubEthaEdit
* open a mode bundle with SubEthaEdit to be prompted if you want to install it or rather show the package contents
* control click a mode bundle and choose "Show Package Contents" to see inside


### Example Bundle:

	* Example.seemode/
	|	* Contents/
	|	|	* Info.plist
	|	|	* Resources/
	|	|	|	* AutocompleteAdditions.txt
	|	|	|	* ChangeLog.txt
	|	|	|	* CustomImage.png
	|	|	|	* CustomImage@2x.png
	|	|	|	* License.txt
	|	|	|	* ModeSettings.xml
	|	|	|	* NewTemplate.txt
	|	|	|	* RegexSymbols.xml
	|	|	|	* Scripts/
	|	|	|	|	* HelloThere.scpt
	|	|	|	* SyntaxDefinition.xml
	|	|	|	* …
	
	

### Bundle Structure

This is the structure of a SubEthaEdit mode bundle:


* **_modename_.seemode/** -- Mode Bundle - contains all files to describe a language/file type
	* **Contents/**
		* [Info.plist][Info_plist]
		* **Resources/**
			* [AutocompleteAdditions.txt][AutocompleteAdditions_txt] _(optional)_
			* _ChangeLog.txt_ -- see: [Additional Files](#AdditionalFiles)
			* **en.lproj/** _(optional)_ -- it is possible to localize modes
				* InfoPlist.strings	
				* …
			* [ModeSettings.xml][ModeSettings_xml] _(optional)_
			* [RegexSymbols.xml][RegexSymbols_xml] _(optional)_
			* [SyntaxDefinition.xml][SyntaxDefinition_xml]
			* _NewFileTemplate.txt_ -- see: [ModeSettings.xml][ModeSettings_xml]
			* _CustomImageForSymbolIcon.png_ -- see: [RegexSymbols.xml][RegexSymbols_xml]
			* _License.txt_ -- see: [Additional Files](#AdditionalFiles)
			* [**Scripts/**][ModeScripts] _(optional)_
				* _customscript.script_ -- see: [Scripts][ModeScripts]
			* …


<!-- Referenced Files -->
[ModeScripts]: ModeScripts.md "ModeScripts.md"
[AutocompleteAdditions_txt]: AutocompleteAdditions_txt.md "AutocompleteAdditions_txt.md"
[Info_plist]: Info_plist.md "Info_plist.md"
[ModeSettings_xml]: ModeSettings_xml.md "ModeSettings_xml.md"
[RegexSymbols_xml]: RegexSymbols_xml.md "RegexSymbols_xml.md"
[SyntaxDefinition_xml]: SyntaxDefinition_xml.md "SyntaxDefinition_xml.md"


### [Additional Files](id:AdditionalFiles)
Other than the regular files of the mode bundle additional files can easily be added - as in this example the whole Documentation folder. You can also drop in Release Notes and Readmes etc.

