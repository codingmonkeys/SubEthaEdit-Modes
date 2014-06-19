# Swift Mode Tutorial Step 4
## All the nice things

The next step is a somewhat mundane one, but crutial for great modes: Add all the Library classes and types.

We put the in the `scope="support."` hierachy. In our case `support.class.standard.cocoa`, `support.subroutine.standard.cocoa`,`support.type.cocoa`,
`support.class.standard.swift`, `support.subroutine.standard.swift`.

To extract the most of Swift I used an command click on a library function in Xcode 6, copied and pasted the header into a SubEthaEdit document and used regex to extract all the structs, types, and classes.

## Symbol Popup




[Step 3](../SwiftModeStep3) - [Overview](..) - [Step 5](../SwiftModeStep5)