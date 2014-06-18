[Documentation][ModeExample]:
## The SubEthaEdit Mode File Format - an Example: _Example.seemode_

`Example.seemode` is a fully functional SubEthatEdit 4 mode. It can be uses as a starting point into how modes work and where to look for specific information. 

It contains files that define the properties of a language that should be recognized for syntax highlighting, additional information for autocompletion support and symbol recognition to fill the symbol popup. It can also contain release notes, custom scripts for that mode, an example file and information on the file extensions that are relevant for the mode's language or file type.


SubEthaEdit's mode files are bundles, like e.g. Keynote presentations or rich text with images (rtfd). This enables you to include custom images, a license or other files you want to within the mode. It also ensures extensibility for further mode specific features, like plugins and the like.


#### RegEx Tips

* test your expressions with SubEthaEdit's "Find All" command in RegEx mode  
* case sensitivity can be set to ignore by including (?i) in your expression 
* if you get stuck somewhere with a regular expression, have a look at the modes included with SubEthaEdit or in this repo


#### SEEMode Tips

* hold option and click in the Menu "Mode → Show In Finder" to reveal modes that are already in SubEthaEdit
* open a mode bundle with SubEthaEdit to be prompted if you want to install it or rather show the package contents (you can also control click a mode bundle and choose "Show Package Contents")

#### Notes on XML Escaping

> The ampersand character (&) and the left angle bracket (<) must not appear in their literal form, except when used as markup delimiters, or within a comment, a processing instruction, or a CDATA section. If they are needed elsewhere, they must be escaped using either numeric character references or the strings " &amp;amp; " and " &amp;lt; " respectively. The right angle bracket (>) may be represented using the string " &amp;gt; ", and must, for compatibility, be escaped using either " &amp;gt; " or a character reference when it appears in the string " ]]> " in content, when that string is not marking the end of a CDATA section.

> In the content of elements, character data is any string of characters which does not contain the start-delimiter of any markup and does not include the CDATA-section-close delimiter, " ]]> ". In a CDATA section, character data is any string of characters not including the CDATA-section-close delimiter, " ]]> ".

> To allow attribute values to contain both single and double quotes, the apostrophe or single-quote character (') may be represented as " &amp;apos; ", and the double-quote character (") as " &amp;quot; ".

(from: [XML 1.0 - Character Data and Markup][W3CXML])

Characters that might need to be escaped are:

* `&` → `&amp;` 
* `>` → `&lt;`
* `<` → `&gt;`
* `"` → `&quot;` 
* `'` → `&apos;`

Regular expression strings get less legible with ecaped characters so make sure to un-escape (at least in your head) before checking or changing them.  
If your regular expression needs a lot of XML related escaping think about using a CDATA section. The following three examples are equivalent:

```xml
<autoend>&lt;/\g&lt;xmltagstatename>></autoend>
<autoend>&lt;/\g&lt;xmltagstatename&gt;&gt;</autoend>
<autoend><![CDATA[</\g<xmltagstatename>>]]></autoend>
```


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
			* [ExampleSyntax.txt](#ExampleSyntax_txt) _(optional)_ 
			* [ModeSettings.xml][ModeSettings_xml] _(optional)_
			* [RegexSymbols.xml][RegexSymbols_xml] _(optional)_
			* [SyntaxDefinition.xml][SyntaxDefinition_xml]
			* _NewTemplate.txt_ -- see: [ModeSettings.xml][ModeSettings_xml]
			* _CustomImage.png_ -- see: [RegexSymbols.xml][RegexSymbols_xml]
			* _License.txt_ -- see: [Additional Files](#AdditionalFiles)
			* [**Scripts/**][ModeScripts] _(optional)_
				* _customscript.script_ -- see: [Scripts][ModeScripts]
			* …


### <a name="ExampleSyntax_txt"></a> ExampleSyntax.txt
When selecting the style sheet for this mode in `Preferences: Styles` the content of this file is used to fill the preview.  
This file is optional.


### <a name="AdditionalFiles"></a> Additional Files
Additionally to the mode format specific files the mode bundle can contain custom files like Release notes or a Read me.   
The file that is used for template content has a custom name by which it is referenced in the [ModeSettings.xml][ModeSettings_xml].  
Files that are used as symbol icons in the symbol popup are also referenced by name in [RegexSymbols.xml][RegexSymbols_xml]. 



<!-- Referenced Files -->
[ModeScripts]: Documentation/ModeScripts.md "ModeScripts.md"
[AutocompleteAdditions_txt]: Documentation/AutocompleteAdditions_txt.md "AutocompleteAdditions_txt.md"
[Info_plist]: Documentation/Info_plist.md "Info_plist.md"
[ModeSettings_xml]: Documentation/ModeSettings_xml.md "ModeSettings_xml.md"
[RegexSymbols_xml]: Documentation/RegexSymbols_xml.md "RegexSymbols_xml.md"
[SyntaxDefinition_xml]: Documentation/SyntaxDefinition_xml.md "SyntaxDefinition_xml.md"

<!-- Referenced Paths -->
[ModeExample]: . "SubEthaEdit 4 Example Mode Documentation"

<!-- Referenced URLs -->
[W3CXML]: http://www.w3.org/TR/2008/REC-xml-20081126/#syntax "Extensible Markup Language (XML) 1.0 - Character Data and Markup"
