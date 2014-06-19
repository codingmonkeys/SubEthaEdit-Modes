# Swift Mode Tutorial Step 4
## Regex based Keywords

So let us go to the more interesting keywords: regex based keywords. One of the most common one for every mode is the number regex. Most languages have slightly different semantics, so if you want to be correct you need to handcraft your regex. Of course you can always just grab a number keywords state from another mode to get you started. However, I like to make it nice, so let's gather all allowed numbers and the ones not allowed into a little text file first:


	// allowed number literals
	1e+1_0
	1.1
	1_000.1
	
	0xabc
	0xa01b.cdp-a
	0xABf
	
	0x001
	0b00_100
	
	0o0123457_123
	
	
	// non allowed number literals
	0x
	0o
	0b
	0b100.11
	0.
	.1
	0x0.01p
	0xf.0f

And then build the parts of our regex:

Decimal, including fractions and underscores:

	(?:[0-9][0-9_]*(?:\.[0-9][0-9_]*)?(?:[eE][-+]?[0-9][0-9_]*)?)

Hexadecimal, including fractions and underscores:

	(?:0x[0-9a-fA-F][0-9a-fA-F_]*(?:\.[0-9a-fA-F][0-9a-fA-F_]*(?:[pP][-+]?[0-9a-fA-F][0-9a-fA-F_]*))?)

Binary, no fractions allowed

	(?:0b[01][01_]*?)

Octal, no fractions allowed

	(?:0o[0-7][0-7_]*?)

Or it together, add an optional -+ in front, and make sure with a look ahead and look behind that there are only non-digits/non-word characters around
	
	(?<![\w\d_])((?:[-+]?(?:[0-9][0-9_]*(?:\.[0-9][0-9_]*)?(?:[eE][-+]?[0-9][0-9_]*)?)|(?:0x[0-9a-fA-F][0-9a-fA-F_]*(?:\.[0-9a-fA-F][0-9a-fA-F_]*(?:[pP][-+]?[0-9a-fA-F][0-9a-fA-F_]*))?)|(?:0b[01][01_]*?)|(?:0o[0-7][0-7_]*?)))(?![\w\d_])
	
Quite the beast!

The whole number keyword group looks like this then:

```xml
<keywords id="Numbers" useforautocomplete="no" scope="language.constant.numeric">
	<regex>(?&lt;![\w\d_])((?:[-+]?(?:[0-9][0-9_]*(?:\.[0-9][0-9_]*)?(?:[eE][-+]?[0-9][0-9_]*)?)|(?:0x[0-9a-fA-F][0-9a-fA-F_]*(?:\.[0-9a-fA-F][0-9a-fA-F_]*(?:[pP][-+]?[0-9a-fA-F][0-9a-fA-F_]*))?)|(?:0b[01][01_]*?)|(?:0o[0-7][0-7_]*?)))(?![\w\d_])</regex>
</keywords>
```

With the addition of having to escape the `<` with an `&lt;` - yihhaaaa.

But let's go one step back: so instead of using the `string` tag you can also use `regex` tags. The regexes in a `regex` tag must have at least one captured group (e.g. something in normal brackets `(` `)` as this is the part that gets highlighted. No group, no highlight. To avoid opening this group to early, you use non-capture-groups a lot, hence the multitude of `(?:` `)`.

So the literal number regex is probably the most important use case for regex based keywords. However, you can also just e.g. highlight everything that starts with an @ by specifing 

	<regex>(@\w+)</regex>

which can be neat if the language is this open. However, in general it is prefered you provide all the possible variants, so the highlighting also pre-validates the code written. And of course, by adding all the possible strings and have the `useforautocomplete="yes"` attribute you also get autocomplete for free.

### Functions

Another use case for regex based keywords is the function and or method highlighting in SubEthaEdit. (E.g. used in the Objective-C mode and most c based modes)

```xml
<keywords id="FunctionRegex" useforautocomplete="no" scope="language.subroutine.function">
	<regex>([A-Za-z0-9_]+ *)\(</regex>
</keywords>
```

For swift this doesn't look right enough though. For once: functions in swift can consist of amost any character, not only ascii, and there are also the named parameter parts which should be highlighted the same. So let's have a try at this.

Sadly the identifier can be almost everything. So lets just do an approximation that is better than the current one. 


```xml
<keywords id="FunctionRegex" useforautocomplete="no" scope="language.subroutine.function">
	<regex>([^-*_+#:.,\(&lt;&gt;\{\[\]}\)\s]+)\s*\(</regex>
	
	<regex>(?&lt;=[\(,])\s*([^-*_+#:.,\(&lt;&gt;{\[\]}\)\s]+)(?:\s*(?:[^-*_+#:.,\(&lt;&gt;{\[\]}\)\s]+))?\s*:</regex>
</keywords>
```

Sadly this still hase some issues (e.g. highlighting unnamed attributes) But still is an improvement. The Character class string is quite the abomination too, but at least it is as closely representing the everything is allowed variant as possible.



[Step 3](../SwiftModeStep3) - [Overview](..) - [Step 5](../SwiftModeStep5)