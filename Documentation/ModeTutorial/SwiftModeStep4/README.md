# Swift Mode Tutorial Step 4
## All the nice things

The next step is a somewhat mundane one, but crutial for great modes: Add all the Library classes and types.

We put the in the `scope="support."` hierachy. In our case `support.class.standard.cocoa`, `support.subroutine.standard.cocoa`,`support.type.cocoa`,
`support.class.standard.swift`, `support.subroutine.standard.swift`.

To extract the most of Swift I used an command click on a library function in Xcode 6, copied and pasted the header into a SubEthaEdit document and used regex to extract all the structs, types, and classes.

## Symbol Popup

Now that the basic elements of the mode are in order, lets head to the next functionality: the Symbol Popup. Currently nothing is shown there, and obviously we want to see classes, enums, and some pragma mark support in there.

The symbol Popup is governed by the `RegexSymbols.xml` file, described in great detail here: [Symbol Definitions](https://github.com/codingmonkeys/SubEthaEdit/blob/master/Documentation/ExampleMode/Documentation/RegexSymbols_xml.md).

Our little helper script did already add a simple `RegexSymbols.xml` that does recognize versioning conflicts, and has 2 stubs for functions and pragma marks. Let's adjust the functions section so it recognizes basic swift functions.

We already have our little identifier recognizer due to the keyword in the function regex: `([^-*+#:.,\(&lt;&gt;\{\[\]}\)\s]+)` so let's reuse it.

```xml
<symbol id="Functions" symbol="f()_#6AB18D" indentation="1" ignoreblocks="yes">
	<regex>^[^\S\n]*func\s+([^-*+#:.,\(&lt;&gt;\{\[\]}\)\s]+(?:&lt;[^&gt;\n]+&gt;)?\([^\)\n]+\))</regex>
	<postprocess>
		<find>\([^\)]*\)</find>
		<replace>()</replace>
		<find>[\n\r]</find>
		<replace> </replace>
		<find>[ \t]+</find>
		<replace> </replace>
	</postprocess>
</symbol>
```
So let's see: we want something at the start of the line that has whitespace but no newline before the `func` keyword, which is followed by an identifier optionally followed by a generic `<>` and then followd by a round bracket opening and closing.

The ´postprocess´ tag does then remove all content of the normal bracket.


 

[Step 3](../SwiftModeStep3) - [Overview](..) - [Step 5](../SwiftModeStep5)