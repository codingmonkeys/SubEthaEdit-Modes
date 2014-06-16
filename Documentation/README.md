# SubEthaEdit Customization Documentation

*This document is work in progress*

# Modes
As with SubEthaEdit up to 4 you can create custom modes to support your language of Choice in terms of Syntax Highlighting, Symbol Recognition and Scripts.
Take a look at the comprehensive [Mode Documentation](Documentation/Example.seemode/Contents/Resources/Documentation/Example_seemode.md).


For changes and general advice look into the [Mode Developer Support Documentation](SupportInformation.md).

### Incomplete unordered list of Changes from 3.x

* since modes changed quite a bit, we also changed the file-extension from `.mode` to `.seemode` so they don't get confused, and don't mess up with modes made for Panic's excellent Coda.
* the basic file layout inside the `.seemode` bundles has stayed the same, so you can just rename `.mode` bundles doing a minimal update of the `SyntaxDefinition.xml` file:
  * `state` and `keyword` tags now have a `scope` attribute instead of the direct color and font attributes. this gives you a css like abstraction so you can have one `.sss` file to style all the modes. Until we provide more documentation please refer to a builtin mode with similar language characteristics to choose the right scope for your states and keywords (you can also have a look at [SEEScopeDoc.html](http://htmlpreview.github.io?https://github.com/codingmonkeys/SubEthaEdit/blob/master/Documentation/Styles/SEEScopeDoc.html)).
* in the `RegexSymbols.xml` some of the builtin symbols graphics have been removed. however, SubEthaEdit 4 now autogenerates symbol images. Possible values are `<SymbolName>` and `<SymbolName>_<hexcolor>` - e.g. `symbol="w()_#b33"` or `symbol="M"`
* Most of the AppleScripts need to be ajusted. Some of the Properties on the document now work slightly different, and sandboxing might prevent you from doing something that worked before.
* Toolbar items and names for scripts are deprecated now.
* To support indenting `states` in `SyntaxDefinition.xml` now have the attribute `indent` - if set to `"yes"` SubEthaEdit can infer indetaion on return and re-indent.
* State `begin` now can have a `autoend` which will be used on "Close current Tag/Block (option-cmd-.). this can either be a plain string, or reference a named group in the begin regex. e.g. `<autoend>@end</autoend>` or `<autoend>&lt;/\g&lt;xmltagstatename&gt;&gt;</autoend>`.
* This is an incomplete list - for reference the old mode documentation can be found in the [Attic](http://htmlpreview.github.io?https://github.com/codingmonkeys/SubEthaEdit/blob/master/Attic/SubEthaEdit3/Documentation/mode.html).

# Scripting

Description forthcoming.

# Styles

Description forthcoming. [SEEScopeDoc.html](http://htmlpreview.github.io?https://github.com/codingmonkeys/SubEthaEdit/blob/master/Documentation/Styles/SEEScopeDoc.html)

### Links
[SubEthaEdit GitHub Repo](https://github.com/codingmonkeys/SubEthaEdit) 
