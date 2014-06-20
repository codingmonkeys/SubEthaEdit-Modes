#!/usr/bin/env ruby
require 'fileutils'

if ARGV.count < 2 then
	print "Usage: CreateModeBundle.rb <ModeName> <Extensions comma separated> [target-directory]\n"
	print "  e.g. CreateModeBundle.rb Markdown md,markdown\n"
	exit -1
end

mode_name = ARGV[0]
mode_extensions = ARGV[1].split(",")


target_directory = '.'

if ARGV.count >= 3 then
	target_directory = ARGV[2]
end

target_directory = File.expand_path(target_directory)



print "Generating Sekelton Mode Bundle: #{mode_name}.seemode\n  extensions:#{mode_extensions}\n  in directory:#{target_directory}\n"


bundle_name = mode_name + ".seemode"
bundle_contents_path = File.join(target_directory, bundle_name, "Contents")
bundle_resources_path = File.join(bundle_contents_path, "Resources")
bundle_scripts_path = File.join(bundle_resources_path, "Scripts")
bundle_shell_path = File.join(bundle_scripts_path, "shell")
bundle_english_path = File.join(bundle_resources_path, "English.lproj")

if File.exists? bundle_contents_path then
	print "\nAlready a Mode at #{bundle_contents_path}\n -- aborted --\n"
	exit -1
end

FileUtils.mkdir_p bundle_shell_path
FileUtils.mkdir_p bundle_english_path

#mark infoplist
File.open(File.join(bundle_contents_path,"Info.plist"), "w") { |file| 
	file.write <<HERE
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleIdentifier</key>
	<string>SEEMode.#{mode_name}</string>
	<key>CFBundleName</key>
	<string>#{mode_name}</string>
	<key>NSHumanReadableCopyright</key>
	<string></string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>SEEMinimumEngineVersion</key>
	<string>4.0</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
</dict>
</plist>
HERE
}

#mark resources

#mark NewTemplate.<extension>
template_name = "NewTemplate.#{mode_extensions[0]}"
example_syntax_name = "ExampleSyntax.#{mode_extensions[0]}"
#mark Create Empty File Templates
[template_name, "AutocompleteAdditions.txt", example_syntax_name, "ChangeLog.txt"].each { |resources_subpath|
	File.open(File.join(bundle_resources_path,resources_subpath), "w") {|file| file.write "" }
}


#mark ModeSettings.xml

File.open(File.join(bundle_resources_path,"ModeSettings.xml"), "w") {|file|
	file.write <<HERE
<settings>
	<template>#{template_name}</template>
	<recognition>
HERE
	mode_extensions.each {|extension|
		file.write <<HERE
		<extension>#{extension}</extension>
HERE
	}

file.write <<HERE
	</recognition>
</settings>
HERE
}

#mark RegexSymbols.xml

File.open(File.join(bundle_resources_path,"RegexSymbols.xml"), "w") {|file| 
	file.write <<'HERE'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE syntax SYSTEM "symbol.dtd">

<symbols>

	<!-- TODO: exchange function with your mode specific functions -->
	<symbol id="Functions" symbol="f()_#6AB18D" indentation="0" ignoreblocks="yes">
		<regex>(?&lt;=[\n\r]|^)(?:[\w0-9_*]+\s+){1,3}[\w0-9_*]+[ \t]*\([\]\[\w0-9_,\s*&amp;&lt;&gt;/]*\)(?=\s*\{)</regex>
		<postprocess>
			<find>\([^\)]*\)</find>
			<replace>()</replace>
			<find>[\n\r]</find>
			<replace> </replace>
			<find>[ \t]+</find>
			<replace> </replace>
		</postprocess>
	</symbol>


	<!-- TODO: exchange Pragma Marks recognition with whatever the language has to show labels and separators -->
	<symbol id="Pragma Marks" font-weight="bold" indentation="0" ignoreblocks="yes" show-in-comments="yes">
		<regex>^([^\S\n]*// (?i)mark:(?:[^\S\n]|-)*[^\n]*)$</regex>
		<postprocess>
			<find>^([^\S\n]*// (?i)mark:(?:[^\S\n]|-)*)</find> <!-- An empty string places a separator -->
			<replace></replace>
		</postprocess>
	</symbol>

	<symbol id="Versioning Conflict" font-weight="bold" image="SymbolWarn" indentation="0" ignoreblocks="no">
		<regex>^&lt;&lt;&lt;&lt;&lt;&lt;&lt;([\n\r]|.)*?======([\n\r]|.)*?&gt;&gt;&gt;&gt;&gt;&gt;&gt;</regex>
		<postprocess>
			<find>.*</find>
			<replace>Versioning conflict!</replace>
		</postprocess>
	</symbol>
</symbols>
HERE
}

#mark SyntaxDefinition.xml
File.open(File.join(bundle_resources_path,"SyntaxDefinition.xml"), "w") {|file| 
	file.write <<HERE
<?xml version="1.0" encoding="UTF-8"?>
<syntax>
	<head>
		<name>#{mode_name}</name>
		<autocompleteoptions use-spelling-dictionary="no" />
		<folding toplevel="1" />
HERE

	file.write <<'HERE'	
		<!-- <charsintokens><![CDATA[_0987654321abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@]]></charsintokens> --> 
		<charsdelimitingtokens><![CDATA[ .,;:()[]{}<>+-/=#?!*
]]></charsdelimitingtokens>
		<!-- <charsincompletion><![CDATA[_0987654321abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-@$</=>!]]></charsincompletion> -->
	</head>
	<states>
		<default id="Base" scope="meta.default">
		
			<state id="Block" type="block" foldable="yes" intend="yes" scope="meta.block.curly">
				<begin><regex>{</regex><autoend>}</autoend></begin>
				<end><regex>}</regex></end>
				<import/>
			</state>

			<keywords id="Control Flow Keywords" scope="keyword.control" casesensitive="yes" useforautocomplete="yes">
				<string>if</string>
				<string>else</string>
				<string>while</string>
			</keywords>

			<keywords id="Objects" useforautocomplete="yes" scope="support.class.standard">
				<string>Object</string>
				<string>String</string>
			</keywords>

			<keywords id="Number Literals" useforautocomplete="YES" scope="keyword.constant">
				<string>true</string>
				<string>false</string>
				<string>nil</string>
			</keywords>

			<keywords id="Types" useforautocomplete="yes" scope="keyword.type">
				<string>boolean</string>
				<string>float</string>
				<string>int</string>
			</keywords>


			<keywords id="FunctionRegex" useforautocomplete="no" scope="language.subroutine.function">
				<regex>([A-Za-z0-9_]+ *)\(</regex>
			</keywords>

			<state id="DoxyGen Comment" type="comment" scope="comment.block.documentation">
				<begin><regex>/\*[\*\!]</regex><autoend>\*/</autoend></begin>
				<end><regex>\*/</regex></end>
				<keywords id="DoxyGen Tags" useforautocomplete="no" scope="comment.block.documentation.tag">
					<regex>(?&lt;=[^\w\d]|^)([@\\]\w+)</regex>
				</keywords>
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
			</state>

			<!-- For example here a states for C blockcomments, C++ singleline comments and strings.
			The strings state handles escaped quotes with a lookbehind regular expression (see a regex tutorial) and colors "foobar" in strings. --> 
			<state id="Comment" scope="comment.block">
				<begin><regex>/\*</regex><autoend>\*/</autoend></begin>
				<end><regex>\*/</regex></end>
				<import mode="Base" state="EmailAndURLContainerState" keywords-only="yes"/>
			</state>

			<state id="SingleComment" scope="comment.line">
				<begin><regex>#</regex></begin>
				<end><regex>[\n\r]</regex></end>
			</state>

			<state id="String" scope="string.double">
				<begin><regex>"</regex><autoend>"</autoend></begin>
				<end><regex>(((?&lt;!\\)(\\\\)*)|^)"</regex></end>
				<keywords id="Foobar in string" scope="meta.important">
					<string>foobar</string>
				</keywords>
			</state>
			

			<keywords id="Numbers" useforautocomplete="no" scope="language.constant.numeric">
				<regex>(?&lt;=[^[A-Za-z0-9]]|^)((?:(?:[0-9]+\.[0-9]*)|(?:\.[0-9]+)([eE][+\-]?[0-9]+)?[fFlL]?)|(?:(?:(?:[1-9][0-9]*)|0[0-7]*|(?:0[xX][0-9a-fA-F]))(?:(?:[uU][lL]?)|(?:[lL][uU]?))?))(?=[^[A-Za-z0-9]]|$)</regex>
			</keywords>

		</default>
	</states>
</syntax>
HERE
}


#mark localized

File.open(File.join(bundle_english_path,"ScopeExamples.plist"), "w") {|file| 
	file.write <<'HERE'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
	<key>comment.line</key>
	<string># comment</string>
	<key>keyword.function</key>
	<string>puts scan defined?</string>
	<key>keyword.class</key>
	<string>if class do while begin</string>
	<key>keyword.type</key>
	<string>public</string>
	<key>language.variable.instance</key>
	<string>@my_var</string>
	<key>constant.numeric</key>
	<string>0 0x4a 0713 1.2e-3 0b01011</string>
	<key>constant.numeric.character</key>
	<string>?\n ?d \x4a</string>
	<key>constant.numeric.keyword</key>
	<string>true false nil</string>
	<key>string</key>
	<string>"lorem ipsum"</string>
  </dict>
</plist>
HERE
}

File.open(File.join(bundle_english_path,"Localizable.strings"), "w") {|file| 
	file.write <<HERE
CFBundleName = "#{mode_name}";
HERE
}

#mark post creation action

%x[open '#{bundle_contents_path}']
