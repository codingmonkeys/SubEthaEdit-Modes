## Mode Settings: _ModeSettings.xml_


The file called `ModeSettings.xml` is located in the modes Resources folder.  
It bundles the information that is needed to recognize a file as being suitable for this mode, when for example opening it or saving it as a new file.
It also contains information for a template for new files of that mode.


1. [Example File](#ExampleFile)
2. [File structure - Tags and Attributes](#FileStructure)
3. [Additional Information](#AdditionalInformation)
	* More about Mode Triggers
	* More about Template Files

### [Example File:](id:ExampleFile)

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


### [File structure - Tags and Attributes](id:FileStructure)

* [**&lt;settings&gt;**](#tag_settings)
	* [**&lt;template&gt;**](#tag_template) (_optional_)

	* [**&lt;recognition&gt;**](#tag_recognition) (_optional_)
		* [**&lt;extension&gt;**](#tag_extension)* (_optional_)  
		@ [casesensitive](#attribute_casesensitive) (_optional_)  

		* [**&lt;filename&gt;**](#tag_filename)* (_optional_)
		* [**&lt;regex&gt;**](#tag_regex)* (_optional_)


---
#### [`<settings>`](id:tag_settings)
The `<settings>` tag is the root tag for this document.  
It can contain a `<template>` tag and a `<recognition>` tag.  
This tag is required.  

---
#### [`<template>`](id:tag_template) _(optional)_
The `<template>` tag specifies the filename of the mode's template file. The referenced file will provide the initial content of a new file that is created with this mode set as its mode.  
The referenced file has to be in the bundle's Recources folder.  
This tag is optional.  


---
#### [`<recognition>`](id:tag_recognition) _(optional)_
The `<recognition>` tag contains potentially multiple `<extension>`, `<filename>` and `<regex>`tags. It defines the mode's triggers, i.e. what marks are used to recognize a file as being of that mode's kind.  
This tag is optional.  


---
#### [`<extension>`](id:tag_extension) _(optional)_
The `<extension>` tag specifies a file extension the mode recognizes.  
This tag is optional.

##### Attributes

* [`casesensitive` _(optional)_](id:attribute_casesensitive) - will take case into account when checking for matches - possible values:
	* _no_ (default)
	* _yes_
	

---
#### [`<filename>`](id:tag_filename) _(optional)_
The `<filename>` tag specifies a file name the mode recognizes.  
This tag is optional.


---
#### [`<regex>`](id:tag_regex) _(optional)_
The `<regex>` tag specifies the regular expression that is used to search for content matches that the mode recognizes.  
Content (like a shebang) can be configured via the regular expression and will be compared to the first 4MB of a file.  
This tag is optional.


---
### [Additional Information:](id:AdditionalInformation)

#### Mode Triggers: Disable or Re-order in Preferences

Mode triggers defined in the `<recognition>` tags can be influenced via the "**Triggers**"-_Preference Pane_:

* can be turned on or off  
* precedence can be set by rearranging the mode order 


#### Template files: When are they used

There are multiple ways to generate a file that has its mode already set and gets the template content:

* Menu:File->New->_Example_
* Menu:File->New Tab->_Example_
* Document Hub:File->New->_Example_ _(right click)_
* Document Hub:File->New->_Example_ _(right alt click)_
* Document Hub:File->New _(if the mode is set as the default mode for new files in the Preferences)_

The following cases however do not fill in the template content:

* changing the mode on a file that already exists
* creating a file via the command line tool with the mode set

