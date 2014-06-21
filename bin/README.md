# SubEthaEdit - bin
## Helper scripts for mode and style creation and maintenance


#### CreateModeBundle.rb

```
Usage: CreateModeBundle.rb <ModeName> <Extensions comma separated> [target-directory]
  e.g. CreateModeBundle.rb Markdown md,markdown
```

Helper script to create a `.seemode` bundle as starting point for a new mode. Best used using the curl trick direclty from this repository so you always get the most recent version of what we think a bundle skeleton should look like.

```
ruby -e "$(curl -fsSL https://raw.github.com/codingmonkeys/SubEthaEdit/master/bin/CreateModeBundle.rb)" <Parameters>	
```
 