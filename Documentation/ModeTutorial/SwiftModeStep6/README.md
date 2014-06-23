# Swift Mode Tutorial Step 6
## Cleanup

We tested the mode, and are content with the way it highlights the code, all the symbols are recognized and the scripts work fine as well. 
Now is a good moment to add some finishing touches:

* add `NSLocalizableCopyright` in your `Info.plist` so its easier to find out who made the mode and when

```xml
<key>NSHumanReadableCopyright</key>
<string>© 2014 TheCodingMonkeys - http://www.codingmonkeys.de</string>
```

* fill in template code that makes sense for your mode - or delete the file and the `<template>` entry in the `ModeSettings.xml` if its empty anyway

* write something into the change log

```
Changes with Version 1.0 (SEE 4.0)
	*) Initial Version
```

* add strings to your `Localizable.strings` - or just delete them if you don't need them

* you can also add a readme or helper script oder anything people who look into your mode would maybe want to know


## Sharing

If you'd like to share your newly created mode with us (and everyone else): Awesome!

Send us a pull request or drop us a line (and the mode!) at [subethaedit+modes@codingmonkeys.de](mailto:subethaedit+modes@codingmonkeys.de?Subject=I%20wrote%20a%20mode%20for%20...) and we will put it into the repo for everyone to use!



<!-- Tutorial Navigation -->
[Step 5: Mode recognition and Scripts](../SwiftModeStep5) - [Overview](..)
<!-- There is no step 7 --><!-- [Step 7](../SwiftModeStep7) -->
