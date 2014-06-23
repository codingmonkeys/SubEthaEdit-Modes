# Swift Mode Tutorial Step 1
## Getting Started

The first step in creating a custom mode for a language or filetype is to gather information and create your `.seemode` bundle.

### Creating the mode bundle

The minimal information you need to create your bundle is the name of your mode and the file extensions files of that type can have. In our case that is simple. Our mode shall be called `Swift` and the only extension Swift currently employs is `.swift`.

Having gathered this minimal information we can go ahead and use the nice `CreateModeBundle.rb` helper script to generate a skeleton mode bundle. During development time I recommend to work in the User Modes directory of your SubEthaEdit - if you are familiar with versioning you should also make the modes directory a git repository so your changes don't get lost.

The quickest way to get to that directory is via the mode menu of __SubEthaEdit__. Hold the option button, click the __Mode__ menu and go to the __Open User Modes Folder__ Item all the way at the bottom of the __Show in Finder__ submenu.

This opens your User Modes folder in the finder. If not already open, open your __Terminal.app__ and drag the little folder icon in the finder's window title onto the __Terminal.app__ icon in the Dock. This conveniently opens up this directory in a new Terminal window.

Now you can go ahead and use our little helper script to generate the `.seemode` Bundle

```bash
ruby -e "$(curl -fsSL https://raw.github.com/codingmonkeys/SubEthaEdit/master/bin/CreateModeBundle.rb)" Swift swift
```

This creates your Mode Skeleton for our new `Swift.seemode` and also conveniently opens it's contents in a new finder window.

Switch the finder into list view and do an option-click on the little triangle in front of Resource to unfold it's directory structure.

Now go back to __SubEthaEdit__ and click the __Reload Modes__ item in the __Modes__ menu. The __Swift__ mode should now appear in the __Modes__ menu and also in the __File -> New__ submenu.

### Gathering examples

Now that we have verfied the mode is in the right place and we can generate and save files of that type, it is time to collect some basic sample code and paste it into the `ExampleSyntax.swift` file so we have something to work with. This file is shown to the User in the Styles Preferences of __SubEthaEdit__. And for us it should be a meaningful collection of elements of the language that we want to highlight and recognize.

As a rule of thumb I would recommend searching the net for suitable sample code, maybe even reference code from other highlighters. Since Swift is quite a new language, let's go with some Apple Sample code for now.

As the skeleton already imports some basic states from other languages as example, you can see that numbers, comments, strings and function calls already have a little bit of highlighting.

In the next step we will add the basic language keywords and constructs to the `SyntaxDefinition.xml` file. However, to do that we actually need to know the exact definition of all of these. Luckily for us Swift has quite a nice iBook which also has a nice HTML variant that describes all this in detail. For other languages you'll need to get prepared and find a good resource for it. It's often astounding what you can learn about a language when making a mode for it.



<!-- Tutorial Navigation -->
[Overview](..) - [Step 2 - Basic Language Features](../SwiftModeStep2)
