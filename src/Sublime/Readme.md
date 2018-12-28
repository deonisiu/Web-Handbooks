# Sublime text 3

## Packages
* Package Control (FIRST INSTAL)
* Advanced new file
* All autocomplete
* Auto file name
* Bootstrap Autocomplete
* Bootstrap Snippets
* Bracket Highlighter
* Color Scheme
* CSS Extended Completions
* CSS 3
* Emmet
* File Icons
* File Icons Mono
* Git
* HTML Extended
* Icon Fonts
* JavaScript & NodeJS Snippets
* Open Folder
* Open Path
* Sass

## Settings

```
{
	"color_scheme": "Packages/Color Scheme - Default/Monokai.sublime-color-scheme",
	"fallback_encoding": "Cyrillic (Windows 1251)",
	"font-face": "Consolas",
	"font_size": 13,
	"hot_exit": true,
	"ignored_packages":
	[
		"GitGutter",
		"Theme - Flatland",
		"Vintage"
	],
	"save_on_focus_lost": true,
	"tab_size": 2,
	"tabs_small": true,
	"theme": "Default.sublime-theme"
}
```

## KeyBind

```
[
	{ "keys": ["ctrl+n"], "command": "advanced_new_file_new"},
	{	"keys": ["ctrl+b"], "command": "prompt_open_folder" },
	{ 
	  "keys": ["shift+enter"], 
	  "command": "run_macro_file", 
	  "args": {
	      "file": "res://Packages/User/end_macro.sublime-macro"
	  } 	  
	},
	{ 
  	"keys": ["ctrl+shift+enter"],
  	"command": "open_file_folder"
	}
]
```

## Macros (Tools) Path : AppData\Roaming\Sublime Text 3\Packages\User

* file : end_macro.sublime-macro
```
[
	{
		"args":
		{
			"extend": false,
			"to": "eol"
		},
		"command": "move_to"
	},
	{
		"args":
		{
			"characters": "\n"
		},
		"command": "insert"
	}
]
```

## Lic

```html
----- BEGIN LICENSE -----
sgbteam
Single User License
EA7E-1153259
8891CBB9 F1513E4F 1A3405C1 A865D53F
115F202E 7B91AB2D 0D2A40ED 352B269B
76E84F0B CD69BFC7 59F2DFEF E267328F
215652A3 E88F9D8F 4C38E3BA 5B2DAAE4
969624E7 DC9CD4D5 717FB40C 1B9738CF
20B3C4F1 E917B5B3 87C38D9C ACCE7DD8
5F7EF854 86B9743C FADC04AA FB0DA5C0
F913BE58 42FEA319 F954EFDD AE881E0B
------ END LICENSE ------
```