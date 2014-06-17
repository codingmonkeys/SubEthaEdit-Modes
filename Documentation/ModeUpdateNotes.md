[Documentation][Docu]:
## Update from SEE3 .mode to SEE4 .seemode: _Notes_

1. [General Changes](#General)
2. [Changes in `SyntaxDefinition.xml`](#SyntaxDefinition)
3. [Changes in `RegexSymbols.xml`](#RegexSymbols)
4. [Changes in `Info.plist`](#InfoPlist)
5. [Changes in Mode Scripts](#ModeScripts)
6. [Minimalist Update](#Minimalist)

---
#### <a name="General"></a>General Changes
ℹ️ [SubEthaEdit 4 Mode Documentation][ExampleMode]

▶️ _Rename your mode bundle from name.bundle to name.seebundle._

On the inside modes have changed quite a bit, so we changed the file-extension from `.mode` to `.seemode` so they don't get confused, and don't mess up with modes made for Panic's excellent Coda.

The basic file layout inside the `.seemode` bundles however has stayed the same, so you can just rename the `.mode` bundles and then go on to update the contained files from there.


---
#### <a name="SyntaxDefinition"></a>Changes in [`SyntaxDefinition.xml`][SyntaxDefinition_xml]  
ℹ️ Style Sheet Scopes Reference (_**TODO**_)   

▶️ _Update `<default>`, `<state>`, `<keywords>` tags for  mode independent style sheets:_  

* ▶️ _Add a `scope` attribute_ - (see Style Sheet Scopes Reference _**TODO**_)
* ▶️ _Remove `background-color`, `color`, `font-style`, `font-weight`, `inverted-background-color`, `inverted-color` attributes._  

▶️ _Move all your states into the `<default>` state._  

▶️ _Add `indent` attribute to your states for indentation  support._  

▶️ _Add `<autoend>` to your states for "Close Current Tag/Block" support._


---
#### <a name="RegexSymbols"></a>Changes in [`RegexSymbols.xml`][RegexSymbols_xml]

▶️ _Check your symbol images and replace with generated symbols or custom images if needed._

If the image is a _custom image_ and part of the mode bundle nothing has to change. It is however possible to add resoulution specific image assets or replace the custom image with a generated image specified in the `symbol` attribute. 

Of the _built in images_ only `SymbolWarn`is still supported. With the others it is easiest to replace the `image` attribute with its `symbol` counterpart which generates an image for you. The [`<symbol>` documentation][RegexSymbols_xml_tag_symbol] describes how to further customize the result. You could also add custom images instead. 
			
		old: <symbol id="Foo" image="SymbolM">
		new: <symbol id="Foo" symbol="M">


---
#### <a name="InfoPlist"></a>Changes in [`Info.plist`][Info_plist]

▶️ _Update `SEEMinimumEngineVersion` to at least 4.0._  
▶️ _Remove `TCMModeExtensions` and `TCMModeNewFileTemplate` and add a [`ModeSettings.xml`][ModeSettings_xml] instead._  
▶️ _Replace `CFBundleGetInfoString` with `NSHumanReadableCopyright`._


---
#### <a name="ModeScripts"></a>Changes in [Mode Scripts][ModeScripts_Docu]  
ℹ️ Updated Scripting Suite Reference (_**TODO**_)

▶️ _Check if custom scripts are still necessary - some scripts are now built in or funtionality directly supported by SubEthaEdit or the mode format itself._

* _Insert Hex Color_ is now a built in script available for all modes
* _Close tag/block_ scripts can now be replaced by [`<autoend>` information][RegexSymbols_xml_tag_symbol] in [`RegexSymbols.xml`][RegexSymbols_xml] - support for closing a state is now built into the mode states

▶️ _Check mode scripts with the AppleScript Editor and the current SubEthaEdit._ 

Most of the AppleScripts need to be ajusted. Some of the Properties on the document now work slightly different, and sandboxing might prevent you from doing something that worked before.

▶️ _Remove keys `shortdisplayname`, `toolbartooltip`, `toolbaricon`, `indefaulttoolbar` from `seescriptsettings()` of your scripts._  
▶️ _Remove custom `toolbaricon` files._


---
#### <a name="Minimalist"></a>Minimalist Update

Updating a mode partially can be a quick solution in times of need but is not recommended.  
This is the bare minimum:

▶️ _Rename your mode bundle from name.bundle to name.seebundle._  
▶️ _Update `<default>`, `<state>`, `<keywords>` tags for  mode independent style sheets by adding a `scope` attribute_  
▶️ _Update `SEEMinimumEngineVersion` to 4.0._  


<!-- Referenced Files -->
[Info_plist]: ExampleMode/Documentation/Info_plist.md "Info.plist Documentation"
[ModeScripts_Docu]: ExampleMode/Documentation/ModeScripts.md "ModeScripts Documentation"
[ModeSettings_xml]: ExampleMode/Documentation/ModeSettings_xml.md "ModeSettings Documentation"
[RegexSymbols_xml]: ExampleMode/Documentation/RegexSymbols_xml.md "RegexSymbols Documentation"
[SyntaxDefinition_xml]: ExampleMode/Documentation/SyntaxDefinition_xml.md "SyntaxDefinition Documentation"


<!-- Referenced Files -->
[RegexSymbols_xml_tag_symbol]: ExampleMode/Documentation/RegexSymbols_xml.md#tag_symbol "RegexSymbols - Documentation for <symbol>"

<!-- Referenced Paths -->
[Docu]: . "SubEthaEdit 4 Mode Documentation"
[ExampleMode]: ExampleMode "SubEthaEdit 4 Mode Documentation"
