# Swift Mode Tutorial Step 2
## Basic Language Features

Now that we have our basic `Swift.seemode` bundle in place, let's add some language specific highlighting.

### Keywords and States

Let's have a look at the `SyntaxDefinition.xml`. (For a complete Reference you can look in the [Mode Documentation](https://github.com/codingmonkeys/SubEthaEdit/blob/master/Documentation/ExampleMode/Documentation/SyntaxDefinition_xml.md) ).

The basic building blocks of a SyntaxDefinition are hierachical `state`s and `keywords` living in that hierachical `state`s. A `state` is something that has a defined `begin` and `ending`, let's say for example a `{` `}` block. For `state`s are utilised for code folding and indenting.

`keywords` on the other hand are used for the actual highlighting. You can use simple strings like: if, else, class, import. For more complex constructs like number literals, or recognizing a function call you can also use regex to describe them. The `scope` attribute defines which type of keyword it is, and this scope is used in the `.sss` style sheet files to assign them a specific color.

### The Keyword scopes

The `scope="keyword.control"` is meant to represent all basic control structure keywords. So let's lookup all of them in the Swift documentation and add the to the already existing `keywords` tag with the `id="Control Flow Keyords"`.

			<keywords id="Control Flow Keywords" scope="keyword.control" casesensitive="yes" useforautocomplete="yes">
				<string>for</string>
				<string>in</string>
				<string>do</string>
				<string>while</string>
				<string>if</string>
				<string>else</string>
				<string>switch</string>
				<string>case</string>
				…

After these we add additional keywords, which are not managing control flow with `scope="keyword"`. In our default Style sheets the difference is visible so that `keyword.control` scoped keywords are shown bold, `keywords` are shown in normal weight. However, although the scope ulitmately is the deciding factor for the coloration, you should try and make the scope distinction a semantic one, not one that is based on how it is colored.

With the keywords in place, we already can see some progress in terms of highlighting:

<div style="text-align:left;color:#000000; background-color:#ffffff; border:solid black 1px; padding:0.5em 1em 0.5em 1em; overflow:auto;font-size:small; font-family:monospace; ">&nbsp;&nbsp;&nbsp;&nbsp;// ANIMATION<br />
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a71790;"><strong>func</strong></span> <span style="color:#003668;">resolveRequestedAnimation</span>() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a71790;">var</span><span style="color:#003668;"> </span>(frames, key) = <span style="color:#003668;">animationFramesAndKeyForState</span>(requestedAnimation)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#003668;">fireAnimationForState</span>(requestedAnimation, usingTextures: frames, withKey: key)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;requestedAnimation = dying ? .Death : .Idle<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</div>

### States

Next up, let's add a `state`. A typical state is the comments. In swift we have single and multine comments almost the same way as in C - But there is a slight twist: multiline comments can now be nested. So to get a good head start, let us just grab the Comment state from the C mode, by finding and copying them into our top level `default` state. That is always something to keep in mind: if you know that a built-in mode already has a similiar feature, you can just look into the `.seemode` bundle and look up how it is done.

			<state id="Comment" type="comment" scope="comment.block">
				<begin><regex>/\*</regex><autoend>\*/</autoend></begin>
				<end><regex>\*/</regex></end>
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
			</state>

			<state id="SingleComment" type="comment" scope="comment.line">
				<begin><regex>//</regex></begin>
				<end><regex>[\n\r]</regex></end>
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
			</state>

So here we go. The `begin` and `end` tags enclose a `regex` tag which defines the begin and ends. We don't use special regex features here, but note that we needed to escape the `*` as it would otherwise be treated as a Regex modifier. Also of interest: we added the `autoend` to the multiline so the default shortcut `option-command-.` will insert a `*/` to close the current comment. This also needs to be escaped as it is a regular expression replace expression. You can have a look at the XML mode to see how to reference something from the begin in it.

The `import` tag imports the `EmailAndURLContainerState` from the base mode, which makes emails and urls clickable in comments. Also nice.

However, in the current form we don't support the correct way of highlighting the multiline comment in Swift. Swift allows nesting of /* */ comments and for us to enable it, we also need to nest the comment state in itself.

			<state id="Comment" type="comment" scope="comment.block">
				<begin><regex>/\*</regex><autoend>\*/</autoend></begin>
				<end><regex>\*/</regex></end>
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
				<state-link state="Comment" />
			</state>

To achieve that we use the `state-link` tag. The `state-link` tag places the referenced state at this position. In contrast, the `import` tag places all the contents of the referenced state.

Also note that this state has the `type="comment"` attribute. You should always add this to comment states. there is a second variant `type="string"` which you also should use for all your String states. This can later be used by the SymbolParser to skip comment and string regions when recognizing items that should appear in the symbol popup in the top bar of SubEthaEdit.

Okay great. So now we have comments and basic keywords going on. Next up: Regex based keywords for numbers, functions and other neat things.



<!-- Tutorial Navigation -->
[Step 1 - Getting Started](../SwiftModeStep1) - [Overview](..) - [Step 3 - Regex based keywords](../SwiftModeStep3)