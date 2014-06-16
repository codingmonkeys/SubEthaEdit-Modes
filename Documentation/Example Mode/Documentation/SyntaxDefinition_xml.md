## Syntax Definitions: _SyntaxDefinition.xml_


The file called `SyntaxDefinition.xml` is located in the modes Resources folder.  
It contains the information that is needed to recognize language or file type specific sections and keywords. It contains additional information about the mode.  
Without this file the mode cannot work.


1. [Shortened Example File](#ExampleFile)
2. [File structure - Tags and Attributes](#FileStructure)
3. [Example File](#ExtendedExample)


### [Shortened Example File:](id:ExampleFile)

	<?xml version="1.0" encoding="UTF-8"?>
	<syntax>
		<head>
			<name>Example</name>
			<autocompleteoptions use-spelling-dictionary="yes" />
			<folding toplevel="2" />
			<charsintokens><![CDATA[_0987654321abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@]]></charsintokens> 
		</head>
		
		<states>
			<default id="Base" scope="meta.default">
			
				<keywords id="Keywords" scope="support.constant" casesensitive="yes" useforautocomplete="yes">
					<string>COLOR</string>
					<string>TEXT</string>
					<regex>foo([0-9])</regex> <!-- This example colors digits prefixed by foo and only the digits)  -->
				</keywords>
	
				<state id="String" scope="string.double">
					<begin><regex>"</regex></begin>
					<end><regex>(((?&lt;!\\)(\\\\)*)|^)"</regex></end>
					<keywords id="Foobar in string" scope="meta.important">
						<string>foobar</string>
					</keywords>
				</state>
				
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
					
			</default>
		</states>
	</syntax>


### [File structure - Tags and Attributes](id:FileStructure)

* [**&lt;syntax&gt;**](#tag_syntax)
	* [**&lt;head&gt;**](#tag_head)
		* [**&lt;name&gt;**](#tag_name)
		
		* [**&lt;autocompleteoptions&gt;**](#tag_autocompleteoptions) (_optional_)  
		@ [use-spelling-dictionary](#attribute_use-spelling-dictionary) (_optional_)
		* [**&lt;folding&gt;**](#tag_folding) (_optional_)  
		@ [toplevel](#attribute_toplevel) (_optional_)
		
		* [**&lt;charsintokens&gt;**](#tag_charsintokens_delimiting) _(optional if &lt;charsdelimitingtokens&gt; is set)_
		* [**&lt;charsdelimitingtokens&gt;**](#tag_charsintokens_delimiting) _(optional if &lt;charsintokens&gt; is set)_
		* [**&lt;charsincompletion&gt;**](#tag_charsincompletion) _(optional)_


	* [**&lt;states&gt;**](#tag_states)
		* [**&lt;default&gt;**](#tag_default)  
		@ [id](#attribute_id)  
		@ [usesymbolsfrommode](#attribute_usesymbolsfrommode) (_optional_)  
		@ [useautocompletefrommode](#attribute_useautocompletefrommode) (_optional_)  
		@ [type](#attribute_type) (_optional_)  
		@ [foldable](#attribute_foldable) (_optional_)  
		@ [scope](#attribute_scope) (_optional_)
			* [**&lt;keywords&gt;**](#tag_keywords)*  
			@ [id](#attribute_id_keyword)  
			@ [casesensitive](#attribute_casesensitive) (_optional_)  
			@ [useforautocomplete](#attribute_useforautocomplete) (_optional_)  
			@ [scope](#attribute_scope_keyword)  
				* [**&lt;string&gt;**](#tag_string)* (_optional_)
				* [**&lt;regex&gt;**](#tag_regex)* (_optional_)
		
			* [**&lt;state&gt;**](#tag_state)* (_optional_)  -- can also contain state, import, state-link, keywords
			@ [Attributes](#tag_default) -- the same attributes as &lt;default&gt;  
				*  [**&lt;begin&gt;**](#tag_begin_end)
					* [**&lt;regex&gt;**](#tag_regex) -- the same as &lt;regex&gt;
				*  [**&lt;end&gt;**](#tag_begin_end)
					* [**&lt;regex&gt;**](#tag_regex) -- the same as &lt;regex&gt;

			* [**&lt;import&gt;**](#tag_import)*  
			@ [mode](#attribute_mode) (_optional_)  
			@ [state](#attribute_state) (_optional_)  
			@ [keywords-only](#attribute_keywords-only) (_optional_)  

			* [**&lt;state-link&gt;**](#tag_state-link)*  
			@ [state](#attribute_state_state-link)  
			@ [mode](#attribute_mode_state-link) (_optional_)  

---
#### [`<syntax>`](id:tag_syntax)
The `<syntax>` tag is the root tag for this document.  
It contains a `<head>` tag and a `<???>` tag.  
This tag is required.  


---
#### [`<head>`](id:tag_head)
The `<head>` tag encloses some global information about the mode.  
It contains a `<name>` tag and a `<???>` tag.  
This tag is required.  


---
#### [`<name>`](id:tag_name)
The `<name>` tag specifies the mode name.  
It must match with the name in the plist after the "_SEEMode._".  
This tag is required. 


---
#### [`<autocompleteoptions>`](id:tag_autocompleteoptions) _(optional)_
The `<extension>` tag adds spelling-dicitionary autocomplete words.  
This tag is optional.

##### Attributes

* [`use-spelling-dictionary` _(optional)_](id:attribute_use-spelling-dictionary) - use spelling-dicitionary autocomplete words - possible values:
	* _no_ (default)
	* _yes_

---
#### [`<folding>`](id:tag_folding) _(optional)_
The `<folding>` tag defines the folding level for ctrl-command-up.  
This tag is optional.

##### Attributes

* [`toplevel` _(optional)_](id:attribute_toplevel) - folding level for ctrl-command-up - possible values:
	* _1_ (default)
	* _2-9_

---
#### [`<charsintokens>` and `<charsdelimitingtokens>`](id:tag_charsintokens_delimiting) _(optional if the other one is specified)_

The `<charsintokens>` and the `<charsdelimitingtokens>` instruct the syntax highlighter where to tokenize the text for fast finding of plain strings.  

The `<charsintokens>` tag specifies the characters that can occur in strings.  
The `<charsdelimitingtokens>` tag specifies the tags that cannot occur in strings.  

One of these tags has to be specified.

_Tip_: Use CDATA here.

---
#### [`<charsincompletion>`](id:tag_charsincompletion) _(optional)_
The `<charsincompletion>` tag defines characters used for autocompletion.  
E.g. in perl you want this to include the $ sign to autocomplete variables. If left out the regular expression word boundaries are used.  
This tag is optional.


---
#### [`<states>`](id:tag_states)
The `<states>` tag encloses all syntax states.  
States are areas of the text that begin and end with an regex like comments or strings,  
with exception of the default state, that exists anywhere where no other state exists.  
This tag is required.

---
#### [`<default>`](id:tag_default)
The `<default>` tag specifies what is colored within the default state (see `<states>`).  
This tag is required.

##### Attributes

* [`id`](id:attribute_id) - string identifier - has to be a unique string - has to bespecified


* [`usesymbolsfrommode` _(optional)_](id:attribute_usesymbolsfrommode) - a mode name to use the symbol recognition from - possible values:
	* inherited from the parent state (default)
	* a mode name

* [`useautocompletefrommode` _(optional)_](id:attribute_useautocompletefrommode) - a mode name to use the autocomplete from - possible values:
	* this mode - inherited from the parent state (default)
	* a mode name

* [`type` _(optional)_](id:attribute_type) - a string description of the type - currently only the values "string" and "comment" have meaning and cause bracket matching and syntax highlighting to ignore these areas of text, additionally code folding has special handling for comments - possible values:
	* _string_
	* _comment_

* [`foldable` _(optional)_](id:attribute_foldable) - makes this state foldable - possible values:
	* _no_ (default)
	* _yes_

* [`scope` _(optional)_](id:attribute_scope) - a string description of the scope, used for style sheets - possible values: 
	* see: _Style Sheet Strings Reference_


---
#### [`<keywords>`](id:tag_keywords)
The `<keywords>` tag specifies keyword groups within the current state.  
This tag is required.

##### Attributes

* [`id`](id:attribute_id_keyword) - string identifier - has to be a unique string - has to bespecified

* [`casesensitive` _(optional)_](id:attribute_casesensitive) - makes this group case sensitive - possible values:
	* _yes_ (default) - group is case sensitive
	* _no_ - ignores case for group

* [`useforautocomplete` _(optional)_](id:attribute_useforautocomplete) - adds strings to autocomplete dictionary - possible values:
	* _yes_ (default) - group's strings are added to the autocomplete dictionary
	* _no_

* [`scope`](id:attribute_scope_keyword) - a string description of the scope, used for style sheets - possible values: 
	* see: _Style Sheet Scopes Reference_ (**TODO**)
	
---
#### [`<string>`](id:tag_string) _(optional)_
The `<string>` tag specifies plain text to be colored.  
This tag is optional.

_Tip_: If your tag does not get colored, check in `<charsintokens>` if you are tokenizing correctly. 


---
#### [`<regex>`](id:tag_regex) _(optional)_
The `<regex>` tag specifies a regular expression to be colored.  
Only the first group will be colored, so enclose the part to color with parens.
This tag is optional.  


---
#### [`<state>`](id:tag_state) _(optional)_
The `<state>` tag specifies a state other than the default state.  
It features the same attributes as `<default>`.  
It has to contain a `<begin>` and a `<end>` tag. It can contain `<keywords>` tags like specified above.  
This tag is optional.  


---
#### [`<begin>` and `<end>`](id:tag_begin_end)
The `<begin>` tag specifies the begin of a state other than the default state.  
The `<end>` tag specifies the end of a state other than the default state.  
Both have to contain a `<regex>` tag.
These tags are required. 
 

---
#### [`<import>`](id:tag_import) _(optional)_
The `<import>` tag lets you import substates and keywords from other modes.  
This tag is optional.

##### Attributes

* [`mode`_(optional)_](id:attribute_mode) -  the mode to import from - possible values:
	* this mode (default)
	* a mode name

* [`state` _(optional)_](id:attribute_state) - the state to import - possible values:
	* default state (default) - content of default state will be imported
	* a state id -  content of state will be imported

* [`keywords-only` _(optional)_](id:attribute_keywords-only) - only import keywords and not substates - possible values:
	* _no_ (default)
	* _yes_ - only import keywords and not substates of state


---
#### [`<state-link>`](id:tag_state-link) _(optional)_
The `<state-link>` tag lets you reuse complete states including the begin and end regex as well as the attributes on the linked.
This tag is optional.  

##### Attributes

* [`state`](id:attribute_state_state-link) - the state to link - a state id -  content of state will be imported

* [`mode`_(optional)_](id:attribute_mode_state-link) -  the mode to import from - possible values:
	* this mode (default)
	* a mode name


---
### [Extended Example File:](id:ExtendedExample)

	<?xml version="1.0" encoding="UTF-8"?>
	<syntax>
		<head>
			<name>Example</name>
			<autocompleteoptions use-spelling-dictionary="yes" />
			<folding toplevel="2" />
		
			<charsintokens><![CDATA[_0987654321abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@]]></charsintokens> 
			<!-- <charsdelimitingtokens><![CDATA[ -]]></charsdelimitingtokens> -->
			<!-- <charsincompletion><![CDATA[_0987654321abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-@$</=>!]]></charsincompletion> -->
		</head>
		<states>
			<default id="Base" scope="meta.default">
			
				<keywords id="Keywords" scope="support.constant" casesensitive="yes" useforautocomplete="yes">
					<string>COLOR</string>
					<string>TEXT</string>
					<regex>foo([0-9])</regex> <!-- This example colors digits prefixed by foo and only the digits)  -->
				</keywords>
	
				<!-- For example here a states for C blockcomments, C++ singleline comments and strings.
				The strings state handles escaped quotes with a lookbehind regular expression (see a regex tutorial) and colors "foobar" in strings. --> 
				<state id="Comment" scope="comment.block">
					<begin><regex>/\*</regex></begin>
					<end><regex>\*/</regex></end>
				</state>
	
				<state id="SingleComment" scope="comment.single">
					<begin><regex>#</regex></begin>
					<end><regex>[\n\r]</regex></end>
				</state>
	
				<state id="String" scope="string.double">
					<begin><regex>"</regex></begin>
					<end><regex>(((?&lt;!\\)(\\\\)*)|^)"</regex></end>
					<keywords id="Foobar in string" scope="meta.important">
						<string>foobar</string>
					</keywords>
				</state>
				
				<state id="Inline Javascript" usesymbolsfrommode="Javascript" useautocompletefrommode="Javascript" scope="meta.block">
					<begin><regex>&lt;(?=script)</regex></begin>
					<end><regex>/script&gt;</regex></end>			
					<import mode="Javascript" />
				</state>
				
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
	
				<keywords id="Numbers" useforautocomplete="no" scope="language.constant.numeric">
					<regex>(?&lt;=[^[A-Za-z0-9]]|^)((?:(?:[0-9]+\.[0-9]*)|(?:\.[0-9]+)([eE][+\-]?[0-9]+)?[fFlL]?)|(?:(?:(?:[1-9][0-9]*)|0[0-7]*|(?:0[xX][0-9a-fA-F]))(?:(?:[uU][lL]?)|(?:[lL][uU]?))?))(?=[^[A-Za-z0-9]]|$)</regex>
				</keywords>
				
				<keywords id="Warnings" scope="meta.important" casesensitive="yes" useforautocomplete="no">
					<regex>(^%Warning:[^\n\r]*)</regex>
				</keywords>
	
				<keywords id="TODOs" scope="meta.important" useforautocomplete="no">
					<regex>(^%TODO:[^\n\r]*)</regex>
				</keywords>
	
			</default>
		</states>
	</syntax>
