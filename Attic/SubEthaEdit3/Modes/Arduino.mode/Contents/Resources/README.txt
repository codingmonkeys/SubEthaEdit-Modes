Arduino Syntax Highlighter for SubEthaEdit and Coda
Version 0.1.1   December 29, 2011
code@rowansimms.com
https://code.google.com/p/arduino-syntax-for-coda/



INSTALLATION INSTRUCTIONS
------------------------------------
The folder, Arduino.mode, needs to be placed in:
    for Coda:        /Library/Application Support/Coda/Modes/
    for SubEthaEdit: /Library/Application Support/SubEthaEdit/Modes/

Quit the application, if it is running, and open it up again.



CHANGELOG
------------------------------------
==Version 0.1.1==

CHANGELOG
Issue #3 : bool recognition
declaring bool was not treated the same as boolean, they are now.

Issue #2 : Syntax Support for ATMega Boards
Additional Serial ports and other features were not supported in the initial release, these are now included.

Issue #1 : Stream Class Support
The stream class and some of the serial classes were missing from the initial release. These have now been included.

==Version 0.1.0==
Initial Release
