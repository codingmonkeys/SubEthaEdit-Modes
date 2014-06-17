[Documentation][StyleExample]:
## The SubEthaEdit Style Sheet Format

SubEthaEdit 4 supports SubEthaEdit Style Sheets. They have the file extension `.sss`. They contain style information and are very similar to _CSS_ files.

1. [Example File](#ExampleFile)
2. [File structure - Keys and Values](#FileStructure)
3. [Additional Information](#AdditionalInformation)
	* [Style sheet files open in CSS mode](#NoSSSMode)


### <a name="ExampleFile"></a>Example Style Sheet:

Very basic style sheet:

```
/* This is the scope every other scope inherits from */

meta.default {
	color : #fff;
	background-color : #000;
}

meta.important {
  font-weight : bold;
  color : #ff000
}

comment {
  font-style : italic;
}

comment.single {
  font-strike-through : strike-through;
  font-underline : underline;
}

```	


### <a name="FileStructure"></a>File structure - Keys and Values

* [**_scopename_**](#scopename)
	* [color](#key_color) (_optional_)
	* [background-color](#key_backgroundcolor) (_optional_)
	* [font-style](#key_fontstyle) (_optional_)
	* [font-weight](#key_fontweight) (_optional_)
	* [font-underline](#key_fontunderline) (_optional_)
	* [font-strike-through](#key_fontstrikethrough) (_optional_)
		

---
#### <a name="scopename"></a>_scopename_

The name of the scope the specified styles will be used for.


---
#### <a name="key_color"></a>color _(optional)_

`color` specifies the text color.

Possible values are:

* hex colors, for example _#978_ or _#792439_
* _#000_ (default for _meta.default_)
* inherited from the parent scope (default)

	
---
#### <a name="key_backgroundcolor"></a>background-color _(optional)_

`background-color` specifies the background color. Only supported for _meta.default_.

Possible values are:

* hex colors, for example _#978_ or _#792439_
* _#fff_ (default for _meta.default_)


---
#### <a name="key_fontstyle"></a>font-style _(optional)_

`font-style` specifies whether the text is italic or not.

Possible values are:

* _italic_
* _normal_ (default for _meta.default_)
* inherited from the parent scope (default)


---
#### <a name="key_fontweight"></a>font-weight _(optional)_

`font-weight` specifies whether the text is bold or not.

Possible values are:

* _bold_
* _normal_ (default for _meta.default_)
* inherited from the parent scope (default)


---
#### <a name="key_fontunderline"></a>font-underline _(optional)_

`font-underline` specifies whether the text underlined or not.

Possible values are:

* _underline_
* _none_ (default for _meta.default_)
* inherited from the parent scope (default)


---
#### <a name="key_fontstrikethrough"></a>font-strike-through _(optional)_

`font-strike-through` specifies whether the text is crossed out or not.

Possible values are:

* _strike-through_
* _none_ (default for _meta.default_)
* inherited from the parent scope (default)


---
### <a name="AdditionalInformation"></a>Additional Information:

#### <a name="NoSSSMode"></a>Style sheet files open in CSS mode
So far there is no stand alone `.sss` mode in SubEthaEdit right now.  
CSS highlighting is not perfect in all cases.



<!-- Referenced Paths -->
[StyleExample]: . "SubEthaEdit 4 Style Documentation"
