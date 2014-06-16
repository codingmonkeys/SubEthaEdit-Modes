[Documentation][ModeExample]:
## The SubEthaEdit Mode File Format - an Example: _Example.seemode_

`Example.seemode` is a fully functional SubEthatEdit 4 mode. It can be uses as a starting point into how modes work and where to look for specific information. 

It contains files that define the properties of a language that should be recognized for syntax highlighting, additional information for autocompletion support and symbol recognition to fill the function popup. It can also contain release notes, custom scripts for that mode, an example file and information on the file extensions that are relevant for the mode's language or file type.


SubEthaEdit's mode files are bundles, like e.g. Keynote presentations or rich text with images (rtfd). This enables you to include custom images, a license or other files you want to within the mode. It also ensures extensibility for further mode specific features, like plugins and the like.


_RegEx Tips_

* test your expressions with SubEthaEdit's "Find All" command in RegEx mode  
* case sensitivity can be set to ignore by including (?i) in your expression 
* if you get stuck somewhere with a regular expression, have a look at the modes included with SubEthaEdit or in this repo


_SEEMode Tips_

* hold option and click in the Menu "Mode → Show In Finder" to reveal modes that are already in SubEthaEdit
* open a mode bundle with SubEthaEdit to be prompted if you want to install it or rather show the package contents (you can also control click a mode bundle and choose "Show Package Contents")

### Example Bundle:
This is the folder structure of `Example.seemode` and all the included files:

```
* Example.seemode/
|	* Contents/
|	|	* Info.plist
|	|	* Resources/
|	|	|	* AutocompleteAdditions.txt
|	|	|	* ChangeLog.txt
|	|	|	* CustomImage.png
|	|	|	* CustomImage@2x.png
|	|	|	* ExampleSyntax.txt
|	|	|	* ModeSettings.xml
|	|	|	* NewTemplate.txt
|	|	|	* RegexSymbols.xml
|	|	|	* Scripts/
|	|	|	|	* HelloThere.scpt
|	|	|	* SyntaxDefinition.xml
```	
	

### Bundle Structure

The following reperesents the general structure of a SubEthaEdit mode bundle.  
Files and folders that can be added for additional mode features but are not necessary are marked as _(optional)_.  
Files in _italics_ are optional custom files without special rules for their naming.   

* **_&lt;modename&gt;_.seemode/** -- Mode Bundle - contains all files to describe a language/file type
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
			* _NewTemplate.txt_ -- see: [ModeSettings.xml][ModeSettings_xml]
			* _CustomImage.png_ -- see: [RegexSymbols.xml][RegexSymbols_xml]
			* _License.txt_ -- see: [Additional Files](#AdditionalFiles)
			* [**Scripts/**][ModeScripts] _(optional)_
				* _customscript.script_ -- see: [Scripts][ModeScripts]
			* …


### <a name="AdditionalFiles"></a>Additional Files
Additionally to the mode format specific files the mode bundle can contain custom files like Release notes or a Read me.   
The file that is used for template content has a custom name by which it is referenced in the [ModeSettings.xml][ModeSettings_xml].  
Files that are used for symbol icons in the function popup are also referenced by name in [RegexSymbols.xml][RegexSymbols_xml]. 


### [File recognition trigger test files][TestFiles]

`TestFiles/` contains example "Example" files showing which of them are recognized as "Example" files and which aren't. 

* `Example` is recognized based on the filename
* `ExampleModeFile_NoShebang.EXAMPLE` is recognized based on the file extension
* `ExampleModeFile_NoShebang.exmpl` is recognized based on the file extension
* `ExampleModeFile_Shebang` - is recognized based on the shebang
* `ExampleModeFile_Shebang.txt` - is recognized based on the shebang (though precedence for recognizing based on txt extension wins in the default setup)
* `NoExampleModeFile_NoShebang.EXMPL`


<!-- Referenced Files -->
[ModeScripts]: Documentation/ModeScripts.md "ModeScripts.md"
[AutocompleteAdditions_txt]: Documentation/AutocompleteAdditions_txt.md "AutocompleteAdditions_txt.md"
[Info_plist]: Documentation/Info_plist.md "Info_plist.md"
[ModeSettings_xml]: Documentation/ModeSettings_xml.md "ModeSettings_xml.md"
[RegexSymbols_xml]: Documentation/RegexSymbols_xml.md "RegexSymbols_xml.md"
[SyntaxDefinition_xml]: Documentation/SyntaxDefinition_xml.md "SyntaxDefinition_xml.md"

<!-- Referenced Paths -->
[TestFiles]: TestFiles "TestFiles/"
[ModeExample]: . "SubEthaEdit 4 Example Mode Documentation"
