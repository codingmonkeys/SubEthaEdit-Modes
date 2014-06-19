[Documentation][ModeExample]:
## Mode Settings: _ModeSettings.xml_

The file called `ModeSettings.xml` is located in the mode's `Resources` folder.  
It bundles the information that is needed to recognize a file as being supported by this mode, when for example opening it, saving an untitled document or pasting code into a new document.  
It also contains information for a template for new files of that mode.

1. [Example File](#ExampleFile)
2. [File structure - Tags and Attributes](#FileStructure)
3. [Additional Information](#AdditionalInformation)
	* [Mode Recognition Triggers: Adjust recognition in Preferences](#ModeTrigger)
	* [Mode Recognition Triggers: Example files](#ModeTriggerExamples)
	* [Template Files: When are they used](#TemplateFile)

### <a name="ExampleFile"></a>Example File:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<settings>
	<template>NewTemplate.txt</template>
	<recognition>
		<extension>example</extension>
		<extension casesensitive="yes">exmpl</extension>
		<filename>Example</filename>
		<regex>\A#!This is my Example Shebang</regex>
	</recognition>
</settings>
```


### <a name="FileStructure"></a>File structure - Tags and Attributes

* [**&lt;settings&gt;**](#tag_settings)
	* [**&lt;template&gt;**](#tag_template) (_optional_)

	* [**&lt;recognition&gt;**](#tag_recognition) (_optional_)
		* [**&lt;extension&gt;**](#tag_extension)* (_optional_)  
		@ [casesensitive](#attribute_casesensitive) (_optional_)  

		* [**&lt;filename&gt;**](#tag_filename)* (_optional_)
		* [**&lt;regex&gt;**](#tag_regex)* (_optional_)


---
#### <a name="tag_settings"></a>`<settings>`
The `<settings>` tag is the root tag for this document.  
It can contain a `<template>` tag and a `<recognition>` tag.  
This tag is required.  


---
#### <a name="tag_template"></a>`<template>` _(optional)_
The `<template>` tag specifies the filename of the mode's template file. The referenced file will provide the initial content of a new file that is created with this mode set as its mode.  
The referenced file has to be in the bundle's `Recources` folder.  
This tag is optional.  


---
#### <a name="tag_recognition"></a>`<recognition>` _(optional)_
The `<recognition>` tag contains potentially multiple `<extension>`, `<filename>` and `<regex>`tags. It defines the mode's triggers, i.e. what marks are used to recognize a file as being of that mode's kind.  
This tag is optional.  


---
#### <a name="tag_extension"></a>`<extension>` _(optional)_
The `<extension>` tag specifies a file extension the mode recognizes.  
This tag is optional.

##### Attributes

* <a name="attribute_casesensitive"></a>`casesensitive` _(optional)_ - will take case into account when checking for matches - possible values:
	* _no_ (default) - ignoring case
	* _yes_ - matching case
	

---
#### <a name="tag_filename"></a>`<filename>` _(optional)_
The `<filename>` tag specifies a file name the mode recognizes.  
This tag is optional.


---
#### <a name="tag_regex"></a>`<regex>` _(optional)_
The `<regex>` tag specifies the regular expression that is used to search for content matches that the mode recognizes.  
Content (like a shebang) can be configured via the regular expression and will be compared to the first 4MB of a file.  
This tag is optional.


---
### <a name="AdditionalInformation"></a>Additional Information:

#### <a name="ModeTrigger"></a>Mode Recognition Triggers: Adjust recognition in Preferences

Mode triggers defined in the `<recognition>` tags can additonally be influenced via **`Preferences: Triggers`**:

* each trigger can be turned on or off  
* precedence which mode should recognize a certain file type can be set by rearranging the mode order 
* additional triggers can be added by hand



####  <a name="ModeTriggerExamples"></a>Mode Recognition Triggers: Example files

[`TestFiles/`][TestFiles] contains files showing which of them are recognized as `Example.seemode` files and which are not. 

* `Example` is recognized based on the filename
* `ExampleModeFile_NoShebang.EXAMPLE` is recognized based on the file extension
* `ExampleModeFile_NoShebang.exmpl` is recognized based on the file extension
* `ExampleModeFile_Shebang` is recognized based on the shebang
* `ExampleModeFile_Shebang.txt` is recognized based on the shebang (though precedence for recognizing based on txt extension wins in the default setup)
* `NoExampleModeFile_NoShebang.EXMPL` is not recognized because no known trigger matches - the `.exmpl` file extension is case sensitive



#### <a name="TemplateFile"></a>Template files: When are they used

There are multiple ways to generate a file that has its mode already set and gets the template content:

* `Menu: File → New →  Example`
* `Menu: File → New Tab → Example`
* `Document Hub: File → New → Example` _(right click)_
* `Document Hub: File → New → Example` _(right click + `⌥ option`)_
* `Document Hub: File → New` _(if the mode is set as the default mode for new files in the Preferences)_

The following cases however do not fill in the template content:

* changing the mode on a file that already exists
* creating a file via the command line tool with the mode set



<!-- Referenced Paths -->
[ModeExample]: .. "SubEthaEdit 4 Example Mode Documentation"
[TestFiles]: ../TestFiles "Test files for mode recognition"
