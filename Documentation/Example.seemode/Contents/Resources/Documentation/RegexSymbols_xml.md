## Symbol Definitions: _RegexSymbols.xml_


The file called `RegexSymbols.xml` is located in the modes Resources folder.  
It defines regexes to parse the document for elements to show in the function popup - for example pragma marks, todos, method declarations. 


1. [Example File](#ExampleFile)
2. [File structure - Tags and Attributes](#FileStructure)


### [Example File:](id:ExampleFile)

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE syntax SYSTEM "symbol.dtd">
	
	<symbols>
		<symbol id="Todos" symbol="do_#2B50E8_11.0_LucidaGrande" indentation="1" show-in-comments="yes">
			<regex>(^%TODO:[^\n\r]*)</regex>
			<postprocess>
				<find>^%(TODO:[^\n\r]*)</find>
				<replace>\1</replace>
			</postprocess>
		</symbol>
	
		<symbol id="Warnings" image="SymbolWarn">
			<regex>(^%Warning:[^\n\r]*)</regex>
			<postprocess>
				<find>^%(Warning:[^\n\r]*)</find>
				<replace>!!! \1</replace>
				<find>[ \t]+$</find>
				<replace></replace>
			</postprocess>
		</symbol>
	
		<symbol id="Foobar" image="CustomImage">
			<regex>foobar</regex>
		</symbol>
	</symbols>

	
	
### [File structure - Tags and Attributes](id:FileStructure)

* [**&lt;symbols&gt;**](#tag_symbols)
	* [**&lt;symbol&gt;**](#tag_symbol)*  
		@ [id](#attribute_id)  
		@ [font-style](#attribute_font-style) (_optional_)  
		@ [font-weight](#attribute_font-weight) (_optional_)  
		@ [image](#attribute_image) (_optional_)  
		@ [indentation](#attribute_indentation) (_optional_)  
		@ [show-in-comments](#attribute_show-in-comments) (_optional_)  
		@ [symbol](#attribute_symbol) (_optional_)  
		
		* [**&lt;regex&gt;**](#tag_regex)
		* [**&lt;postprocess&gt;**](#tag_postprocess) (_optional_)
			* [**&lt;find&gt;**](#tag_findreplace)*
			* [**&lt;replace&gt;**](#tag_findreplace)*


---
#### [`<symbols>`](id:tag_symbols)
The `<symbols>` tag is the root tag for this document.  
It can contain multiple `<symbol>` tags.  
This tag is required.  

---
#### [`<symbol>`](id:tag_symbol)
The `<symbol>` tag specifies what is being shown in the function popup. The result of regex and optional postprocessing are used to generate the symbol title. If the result for the title is an empty string the symbol shows up as an separator in the function popup.  
This tag is optional.  

##### Attributes

* [`id`](id:attribute_id) - string identifier for an specific symbol - has to be a unique string - has to be]specified

* [`font-style` _(optional)_](id:attribute_font-style) - font style of the symbol title - possible values:
	*  _normal_ : Normal font-style (default)
	* _italic_ : Italic text in popup

* [`font-weight` _(optional)_](id:attribute_font-weight) - font weight of the symbol title - possible values:
	* _normal_ (default) : Normal text
	* _bold_ : Bold text in popup

* [`image` _(optional)_](id:attribute_image) - icon image for the symbol - if this is specified the symbol attribute will be ignored - possible values:
	* image included in the application - SubEthaEdit currently supports: _SymbolWarn_
	* image in the Resources directory of the mode by name - Apple’s naming conventions for high-resolution versions of the image apply (file extension is optional) (**Note: there is a bug in SEE 4.0.1 and lower that ignores the resolution specific images**)  


* [`indentation` _(optional)_](id:attribute_indentation) - level of indentation in the function popup - possible values:
	* _0_ (default) 
	* _1-15_ 

* [`show-in-comments` _(optional)_](id:attribute_show-in-comments) - will ignore this symbol definition if it occours in a comment - possible values:
	* _no_ (default)
	* _yes_
	
* [`symbol` _(optional)_](id:attribute_symbol) -  generated icon image for the symbol - if the image attribute is specified this will be ignored - possible values:
	*	string with the format _name_
	*	string with the format _name_color_
	*	string with the format _name_color_fontsize_
	*	string with the format _name_color_fontsize_fontfamily_
	
	where  
	_name_ is the character(s) that should show up in the icon  (eg. F(), M) - defaults to empty string  
	_color_ is a HTML color string (eg. #f84, #aa8799) - defaults to #2B50E8   
	_fontsize_ is a font size in points - defaults to 11.0  
	_fontfamily_ is the name of a font - defaults to LucidaGrand 


---
#### [`<regex>`](id:tag_regex)
The `<regex>` tag specifies the regular expression that is used to search for this `<symbol>`. It contains a Ruby-flavored regular expression. If groups are specified in the regular expression the first group is used for the found string.  
This tag is required.  

_Tip_: Escape unwanted groups with (?:).  


---
#### [`<postprocess>`](id:tag_postprocess) _(optional)_
The `<postprocess>` tag specifies the find and replace operations that should be executed on the found string to generate the desired title string. It can contain multiple `<find>` and `<replace>` pairs.  
This tag is optional.
	

---
#### [`<find>` and `<replace>`](id:tag_findreplace)
Contained in the `<postprocess>` tag `<find>` and `<replace>` specify the find and replace operations that should be executed on the found string. They each contain a Ruby-flavored regular expression. You can use groups like \1 and the like.    
These tags are required and need to be added in pairs.
